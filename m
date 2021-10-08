Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90335426DBE
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 17:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243261AbhJHPoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 11:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbhJHPoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 11:44:00 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75FBC061755
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 08:42:04 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id a14so6608491qvb.6
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rjs4mCGafYlXNdybb9ZGxlAk2gqqUMvwHU2DzJJHvqI=;
        b=7hgF0Eq+zGYzt7/FS7OTsVJovpU37Wp0bpbTmPwuIhctC10L3AQ1I+TLhrRYa2HzI6
         wGOBbx4x+92vcDIM5BUHEI7xTaaSL+gKuUXnFwW1YdC8+iV0maARKJFNVOvctPEgX9fN
         D9aM4rEiFi6glR1z2u7bGKV+/dd1QVJ+qhRUcesiCwPF7ArKtNX4FZCiu8kdkiMvpqtJ
         IaRE2+pT31G3AZG/bw1QOUFapj6GeolHcSX21KlLmNSh/m6Kw5NaVFwnJvULRJkcUw7M
         DTAitj3SenGQeuIKVivF6cVlBuKi3EC4zjf/dV2R0TCsTVfcVaEOh9NcZPvkz4bcRaq3
         +ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rjs4mCGafYlXNdybb9ZGxlAk2gqqUMvwHU2DzJJHvqI=;
        b=8G2TqAnaj6pwx3o4Y5j1pZIQh1cVrP++KNUwveYI6zMRDE+cYHJSt/4X9UH4lx+NOs
         xUeTqRd4WceSniAtCIVFvjqQFX9Ou1pJOs2P0FMbc3LSKj8P8Rtlg3QjgensvBR/WOvt
         TAmOBgjn7wUuZdZPzkJtkYkvwOUDRNp+yxQDY8q6CxID6pXB0mOeI7UuPIXE8EzlolVC
         J9mPaXYsnEv9B+JGBlBMHrNPx4TDLC1YnaV0emvOHigiOletyt1MhVNHsrN+kaOrCDgk
         GyDbD61Jdcq/e12QBZkS/1U3ZXUQuqvSh8jbLmSMcLAeIEGA3TXF6wAv+a0cxVO1s097
         UQuA==
X-Gm-Message-State: AOAM533+RUfCKIMCTh+pSq5RmJdEMWAXANrnmCq4LNh2PVZg5sQvNRmc
        FaO/c6SIjjntPHPyCqV0GZ8+LA==
X-Google-Smtp-Source: ABdhPJztze8fJcBoJDAyfAaXu2xI3rtosIxtZNyE1oYjwGkcC0IZe06b8/R0c5Q21brKykmtBw4TKg==
X-Received: by 2002:a05:6214:118f:: with SMTP id t15mr8761837qvv.28.1633707723890;
        Fri, 08 Oct 2021 08:42:03 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 6sm2265371qkc.123.2021.10.08.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:42:03 -0700 (PDT)
Message-ID: <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro
 and Cedrus
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Date:   Fri, 08 Oct 2021 11:42:01 -0400
In-Reply-To: <20211008100423.739462-1-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chen-Yu,

thanks for looking into this.

Le vendredi 08 octobre 2021 à 18:04 +0800, Chen-Yu Tsai a écrit :
> Hi everyone,
> 
> While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
> behavioral differences compared to Hantro and Cedrus:
> 
> 1. The driver always overrides the sizeimage setting given by userspace
>    for the output format. This results in insufficient buffer space when
>    running the ChromeOS video_decode_accelerator_tests test program,
>    likely due to a small initial resolution followed by dynamic
>    resolution change.
> 
> 2. Doesn't support dynamic resolution change.
> 
> This small series fixes both and aligns the behavior with the other two
> stateless decoder drivers. This was tested on the downstream ChromeOS
> 5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
> have any other RK3399 devices set up to test video stuff, so testing
> would be very much appreciated.
> 
> Also, I'm not sure if user applications are required to check the value
> of sizeimage upon S_FMT return. If the value is different or too small,
> what can the application do besides fail? AFAICT it can't split the
> data of one frame (or slice) between different buffers.

While most software out there just assumes that driver will do it right and
crash when it's not the case, application that do map the buffer to CPU must
read back the fmt structure as the drivers are all fail-safe and will modify
that structure to a set of valid value s for the context.

As for opposite direction (output vs capture) format being changed, this should
be documented in the spec, if you find it too unclear or missing for sateless
codec (I know it's there for stateful but can't remember, would have to re-read,
for stateless) let us know.

regards,
Nicolas

> 
> Andrzej, I believe the second patch would conflict with your VP9 series.
> 
> 
> Regards
> ChenYu
> 
> Chen-Yu Tsai (2):
>   media: rkvdec: Do not override sizeimage for output format
>   media: rkvdec: Support dynamic resolution changes
> 
>  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
>  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
>  2 files changed, 23 insertions(+), 22 deletions(-)
> 


