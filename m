Return-Path: <linux-media+bounces-41972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A82B488CA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3582A171E96
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E08F2EA493;
	Mon,  8 Sep 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGvrQWZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB732F1FC5;
	Mon,  8 Sep 2025 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324426; cv=none; b=QiF0h9iHxqigDLGkseym4I+FFwWsW7CqB63EOzLcsrNaT3NUA6uXDK6NvInhiHSzYyGTzwPpuZhL9dlLyBp3Ca0hTOO66Sy8G5DfE1200GCl87jAmJBAeGK3uCALl1HpwN2H5hHjgegfB2A935bdX/RA51FGoh+2NP9nl5eh8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324426; c=relaxed/simple;
	bh=IIh1/fBjujCN8XT7Sqwx374bf6yi3eMjJfutRucmrVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fxzxp0mTCLYzDAswmLd+zmwqpV6NM2108iFj35UgXrjcn6N/CGG5WcBvq67zWWwqU+8YpASfCGV/rGfEcuCZThwhtSZK3IGEK1/pzzu4sbutLs1AKZ6i6U2qj1cinjfj9zkGngvfRSieOWaXQwLsDbpbyw1XITUaP2Q6PxfC2Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGvrQWZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A73C4CEF1;
	Mon,  8 Sep 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757324426;
	bh=IIh1/fBjujCN8XT7Sqwx374bf6yi3eMjJfutRucmrVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jGvrQWZ2XcAK5fU1ZxN/J8kHwQYnANH0jJJ13UnYL+0rrwCb7fEylanrrIGn4FoF+
	 ZPD0QAIhPUlzwqUTf4QCdH4EuETwW2THkaKAKRVG2keQXFyGNGMtCwGVHM0ZFTreZe
	 swwDZaYdAz4s9MewrfkZ4aRLZZ+ArN9THEBiYMR1M5ETwAdXZT+uKV/Qn8+pZNRU6k
	 Slp2tQBOP7c9Z4zAbj2OPpFcFFrSOMmmlRp/R3+SuuTuh2L7B+LrOrH+HM1lFgJkUp
	 c1ISiP/GGP5M/0AMFttSnSk1XklxMoheaEnHP3OG7y70vCQ323R0mC0fl5x49aam/M
	 UTRktqdb2nsPg==
Message-ID: <efad692d-c2b2-4d7a-b61d-d542b25ba6a4@kernel.org>
Date: Mon, 8 Sep 2025 11:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Mark invalid entities with id
 UVC_INVALID_ENTITY_ID
To: Ricardo Ribalda <ribalda@chromium.org>,
 Tomasz Sikora <sikora.tomus@gmail.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
 syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
References: <20250820-uvc-thadeu2-v1-1-a04a7cc8fc76@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250820-uvc-thadeu2-v1-1-a04a7cc8fc76@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Aug-25 18:08, Ricardo Ribalda wrote:
> From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
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
> If we add a new entity with id 0 or a duplicated ID, it will be marked
> as UVC_INVALID_ENTITY_ID.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans





> In a previous attempt commit 3dd075fe8ebb ("media: uvcvideo: Require
> entities to have a non-zero unique ID"), we ignored all the invalid units,
> this broke a lot of non-compatible cameras. Hopefully we are more lucky
> this time.
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
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0584f746fde3d52b4675
> Reported-by: syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
> Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Co-developed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> This is a new attempt to land a Thadeu's patch, but being a bit more
> benevolent on the non-compliant cameras.
> 
> I have kept most of Thadeu's code, but instead of returning an error
> when trying to allocate an invalid entity, I replace its id with a
> special ID.
> 
> Thadeu can you validate this new version?
> 
> Tomasz can you also check this patch with your non compliant camera?
> 
> Thanks!
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 73 ++++++++++++++++++++++++--------------
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  2 files changed, 48 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 775bede0d93d9b3e5391914aa395326d3de6a3b1..46923cd85f0b6790f01ae6b393571ca7660900f7 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -137,6 +137,9 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id)
>  {
>  	struct uvc_entity *entity;
>  
> +	if (id == UVC_INVALID_ENTITY_ID)
> +		return NULL;
> +
>  	list_for_each_entry(entity, &dev->entities, list) {
>  		if (entity->id == id)
>  			return entity;
> @@ -795,14 +798,27 @@ static const u8 uvc_media_transport_input_guid[16] =
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
> +	/* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
> +	if (id == 0) {
> +		dev_err(&dev->intf->dev, "Found Unit with invalid ID 0.\n");
> +		id = UVC_INVALID_ENTITY_ID;
> +	}
> +
> +	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> +	if (uvc_entity_by_id(dev, id)) {
> +		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> +		id = UVC_INVALID_ENTITY_ID;
> +	}
> +
>  	extra_size = roundup(extra_size, sizeof(*entity->pads));
>  	if (num_pads)
>  		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> @@ -812,7 +828,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>  	     + num_inputs;
>  	entity = kzalloc(size, GFP_KERNEL);
>  	if (entity == NULL)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	entity->id = id;
>  	entity->type = type;
> @@ -924,10 +940,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
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
> @@ -1036,10 +1052,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
> @@ -1095,10 +1111,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
> @@ -1117,9 +1133,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
> @@ -1139,9 +1156,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
> @@ -1168,9 +1185,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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
> @@ -1315,9 +1333,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  		return dev_err_probe(&dev->intf->dev, irq,
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
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 70dc80e2b213dff333665022b3410b175d072793..881bfa0caab22714c26a3260cc843bda8e2706a4 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -41,6 +41,8 @@
>  #define UVC_EXT_GPIO_UNIT		0x7ffe
>  #define UVC_EXT_GPIO_UNIT_ID		0x100
>  
> +#define UVC_INVALID_ENTITY_ID          0xffff
> +
>  /* ------------------------------------------------------------------------
>   * Driver specific constants.
>   */
> 
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250820-uvc-thadeu2-25723a961bd8
> 
> Best regards,


