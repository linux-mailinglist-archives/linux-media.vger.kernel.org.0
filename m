Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CA464DA04
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 12:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiLOLHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 06:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLOLHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 06:07:43 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD7223E84
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 03:07:42 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id n4so2821751plp.1
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vc7urz0MQ9ZSG7GJIi9irvt4TLa7mcOWa2rcv4Jgef8=;
        b=B8uGpmQIMCLxDTpWqHz/7fu3qWjF/qluOOmPSUysWIgi9oHhvF81ScXuCq/4f9FA/n
         dc79S83g6o1SH4jl4CGfpxdBwiQoGcI6ktvrty2r/JjAoDU+dFNoby122IjOypG8yjgc
         lRuZR62WdSPWYPJvI44Vx088JT88xbsmdismg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vc7urz0MQ9ZSG7GJIi9irvt4TLa7mcOWa2rcv4Jgef8=;
        b=DBPSAHrlksLetBkCqtfhqxeSirD8p02UThsZMoNkBAg3EchMu9ykmo5XpasypqZhpE
         RxiUPiNSZ7jpN/6kkM/LH+P9KB5c6W6ctTB4Vjwzy+nqLq1kSm80Z+6ZCLJ1jf0JoJZy
         KftfmBTj/hUlCskvH+d23Iohb4j+LI/Vc02gYgCyPwfbkDjJykXzQKQvFmEWBcBoJgyf
         LaDovZFPsjQHWiko6XRM+vGFIV8YHEdsIObreD1e2RGkSAC8K5C6uSht0/p7qTgT8GC1
         +G6MI07Y2Z9XzuSKLxQ2FkxHeLbsAGT1KZ3vDfkS1+8XEyulMCSWLWS6O8RVVDA/rIhl
         coNg==
X-Gm-Message-State: ANoB5pkeOUWFFhWxuNjqdLAdXOGRzFFr80NwU5ZdMKLN/P4xEe9FDt4d
        qeuH0Yvcu051OXWRrZpfeuzQFzOlQdxtHBkuQi0=
X-Google-Smtp-Source: AA0mqf52hxzHV8x57fruuJMDSx3CFpdsetbjbKbdCjMPRRQyJ1qPe2TZjI116hm1ugToggBdDbBAQw==
X-Received: by 2002:a17:902:cf4c:b0:189:d696:63e2 with SMTP id e12-20020a170902cf4c00b00189d69663e2mr32559610plg.39.1671102462110;
        Thu, 15 Dec 2022 03:07:42 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id n3-20020a170903110300b001892af9472esm3529810plh.261.2022.12.15.03.07.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 03:07:40 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so2383544pjp.1
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 03:07:40 -0800 (PST)
X-Received: by 2002:a17:902:8a98:b0:189:d081:1ebb with SMTP id
 p24-20020a1709028a9800b00189d0811ebbmr21327983plo.130.1671102459512; Thu, 15
 Dec 2022 03:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v3-0-9a67616cc549@chromium.org> <20221214-uvc-status-alloc-v3-1-9a67616cc549@chromium.org>
In-Reply-To: <20221214-uvc-status-alloc-v3-1-9a67616cc549@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 15 Dec 2022 12:07:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCt9DC9X01JHuZxk4qPDHxCMk3dM1k0i1P32SjRePhoBKw@mail.gmail.com>
Message-ID: <CANiDSCt9DC9X01JHuZxk4qPDHxCMk3dM1k0i1P32SjRePhoBKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Remove void casting for the
 status endpoint
To:     Max Staudt <mstaudt@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ming Lei <tom.leiming@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yunke Cao <yunkec@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Dec 2022 at 11:57, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Make the code more resiliant, by replacing the castings with proper
> structure definitions and using offsetof() instead of open coding the
> location of the data.
>
> Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 64 +++++++++++++-------------------------
>  drivers/media/usb/uvc/uvcvideo.h   | 25 +++++++++++++--
>  2 files changed, 44 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 7518ffce22ed..dbaa9b07d77f 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -73,38 +73,24 @@ static void uvc_input_report_key(struct uvc_device *dev, unsigned int code,
>  /* --------------------------------------------------------------------------
>   * Status interrupt endpoint
>   */
> -struct uvc_streaming_status {
> -       u8      bStatusType;
> -       u8      bOriginator;
> -       u8      bEvent;
> -       u8      bValue[];
> -} __packed;
> -
> -struct uvc_control_status {
> -       u8      bStatusType;
> -       u8      bOriginator;
> -       u8      bEvent;
> -       u8      bSelector;
> -       u8      bAttribute;
> -       u8      bValue[];
> -} __packed;
> -
>  static void uvc_event_streaming(struct uvc_device *dev,
> -                               struct uvc_streaming_status *status, int len)
> +                               struct uvc_status *status, int len)
>  {
> -       if (len < 3) {
> +       if (len <= offsetof(struct uvc_status, bEvent)) {
>                 uvc_dbg(dev, STATUS,
>                         "Invalid streaming status event received\n");
>                 return;
>         }
>
>         if (status->bEvent == 0) {
> -               if (len < 4)
> +               if (len <= offsetof(struct uvc_status, streaming))
>                         return;
> +
>                 uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
>                         status->bOriginator,
> -                       status->bValue[0] ? "pressed" : "released", len);
> -               uvc_input_report_key(dev, KEY_CAMERA, status->bValue[0]);
> +                       status->streaming.button ? "pressed" : "released", len);
> +               uvc_input_report_key(dev, KEY_CAMERA,
> +                                    status->streaming.button);
>         } else {
>                 uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
>                         status->bOriginator, status->bEvent, len);
> @@ -131,7 +117,7 @@ static struct uvc_control *uvc_event_entity_find_ctrl(struct uvc_entity *entity,
>  }
>
>  static struct uvc_control *uvc_event_find_ctrl(struct uvc_device *dev,
> -                                       const struct uvc_control_status *status,
> +                                       const struct uvc_status *status,
>                                         struct uvc_video_chain **chain)
>  {
>         list_for_each_entry((*chain), &dev->chains, list) {
> @@ -143,7 +129,7 @@ static struct uvc_control *uvc_event_find_ctrl(struct uvc_device *dev,
>                                 continue;
>
>                         ctrl = uvc_event_entity_find_ctrl(entity,
> -                                                         status->bSelector);
> +                                                    status->control.bSelector);
>                         if (ctrl)
>                                 return ctrl;
>                 }
> @@ -153,7 +139,7 @@ static struct uvc_control *uvc_event_find_ctrl(struct uvc_device *dev,
>  }
>
>  static bool uvc_event_control(struct urb *urb,
> -                             const struct uvc_control_status *status, int len)
> +                             const struct uvc_status *status, int len)
>  {
>         static const char *attrs[] = { "value", "info", "failure", "min", "max" };
>         struct uvc_device *dev = urb->context;
> @@ -161,24 +147,24 @@ static bool uvc_event_control(struct urb *urb,
>         struct uvc_control *ctrl;
>
>         if (len < 6 || status->bEvent != 0 ||
> -           status->bAttribute >= ARRAY_SIZE(attrs)) {
> +           status->control.bAttribute >= ARRAY_SIZE(attrs)) {
>                 uvc_dbg(dev, STATUS, "Invalid control status event received\n");
>                 return false;
>         }
>
>         uvc_dbg(dev, STATUS, "Control %u/%u %s change len %d\n",
> -               status->bOriginator, status->bSelector,
> -               attrs[status->bAttribute], len);
> +               status->bOriginator, status->control.bSelector,
> +               attrs[status->control.bAttribute], len);
>
>         /* Find the control. */
>         ctrl = uvc_event_find_ctrl(dev, status, &chain);
>         if (!ctrl)
>                 return false;
>
> -       switch (status->bAttribute) {
> +       switch (status->control.bAttribute) {
>         case UVC_CTRL_VALUE_CHANGE:
>                 return uvc_ctrl_status_event_async(urb, chain, ctrl,
> -                                                  status->bValue);
> +                                                  status->control.bValue);
>
>         case UVC_CTRL_INFO_CHANGE:
>         case UVC_CTRL_FAILURE_CHANGE:
> @@ -214,28 +200,22 @@ static void uvc_status_complete(struct urb *urb)
>
>         len = urb->actual_length;
>         if (len > 0) {
> -               switch (dev->status[0] & 0x0f) {
> +               switch (dev->status->bStatusType & 0x0f) {
>                 case UVC_STATUS_TYPE_CONTROL: {
> -                       struct uvc_control_status *status =
> -                               (struct uvc_control_status *)dev->status;
> -
> -                       if (uvc_event_control(urb, status, len))
> +                       if (uvc_event_control(urb, dev->status, len))
>                                 /* The URB will be resubmitted in work context. */
>                                 return;
>                         break;
>                 }
>
>                 case UVC_STATUS_TYPE_STREAMING: {
> -                       struct uvc_streaming_status *status =
> -                               (struct uvc_streaming_status *)dev->status;
> -
> -                       uvc_event_streaming(dev, status, len);
> +                       uvc_event_streaming(dev, dev->status, len);
>                         break;
>                 }
>
>                 default:
>                         uvc_dbg(dev, STATUS, "Unknown status event type %u\n",
> -                               dev->status[0]);
> +                               dev->status->bStatusType);
>                         break;
>                 }
>         }
> @@ -259,12 +239,12 @@ int uvc_status_init(struct uvc_device *dev)
>
>         uvc_input_init(dev);
>
> -       dev->status = kzalloc(UVC_MAX_STATUS_SIZE, GFP_KERNEL);
> +       dev->status = kzalloc(sizeof(*dev->status), GFP_KERNEL);
>         if (dev->status == NULL)
>                 return -ENOMEM;
>
>         dev->int_urb = usb_alloc_urb(0, GFP_KERNEL);
> -       if (dev->int_urb == NULL) {
> +       if (!dev->int_urb) {
>                 kfree(dev->status);
>                 return -ENOMEM;
>         }
> @@ -281,7 +261,7 @@ int uvc_status_init(struct uvc_device *dev)
>                 interval = fls(interval) - 1;
>
>         usb_fill_int_urb(dev->int_urb, dev->udev, pipe,
> -               dev->status, UVC_MAX_STATUS_SIZE, uvc_status_complete,
> +               dev->status, sizeof(dev->status), uvc_status_complete,
this is obviously sizeof(*dev->status)

Sorry about that. Will resend, with other comments (if any)
>                 dev, interval);
>
>         return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index df93db259312..84326991ec36 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -51,8 +51,6 @@
>  #define UVC_URBS               5
>  /* Maximum number of packets per URB. */
>  #define UVC_MAX_PACKETS                32
> -/* Maximum status buffer size in bytes of interrupt URB. */
> -#define UVC_MAX_STATUS_SIZE    16
>
>  #define UVC_CTRL_CONTROL_TIMEOUT       5000
>  #define UVC_CTRL_STREAMING_TIMEOUT     5000
> @@ -527,6 +525,26 @@ struct uvc_device_info {
>         const struct uvc_control_mapping **mappings;
>  };
>
> +struct uvc_status_streaming {
> +       u8      button;
> +} __packed;
> +
> +struct uvc_status_control {
> +       u8      bSelector;
> +       u8      bAttribute;
> +       u8      bValue[11];
> +} __packed;
> +
> +struct uvc_status {
> +       u8      bStatusType;
> +       u8      bOriginator;
> +       u8      bEvent;
> +       union {
> +               struct uvc_status_control control;
> +               struct uvc_status_streaming streaming;
> +       };
> +} __packed;
> +
>  struct uvc_device {
>         struct usb_device *udev;
>         struct usb_interface *intf;
> @@ -559,7 +577,8 @@ struct uvc_device {
>         /* Status Interrupt Endpoint */
>         struct usb_host_endpoint *int_ep;
>         struct urb *int_urb;
> -       u8 *status;
> +       struct uvc_status *status;
> +
>         struct input_dev *input;
>         char input_phys[64];
>
>
> --
> 2.39.0.314.g84b9a713c41-goog-b4-0.11.0-dev-696ae



-- 
Ricardo Ribalda
