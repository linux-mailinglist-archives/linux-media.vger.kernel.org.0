Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21BA680713
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 09:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbjA3ILN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 03:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbjA3ILM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 03:11:12 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71AA15B92
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 00:10:44 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id r18so7031920pgr.12
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 00:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DLvNeZrlZF3qHzKxRoxIGG9/wy5lq3h6gM+nv9CTwug=;
        b=DxAbuY5ftH5m5QZ5xCTwMk6oIZdL+DH1dWeov/zM/Uuw5aLFjyX5urDPirIU8TbWdK
         m2zWXOC+XZSg8DF+DaHgMsF1Y8HsGWhAGuiil21niuh+BRZFJwrjb25J54VDgqOvauTO
         YcvI57I/tlnJQD54ggk5/FywlwLquA7TVvvGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLvNeZrlZF3qHzKxRoxIGG9/wy5lq3h6gM+nv9CTwug=;
        b=gSvM98DBAgQ790jb6DPOhLZe8toP2FIcgX4lAeLdKax0GhIkSunp+94SB1yHtckLg9
         1zDwOSOpaBlv/oKf4YwsWKxTV2XJrlbiGEZ6E1l/6vJ2svO3jF97psmQinMn2GDFdgN3
         3s2O/gVFjA2eNDzPxKhBSfve8EgdS/X043qLe9/e6YWSGyeJzu1YcP9uAyVyD54InW2b
         yvSW4QG0YLilokna1cAC8V+BF4uNO2K8/HjAozBFMCuCngX+ITHBOg8Qc0t+xQ09WOI4
         fQRytnwRDfWao+03E6JQFY0BvKVErx/qdzQz3RDHIo0aSSI3ZRA3En51edgUbVxrvIoU
         FwVg==
X-Gm-Message-State: AO0yUKUnd52N5D7X4TCM3ML8srZxKtMhccVH0yJHinomiVpchRFYYkMx
        Q0f1pf0Lj8RST09jy2vS7KwW9x1EfL/37gYh
X-Google-Smtp-Source: AK7set9ATx+MTtZ4xuHAXLE47Hzj5jDazt+3zfgTsFJb3gbExy2m/LA00KWsy6WIOf7L1iCTrO3aXA==
X-Received: by 2002:a05:6a00:2193:b0:593:a3bc:a017 with SMTP id h19-20020a056a00219300b00593a3bca017mr7871743pfi.20.1675066166151;
        Mon, 30 Jan 2023 00:09:26 -0800 (PST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id k5-20020aa79985000000b0059398b45272sm3490767pfh.58.2023.01.30.00.09.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 00:09:25 -0800 (PST)
Received: by mail-pf1-f173.google.com with SMTP id u5so6783252pfm.10
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 00:09:25 -0800 (PST)
X-Received: by 2002:a62:d158:0:b0:592:6981:c54b with SMTP id
 t24-20020a62d158000000b005926981c54bmr1760456pfl.60.1675066164672; Mon, 30
 Jan 2023 00:09:24 -0800 (PST)
MIME-Version: 1.0
References: <9001ccdec3e3234253cf2f93ea39745ed6f525f1.camel@intel.com>
In-Reply-To: <9001ccdec3e3234253cf2f93ea39745ed6f525f1.camel@intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 30 Jan 2023 09:09:17 +0100
X-Gmail-Original-Message-ID: <CANiDSCutto9KpP=Q5GCXpTn=eUE+RsCpWqA_goDb+MqnT3iU+w@mail.gmail.com>
Message-ID: <CANiDSCutto9KpP=Q5GCXpTn=eUE+RsCpWqA_goDb+MqnT3iU+w@mail.gmail.com>
Subject: Re: [PATCH] uvc: Intel PID enabling UVC Metadata attributes
To:     Dmitry Perchanov <dmitry.perchanov@intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, linux-kernel@vger.kernel.org,
        evgeni.raikhel@intel.com, demisrael@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry

I believe Laurent usually requests the full usb descriptors. Could you
send the output of lsusb -v for these devices?

Thanks!

On Sun, 29 Jan 2023 at 15:30, Dmitry Perchanov
<dmitry.perchanov@intel.com> wrote:
>
> Intel RealSense UVC cameras Metadata support.
>
> Co-developed-by: Yu MENG <yu1.meng@intel.com>
> Co-developed-by: Evgeni Raikhel <evgeni.raikhel@intel.com>
> Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 72 ++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e4bcb5011360..955f67d9a993 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3000,6 +3000,78 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D410/ASR depth camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0ad2,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D415/ASRC depth camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0ad3,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D430/AWG depth camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0ad4,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel Fallback USB2 Descriptor */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0ad6,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D435/AWGC depth camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0b07,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D435i depth camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0b3a,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D405 Depth Camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0b5b,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> +       /* Intel D455 Depth Camera */
> +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> +         .idVendor             = 0x8086,
> +         .idProduct            = 0x0b5c,
> +         .bInterfaceClass      = USB_CLASS_VIDEO,
> +         .bInterfaceSubClass   = 1,
> +         .bInterfaceProtocol   = 0,
> +         .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
>         /* Generic USB Video Class */
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>         { USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> --
> 2.25.1
>
>
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>


-- 
Ricardo Ribalda
