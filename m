Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1058D5910C2
	for <lists+linux-media@lfdr.de>; Fri, 12 Aug 2022 14:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbiHLM0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Aug 2022 08:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238444AbiHLMZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Aug 2022 08:25:47 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005036A4AC
        for <linux-media@vger.kernel.org>; Fri, 12 Aug 2022 05:25:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id qn6so1732445ejc.11
        for <linux-media@vger.kernel.org>; Fri, 12 Aug 2022 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hoPdeb8OdFXqd1Rv3siD9/ni79oI0Ebkx5U/fkexjYo=;
        b=VXLIxL00R6mE0dHpqUOlVOQPOSrutRURGF0ISBuM1gReVDR8t0x0QpoQkyTy3zJpcw
         1rlXK7sLtVtIT+IwtH3MPhJa8sED+U4aIeIGsM80W8/Sm408vLj9OGnj8J2FcfNDHCEJ
         gssjkuUYt5loxmQloVx8PA1tVU7kVCueLPai4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hoPdeb8OdFXqd1Rv3siD9/ni79oI0Ebkx5U/fkexjYo=;
        b=Y9h0hliL7ofSwSNLfoB1yRothOFpheDbZd4DgU9/PwbNvCZIW6yFRqSLAbJBWlFjhj
         glniZ7kXfCEtD8v66yWOS20hfC8iMdfD7egFAnFbzl7mgJZndMbpgjg98hSR+c1rQOqn
         AV0DcQTYo3JHQke6rZDO9K5S+B2I1e5/CaTGD0PKB4rN3kRwoyeZs0R6eDudWVBa42IS
         3fcw9eB8WhPAQEAWXNXWkj9eoIHsmP3kcyb2SWcckQqDbXNTIb7u+11QtpSwPlfNRqH6
         rjHhySIuJeZmqVdERPIUSKi4ihalwIr8u5aXelX7bnXZIf//S5nv3w7v0c/nip4KdkiS
         9MdA==
X-Gm-Message-State: ACgBeo1vVCSYlDlIJ5WF1/yukul62/IBeAiNbUgCGYWbPdF3S7fyvm2m
        9aW6Y0gle8v31bJFIwfk31IcGVzYUtMLGQ==
X-Google-Smtp-Source: AA6agR6/7KyMcZWNoz/YdSv2ccMLDlu7fGvXr2HFM9JBdR4f5C8aelvjcEJKgXIAvHA0ufVa0MHzpg==
X-Received: by 2002:a17:907:7f1d:b0:732:fa14:2012 with SMTP id qf29-20020a1709077f1d00b00732fa142012mr2588410ejc.652.1660307143211;
        Fri, 12 Aug 2022 05:25:43 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7d811000000b0043d7ff1e3bcsm1268143edq.72.2022.08.12.05.25.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 05:25:42 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id qn6so1732363ejc.11
        for <linux-media@vger.kernel.org>; Fri, 12 Aug 2022 05:25:42 -0700 (PDT)
X-Received: by 2002:a17:906:9f2a:b0:730:bc30:da30 with SMTP id
 fy42-20020a1709069f2a00b00730bc30da30mr2556056ejc.763.1660307142238; Fri, 12
 Aug 2022 05:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220812121202.1971-1-huanglei@kylinos.cn>
In-Reply-To: <20220812121202.1971-1-huanglei@kylinos.cn>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 12 Aug 2022 14:25:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCu_RMx6mA54uUxsbF+oLw9PsWhrSR4U-dHASqPwnwB-3Q@mail.gmail.com>
Message-ID: <CANiDSCu_RMx6mA54uUxsbF+oLw9PsWhrSR4U-dHASqPwnwB-3Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: limit power line control for Sonix Technology
To:     huanglei <huanglei@kylinos.cn>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi huanglei

Thanks for your patch

Don't you have to add a field:

.driver_info = (kernel_ulong_t)&uvc_ctrl_power_line_limited },

to your quirk?


Regards!

On Fri, 12 Aug 2022 at 14:16, huanglei <huanglei@kylinos.cn> wrote:
>
> The device does not implement the power line control correctly. Add a
> corresponding control mapping override.
>
> Bus 003 Device 003: ID 3277:0072 Sonix Technology Co., Ltd. USB 2.0 Camera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x3277
>   idProduct          0x0072
>   bcdDevice            1.00
>   iManufacturer           2 Sonix Technology Co., Ltd.
>   iProduct                1 USB 2.0 Camera
>   iSerial                 3 REV0001
>   bNumConfigurations      1
>
> Signed-off-by: huanglei <huanglei@kylinos.cn>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9c05776f11d1..48f4d755a584 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3282,6 +3282,14 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Sonix Technology USB 2.0 Camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x3277,
> +         .idProduct            = 0x0072,
> +         .bInterfaceClass      = USB_CLASS_VENDOR_SPEC,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0 },
>         /* Generic USB Video Class */
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> --
> 2.17.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus



-- 
Ricardo Ribalda
