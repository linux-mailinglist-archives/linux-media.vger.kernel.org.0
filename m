Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6162559BE6F
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 13:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbiHVL1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 07:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbiHVL1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 07:27:33 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AE732EF6
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 04:27:32 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r4so13425548edi.8
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc;
        bh=t3OYeX7kWxlsPaW3fbNLmb2bg7Gc/NegkzT2tgCob5U=;
        b=IuYlNN7SMdin+fNrslQw9uMzHff4olPykrSZXrZGD2lyoXboUGdqK71s3THD/kGhv4
         Q4PwwSmvsP1aUvLy5m+V+tdRx5HuxVf/P/L468MXXSV3ZgTh7tMIryEWHMgIU2hWvLjE
         tqEiE7syPpGT2ElVdBedG1m+FH7TieZi8KsJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc;
        bh=t3OYeX7kWxlsPaW3fbNLmb2bg7Gc/NegkzT2tgCob5U=;
        b=nUJLNZ1YG/0cBfzsR51LkCXgSpjxzCRAGtt1GBwUIHdNEMXBZPe3mapROtMR2vmtSK
         SOhFVSE0X6n9WklF16Vd5LTGPxuSFw6yk8LcPhYX/keTdtItkrBWZUiihOhgdT2fTYJG
         9HP/8iHI82pY58G8OPdLDnUwnLUdVKzjOJcZj+6tA3eLHj1Q6A0f3wY+4x7HwvLB5vBv
         lheVwsFL9ndyDGRE7OyS7nCi7ufBvAOukDjKVp0zle8JeIedLYiEjjCoUdX753JFXr3w
         dnc6tyev4BScH4RM8jNo9ChMhbRjbBLDoVeni504jcl9o7mhCqZtfnTKgzvghzms5ywS
         Wmog==
X-Gm-Message-State: ACgBeo03xe5mMuOMnKd8cFdJHtbPRupV3VANsaCVIypds+im4uA7WpTH
        DA4POYB43tGi6234PWiLGtQQ3ssiE/RACQ==
X-Google-Smtp-Source: AA6agR5C4um7sYDRdPnHLHjVQlQ03sYxIITQzOZY0VpwOuEceQhEKgBQlKdr9R1p62c30cnASt/Cig==
X-Received: by 2002:a05:6402:369a:b0:43d:75c5:f16c with SMTP id ej26-20020a056402369a00b0043d75c5f16cmr15434299edb.57.1661167650538;
        Mon, 22 Aug 2022 04:27:30 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id la26-20020a170907781a00b0073c23616cb1sm5773816ejc.12.2022.08.22.04.27.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 04:27:29 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id q2so11313802edb.6
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 04:27:29 -0700 (PDT)
X-Received: by 2002:a05:6402:3585:b0:446:9d7b:2e38 with SMTP id
 y5-20020a056402358500b004469d7b2e38mr5664787edc.248.1661167649019; Mon, 22
 Aug 2022 04:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220808134106.70100-1-ribalda@chromium.org>
In-Reply-To: <20220808134106.70100-1-ribalda@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 22 Aug 2022 13:27:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCtyWTUn2qOpFLR=694_GFKfmj-TfMNE-8n2zwm=6mGr9A@mail.gmail.com>
Message-ID: <CANiDSCtyWTUn2qOpFLR=694_GFKfmj-TfMNE-8n2zwm=6mGr9A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix InterfaceProtocol for Quanta camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi

Friendly ping on text-mode with the correct account ;)

Regards!

On Mon, 8 Aug 2022 at 15:41, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> The device is using a different InterfaceProtocol than the one set in
> the original quirk.
>
> Fixes: 95f03d973478 ("media: uvcvideo: Limit power line control for Quanta cameras")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>
> This was fixed on the last version of the patchset. Unfortunately I did
> checked that it was the version merged :(.
>
> It is too late to land it in this version?
>
>
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9c05776f11d1..6556158a8888 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2740,7 +2740,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .idProduct            = 0x4034,
>           .bInterfaceClass      = USB_CLASS_VIDEO,
>           .bInterfaceSubClass   = 1,
> -         .bInterfaceProtocol   = 0,
> +         .bInterfaceProtocol   = 1,
>           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
>         /* LogiLink Wireless Webcam */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> --
> 2.37.1.559.g78731f0fdb-goog
>


-- 
Ricardo Ribalda
