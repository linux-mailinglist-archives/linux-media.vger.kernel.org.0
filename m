Return-Path: <linux-media+bounces-48328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA57CA78B1
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 13:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E32C3054805
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 12:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55201267714;
	Fri,  5 Dec 2025 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REi+D2kh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2180526F295
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936833; cv=none; b=u4/CbVyW/sEmjprGkPlbF0J0CS4lWTv4B3N1/z5NwF5S+8WcUT6KmAMXFX5ZL4pECrgiK1wiu6INXM6R7ATtK7Ngdbw/OWECLa7jQEvAvNTPNkBkfnp9xGBa6FP/7Z5rwRfVyM9V0ZJ8KjORl7GbejVRIaJ6r7CsX8atPy9oQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936833; c=relaxed/simple;
	bh=Y0QnKDnqFDGfxXGrwWFV8naFMyeEhC4QC97fe5m28mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pATIcd9tuETYnuizeLxDO/FShp1L+y0R5oDQnsjL+3RFYP2w/7jWXQsE0gc+jELwQlVldnb1l8XgGeD21pbJYMSyakjqKeIEac7rFf+/ChdfN3wWpJb8s4ic3K66rAX3y7AgzTU8x8yN36RCMqI9jwSoehkaaYIpbAU0JWigvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REi+D2kh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764936829; x=1796472829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Y0QnKDnqFDGfxXGrwWFV8naFMyeEhC4QC97fe5m28mw=;
  b=REi+D2khkUz3bbbkUgnEdkMpddJjvIjyKSPsEOFjA7rdAijiqEHEtNwC
   Q1zzXM1zCBdc6hoLgMCA+op3kt51UkFrhmRCe2y3f8g5G8JGCNuBAd0JN
   Gs13WqDndJrsthj+YgCbXSIYtM/zoxFZwPJfN4NdQcUshW1W0ggHKYmgu
   acYh+DKs7A/HGoWcLEYYGpF4a14TqeqjHgqwAZ8w/4K+pKqcEiAaDTODR
   k/VJns/KxpScr16BEkiz3xf1mqCSCnzhCIc2y7mLcPffzzEP/SSMrdKEH
   twpKV2wz/e18vUe4ptW8IvTu+eRofJFLjzRPNG7JTfg9q5A9y9G8HNKSH
   A==;
X-CSE-ConnectionGUID: uLVo0sRNRVerYpU81wL7+A==
X-CSE-MsgGUID: COvCsGzUTrargiAqmlPSWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78320954"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78320954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 04:13:46 -0800
X-CSE-ConnectionGUID: RKIkLs/pQxGMj+hX4iof4g==
X-CSE-MsgGUID: BdAojj/bS5CRRnArDlAhFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="200233797"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.139])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 04:13:45 -0800
Date: Fri, 5 Dec 2025 13:13:38 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: useeplus.l4qli@passmail.net
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] driver/media: add 'com.useeplus.protocol' USB camera
 V4L2 driver
Message-ID: <tgwger5nakrqgtnexz3umrmz43enfuwin2wxvhvczwgleiy7z2@6nykbgv77cdr>
References: <175703815458.6.14698369738764855320.888629330@passmail.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175703815458.6.14698369738764855320.888629330@passmail.net>

Hello,

Thank you for the patch!

On Fri, Sep 05, 2025 at 02:09:06AM +0000, useeplus.l4qli@passmail.net wrote:
> Add a driver for the 'Geek szitman supercamera' ('com.useeplus.protocol'
> protocol)
> 
> This patch adds a V4L2 driver for USB cameras using the proprietary
> 'com.useeplus.protocol' protocol.
> The driver builds upon the work of
> https://github.com/hbens/geek-szitman-supercamera (owned by one of the
> authors of this driver), and draws inspiration from the "usbtv" and
> "gspca" drivers present in the linux kernel.
> 

You can include a cover letter with the output of v4l2-compliance and
"lsusb -v -d 2ce3:3828" in the next version.

> Signed-off-by: Amaury Barral <useeplus.l4qli@passmail.net>
> Co-developed-by: Hadrien Barral <hadrien.barral@univ-eiffel.fr>
> Signed-off-by: Hadrien Barral <hadrien.barral@univ-eiffel.fr>
> ---
> Note: this is my first time writing such a driver. I have tested it
> to the extent of my capabilities (multiple and fast disconnections and
> reconnections, video streaming using ffplay and firefox) and identified
> no bugs on my end. However my setup does not allow me to test, for
> instance, features such as connecting several such devices on the same
> computer.
> 
> diff -uprN linux-master/drivers/media/usb/Kconfig 
> linux-master-modified/drivers/media/usb/Kconfig
> --- linux-master/drivers/media/usb/Kconfig    2025-08-18 
> 07:22:10.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/Kconfig    2025-09-04 
> 11:29:37.667388721 +0900
> @@ -17,6 +17,7 @@ source "drivers/media/usb/gspca/Kconfig"
>   source "drivers/media/usb/pwc/Kconfig"
>   source "drivers/media/usb/s2255/Kconfig"
>   source "drivers/media/usb/usbtv/Kconfig"
> +source "drivers/media/usb/useeplus/Kconfig"
>   source "drivers/media/usb/uvc/Kconfig"
> 
>   endif
> diff -uprN linux-master/drivers/media/usb/Makefile 
> linux-master-modified/drivers/media/usb/Makefile
> --- linux-master/drivers/media/usb/Makefile    2025-08-18 
> 07:22:10.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/Makefile    2025-09-04 
> 11:30:14.977994923 +0900
> @@ -30,3 +30,4 @@ obj-$(CONFIG_VIDEO_HDPVR) += hdpvr/
>   obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2/
>   obj-$(CONFIG_VIDEO_STK1160) += stk1160/
>   obj-$(CONFIG_VIDEO_USBTV) += usbtv/
> +obj-$(CONFIG_VIDEO_USEEPLUS) += useeplus/
> diff -uprN linux-master/drivers/media/usb/useeplus/Kconfig 
> linux-master-modified/drivers/media/usb/useeplus/Kconfig
> --- linux-master/drivers/media/usb/useeplus/Kconfig    1970-01-01 
> 09:00:00.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/useeplus/Kconfig 2025-09-03 
> 21:11:01.080048349 +0900
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_USEEPLUS
> +    tristate "UseePlus cameras support"
> +    depends on VIDEO_DEV
> +    select VIDEOBUF2_VMALLOC
> +
> +    help
> +      This is a video4linux2 driver for UseePlus based cameras.
> +      Currently only supports the following hardware:
> +      - Geek szitman supercamera, USB-ID 2ce3:3828.

No need to keep a list of supported devices in the Kconfig.

> +
> +      To compile this driver as a module, choose M here: the
> +      module will be called useeplus
> diff -uprN linux-master/drivers/media/usb/useeplus/Makefile 
> linux-master-modified/drivers/media/usb/useeplus/Makefile
> --- linux-master/drivers/media/usb/useeplus/Makefile    1970-01-01 
> 09:00:00.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/useeplus/Makefile 2025-09-03 
> 21:11:01.080048349 +0900
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +useeplus-y := supercamera.o
> +
> +obj-$(CONFIG_VIDEO_USEEPLUS) += supercamera.o
> diff -uprN linux-master/drivers/media/usb/useeplus/supercamera.c 
> linux-master-modified/drivers/media/usb/useeplus/supercamera.c
> --- linux-master/drivers/media/usb/useeplus/supercamera.c 1970-01-01 
> 09:00:00.000000000 +0900
> +++ linux-master-modified/drivers/media/usb/useeplus/supercamera.c 
> 2025-09-03 21:11:01.080048349 +0900
> @@ -0,0 +1,805 @@

something is wrong with the formatting of the patch.

See:
https://git-send-email.io/

or even better b4:
https://b4.docs.kernel.org/en/latest/contributor/overview.html

> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * supercamera_v4l2.c - V4L2 driver for "Geek szitman supercamera" USB
> + *  endoscope
> + *
> + * This driver supports USB cameras that use the proprietary
> + *  "com.useeplus.protocol". The camera shows up as a standard V4L2 video
> + *  device.
> + *
> + * The camera uses a basic protocol where JPEG frames are split across
> + *  multiple USB packets.
> + * Each USB packet has a 5-byte header (magic 0xBBAA + camera ID + length)
> + *  followed by a camera frame with a 7-byte header
> + *  (frame ID + camera number + flags) and then JPEG data.
> + *  We accumulate the JPEG data until the frame ID changes, then deliver
> + *  the complete frame.
> + *
> + * Currently, we only supports the following hardware:
> + *   Name: Geek szitman supercamera (from USB descriptors)
> + *   USB ID: 2ce3:3828
> + *   Resolution: 640x480 JPEG only
> + *   Frame rate: ~30 FPS
> + *
> + * This driver is based on patterns from usbtv and gspca drivers.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/usb.h>
> +#include <linux/videodev2.h>
> +#include <linux/wait.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#define DRIVER_NAME "supercamera"
> +
> +#define USB_VENDOR_ID_SUPERCAMERA 0x2ce3
> +#define USB_PRODUCT_ID_SUPERCAMERA 0x3828
> +
> +#define CONTROL_INTERFACE_NUMBER 0
> +#define VIDEO_INTERFACE_NUMBER 1
> +#define VIDEO_INTERFACE_ALTERNATE_SETTING 1
> +
> +#define ENDPOINT_1_IN 0x81
> +#define ENDPOINT_1_OUT 0x01
> +#define ENDPOINT_2_IN 0x82
> +#define ENDPOINT_2_OUT 0x02
> +
> +#define URB_BUFFER_SIZE 0x1000
> +#define MAX_URBS 4
> +
> +#define UPP_USB_MAGIC 0xBBAA
> +#define UPP_CAMID_7 7

what is the meaning of UPP ?

UseePlus ? but what is the second P ?

> +
> +#define CAMERA_WIDTH 640
> +#define CAMERA_HEIGHT 480
> +#define CAMERA_FRAME_SIZE (CAMERA_WIDTH * CAMERA_HEIGHT * 3)
> +
> +/* USB interface descriptors constants for this device */
> +#define DEVICE_INTERFACE_NUMBER 0x1
> +#define DEVICE_INTERFACE_CLASS 0xff
> +#define DEVICE_INTERFACE_SUBCLASS 0xf0
> +#define DEVICE_INTERFACE_PROTOCOL 0x01
> +
> +/* ======================= DATA MODELS ======================= */
> +
> +/* USB frame header (5 bytes) */
> +struct upp_usb_frame {
> +    __le16 magic;
> +    __u8 cid;      /* camera id */
> +    __le16 length; /* does not include the 5-bytes header length */
> +} __packed;
> +
> +/* Camera frame header (7 bytes) */
> +struct upp_cam_frame {
> +    __u8 fid;     /* frame id */
> +    __u8 cam_num; /* camera number */
> +    /* flags byte */
> +    __u8 unused_A : 1;
> +    __u8 button_press : 1;
> +    __u8 unused_B : 6;
> +    __le32 unused_C;
> +} __packed;
> +
> +/* Buffer wrapper for our buffer list */
> +struct supercamera_buffer {
> +    struct vb2_v4l2_buffer vb;
> +    struct list_head list;
> +};
> +
> +struct supercamera_dev {
> +    struct usb_device *udev;
> +    struct v4l2_device v4l2_dev;
> +    struct video_device vdev;
> +    struct vb2_queue vb_queue;
> +    struct mutex vb_queue_mutex; /* Protects vb_queue */
> +
> +    /* USB interface and endpoint information */

no need for this comment.

> +    struct usb_interface *intf;
> +    struct urb *urbs[MAX_URBS];
> +    char *urb_buffers[MAX_URBS];
> +    dma_addr_t urb_dma_handles[MAX_URBS];
> +
> +    /* Buffer management */

remove this comment and replace it by "Protects buffer list" 

> +    spinlock_t buffer_list_lock; /* Protects buffer list */
> +    struct list_head buffer_list;
> +
> +    /* Device state */
> +    bool streaming;
> +
> +    /* Protocol handling */
> +    struct {
> +        /* Buffer for accumulating JPEG data */
> +        char *jpeg_buffer;
> +        size_t jpeg_buffer_size;
> +        size_t jpeg_data_size;
> +
> +        /* Current frame ID tracking */

just keep a comment if it really adds an important information not in
the name of the variable

> +        uint8_t current_fid;
> +        bool has_frame_id;
> +    } protocol;
> +};
> +
> +/* ======================= DEVICE INFRASTRUCTURE ======================= */
> +
> +static void supercamera_complete_frame(struct supercamera_dev *sc_dev)
> +{
> +    struct supercamera_buffer *buf = NULL;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&sc_dev->buffer_list_lock, flags);
> +    if (!list_empty(&sc_dev->buffer_list)) {

just return here if the list is empty ...

> +        buf = list_first_entry(&sc_dev->buffer_list, struct 
> supercamera_buffer, list);
> +        list_del(&buf->list);
> +    }
> +    spin_unlock_irqrestore(&sc_dev->buffer_list_lock, flags);
> +
> +    if (!buf) {

... to avoid this if check

> +        sc_dev->protocol.jpeg_data_size = 0;
> +        return;
> +    }
> +
> +    if (sc_dev->protocol.jpeg_data_size <= 
> vb2_plane_size(&buf->vb.vb2_buf, 0)) {
> +        void *vaddr = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +
> +        memcpy(vaddr, sc_dev->protocol.jpeg_buffer, 
> sc_dev->protocol.jpeg_data_size);
> +        vb2_set_plane_payload(&buf->vb.vb2_buf, 0, 
> sc_dev->protocol.jpeg_data_size);
> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +    } else {
> +        vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +    }
> +
> +    sc_dev->protocol.jpeg_data_size = 0;
> +}
> +
> +static void supercamera_handle_upp_frame(struct supercamera_dev *sc_dev,
> +    const struct upp_usb_frame *frame, const char *data, size_t length)
> +{
> +    const struct upp_cam_frame *cam_frame;
> +    size_t cam_header_len = sizeof(struct upp_cam_frame);
> +    uint8_t new_fid;
> +
> +    if (length < cam_header_len)
> +        return;
> +
> +    cam_frame = (const struct upp_cam_frame *)data;
> +    new_fid = cam_frame->fid;
> +
> +    /* Frame boundary detected - complete previous frame */
> +    if (sc_dev->protocol.jpeg_data_size > 0 && 
> sc_dev->protocol.has_frame_id
> +        && sc_dev->protocol.current_fid != new_fid) {
> +        supercamera_complete_frame(sc_dev);
> +    }
> +
> +    if (sc_dev->protocol.jpeg_data_size == 0) {
> +        sc_dev->protocol.current_fid = new_fid;
> +        sc_dev->protocol.has_frame_id = true;
> +    }
> +
> +    /*  // Not used, but left just in case
> +     * if (cam_frame->button_press) {
> +     *     dev_warn(dev, "Button press event detected\n");
> +     * }
> +     */

Remove if it is not used.

> +
> +    if (length > cam_header_len) {
> +        size_t data_len = length - cam_header_len;
> +
> +        if (sc_dev->protocol.jpeg_data_size + data_len >
> +            sc_dev->protocol.jpeg_buffer_size) {
> +            sc_dev->protocol.jpeg_data_size = 0;
> +            return;
> +        }
> +
> +        memcpy(sc_dev->protocol.jpeg_buffer + 
> sc_dev->protocol.jpeg_data_size,
> +            data + cam_header_len, data_len);
> +        sc_dev->protocol.jpeg_data_size += data_len;
> +    }
> +}
> +
> +static void supercamera_return_all_buffers(struct supercamera_dev *sc_dev,
> +    enum vb2_buffer_state state)
> +{
> +    struct supercamera_buffer *buf, *tmp;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&sc_dev->buffer_list_lock, flags);

You can use guard(spinlock_irqsave)

> +    list_for_each_entry_safe(buf, tmp, &sc_dev->buffer_list, list) {
> +        list_del(&buf->list);
> +        vb2_buffer_done(&buf->vb.vb2_buf, state);
> +    }
> +    spin_unlock_irqrestore(&sc_dev->buffer_list_lock, flags);
> +}
> +
> +static int supercamera_send_initial_commands(struct supercamera_dev 
> *sc_dev)
> +{
> +    struct device *dev = &sc_dev->intf->dev;
> +    int ret;
> +
> +    /* Device initialization command for endpoint 2 */
> +    const char ep2_cmd[] = {0xFF, 0x55, 0xFF, 0x55, 0xEE, 0x10};

I suppose these are reversed-engineered and we don't know the meaning of
these commands ?

> +
> +    ret = usb_bulk_msg(sc_dev->udev, usb_sndbulkpipe(sc_dev->udev, 
> ENDPOINT_2_OUT),
> +        (void *)ep2_cmd, sizeof(ep2_cmd), NULL, 1000);
> +    if (ret) {
> +        dev_err(dev, "Failed to send EP2 command: %d\n", ret);
> +        return ret;
> +    }
> +
> +    /* Start streaming command (UPP protocol header) */
> +    const char start_stream_cmd[] = {0xBB, 0xAA, 5, 0, 0};
> +
> +    ret = usb_bulk_msg(sc_dev->udev, usb_sndbulkpipe(sc_dev->udev, 
> ENDPOINT_1_OUT),
> +        (void *)start_stream_cmd, sizeof(start_stream_cmd), NULL, 1000);
> +    if (ret) {
> +        dev_err(dev, "Failed to send start stream command: %d\n", ret);
> +        return ret;

remove this return ...

> +    }
> +
> +    return 0;

... and return ret here.

> +}
> +
> +static void supercamera_urb_complete(struct urb *urb)
> +{
> +    struct supercamera_dev *sc_dev = urb->context;
> +    struct device *dev = &sc_dev->intf->dev;
> +    int ret;
> +
> +    if (!sc_dev)
> +        return;

why is this check required ?

> +
> +    switch (urb->status) {
> +    case 0:
> +        break;
> +    case -ECONNRESET:
> +    case -ENOENT:
> +    case -ESHUTDOWN:
> +        return;
> +    default:
> +        if (!sc_dev->streaming)

is this streaming bool protected by a lock ?

> +            return;
> +        usb_submit_urb(urb, GFP_ATOMIC);
> +        return;
> +    }
> +
> +    if (urb->actual_length > 0) {
> +        const char *data = urb->transfer_buffer;
> +        size_t len = urb->actual_length;
> +        size_t offset = 0;
> +
> +        while (offset + sizeof(struct upp_usb_frame) <= len) {
> +            const struct upp_usb_frame *frame =
> +                (const struct upp_usb_frame *)(data + offset);
> +            size_t frame_len =
> +                sizeof(struct upp_usb_frame) + le16_to_cpu(frame->length);
> +
> +            if (offset + frame_len > len)
> +                break;
> +
> +            if (le16_to_cpu(frame->magic) != UPP_USB_MAGIC) {
> +                offset++;
> +                continue;
> +            }
> +
> +            if (frame->cid != UPP_CAMID_7) {
> +                offset += frame_len;
> +                continue;
> +            }
> +
> +            supercamera_handle_upp_frame(sc_dev, frame,
> +                data + offset + sizeof(struct upp_usb_frame),
> +                le16_to_cpu(frame->length));
> +
> +            offset += frame_len;
> +        }
> +    }
> +
> +    if (sc_dev->streaming) {
> +        ret = usb_submit_urb(urb, GFP_ATOMIC);
> +        if (ret)
> +            dev_err(dev, "Failed to resubmit URB: %d\n", ret);
> +    }
> +}
> +
> +#define CLEANUP_URBS(sc_dev) \
> +do { \
> +    int i; \
> +    for (i = 0; i < MAX_URBS; i++) { \
> +        if ((sc_dev)->urbs[i]) { \
> +            usb_kill_urb((sc_dev)->urbs[i]); \
> +            usb_free_urb((sc_dev)->urbs[i]); \
> +            (sc_dev)->urbs[i] = NULL; \
> +        } \
> +        if ((sc_dev)->urb_buffers[i]) { \
> +            usb_free_coherent((sc_dev)->udev, URB_BUFFER_SIZE, \
> +                (sc_dev)->urb_buffers[i], (sc_dev)->urb_dma_handles[i]); \
> +            (sc_dev)->urb_buffers[i] = NULL; \
> +        } \
> +    } \
> +} while (0)

is there a particular reason not to define this as a function ?

> +
> +static int supercamera_start_streaming(struct supercamera_dev *sc_dev)
> +{
> +    struct device *dev = &sc_dev->intf->dev;
> +    int ret;
> +    int i;

unsigned ?

> +
> +    ret = supercamera_send_initial_commands(sc_dev);
> +    if (ret) {
> +        dev_err(dev, "Failed to send initial commands: %d\n", ret);
> +        return ret;
> +    }
> +
> +    usb_clear_halt(sc_dev->udev, usb_rcvbulkpipe(sc_dev->udev, 
> ENDPOINT_1_IN));
> +
> +    for (i = 0; i < MAX_URBS; i++) {
> +        sc_dev->urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
> +        if (!sc_dev->urbs[i]) {
> +            dev_err(dev, "Failed to allocate URB\n");

no need for the dev_err()

> +            ret = -ENOMEM;
> +            goto error;
> +        }
> +
> +        sc_dev->urb_buffers[i] = usb_alloc_coherent(sc_dev->udev, 
> URB_BUFFER_SIZE,
> +            GFP_KERNEL, &sc_dev->urb_dma_handles[i]);
> +        if (!sc_dev->urb_buffers[i]) {
> +            dev_err(dev, "Failed to allocate URB buffer\n");

same.

> +            ret = -ENOMEM;
> +            goto error;
> +        }
> +
> +        usb_fill_bulk_urb(sc_dev->urbs[i], sc_dev->udev,
> +            usb_rcvbulkpipe(sc_dev->udev, ENDPOINT_1_IN), 
> sc_dev->urb_buffers[i],
> +            URB_BUFFER_SIZE, supercamera_urb_complete, sc_dev);
> +        sc_dev->urbs[i]->transfer_dma = sc_dev->urb_dma_handles[i];
> +        sc_dev->urbs[i]->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
> +    }
> +
> +    for (i = 0; i < MAX_URBS; i++) {
> +        ret = usb_submit_urb(sc_dev->urbs[i], GFP_KERNEL);
> +        if (ret) {
> +            dev_err(dev, "Failed to submit URB %d: %d\n", i, ret);
> +            goto error;
> +        }
> +    }
> +
> +    sc_dev->protocol.has_frame_id = false;
> +    sc_dev->protocol.jpeg_data_size = 0;
> +
> +    sc_dev->streaming = true;
> +    return 0;
> +
> +error:
> +    CLEANUP_URBS(sc_dev);
> +
> +    return ret;
> +}
> +
> +static void supercamera_stop_streaming(struct supercamera_dev *sc_dev)
> +{
> +    sc_dev->streaming = false;
> +    CLEANUP_URBS(sc_dev);
> +}
> +
> +/* VB2 operations */
> +static int supercamera_vb2_queue_setup(struct vb2_queue *vq, unsigned 
> int *nbuffers,
> +    unsigned int *nplanes, unsigned int sizes[], struct device 
> *alloc_devs[])
> +{
> +    if (*nbuffers < 2)
> +        *nbuffers = 2;
> +
> +    if (*nplanes) {
> +        if (sizes[0] < CAMERA_WIDTH * CAMERA_HEIGHT)
> +            return -EINVAL;
> +    } else {
> +        sizes[0] = CAMERA_FRAME_SIZE;
> +        *nplanes = 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int supercamera_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +    struct supercamera_dev *sc_dev = vb2_get_drv_priv(vb->vb2_queue);
> +    struct device *dev = &sc_dev->intf->dev;
> +
> +    if (vb2_plane_size(vb, 0) < CAMERA_WIDTH * CAMERA_HEIGHT) {
> +        dev_err(dev, "Buffer size too small\n");
> +        return -EINVAL;
> +    }

Do you need vb2_buf_prepare() to do just this check ?

> +
> +    return 0;
> +}
> +
> +static void supercamera_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +    struct supercamera_dev *sc_dev = vb2_get_drv_priv(vb->vb2_queue);
> +    struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +    struct supercamera_buffer *buf = container_of(vbuf, struct 
> supercamera_buffer, vb);
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&sc_dev->buffer_list_lock, flags);
> +    list_add_tail(&buf->list, &sc_dev->buffer_list);
> +    spin_unlock_irqrestore(&sc_dev->buffer_list_lock, flags);

You can use guard here also.

> +}
> +
> +static int supercamera_vb2_start_streaming(struct vb2_queue *vq, 
> unsigned int count)
> +{
> +    struct supercamera_dev *sc_dev = vb2_get_drv_priv(vq);
> +    struct device *dev = &sc_dev->intf->dev;
> +    int ret;
> +
> +    if (count == 0)
> +        return 0;
> +
> +    ret = supercamera_start_streaming(sc_dev);
> +    if (ret) {
> +        dev_err(dev, "Failed to start USB streaming: %d\n", ret);
> +        return ret;
> +    }
> +
> +    return 0;

just return ret here

And you need some cleanup of the vb2 buffers here. Return the buffers in
the QUEUED STATE if start streaming failed.

Check with git which drivers were added recently to the media subsystem
and see how they implements their vb2 callbacks. Recent drivers tend to
be better as inspiration.

$ git log --since="2 years ago" --diff-filter=A --name-only --pretty=format: drivers/media/

> +}
> +
> +static void supercamera_vb2_stop_streaming(struct vb2_queue *vq)
> +{
> +    struct supercamera_dev *sc_dev = vb2_get_drv_priv(vq);
> +
> +    supercamera_return_all_buffers(sc_dev, VB2_BUF_STATE_ERROR);
> +    supercamera_stop_streaming(sc_dev);
> +}
> +
> +static const struct vb2_ops supercamera_vb2_ops = {
> +    .queue_setup = supercamera_vb2_queue_setup,
> +    .buf_prepare = supercamera_vb2_buf_prepare,
> +    .buf_queue = supercamera_vb2_buf_queue,
> +    .start_streaming = supercamera_vb2_start_streaming,
> +    .stop_streaming = supercamera_vb2_stop_streaming,
> +    .wait_prepare = vb2_ops_wait_prepare,
> +    .wait_finish = vb2_ops_wait_finish,
> +};
> +
> +/* V4L2 file operations */
> +static int supercamera_v4l2_open(struct file *file)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +    struct device *dev = &sc_dev->intf->dev;
> +    struct v4l2_fh *fh;
> +    int ret;
> +
> +    fh = kzalloc(sizeof(*fh), GFP_KERNEL);
> +    if (!fh)
> +        return -ENOMEM;
> +
> +    v4l2_fh_init(fh, &sc_dev->vdev);
> +    v4l2_fh_add(fh);
> +    file->private_data = fh;
> +
> +    if (sc_dev->vb_queue.type == 0) {
> +        sc_dev->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +        sc_dev->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF 
> | VB2_READ;
> +        sc_dev->vb_queue.buf_struct_size = sizeof(struct 
> supercamera_buffer);
> +        sc_dev->vb_queue.ops = &supercamera_vb2_ops;
> +        sc_dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
> +        sc_dev->vb_queue.timestamp_flags = 
> V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +        sc_dev->vb_queue.dev = dev;
> +        sc_dev->vb_queue.lock = &sc_dev->vb_queue_mutex;
> +        sc_dev->vb_queue.drv_priv = sc_dev;
> +
> +        ret = vb2_queue_init(&sc_dev->vb_queue);
> +        if (ret) {
> +            dev_err(dev, "Failed to initialize VB2 queue: %d\n", ret);
> +            v4l2_fh_del(fh);
> +            v4l2_fh_exit(fh);
> +            kfree(fh);
> +            return ret;
> +        }
> +    }

This does not belong to the file ops open callback. Again see how other
drivers do it. I will be actually surprised if you need something
different from v4l2_fh_open()

> +
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_release(struct file *file)
> +{
> +    struct v4l2_fh *fh = file->private_data;
> +
> +    v4l2_fh_del(fh);
> +    v4l2_fh_exit(fh);
> +    kfree(fh);
> +
> +    return 0;
> +}
> +
> +static __poll_t supercamera_v4l2_poll(struct file *file, struct 
> poll_table_struct *wait)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_poll(&sc_dev->vb_queue, file, wait);
> +}
> +
> +static int supercamera_v4l2_mmap(struct file *file, struct 
> vm_area_struct *vma)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_mmap(&sc_dev->vb_queue, vma);
> +}
> +
> +static const struct v4l2_file_operations supercamera_fops = {
> +    .owner = THIS_MODULE,
> +    .open = supercamera_v4l2_open,
> +    .release = supercamera_v4l2_release,
> +    .poll = supercamera_v4l2_poll,
> +    .mmap = supercamera_v4l2_mmap,
> +    .unlocked_ioctl = video_ioctl2,

have a look at the v4l2 generic callbacks:

	.owner = THIS_MODULE,
	.open = v4l2_fh_open,
	.release = vb2_fop_release,
	.poll = vb2_fop_poll,
	.unlocked_ioctl = video_ioctl2,
	.mmap = vb2_fop_mmap,

Again, I would be suprised if you need custom fops

> +};
> +
> +/* V4L2 ioctl operations */
> +static int supercamera_v4l2_ioctl_querycap(struct file *file, void *fh, 
> struct v4l2_capability *cap)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +    char manufacturer[128];
> +    char product[128];
> +
> +    strscpy(cap->driver, DRIVER_NAME, sizeof(cap->driver));
> +
> +    if (usb_string(sc_dev->udev, 
> sc_dev->udev->descriptor.iManufacturer, manufacturer,
> +            sizeof(manufacturer)) >= 0 && usb_string(sc_dev->udev,
> +            sc_dev->udev->descriptor.iProduct, product, 
> sizeof(product)) >= 0) {
> +        snprintf(cap->card, sizeof(cap->card), "%s: %s", manufacturer, 
> product);
> +    } else {
> +        strscpy(cap->card, "Unknown UseePlus USB camera", 
> sizeof(cap->card));
> +    }
> +
> +    usb_make_path(sc_dev->udev, cap->bus_info, sizeof(cap->bus_info));
> +
> +    cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE | 
> V4L2_CAP_STREAMING;
> +    cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> +
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_g_input(struct file *file, void *fh, 
> unsigned int *i)
> +{
> +    *i = 0;
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_s_input(struct file *file, void *fh, 
> unsigned int i)
> +{
> +    if (i > 0)
> +        return -EINVAL;
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_enum_input(struct file *file, void 
> *fh, struct v4l2_input *input)
> +{
> +    if (input->index > 0)
> +        return -EINVAL;
> +
> +    strscpy(input->name, "Camera", sizeof(input->name));
> +    input->type = V4L2_INPUT_TYPE_CAMERA;
> +
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_enum_fmt_vid_cap(struct file *file, 
> void *fh,
> +    struct v4l2_fmtdesc *f)
> +{
> +    if (f->index != 0)
> +        return -EINVAL;
> +
> +    f->pixelformat = V4L2_PIX_FMT_JPEG;
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_g_fmt_vid_cap(struct file *file, void 
> *fh, struct v4l2_format *f)
> +{
> +    f->fmt.pix.width = CAMERA_WIDTH;
> +    f->fmt.pix.height = CAMERA_HEIGHT;
> +    f->fmt.pix.pixelformat = V4L2_PIX_FMT_JPEG;
> +    f->fmt.pix.field = V4L2_FIELD_NONE;
> +    f->fmt.pix.bytesperline = 0;
> +    f->fmt.pix.sizeimage = CAMERA_FRAME_SIZE;
> +    f->fmt.pix.colorspace = V4L2_COLORSPACE_JPEG;
> +    f->fmt.pix.priv = 0;
> +
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_g_parm(struct file *file, void *fh, 
> struct v4l2_streamparm *a)
> +{
> +    if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +        return -EINVAL;
> +
> +    a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> +    a->parm.capture.capturemode = 0;
> +    a->parm.capture.timeperframe.numerator = 1;
> +    a->parm.capture.timeperframe.denominator = 30;
> +    a->parm.capture.extendedmode = 0;
> +    a->parm.capture.readbuffers = 2;
> +
> +    return 0;
> +}
> +
> +static int supercamera_v4l2_ioctl_reqbufs(struct file *file, void *fh,
> +    struct v4l2_requestbuffers *rb)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_reqbufs(&sc_dev->vb_queue, rb);
> +}
> +
> +static int supercamera_v4l2_ioctl_querybuf(struct file *file, void *fh, 
> struct v4l2_buffer *b)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_querybuf(&sc_dev->vb_queue, b);
> +}
> +
> +static int supercamera_v4l2_ioctl_qbuf(struct file *file, void *fh, 
> struct v4l2_buffer *b)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_qbuf(&sc_dev->vb_queue, NULL, b);
> +}
> +
> +static int supercamera_v4l2_ioctl_dqbuf(struct file *file, void *fh, 
> struct v4l2_buffer *b)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_dqbuf(&sc_dev->vb_queue, b, file->f_flags & O_NONBLOCK);
> +}
> +
> +static int supercamera_v4l2_ioctl_streamon(struct file *file, void *fh, 
> enum v4l2_buf_type i)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_streamon(&sc_dev->vb_queue, i);
> +}
> +
> +static int supercamera_v4l2_ioctl_streamoff(struct file *file, void 
> *fh, enum v4l2_buf_type i)
> +{
> +    struct supercamera_dev *sc_dev = video_drvdata(file);
> +
> +    return vb2_streamoff(&sc_dev->vb_queue, i);
> +}
> +
> +static const struct v4l2_ioctl_ops supercamera_ioctl_ops = {
> +    .vidioc_querycap = supercamera_v4l2_ioctl_querycap,
> +    .vidioc_g_input = supercamera_v4l2_ioctl_g_input,
> +    .vidioc_s_input = supercamera_v4l2_ioctl_s_input,
> +    .vidioc_enum_input = supercamera_v4l2_ioctl_enum_input,
> +    .vidioc_enum_fmt_vid_cap = supercamera_v4l2_ioctl_enum_fmt_vid_cap,
> +    .vidioc_g_fmt_vid_cap = supercamera_v4l2_ioctl_g_fmt_vid_cap,
> +    .vidioc_s_fmt_vid_cap = supercamera_v4l2_ioctl_g_fmt_vid_cap,
> +    .vidioc_try_fmt_vid_cap = supercamera_v4l2_ioctl_g_fmt_vid_cap,
> +    .vidioc_g_parm = supercamera_v4l2_ioctl_g_parm,
> +    .vidioc_s_parm = supercamera_v4l2_ioctl_g_parm,
> +    .vidioc_reqbufs = supercamera_v4l2_ioctl_reqbufs,
> +    .vidioc_querybuf = supercamera_v4l2_ioctl_querybuf,
> +    .vidioc_qbuf = supercamera_v4l2_ioctl_qbuf,
> +    .vidioc_dqbuf = supercamera_v4l2_ioctl_dqbuf,
> +    .vidioc_streamon = supercamera_v4l2_ioctl_streamon,
> +    .vidioc_streamoff = supercamera_v4l2_ioctl_streamoff,

Have a look at the vb2 generic callbacks, here are some of them:

	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
	.vidioc_querybuf = vb2_ioctl_querybuf,
	.vidioc_qbuf = 	vb2_ioctl_qbuf,
	.vidioc_dqbuf = vb2_ioctl_dqbuf,
	.vidioc_expbuf = vb2_ioctl_expbuf,
	.vidioc_streamon = vb2_ioctl_streamon,
	.vidioc_streamoff = vb2_ioctl_streamoff,

> +};
> +
> +/* USB probe/disconnect */
> +static int supercamera_probe(struct usb_interface *intf, const struct 
> usb_device_id *id)
> +{
> +    struct supercamera_dev *sc_dev;
> +    struct device *dev = &intf->dev;
> +    struct usb_device *udev;
> +    int retval;
> +    int ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
> +    int altsetting = intf->cur_altsetting->desc.bAlternateSetting;
> +    int class = intf->cur_altsetting->desc.bInterfaceClass;
> +    int subclass = intf->cur_altsetting->desc.bInterfaceSubClass;
> +    int protocol = intf->cur_altsetting->desc.bInterfaceProtocol;
> +
> +    if (ifnum != DEVICE_INTERFACE_NUMBER || class != DEVICE_INTERFACE_CLASS
> +        || subclass != DEVICE_INTERFACE_SUBCLASS || protocol != 
> DEVICE_INTERFACE_PROTOCOL) {
> +        return -ENODEV;
> +    }
> +
> +    if (altsetting != VIDEO_INTERFACE_ALTERNATE_SETTING) {
> +        retval = usb_set_interface(interface_to_usbdev(intf), ifnum,
> +        VIDEO_INTERFACE_ALTERNATE_SETTING);
> +        if (retval) {
> +            dev_err(dev, "Failed to set interface: %d\n", retval);
> +            return retval;
> +        }
> +    }
> +
> +    sc_dev = devm_kzalloc(dev, sizeof(*sc_dev), GFP_KERNEL);
> +    if (!sc_dev)
> +        return -ENOMEM;
> +
> +    udev = interface_to_usbdev(intf);
> +    sc_dev->udev = udev;
> +    sc_dev->intf = intf;
> +
> +    mutex_init(&sc_dev->vb_queue_mutex);
> +
> +    spin_lock_init(&sc_dev->buffer_list_lock);
> +    INIT_LIST_HEAD(&sc_dev->buffer_list);
> +
> +    /* Allocate JPEG buffer - even worst-case JPEG can't exceed 
> uncompressed size */
> +    sc_dev->protocol.jpeg_buffer_size = CAMERA_FRAME_SIZE;
> +    sc_dev->protocol.jpeg_buffer = devm_kzalloc(dev, 
> sc_dev->protocol.jpeg_buffer_size,
> +        GFP_KERNEL);
> +    if (!sc_dev->protocol.jpeg_buffer) {
> +        retval = -ENOMEM;
> +        goto error_jpeg_buffer;
> +    }
> +
> +    retval = v4l2_device_register(dev, &sc_dev->v4l2_dev);
> +    if (retval) {
> +        dev_err(dev, "Failed to register v4l2 device: %d\n", retval);
> +        goto error_v4l2;
> +    }
> +
> +    sc_dev->vdev = (struct video_device) {
> +        .name = "supercamera",
> +        .fops = &supercamera_fops,
> +        .ioctl_ops = &supercamera_ioctl_ops,
> +        .release = video_device_release_empty,
> +        .v4l2_dev = &sc_dev->v4l2_dev,
> +        .vfl_dir = VFL_DIR_RX,
> +        .device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE | 
> V4L2_CAP_STREAMING,
> +    };
> +
> +    video_set_drvdata(&sc_dev->vdev, sc_dev);
> +    retval = video_register_device(&sc_dev->vdev, VFL_TYPE_VIDEO, -1);
> +    if (retval) {
> +        dev_err(dev, "Failed to register video device: %d\n", retval);
> +        goto error_video;
> +    }
> +
> +    usb_set_intfdata(intf, sc_dev);
> +
> +    return 0;
> +
> +error_video:
> +    v4l2_device_unregister(&sc_dev->v4l2_dev);
> +error_v4l2:

is this needed ? Or error handling is missing ?

> +error_jpeg_buffer:
> +    return retval;
> +}

--
Kind Regards
Mehdi Djait

