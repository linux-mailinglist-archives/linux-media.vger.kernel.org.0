Return-Path: <linux-media+bounces-18570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5398671B
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D01F1C217A7
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12A9142E83;
	Wed, 25 Sep 2024 19:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ng3MkJE1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467B21D5AD6
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727293524; cv=none; b=KBmVEUt0MKARM0kVeL4RBm9Uk78PBCv0ar/w/BfgeJb8/gRQFb1MvIHT8w0Kl+8+MuBBCsPesoIenpGzoBy7hn3YXbv9UczCT9fpTL4qq1qKQCJgWJdb7AhbTMxdm+OjhoCHB9UMJgpaOoR777EXZOd5MYdaLNcLtCGLEOOie6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727293524; c=relaxed/simple;
	bh=sCszy3caVRL9X9avoI+vBDqGjDNSU1npZk/oPfVZIbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GziFHVSsCgI4aNkUVFgmZfRKWRJKC11OUTIr6ZbJZZnMuhXyua0v4Fs/znUstWir/kwLVg0ogmAswfOOfKRcfrRZPTCqopIOkA47CNyf+4vDTgSK+d7TFVpdAQ2FKeznxhNsj1T4UGBwuVfE1K8rxCEY7dYvDa5edj6x3XD2dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ng3MkJE1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1396E7E2;
	Wed, 25 Sep 2024 21:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727293433;
	bh=sCszy3caVRL9X9avoI+vBDqGjDNSU1npZk/oPfVZIbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng3MkJE1rr5E6ydX40oHzbeRtmYg1d6wv29MZ+HSsW31sDQimMbOPdNFvlvb480vm
	 V9p9zC7SVmuJWccONthEWzdPBYXrp7+2QY8grZd+qfsYodvVZ2SwlKhP4ar647PN1k
	 LdVyXMMc9WGXPVQNLFRThT2vEYa4mGXkW8zQw55g=
Date: Wed, 25 Sep 2024 22:45:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>, kernel-dev@igalia.com,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <20240925194518.GH30399@pendragon.ideasonboard.com>
References: <20240913180601.1400596-1-cascardo@igalia.com>
 <20240913180601.1400596-2-cascardo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913180601.1400596-2-cascardo@igalia.com>

Hi Thadeu,

Thank you for the patch.

On Fri, Sep 13, 2024 at 03:06:01PM -0300, Thadeu Lima de Souza Cascardo wrote:
> Per UVC 1.1+ specification 3.7.2, units and terminals must have a non-zero
> unique ID.
> 
> ```
> Each Unit and Terminal within the video function is assigned a unique
> identification number, the Unit ID (UID) or Terminal ID (TID), contained in
> the bUnitID or bTerminalID field of the descriptor. The value 0x00 is
> reserved for undefined ID,
> ```
> 
> So, deny allocating an entity with ID 0 or an ID that belongs to a unit
> that is already added to the list of entities.
> 
> This also prevents some syzkaller reproducers from triggering warnings due
> to a chain of entities referring to themselves. In one particular case, an
> Output Unit is connected to an Input Unit, both with the same ID of 1. But
> when looking up for the source ID of the Output Unit, that same entity is
> found instead of the input entity, which leads to such warnings.
> 
> In another case, a backward chain was considered finished as the source ID
> was 0. Later on, that entity was found, but its pads were not valid.
> 
> Here is a sample stack trace for one of those cases.
> 
> [   20.650953] usb 1-1: new high-speed USB device number 2 using dummy_hcd
> [   20.830206] usb 1-1: Using ep0 maxpacket: 8
> [   20.833501] usb 1-1: config 0 descriptor??
> [   21.038518] usb 1-1: string descriptor 0 read error: -71
> [   21.038893] usb 1-1: Found UVC 0.00 device <unnamed> (2833:0201)
> [   21.039299] uvcvideo 1-1:0.0: Entity type for entity Output 1 was not initialized!
> [   21.041583] uvcvideo 1-1:0.0: Entity type for entity Input 1 was not initialized!
> [   21.042218] ------------[ cut here ]------------
> [   21.042536] WARNING: CPU: 0 PID: 9 at drivers/media/mc/mc-entity.c:1147 media_create_pad_link+0x2c4/0x2e0
> [   21.043195] Modules linked in:
> [   21.043535] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc7-00030-g3480e43aeccf #444
> [   21.044101] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
> [   21.044639] Workqueue: usb_hub_wq hub_event
> [   21.045100] RIP: 0010:media_create_pad_link+0x2c4/0x2e0
> [   21.045508] Code: fe e8 20 01 00 00 b8 f4 ff ff ff 48 83 c4 30 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 0f 0b eb e9 0f 0b eb 0a 0f 0b eb 06 <0f> 0b eb 02 0f 0b b8 ea ff ff ff eb d4 66 2e 0f 1f 84 00 00 00 00
> [   21.046801] RSP: 0018:ffffc9000004b318 EFLAGS: 00010246
> [   21.047227] RAX: ffff888004e5d458 RBX: 0000000000000000 RCX: ffffffff818fccf1
> [   21.047719] RDX: 000000000000007b RSI: 0000000000000000 RDI: ffff888004313290
> [   21.048241] RBP: ffff888004313290 R08: 0001ffffffffffff R09: 0000000000000000
> [   21.048701] R10: 0000000000000013 R11: 0001888004313290 R12: 0000000000000003
> [   21.049138] R13: ffff888004313080 R14: ffff888004313080 R15: 0000000000000000
> [   21.049648] FS:  0000000000000000(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
> [   21.050271] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   21.050688] CR2: 0000592cc27635b0 CR3: 000000000431c000 CR4: 0000000000750ef0
> [   21.051136] PKRU: 55555554
> [   21.051331] Call Trace:
> [   21.051480]  <TASK>
> [   21.051611]  ? __warn+0xc4/0x210
> [   21.051861]  ? media_create_pad_link+0x2c4/0x2e0
> [   21.052252]  ? report_bug+0x11b/0x1a0
> [   21.052540]  ? trace_hardirqs_on+0x31/0x40
> [   21.052901]  ? handle_bug+0x3d/0x70
> [   21.053197]  ? exc_invalid_op+0x1a/0x50
> [   21.053511]  ? asm_exc_invalid_op+0x1a/0x20
> [   21.053924]  ? media_create_pad_link+0x91/0x2e0
> [   21.054364]  ? media_create_pad_link+0x2c4/0x2e0
> [   21.054834]  ? media_create_pad_link+0x91/0x2e0
> [   21.055131]  ? _raw_spin_unlock+0x1e/0x40
> [   21.055441]  ? __v4l2_device_register_subdev+0x202/0x210
> [   21.055837]  uvc_mc_register_entities+0x358/0x400
> [   21.056144]  uvc_register_chains+0x1fd/0x290
> [   21.056413]  uvc_probe+0x380e/0x3dc0
> [   21.056676]  ? __lock_acquire+0x5aa/0x26e0
> [   21.056946]  ? find_held_lock+0x33/0xa0
> [   21.057196]  ? kernfs_activate+0x70/0x80
> [   21.057533]  ? usb_match_dynamic_id+0x1b/0x70
> [   21.057811]  ? find_held_lock+0x33/0xa0
> [   21.058047]  ? usb_match_dynamic_id+0x55/0x70
> [   21.058330]  ? lock_release+0x124/0x260
> [   21.058657]  ? usb_match_one_id_intf+0xa2/0x100
> [   21.058997]  usb_probe_interface+0x1ba/0x330
> [   21.059399]  really_probe+0x1ba/0x4c0
> [   21.059662]  __driver_probe_device+0xb2/0x180
> [   21.059944]  driver_probe_device+0x5a/0x100
> [   21.060170]  __device_attach_driver+0xe9/0x160
> [   21.060427]  ? __pfx___device_attach_driver+0x10/0x10
> [   21.060872]  bus_for_each_drv+0xa9/0x100
> [   21.061312]  __device_attach+0xed/0x190
> [   21.061812]  device_initial_probe+0xe/0x20
> [   21.062229]  bus_probe_device+0x4d/0xd0
> [   21.062590]  device_add+0x308/0x590
> [   21.062912]  usb_set_configuration+0x7b6/0xaf0
> [   21.063403]  usb_generic_driver_probe+0x36/0x80
> [   21.063714]  usb_probe_device+0x7b/0x130
> [   21.063936]  really_probe+0x1ba/0x4c0
> [   21.064111]  __driver_probe_device+0xb2/0x180
> [   21.064577]  driver_probe_device+0x5a/0x100
> [   21.065019]  __device_attach_driver+0xe9/0x160
> [   21.065403]  ? __pfx___device_attach_driver+0x10/0x10
> [   21.065820]  bus_for_each_drv+0xa9/0x100
> [   21.066094]  __device_attach+0xed/0x190
> [   21.066535]  device_initial_probe+0xe/0x20
> [   21.066992]  bus_probe_device+0x4d/0xd0
> [   21.067250]  device_add+0x308/0x590
> [   21.067501]  usb_new_device+0x347/0x610
> [   21.067817]  hub_event+0x156b/0x1e30
> [   21.068060]  ? process_scheduled_works+0x48b/0xaf0
> [   21.068337]  process_scheduled_works+0x5a3/0xaf0
> [   21.068668]  worker_thread+0x3cf/0x560
> [   21.068932]  ? kthread+0x109/0x1b0
> [   21.069133]  kthread+0x197/0x1b0
> [   21.069343]  ? __pfx_worker_thread+0x10/0x10
> [   21.069598]  ? __pfx_kthread+0x10/0x10
> [   21.069908]  ret_from_fork+0x32/0x40
> [   21.070169]  ? __pfx_kthread+0x10/0x10
> [   21.070424]  ret_from_fork_asm+0x1a/0x30
> [   21.070737]  </TASK>
> 
> Reported-by: syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0584f746fde3d52b4675
> Reported-by: syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
> Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08c2d..af1eb189fd89 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -775,14 +775,27 @@ static const u8 uvc_media_transport_input_guid[16] =
>  	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>  
> -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> -		unsigned int num_pads, unsigned int extra_size)
> +static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> +					       u16 id, unsigned int num_pads,
> +					       unsigned int extra_size)
>  {
>  	struct uvc_entity *entity;
>  	unsigned int num_inputs;
>  	unsigned int size;
>  	unsigned int i;
>  
> +	/* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero */

s/zero/zero./

> +	if (id == 0) {
> +		dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* Per UVC 1.1+ spec 3.7.2, the ID is unique */

s/unique/unique./

> +	if (uvc_entity_by_id(dev, id)) {
> +		dev_err(&dev->udev->dev, "Found multiple Units with the same ID.\n");

I would print the ID here:

		dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);

I'll fix those small issues when applying the patch, no need to submit a
new version.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	extra_size = roundup(extra_size, sizeof(*entity->pads));
>  	if (num_pads)
>  		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> @@ -792,7 +805,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  	     + num_inputs;
>  	entity = kzalloc(size, GFP_KERNEL);
>  	if (entity == NULL)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	entity->id = id;
>  	entity->type = type;
> @@ -904,10 +917,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  			break;
>  		}
>  
> -		unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
> -					p + 1, 2*n);
> -		if (unit == NULL)
> -			return -ENOMEM;
> +		unit = uvc_alloc_new_entity(dev, UVC_VC_EXTENSION_UNIT,
> +					    buffer[3], p + 1, 2 * n);
> +		if (IS_ERR(unit))
> +			return PTR_ERR(unit);
>  
>  		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
> @@ -1016,10 +1029,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
> -					1, n + p);
> -		if (term == NULL)
> -			return -ENOMEM;
> +		term = uvc_alloc_new_entity(dev, type | UVC_TERM_INPUT,
> +					    buffer[3], 1, n + p);
> +		if (IS_ERR(term))
> +			return PTR_ERR(term);
>  
>  		if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA) {
>  			term->camera.bControlSize = n;
> @@ -1075,10 +1088,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return 0;
>  		}
>  
> -		term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
> -					1, 0);
> -		if (term == NULL)
> -			return -ENOMEM;
> +		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> +					    buffer[3], 1, 0);
> +		if (IS_ERR(term))
> +			return PTR_ERR(term);
>  
>  		memcpy(term->baSourceID, &buffer[7], 1);
>  
> @@ -1097,9 +1110,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
> -		if (unit == NULL)
> -			return -ENOMEM;
> +		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> +					    p + 1, 0);
> +		if (IS_ERR(unit))
> +			return PTR_ERR(unit);
>  
>  		memcpy(unit->baSourceID, &buffer[5], p);
>  
> @@ -1119,9 +1133,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
> -		if (unit == NULL)
> -			return -ENOMEM;
> +		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3], 2, n);
> +		if (IS_ERR(unit))
> +			return PTR_ERR(unit);
>  
>  		memcpy(unit->baSourceID, &buffer[4], 1);
>  		unit->processing.wMaxMultiplier =
> @@ -1148,9 +1162,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			return -EINVAL;
>  		}
>  
> -		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
> -		if (unit == NULL)
> -			return -ENOMEM;
> +		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> +					    p + 1, n);
> +		if (IS_ERR(unit))
> +			return PTR_ERR(unit);
>  
>  		memcpy(unit->guid, &buffer[4], 16);
>  		unit->extension.bNumControls = buffer[20];
> @@ -1290,9 +1305,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  		return dev_err_probe(&dev->udev->dev, irq,
>  				     "No IRQ for privacy GPIO\n");
>  
> -	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -	if (!unit)
> -		return -ENOMEM;
> +	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> +				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +	if (IS_ERR(unit))
> +		return PTR_ERR(unit);
>  
>  	unit->gpio.gpio_privacy = gpio_privacy;
>  	unit->gpio.irq = irq;

-- 
Regards,

Laurent Pinchart

