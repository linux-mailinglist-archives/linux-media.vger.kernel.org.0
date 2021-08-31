Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2814D3FCDA2
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 21:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240449AbhHaTUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 15:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhHaTUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 15:20:19 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C39C061760
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 12:19:24 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id b7so187323iob.4
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BnfnduHx3i2X80cz742KibQtwDjAziOnxR1dEDNguNQ=;
        b=k8Uq/xSxlaLj3DJmwHqi3zi23+XTDI345vnvhN5QS8pnpgx8a0Q49xhD5D4KS8+DLC
         gtYdQDcKGi80NEfOReWj/tPYUGw6JOZLDane/KBJPXnNoHM9WB2/1f+riot8p/HOeB7G
         u8BARTX9hRBylvw5eZW2vgu6vn4Si0ptrSmEEckvMh4M/81RefCoqC1u5cM7rBtbBLNs
         z5Hpha8wYRq/8xulDm1+MfqK4W0ggyxAhzcul7WLDxCMRZq6YH10Lb4hjPT1rOlWa6Nc
         WC0yq2hPUZ3DtgBpKPenD7oBZyvF3EX39LxtgC0rOpCGm8b2Itupimky3nERNn1xhvv/
         A1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BnfnduHx3i2X80cz742KibQtwDjAziOnxR1dEDNguNQ=;
        b=sccWVfqfWpGqlfUYtJqTK1hdGu4372MWIx0uUERZhA9UqJFpk6MZwXS4XKBUTwUNJX
         fgtueQcJBMYgAac/FRx4biMlnI5uRrAMYgpMMYbbly9eiOd/DlLDF8iNgBpVvQ/H6Df2
         hIeP85c3D2vjNpSXrNyuBIk6A9ZE3hAaX9HLnfbGZnZnsWbSwtf4fYApv1DEJSWS/4jh
         6tZ1psFF+06aiwTDT0WPrKkszqU/VwJNG2GUuqYEFepRjwrywg94BVgAdOuQ7H2ddELJ
         S8Yc1zi6XP2Da+AYCgQXyMCQMwl7lchzRQUjvGQwlZTIC1K8sH9ESToAsvDNlvOql7Fw
         Bb5w==
X-Gm-Message-State: AOAM533y8+r1CfoIbNb/c4HrzPx5OXJS9c0G6X56lFGyz01IfWFmIW0P
        1DW6VES2dHl0X/iNjOHZwvmAFQ==
X-Google-Smtp-Source: ABdhPJzLpm8haUqn3kfzyuXtg4CiQZwskLDtRsRbptxnszVRu77+8NA0/wO490W6qNwD3GPt10CQDw==
X-Received: by 2002:a02:2348:: with SMTP id u69mr4216099jau.141.1630437562446;
        Tue, 31 Aug 2021 12:19:22 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id c23sm10143469ioi.31.2021.08.31.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 12:19:21 -0700 (PDT)
Message-ID: <1484b5ebb9c943c72d7d7a0481c1a2cd9899705b.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: HEVC: RPS clean up
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date:   Tue, 31 Aug 2021 15:19:19 -0400
In-Reply-To: <20210831094900.203283-1-benjamin.gaignard@collabora.com>
References: <20210831094900.203283-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per discussion with Ezequiel, I think this patch should perhaps be made an
RFC titled "media: uapi: clean and make HEVC uAPI public". Keep it RFC until we
have collected all the needed changes.

Opinion ?

Le mardi 31 août 2021 à 11:48 +0200, Benjamin Gaignard a écrit :
> This series aims to clean up Reference Picture Set usage and flags.
> 
> Long term flag was named with RPS prefix while it is not used for RPS
> but for mark long term references in DBP. Remane it and remove the two
> other useless RPS flags.
> 
> Clarify documentation about RPS lists content and make sure that Hantro
> driver use them correctly (i.e without look up in DBP).
> 
> Benjamin
> 
> Benjamin Gaignard (2):
>   media: hevc: Remove RPS named flags
>   media: hevc: Embedded indexes in RPS
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 12 ++++-----
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++++--------------
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
>  include/media/hevc-ctrls.h                    |  4 +--
>  4 files changed, 14 insertions(+), 31 deletions(-)
> 


