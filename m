Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7CB4FF8B7
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 16:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiDMOSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 10:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiDMOSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 10:18:00 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22D55F8D8
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 07:15:38 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id o18so1429385qtk.7
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Je+OBWCP+RuJHaUt3uOA2yKSmvIM5+FWYrIzROwQA0w=;
        b=K3MobVZ1LQRxxa3e8Av3pfbVzFf5O/Ervf0hGcJXeEg0kgoULmbHSKsWTVfpA9kMif
         B10w8CjUVa0LQVNo+NEFrf3L0/8sTfYK6CGNrX1wfGiu9ORbsKs3ghFGo1fqqlPX/ncW
         PwuMNKNOKZNSkoa9RDM2S77ibWZ2E4QqrW7AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Je+OBWCP+RuJHaUt3uOA2yKSmvIM5+FWYrIzROwQA0w=;
        b=0fcgi2OhfLKY5TTp6JhaAeqP1AJDYs9T+SfhUCUhb9zwgk/ygNQNTyTWdBDUKYU4eD
         0AdQR++Z+lWn/hsBwr/xUTBM+1fbu8bGXcPpy9bhvNlFzCafW7dCHLyq1xx0GvZHP0Fx
         anMnwOWIJzzxMb4+uK3mPCeg7pm+d8Bb24HuDS9bC92+HJYAvwFv2qmT7Bo6RGV7vLv1
         Pf3htlqkCIbWVCjVcjCaT7tTxIrVY32eoYR8yHuMVTwc/w8ebMdiIRFR4+iEcWT3WEiT
         w9kOy96b/eqIaRw752SdWZPsvv9EevCdD2I9+oUPAqg6svwJzDlXxTlDNjRNgivWiGF4
         miSw==
X-Gm-Message-State: AOAM531eQPBa+genX/+7tAJK/XLl06FGrAYLwpcO6xCub9mlex7CZPmd
        XW/moEzA6K9YLZpBR/fQHXqsKgfYOx2eRQ==
X-Google-Smtp-Source: ABdhPJxlz4FcKTJGdiirObGxLR1UEtvZYWqpP/jD4YtyMg+xxQCTYKJ7N+80uLVm5FPT2hRq1f3wdg==
X-Received: by 2002:a05:622a:311:b0:2e1:c5eb:f52f with SMTP id q17-20020a05622a031100b002e1c5ebf52fmr7559734qtw.468.1649859337627;
        Wed, 13 Apr 2022 07:15:37 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id y5-20020a05620a0e0500b0069c28a4e8ddsm4632606qkm.72.2022.04.13.07.15.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 07:15:36 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2ebf3746f87so23872747b3.6
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 07:15:36 -0700 (PDT)
X-Received: by 2002:a81:230e:0:b0:2eb:57f7:5ed5 with SMTP id
 j14-20020a81230e000000b002eb57f75ed5mr32890479ywj.229.1649859336277; Wed, 13
 Apr 2022 07:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220413133315.622593-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20220413133315.622593-1-sakari.ailus@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 13 Apr 2022 23:15:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A-8pnFN6UH-kT-LKwMpnOU8mxPE5mXXxRWRyqTiPUtxA@mail.gmail.com>
Message-ID: <CAAFQd5A-8pnFN6UH-kT-LKwMpnOU8mxPE5mXXxRWRyqTiPUtxA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Revert "media: dw9768: activate runtime PM and turn
 off device"
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 13, 2022 at 10:32 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> This reverts commit c09d776eaa060534a1663e3b89d842db3e1d9076.
>
> Revert the commit as it breaks runtime PM support on OF based systems.
> More fixes to the driver are needed.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/dw9768.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index 65c6acf3ced9a..c086580efac78 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -469,11 +469,6 @@ static int dw9768_probe(struct i2c_client *client)
>
>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
>
> -       /*
> -        * Device is already turned on by i2c-core with ACPI domain PM.
> -        * Attempt to turn off the device to satisfy the privacy LED concerns.
> -        */
> -       pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
>         if (!pm_runtime_enabled(dev)) {
>                 ret = dw9768_runtime_resume(dev);
> @@ -488,7 +483,6 @@ static int dw9768_probe(struct i2c_client *client)
>                 dev_err(dev, "failed to register V4L2 subdev: %d", ret);
>                 goto err_power_off;
>         }
> -       pm_runtime_idle(dev);
>
>         return 0;
>
> --
> 2.30.2
>

Thanks for a quick response!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
