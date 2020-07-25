Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1005022D7DE
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 15:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGYNaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 09:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgGYNaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 09:30:20 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1C8C0619D3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 06:30:20 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id v26so2349710ood.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLWl61iUFiVNKzf6C4Wv/3AzPUpXVP85XKnNXPWBYrU=;
        b=PZoxQWaEEFH33OFQHOpMXRU0MIpBu4YViuOHULt18d9xuIhu3tT6809qi9XNf8JTZc
         RjUUeNarCKKAqKNK+KkHyyAA5S8UmDSMWYZ1VWLUb5d4XoJGpm7okf0sokyZHkybqEvI
         rrP6D2a8Rh08n6mwgNSbcmXu/eX2SDbSFpVMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLWl61iUFiVNKzf6C4Wv/3AzPUpXVP85XKnNXPWBYrU=;
        b=m3RU0yhtyO/XuO8wz41glSttHqB9wfGLJ9P+bMxqw0ooA6VD972URjAO4sQBRvxWdD
         SmKvAy5Ny3HA6DLGPuKn+9jcbuEnbv0q94sECWnrcSkAZ7GflY9RvX6ZWy+g+/WYJOmo
         p+FIVif6Qpl98s3HmObH31H97k4eHC81ZoQYHG/mn+NcqTUtAeK08Rvzl0WxuaWX1C/e
         ScgpU4uKSjYGOINH83Z//ikpv1cE/ZD4twJR8uHke+B6wLOZ4p2FiSWoUw/Y3f+/Lv5c
         rpE9tie9LW88r6mtQi6FAcVAQLgCYRZQbbJ1OAUeqfcp6ZHak+sN5JXNxIlzBGQgfsYu
         9IMw==
X-Gm-Message-State: AOAM530SkiqyVJNoh6UcgcL/iYNUay2MB/g8V/cLLeVmdZec2Ct79htR
        NN+Vg4n3dZ4yvgwWaQUmRFS+qw59DLQ=
X-Google-Smtp-Source: ABdhPJyIBZI6DpKOyeWizIkTz/ZtE/sj+54oI9JZXDHjKqAi/Vjud5CHmGODf+JQrKMCCAmZQQYb1A==
X-Received: by 2002:a4a:b6c5:: with SMTP id w5mr13724526ooo.89.1595683818713;
        Sat, 25 Jul 2020 06:30:18 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id j9sm1256407otc.69.2020.07.25.06.30.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 06:30:17 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id k4so10488547oik.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 06:30:16 -0700 (PDT)
X-Received: by 2002:aca:b6c3:: with SMTP id g186mr11132450oif.55.1595683816161;
 Sat, 25 Jul 2020 06:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200715202233.185680-1-ezequiel@collabora.com> <20200715202233.185680-4-ezequiel@collabora.com>
In-Reply-To: <20200715202233.185680-4-ezequiel@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Sat, 25 Jul 2020 22:30:02 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVJ+baQshWRJJrwKJ6bKss_KqHoC1xP9kvGtDqC0iFZWw@mail.gmail.com>
Message-ID: <CAPBb6MVJ+baQshWRJJrwKJ6bKss_KqHoC1xP9kvGtDqC0iFZWw@mail.gmail.com>
Subject: Re: [PATCH 03/10] media: uapi: h264: Split prediction weight parameters
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> The prediction weight parameters are only required under
> certain conditions, which depend on slice header parameters.
>
> The slice header syntax specifies that the prediction
> weight table is present if:
>
> ((weighted_pred_flag && (slice_type == P || slice_type == SP)) || \
> (weighted_bipred_idc == 1 && slice_type == B))

This is a pretty important bit - how about mentioning in the documentation when
this new control is expected to be present, so both drivers and
userspace submit it
or omit it in a consistent manner?
