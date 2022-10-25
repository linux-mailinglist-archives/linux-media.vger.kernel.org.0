Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489CA60CFBE
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 16:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiJYO7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 10:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiJYO7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 10:59:10 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BAA1AC1F8
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 07:59:09 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id 137so10498608iou.9
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 07:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf9l8TdBoqI3NSI3uJgvcfgTwT27VcCao15/BLv2mmM=;
        b=CS3mnQ7JD6Q8rKoVfoDkCC+DFRUfHfkHxcAvQ72s5DnYhjp6MdDQGy5vs/jIuAZl8w
         fGqhH+rPyCGoccxGPyuMShyPPDgCRLIBzTT5PIbNLhk+736yD/7X/OeUAAgvRUBSW1Gg
         gTwzP/q5lUOMZZLv0Zs9jFyhWc3ADpyEJRgt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qf9l8TdBoqI3NSI3uJgvcfgTwT27VcCao15/BLv2mmM=;
        b=WNhqZ4eGp01KnQ2hL/7Gc5HtiAunbAObl/WDY43jeSyEBN0Jr/MfGrkjVswRVqcRtv
         QRnjgReEaj92I5tVgDKXsSBAI/j9pHa15cjrDdoGj7c58HrBy3+s5FMgRTE6uuDilXIx
         S9Iy9CXvDe3kYLzkNTRyTBtYKp0ptQ5GyKp3JzTCWVuzEQfJhrjPOF0i8Fw9xId1p7FI
         fXaubT9iHD9/rhjNXmOoBzRL8XhEFnChJ3DBygNCmaeuZdtZqccmPGVR6BhMq80rWZAr
         bzGCIcMYYTOzcaR5E5FvZSzFAil8YzfABRKsW0aHQQTxRUsmMH+qTHH6Tqmyvo/zdAhb
         602g==
X-Gm-Message-State: ACrzQf1CYz+HT66Zl34F00PNHvJ88qtZdaYbyglZQBbbE/i5RXbLsH4w
        IhJGKgDeeGr0Izd2UTQW2yI3ywo7F0rkPV04
X-Google-Smtp-Source: AMsMyM5OitPr6k2OlKDivCcwqbas6jJhWg44aq4nWCPwCfHPiHYRq5un3siZmScQA4SEDI1V25KQBw==
X-Received: by 2002:a02:8804:0:b0:35b:7425:82af with SMTP id r4-20020a028804000000b0035b742582afmr24451207jai.21.1666709948518;
        Tue, 25 Oct 2022 07:59:08 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id y25-20020a056638229900b00363a11b0b44sm994447jas.9.2022.10.25.07.59.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 07:59:07 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id r142so10491748iod.11
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 07:59:07 -0700 (PDT)
X-Received: by 2002:a5d:9ac1:0:b0:6a3:1938:e6b0 with SMTP id
 x1-20020a5d9ac1000000b006a31938e6b0mr22659626ion.186.1666709947180; Tue, 25
 Oct 2022 07:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221025050450.1743072-1-pedro.guilherme@espectro.eng.br> <20221025050450.1743072-3-pedro.guilherme@espectro.eng.br>
In-Reply-To: <20221025050450.1743072-3-pedro.guilherme@espectro.eng.br>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 25 Oct 2022 16:58:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCvN5DEDdjCkO-KXgYwnhF_FGE4c=DMGiUTy4KKp51ANFA@mail.gmail.com>
Message-ID: <CANiDSCvN5DEDdjCkO-KXgYwnhF_FGE4c=DMGiUTy4KKp51ANFA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvc_driver: fix usage of symbolic
 permissions to octal
To:     Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 25 Oct 2022 at 07:40, Pedro Guilherme Siqueira Moreira
<pedro.guilherme@espectro.eng.br> wrote:
>
> Change symbolic permissions to octal equivalents as recommended by
> scripts/checkpatch.pl on drivers/media/usb/uvc/uvc_driver.c.
>
> Signed-off-by: Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7b6c97ad3a41..c5adad4e51e2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2362,17 +2362,17 @@ static int uvc_clock_param_set(const char *val, const struct kernel_param *kp)
>  }
>
>  module_param_call(clock, uvc_clock_param_set, uvc_clock_param_get,
> -                 &uvc_clock_param, S_IRUGO|S_IWUSR);
> +                 &uvc_clock_param, 0644);
>  MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
> -module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, S_IRUGO|S_IWUSR);
> +module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
>  MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
> -module_param_named(nodrop, uvc_no_drop_param, uint, S_IRUGO|S_IWUSR);
> +module_param_named(nodrop, uvc_no_drop_param, uint, 0644);
>  MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
> -module_param_named(quirks, uvc_quirks_param, uint, S_IRUGO|S_IWUSR);
> +module_param_named(quirks, uvc_quirks_param, uint, 0644);
>  MODULE_PARM_DESC(quirks, "Forced device quirks");
> -module_param_named(trace, uvc_dbg_param, uint, S_IRUGO|S_IWUSR);
> +module_param_named(trace, uvc_dbg_param, uint, 0644);
>  MODULE_PARM_DESC(trace, "Trace level bitmask");
> -module_param_named(timeout, uvc_timeout_param, uint, S_IRUGO|S_IWUSR);
> +module_param_named(timeout, uvc_timeout_param, uint, 0644);
>  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
>
>  /* ------------------------------------------------------------------------
> --
> 2.38.1
>


-- 
Ricardo Ribalda
