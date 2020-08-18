Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F0524861B
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgHRNeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 09:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHRNdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:33:55 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E6CC061342
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 06:33:55 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 93so16272445otx.2
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dQLyWbIJMiZVSB0b6mZobaJ2GGEre/pwsB3towSn0HQ=;
        b=TxAO70T/2C0DtmpXFEDzxL6jjQOUfyf3b+vnxO/vcvap4GhPs3tYTrBNAZ+k368wJu
         I1h8GiU3jsiRrN3yv4gGwDmZMeKALDE9vLuQgGn1MZUKskKLFhOQlMAXgfoI50Jk6CV2
         iClvoh9t7asFU+qgFcZ1aLkpEpezBF+rf42PugDyFdYKqaJuBLZCk6XaPPaHlF15qVFu
         bg0aOqPHPGLemrg+rFvRnbvPRcB5r0Xlk9aTUjxwlHuRamHlkTjAWZZ7IoydX5eBvAFh
         t3kNS/aNM/zaMqGbvU7Wvqp+0alrLRvZjmNMbUTkAJY2fW4LNkkhDyChp8EaPOUCQLbU
         Lrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQLyWbIJMiZVSB0b6mZobaJ2GGEre/pwsB3towSn0HQ=;
        b=nzzKKeqS6HTfeng2Lka9NluUb8SwFjzqHQyRUKeYGFZALyPXhLSJNjhUNAmEN4pk2r
         eaQBLXyDhzrpx76QL5mMFD3ogKSkGb19FUXFYjjzqtI2Cc4Lau5VuH/vjlqfHdmEfPSf
         HBigpqp20UazQhQm1BnZKeafI43yYWy8b3OCCweEN9vSOMMubrdlboI9759Z+TXmzJP4
         3nkoJPs2W+/PGL8/9rNuTylurUs84sz3HMt1QcSStffq0jO9bhbCck85Ihu0TPB/4P1h
         hcLWN46uUvTqho+x5yjeHUZcZrcu4pet5e32ooWnZBBdJC4KzMV2ahR8Ot1n1T6CgKlX
         eOIw==
X-Gm-Message-State: AOAM533y3KUUSekW/RW0fRoUdfcOZi5D31fC9Uvmg/H9pj4qhHOfyG/p
        Pl0inVbAGK54SxXJwcKz5VmQGxJpCZRD1EwAusMOSOiDn3xDXg==
X-Google-Smtp-Source: ABdhPJyPhrWFOwFucKpcNzKyV26qgAIIOsQfewHH1dlhx1GaykINWZX21wkV7VV9ZCkZqgTvNkgSI2b1LMgltLc73QE=
X-Received: by 2002:a9d:1a3:: with SMTP id e32mr14329566ote.272.1597757634275;
 Tue, 18 Aug 2020 06:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200814205403.27639-1-andrey.konovalov@linaro.org>
In-Reply-To: <20200814205403.27639-1-andrey.konovalov@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 18 Aug 2020 15:33:43 +0200
Message-ID: <CAG3jFytWaWH2TUprQ1dEjKatUEfWWzeuUc18J3g8zk6bE9-cQQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: camss: extend VIDIOC_ENUM_* ioctls support
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

I've looked through this series, and it all looks good to me.

Acked-by: Robert Foss <robert.foss@linaro.org>

On Fri, 14 Aug 2020 at 22:54, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> The first two patches add mbus_code filtering support to VIDIOC_ENUM_FMT
> implementation, and VIDIOC_ENUM_FRAMESIZES support.
>
> The minimum and the maximum frame size values are deduced from
> __video_try_fmt() code.
>
> The third patch replaces harcoded limits in __video_try_fmt() with
> the definitions introduced by the second patch.
>
> Andrey Konovalov (3):
>   media: camss: Make use of V4L2_CAP_IO_MC
>   media: camss: add support for vidioc_enum_framesizes ioctl
>   media: camss: __video_try_fmt(): don't use hardcoded constants
>
>  .../media/platform/qcom/camss/camss-video.c   | 112 +++++++++++++++---
>  1 file changed, 95 insertions(+), 17 deletions(-)
>
> --
> 2.17.1
>
