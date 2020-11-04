Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBFF2A6FCE
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 22:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731299AbgKDVm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 16:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgKDVm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 16:42:29 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB64FC0613D4
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 13:42:28 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id d9so17814350oib.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 13:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0sP9BzctjkhkEXwO+56zPqmVw64SM4o5eBdgRXpMR4E=;
        b=n96Yjsp7Hm8zz6NM0QjxGs9P6NZYYIOgvnYzW3XzfDs0Ojjnzym/pUc7L6bO+8UQ8e
         FO4iCe2OdSJ3pteHN/Eu33XavZB2vw88TUyZXtYUbTzlIegovq+oHBSJDHH6W1r48ctR
         jKxQABIofqUBC4u81I6xo76NjjEX2SAbmB45I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0sP9BzctjkhkEXwO+56zPqmVw64SM4o5eBdgRXpMR4E=;
        b=lT3ewAIDrZ8TsxzfIG601hiSoRgT+PtGvCXopmNh7TAWMIQ97Cd4dPyZmKYEhOS9Eo
         JSgYQndSQwdcHVNXq0+rzva4jqxsE90a4zLygnkViMBj8HYlbFP2QtvoT+Hy3Tm22tSg
         bF7MSiFD44LRRCt/SL3rW9+zlt2AnoZgDSqmdyJnWIzI5nZ9HwdpYx8+nXT65Pm7jz5o
         r2GoP+UoDkVAeX4UXMmPkWXkBnwBCXFtyeXl+uLXpHbq1qzAELaUrSoasxk6ZZQFMlrk
         i0gRgqILBjeSMHTCCI7U2ArsVAGhPsO33m5jgbzRshkflFa1dIvMCt+M/yCYk9FI5gJG
         mi2Q==
X-Gm-Message-State: AOAM532zUZ/jno6tsRDZDvG3wHT416R2OPvhmxtvd9+A8sMz6ZKYw8Qt
        Evh+DwxRPafxoByf5gwFqvPRTTZ0rECZFrVV
X-Google-Smtp-Source: ABdhPJzd0Rc+JiLoq2jJ+F37t11XUGtmd8UuizzZf8OUR/vh+grnBcHO2sim1X/QgLFAXr0kNJpz1g==
X-Received: by 2002:aca:4582:: with SMTP id s124mr3989956oia.81.1604526147780;
        Wed, 04 Nov 2020 13:42:27 -0800 (PST)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id f2sm748945oig.15.2020.11.04.13.42.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 13:42:27 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id l4so885312oos.7
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 13:42:27 -0800 (PST)
X-Received: by 2002:a4a:2e16:: with SMTP id x22mr135263ool.84.1604526146360;
 Wed, 04 Nov 2020 13:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20201104180734.286789-1-ribalda@chromium.org> <20201104180734.286789-2-ribalda@chromium.org>
 <87769d554b4575bf9371380b013e66d70f1b21c4.camel@perches.com>
In-Reply-To: <87769d554b4575bf9371380b013e66d70f1b21c4.camel@perches.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Nov 2020 22:42:15 +0100
X-Gmail-Original-Message-ID: <CANiDSCtjtoQef9NN7+DvW=bD_2iEvP8zvOUN8wT6_bg6ZAD6gw@mail.gmail.com>
Message-ID: <CANiDSCtjtoQef9NN7+DvW=bD_2iEvP8zvOUN8wT6_bg6ZAD6gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: uvcvideo: Use pr_cont() macro
To:     Joe Perches <joe@perches.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe


On Wed, Nov 4, 2020 at 8:29 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-11-04 at 19:07 +0100, Ricardo Ribalda wrote:
> > Replace all the uses of printk(KERN_CONT ... with pr_cont().
>
> Perhaps remove the uvc_printk macro and uses and use the more
> common pr_fmt and pr_<level> mechanisms.

I have made the suggested changes and pushed them to my working branch

https://github.com/ribalda/linux/tree/uvctest-v3

once the other patches are reviewed I send it to the mailing list.

Thanks!

>
> Something like:
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  5 +++--
>  drivers/media/usb/uvc/uvc_driver.c | 35 +++++++++++++++------------------
>  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++----
>  drivers/media/usb/uvc/uvc_status.c |  9 +++++----
>  drivers/media/usb/uvc/uvc_video.c  | 40 ++++++++++++++++----------------------
>  drivers/media/usb/uvc/uvcvideo.h   | 25 +++++++++++-------------
>  6 files changed, 58 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f479d8971dfb..e0b273697d49 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -6,6 +6,8 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> @@ -1317,8 +1319,7 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>         w->urb->interval = dev->int_ep->desc.bInterval;
>         ret = usb_submit_urb(w->urb, GFP_KERNEL);
>         if (ret < 0)
> -               uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
> -                          ret);
> +               pr_err("Failed to resubmit status URB (%d)\n", ret);
>  }
>
>  bool uvc_ctrl_status_event(struct urb *urb, struct uvc_video_chain *chain,
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ddb9eaa11be7..03d68e2b6b70 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -6,6 +6,8 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/atomic.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -534,8 +536,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>                                 sizeof(format->name));
>                         format->fcc = fmtdesc->fcc;
>                 } else {
> -                       uvc_printk(KERN_INFO, "Unknown video format %pUl\n",
> -                               &buffer[5]);
> +                       pr_info("Unknown video format %pUl\n", &buffer[5]);
>                         snprintf(format->name, sizeof(format->name), "%pUl\n",
>                                 &buffer[5]);
>                         format->fcc = 0;
> @@ -1925,7 +1926,7 @@ static int uvc_scan_device(struct uvc_device *dev)
>                 uvc_scan_fallback(dev);
>
>         if (list_empty(&dev->chains)) {
> -               uvc_printk(KERN_INFO, "No valid video chain found.\n");
> +               pr_info("No valid video chain found\n");
>                 return -1;
>         }
>
> @@ -2077,8 +2078,8 @@ int uvc_register_video_device(struct uvc_device *dev,
>
>         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>         if (ret < 0) {
> -               uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
> -                          v4l2_type_names[type], ret);
> +               pr_err("Failed to register %s device (%d)\n",
> +                      v4l2_type_names[type], ret);
>                 return ret;
>         }
>
> @@ -2094,8 +2095,7 @@ static int uvc_register_video(struct uvc_device *dev,
>         /* Initialize the streaming interface with default parameters. */
>         ret = uvc_video_init(stream);
>         if (ret < 0) {
> -               uvc_printk(KERN_ERR, "Failed to initialize the device (%d).\n",
> -                          ret);
> +               pr_err("Failed to initialize the device (%d)\n", ret);
>                 return ret;
>         }
>
> @@ -2129,8 +2129,8 @@ static int uvc_register_terms(struct uvc_device *dev,
>
>                 stream = uvc_stream_by_id(dev, term->id);
>                 if (stream == NULL) {
> -                       uvc_printk(KERN_INFO, "No streaming interface found "
> -                                  "for terminal %u.", term->id);
> +                       pr_info("No streaming interface found for terminal %u\n",
> +                               term->id);
>                         continue;
>                 }
>
> @@ -2163,8 +2163,7 @@ static int uvc_register_chains(struct uvc_device *dev)
>  #ifdef CONFIG_MEDIA_CONTROLLER
>                 ret = uvc_mc_register_entities(chain);
>                 if (ret < 0)
> -                       uvc_printk(KERN_INFO,
> -                                  "Failed to register entities (%d).\n", ret);
> +                       pr_info("Failed to register entities (%d)\n", ret);
>  #endif
>         }
>
> @@ -2261,17 +2260,16 @@ static int uvc_probe(struct usb_interface *intf,
>                 goto error;
>         }
>
> -       uvc_printk(KERN_INFO, "Found UVC %u.%02x device %s (%04x:%04x)\n",
> +       pr_info("Found UVC %u.%02x device %s (%04x:%04x)\n",
>                 dev->uvc_version >> 8, dev->uvc_version & 0xff,
>                 udev->product ? udev->product : "<unnamed>",
>                 le16_to_cpu(udev->descriptor.idVendor),
>                 le16_to_cpu(udev->descriptor.idProduct));
>
>         if (dev->quirks != dev->info->quirks) {
> -               uvc_printk(KERN_INFO, "Forcing device quirks to 0x%x by module "
> -                       "parameter for testing purpose.\n", dev->quirks);
> -               uvc_printk(KERN_INFO, "Please report required quirks to the "
> -                       "linux-uvc-devel mailing list.\n");
> +               pr_info("Forcing device quirks to 0x%x by module parameter for testing purpose\n",
> +                       dev->quirks);
> +               pr_info("Please report required quirks to the linux-uvc-devel mailing list\n");
>         }
>
>         /* Register the V4L2 device. */
> @@ -2300,9 +2298,8 @@ static int uvc_probe(struct usb_interface *intf,
>
>         /* Initialize the interrupt URB. */
>         if ((ret = uvc_status_init(dev)) < 0) {
> -               uvc_printk(KERN_INFO, "Unable to initialize the status "
> -                       "endpoint (%d), status interrupt will not be "
> -                       "supported.\n", ret);
> +               pr_info("Unable to initialize the status endpoint (%d), status interrupt will not be supported\n",
> +                       ret);
>         }
>
>         uvc_trace(UVC_TRACE_PROBE, "UVC device initialized.\n");
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index ca3a9c2eec27..a5c11cde273c 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -6,6 +6,8 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/videodev2.h>
> @@ -139,8 +141,8 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
>         list_for_each_entry(entity, &chain->entities, chain) {
>                 ret = uvc_mc_init_entity(chain, entity);
>                 if (ret < 0) {
> -                       uvc_printk(KERN_INFO, "Failed to initialize entity for "
> -                                  "entity %u\n", entity->id);
> +                       pr_info("Failed to initialize entity for entity %u\n",
> +                               entity->id);
>                         return ret;
>                 }
>         }
> @@ -148,8 +150,8 @@ int uvc_mc_register_entities(struct uvc_video_chain *chain)
>         list_for_each_entry(entity, &chain->entities, chain) {
>                 ret = uvc_mc_create_links(chain, entity);
>                 if (ret < 0) {
> -                       uvc_printk(KERN_INFO, "Failed to create links for "
> -                                  "entity %u\n", entity->id);
> +                       pr_info("Failed to create links for entity %u\n",
> +                               entity->id);
>                         return ret;
>                 }
>         }
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 2bdb0ff203f8..4c84525ada71 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -6,6 +6,8 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/input.h>
>  #include <linux/slab.h>
> @@ -208,8 +210,8 @@ static void uvc_status_complete(struct urb *urb)
>                 return;
>
>         default:
> -               uvc_printk(KERN_WARNING, "Non-zero status (%d) in status "
> -                       "completion handler.\n", urb->status);
> +               pr_warn("Non-zero status (%d) in status completion handler\n",
> +                       urb->status);
>                 return;
>         }
>
> @@ -244,8 +246,7 @@ static void uvc_status_complete(struct urb *urb)
>         /* Resubmit the URB. */
>         urb->interval = dev->int_ep->desc.bInterval;
>         if ((ret = usb_submit_urb(urb, GFP_ATOMIC)) < 0) {
> -               uvc_printk(KERN_ERR, "Failed to resubmit status URB (%d).\n",
> -                       ret);
> +               pr_err("Failed to resubmit status URB (%d)\n", ret);
>         }
>  }
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a6a441d92b94..6d48bcdeac16 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -6,6 +6,8 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> @@ -76,9 +78,8 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>         if (likely(ret == size))
>                 return 0;
>
> -       uvc_printk(KERN_ERR,
> -                  "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> -                  uvc_query_name(query), cs, unit, ret, size);
> +       pr_err("Failed to query (%s) UVC control %u on unit %u: %d (exp. %u)\n",
> +              uvc_query_name(query), cs, unit, ret, size);
>
>         if (ret != -EPIPE)
>                 return ret;
> @@ -254,9 +255,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>                 ret = -EIO;
>                 goto out;
>         } else if (ret != size) {
> -               uvc_printk(KERN_ERR, "Failed to query (%u) UVC %s control : "
> -                       "%d (exp. %u).\n", query, probe ? "probe" : "commit",
> -                       ret, size);
> +               pr_err("Failed to query (%u) UVC %s control : %d (exp. %u)\n",
> +                      query, probe ? "probe" : "commit", ret, size);
>                 ret = -EIO;
>                 goto out;
>         }
> @@ -334,9 +334,8 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>                 probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
>                 size, uvc_timeout_param);
>         if (ret != size) {
> -               uvc_printk(KERN_ERR, "Failed to set UVC %s control : "
> -                       "%d (exp. %u).\n", probe ? "probe" : "commit",
> -                       ret, size);
> +               pr_err("Failed to set UVC %s control : %d (exp. %u)\n",
> +                      probe ? "probe" : "commit", ret, size);
>                 ret = -EIO;
>         }
>
> @@ -1120,8 +1119,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>
>         ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
> -               uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
> -                          ret);
> +               pr_err("Failed to resubmit video URB (%d)\n", ret);
>  }
>
>  static void uvc_video_decode_data(struct uvc_urb *uvc_urb,
> @@ -1507,8 +1505,8 @@ static void uvc_video_complete(struct urb *urb)
>                 break;
>
>         default:
> -               uvc_printk(KERN_WARNING, "Non-zero status (%d) in video "
> -                       "completion handler.\n", urb->status);
> +               pr_warn("Non-zero status (%d) in video completion handler\n",
> +                       urb->status);
>                 fallthrough;
>         case -ENOENT:           /* usb_poison_urb() called. */
>                 if (stream->frozen)
> @@ -1545,9 +1543,7 @@ static void uvc_video_complete(struct urb *urb)
>         if (!uvc_urb->async_operations) {
>                 ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
> -                       uvc_printk(KERN_ERR,
> -                                  "Failed to resubmit video URB (%d).\n",
> -                                  ret);
> +                       pr_err("Failed to resubmit video URB (%d)\n", ret);
>                 return;
>         }
>
> @@ -1893,8 +1889,8 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>         for_each_uvc_urb(uvc_urb, stream) {
>                 ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>                 if (ret < 0) {
> -                       uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
> -                                  uvc_urb_index(uvc_urb), ret);
> +                       pr_err("Failed to submit URB %u (%d)\n",
> +                              uvc_urb_index(uvc_urb), ret);
>                         uvc_video_stop_transfer(stream, 1);
>                         return ret;
>                 }
> @@ -1989,7 +1985,7 @@ int uvc_video_init(struct uvc_streaming *stream)
>         int ret;
>
>         if (stream->nformats == 0) {
> -               uvc_printk(KERN_INFO, "No supported video formats found.\n");
> +               pr_info("No supported video formats found\n");
>                 return -EINVAL;
>         }
>
> @@ -2029,8 +2025,7 @@ int uvc_video_init(struct uvc_streaming *stream)
>         }
>
>         if (format->nframes == 0) {
> -               uvc_printk(KERN_INFO, "No frame descriptor found for the "
> -                       "default format.\n");
> +               pr_info("No frame descriptor found for the default format\n");
>                 return -EINVAL;
>         }
>
> @@ -2064,8 +2059,7 @@ int uvc_video_init(struct uvc_streaming *stream)
>                 if (stream->intf->num_altsetting == 1)
>                         stream->decode = uvc_video_encode_bulk;
>                 else {
> -                       uvc_printk(KERN_INFO, "Isochronous endpoints are not "
> -                               "supported for video output devices.\n");
> +                       pr_info("Isochronous endpoints are not supported for video output devices\n");
>                         return -EINVAL;
>                 }
>         }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c4..724dec20444a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -725,20 +725,17 @@ extern unsigned int uvc_trace_param;
>  extern unsigned int uvc_timeout_param;
>  extern unsigned int uvc_hw_timestamps_param;
>
> -#define uvc_trace(flag, msg...) \
> -       do { \
> -               if (uvc_trace_param & flag) \
> -                       printk(KERN_DEBUG "uvcvideo: " msg); \
> -       } while (0)
> -
> -#define uvc_warn_once(dev, warn, msg...) \
> -       do { \
> -               if (!test_and_set_bit(warn, &dev->warnings)) \
> -                       printk(KERN_INFO "uvcvideo: " msg); \
> -       } while (0)
> -
> -#define uvc_printk(level, msg...) \
> -       printk(level "uvcvideo: " msg)
> +#define uvc_trace(flag, fmt, ...)                                      \
> +do {                                                                   \
> +       if (uvc_trace_param & flag)                                     \
> +               printk(KERN_DEBUG "uvcvideo: " fmt, ##__VA_ARGS__);     \
> +} while (0)
> +
> +#define uvc_warn_once(dev, warn, fmt, ...)                             \
> +do {                                                                   \
> +       if (!test_and_set_bit(warn, &(dev)->warnings))                  \
> +               pr_info(fmt, ##__VA_ARGS__);                            \
> +} while (0)
>
>  /* --------------------------------------------------------------------------
>   * Internal functions.
>
>


-- 
Ricardo Ribalda
