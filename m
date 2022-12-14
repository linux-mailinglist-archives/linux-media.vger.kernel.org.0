Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBF964C7EA
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 12:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237912AbiLNL1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 06:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiLNL1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 06:27:05 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D24220CE
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:27:04 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id t18so4190384pfq.13
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rUQEtBl1/L1ObEHjiRF8MELDwBPDwamGEgo/ewsNXhg=;
        b=Nr2TRbtcNNEIucWZd7h/ZgNckzVoSU8v8HO9dO2x1ZF0Z9NhBChwSLkPGtiset6yCM
         lSPIXwNuTY9U4z7CmX2qASl5ZWCvosvF80kDqebcH9JNfJs/VPH2hl8bcQPaxjsMXTWe
         AJ+jbEzyGFucfDJ5qcLKSdgwvLrZoiWMrZ6/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUQEtBl1/L1ObEHjiRF8MELDwBPDwamGEgo/ewsNXhg=;
        b=QK5WfCKtbHrBf55OWMBILaKx1T+hLMOiJ9ed2JfWu5xsbAzep12nu36GN6c9NHmIAL
         qQ2NqBT3uu93SkJa/Ljh/z291tcGlAy/7/1yMXx2oiTa5/PnL0IJfEI2EMPuWJqKUq/Z
         uqaWYzo01VVR74S3mKIr7c5O26zrHShw4fv8jq9c/gWErzuZ+CZznCTrDDvkymtDthBe
         peBZo3WUZOkFirz01uV6Ra0C40wrQHivpJ74JwIydO0cbt0JlRr+JNpV2OjsIs3utNA1
         C01oVfCYyyks+s3aQ6CrOmQbiwHbeOgw4fhOfWCK3DKlgd6S9TiEgJsZnCTm/wzDao8h
         WZbw==
X-Gm-Message-State: ANoB5pn8nCiyGtTMi/4ZhxtTfif0qAYgbye4p1ua2D77F1TIYuovK8CR
        bV20DPAbd5eGSlvdXuOgdnhYQ+9Ifa4vW9Cqsy0=
X-Google-Smtp-Source: AA0mqf4do/08NoBndYUNCYQgQGzm1HFWQQ/ZkuxH34k4zlVt+1C3x2eMxbbpqkSNgOxypLmW2Ug2sA==
X-Received: by 2002:a62:17c4:0:b0:578:43e3:f48e with SMTP id 187-20020a6217c4000000b0057843e3f48emr15359292pfx.16.1671017223568;
        Wed, 14 Dec 2022 03:27:03 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id h67-20020a628346000000b0056b9df2a15esm9295491pfe.62.2022.12.14.03.27.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 03:27:02 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso6740379pjh.1
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:27:02 -0800 (PST)
X-Received: by 2002:a17:902:8a98:b0:189:d081:1ebb with SMTP id
 p24-20020a1709028a9800b00189d0811ebbmr21137959plo.130.1671017221371; Wed, 14
 Dec 2022 03:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v1-0-a0098ddc7c93@chromium.org>
In-Reply-To: <20221214-uvc-status-alloc-v1-0-a0098ddc7c93@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Dec 2022 12:26:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCsi5juv7vTOnVr0rP5SVWG1V1uz8++-f3Q+kihpxpGHRw@mail.gmail.com>
Message-ID: <CANiDSCsi5juv7vTOnVr0rP5SVWG1V1uz8++-f3Q+kihpxpGHRw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Do not alloc dev->status
To:     Yunke Cao <yunkec@chromium.org>, Max Staudt <mstaudt@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

This is the next version of the previous patch including Sergey's comments.

It is on its own series now.

Regards!

On Wed, 14 Dec 2022 at 12:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> UVC_MAX_STATUS_SIZE is 16, simplify the code by inlining dev->status.
>
> Now that we are at it, remove all the castings.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> To: Yunke Cao <yunkec@chromium.org>
> To: Sergey Senozhatsky <senozhatsky@chromium.org>
> To: Max Staudt <mstaudt@google.com>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/usb/uvc/uvc_status.c | 69 ++++++++++++--------------------------
>  drivers/media/usb/uvc/uvcvideo.h   | 22 +++++++++++-
>  2 files changed, 42 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 7518ffce22ed..adf63e7616c9 100644
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
> +               switch (dev->status.bStatusType & 0x0f) {
>                 case UVC_STATUS_TYPE_CONTROL: {
> -                       struct uvc_control_status *status =
> -                               (struct uvc_control_status *)dev->status;
> -
> -                       if (uvc_event_control(urb, status, len))
> +                       if (uvc_event_control(urb, &dev->status, len))
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
> +                       uvc_event_streaming(dev, &dev->status, len);
>                         break;
>                 }
>
>                 default:
>                         uvc_dbg(dev, STATUS, "Unknown status event type %u\n",
> -                               dev->status[0]);
> +                               dev->status.bStatusType);
>                         break;
>                 }
>         }
> @@ -259,15 +239,9 @@ int uvc_status_init(struct uvc_device *dev)
>
>         uvc_input_init(dev);
>
> -       dev->status = kzalloc(UVC_MAX_STATUS_SIZE, GFP_KERNEL);
> -       if (dev->status == NULL)
> -               return -ENOMEM;
> -
>         dev->int_urb = usb_alloc_urb(0, GFP_KERNEL);
> -       if (dev->int_urb == NULL) {
> -               kfree(dev->status);
> +       if (!dev->int_urb)
>                 return -ENOMEM;
> -       }
>
>         pipe = usb_rcvintpipe(dev->udev, ep->desc.bEndpointAddress);
>
> @@ -281,7 +255,7 @@ int uvc_status_init(struct uvc_device *dev)
>                 interval = fls(interval) - 1;
>
>         usb_fill_int_urb(dev->int_urb, dev->udev, pipe,
> -               dev->status, UVC_MAX_STATUS_SIZE, uvc_status_complete,
> +               &dev->status, sizeof(dev->status), uvc_status_complete,
>                 dev, interval);
>
>         return 0;
> @@ -296,7 +270,6 @@ void uvc_status_unregister(struct uvc_device *dev)
>  void uvc_status_cleanup(struct uvc_device *dev)
>  {
>         usb_free_urb(dev->int_urb);
> -       kfree(dev->status);
>  }
>
>  int uvc_status_start(struct uvc_device *dev, gfp_t flags)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index df93db259312..cdd2e328acc2 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -527,6 +527,26 @@ struct uvc_device_info {
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
> @@ -559,7 +579,7 @@ struct uvc_device {
>         /* Status Interrupt Endpoint */
>         struct usb_host_endpoint *int_ep;
>         struct urb *int_urb;
> -       u8 *status;
> +       struct uvc_status status;
>         struct input_dev *input;
>         char input_phys[64];
>
>
> ---
> base-commit: 0ec5a38bf8499f403f81cb81a0e3a60887d1993c
> change-id: 20221214-uvc-status-alloc-93becb783898
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>



-- 
Ricardo Ribalda
