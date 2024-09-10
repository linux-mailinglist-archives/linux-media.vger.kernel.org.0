Return-Path: <linux-media+bounces-18078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BAC97390C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 15:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86EC71F24F78
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 13:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9099A192B62;
	Tue, 10 Sep 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B8eDMhBc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B61EEE9
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976147; cv=none; b=BgULXm0TLDAzVjaF64NNPsD9Uih0nAQ+TC6T3w37osRQghORRlcu0Crpi3MzoRwrVILhUavRmUEd5SOayJcXJJuGAefcrT7p+do2SnEWZFweWMvPOTSi4nvSn0hSMmSBK6NDopb6qHeNQcba8TwT5jwT+B/mG/dT1C0p/9A3Fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976147; c=relaxed/simple;
	bh=tYGeTxY1AntF7t/7tKmS2hnlgka2iFQSk/vlXuFhfRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xefv8E1/vxZa9FTExm95GcPxGjNs4iidFnLc3tfvqbdOopa8AMA1cdUUtT/nS2OY0VJfZ0jQkTj4opylHCDoH1ASz89IJsaMOvSRM9389qzgBWu7+LtnKpcu5shRjjdNmV36NFFhLm5pX30BXcyYJOTmq2JJqqmbLPbnx1yoyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B8eDMhBc; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d885019558so3831614a91.2
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725976145; x=1726580945; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KmxpQmyohfe8a8zx9N73tYLBVOlUHuUlWBWDEKj2GzU=;
        b=B8eDMhBcuyNyyARBNPfm5s2Y+LMRiRpwy9CY3zpyuGiWUpe3feZAGjA5ouXp/rTlxB
         RD1+Fa3DMBM1FPsv3sUZuMDfcTNVZGOSCWJ/tAatdkbCfuSc4CAawq2zDEqcJr0XSu98
         lU9R8kw1pGW+gSHwE8fVaZfMOj8NWETChVbm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976145; x=1726580945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmxpQmyohfe8a8zx9N73tYLBVOlUHuUlWBWDEKj2GzU=;
        b=jSZ2d22wZ8M9Q+1pR37b5IsdYTChRf0xGn70tTlnciCy5YArtRnYJI9P0SAnhNLu2m
         WudI8iGPtL45++kZOqRZO4DKNX3Z+hiqlalBAxM7J5xQOhjRkRsNlRaYHHYL3eaVmCPO
         /2Fo9Z19pYuVXFQyYFR+D6TnQm7plzkxa60FTAXyegUqwwfvhVDcSZ2iFnhaPd6Dx1Rc
         e/tBJ/yTJvVY5sspeKl09P3kUi6ILS9sjQ0aSkNzroX3Wsgcl4FDbWIWZE7v1LYSBNVp
         SruSUd/8MqegxkOsDh2h+7RAkbUrgOa+tTH0XB+nvS284cIcnYNVYAnBSgbs7ObhKpxy
         ocYA==
X-Gm-Message-State: AOJu0YzV4j02aW9ym9ZfWG5SAbgDU9qPr6/sVAi+aRvA882T1Cdi67o8
	Y6UUfzlLHcbm2lqoG0PLXwKy9Yvz8Me1di9Ba5XGZn3w7L5oJHAWt31YYVTF05EfZevV8Sx5how
	=
X-Google-Smtp-Source: AGHT+IF1HvGXpyIn8hPu5ldSXyO+fOdxvBl4Zd9UxYz/oinj6YrhW5OKdTZl10hLzHqCF/qwyx/N1A==
X-Received: by 2002:a17:90b:4c84:b0:2d8:87d3:903b with SMTP id 98e67ed59e1d1-2dad5196fe1mr13666270a91.35.1725976144808;
        Tue, 10 Sep 2024 06:49:04 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc040397sm8482800a91.25.2024.09.10.06.49.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 06:49:04 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d916b6a73aso1431669a12.1
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 06:49:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:c888:b0:1cf:122b:37d1 with SMTP id
 adf61e73a8af0-1cf5e114436mr1500142637.30.1725976143248; Tue, 10 Sep 2024
 06:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909204605.1870265-1-cascardo@igalia.com> <20240909204605.1870265-2-cascardo@igalia.com>
In-Reply-To: <20240909204605.1870265-2-cascardo@igalia.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Sep 2024 15:48:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCvKra9mtLvkj6Fc7-ogyEDqQixh8YM6M6AsY8Lfw0=0LQ@mail.gmail.com>
Message-ID: <CANiDSCvKra9mtLvkj6Fc7-ogyEDqQixh8YM6M6AsY8Lfw0=0LQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: require entities to have a unique ID
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Thadeu

Thanks for your patch

On Mon, 9 Sept 2024 at 22:46, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
>
> Per UVC 1.5 specification, units and terminals must have an unique ID.

This is also valid from 1.1.

I would write it as:

Per UVC 1.1+ specification 3.7.2.2 , units and terminals must have an unique ID.
```
The Output Terminal is uniquely identified by the value in the
bTerminalID field. No other Unit
or Terminal within the same video function may have the same ID.
```

Also, I might squash the next patch into this one, to simplify the
backporting to stable... but that is up to you ;)

>
> So, deny allocating an entity with an ID that belongs to a unit that is
> already added to the list of entities.
>
> This also prevents some syzkaller reproducers from triggering warnings due
> to a chain of entities referring to themselves. In one particular case, an
> Output Unit is connected to an Input Unit, both with the same ID of 1. But
> when looking up for the source ID of the Output Unit, that same entity is
> found instead of the input entity, which leads to such warnings.
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
> Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index f0febdc08c2d..a6973b0ba676 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -775,14 +775,18 @@ static const u8 uvc_media_transport_input_guid[16] =
>         UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>
> -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> -               unsigned int num_pads, unsigned int extra_size)
> +static struct uvc_entity *uvc_alloc_entity(struct uvc_device *dev, u16 type,
> +               u16 id, unsigned int num_pads, unsigned int extra_size)
>  {

can we rename it as uvc_alloc_new_entity? Now the semantics of the
function has changed.

nit: Please check the warnings found by the CI:
https://patchwork.linuxtv.org/project/linux-media/patch/20240909204605.1870265-3-cascardo@igalia.com/
https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1267835/test_report?job_name=checkpatch


>         struct uvc_entity *entity;
>         unsigned int num_inputs;
>         unsigned int size;
>         unsigned int i;
>
> +       /* Per UVC 1.5 spec, the ID is unique */

/* Per UVC 1.1+ spec 3.7.2.2, the ID is unique */

> +       if (uvc_entity_by_id(dev, id))

It might be worth to throw a dev_err() here

> +               return NULL;
> +
>         extra_size = roundup(extra_size, sizeof(*entity->pads));
>         if (num_pads)
>                 num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> @@ -904,7 +908,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>                         break;
>                 }
>
> -               unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
> +               unit = uvc_alloc_entity(dev, UVC_VC_EXTENSION_UNIT, buffer[3],
>                                         p + 1, 2*n);
>                 if (unit == NULL)
>                         return -ENOMEM;
> @@ -1016,7 +1020,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
> +               term = uvc_alloc_entity(dev, type | UVC_TERM_INPUT, buffer[3],
>                                         1, n + p);
>                 if (term == NULL)
>                         return -ENOMEM;
> @@ -1075,7 +1079,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return 0;
>                 }
>
> -               term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
> +               term = uvc_alloc_entity(dev, type | UVC_TERM_OUTPUT, buffer[3],
>                                         1, 0);
>                 if (term == NULL)
>                         return -ENOMEM;
> @@ -1097,7 +1101,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
> +               unit = uvc_alloc_entity(dev, buffer[2], buffer[3], p + 1, 0);
>                 if (unit == NULL)
>                         return -ENOMEM;
>
> @@ -1119,7 +1123,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
> +               unit = uvc_alloc_entity(dev, buffer[2], buffer[3], 2, n);
>                 if (unit == NULL)
>                         return -ENOMEM;
>
> @@ -1148,7 +1152,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
> +               unit = uvc_alloc_entity(dev, buffer[2], buffer[3], p + 1, n);
>                 if (unit == NULL)
>                         return -ENOMEM;
>
> @@ -1290,7 +1294,8 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return dev_err_probe(&dev->udev->dev, irq,
>                                      "No IRQ for privacy GPIO\n");
>
> -       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +       unit = uvc_alloc_entity(dev, UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID,
> +                               0, 1);
>         if (!unit)
>                 return -ENOMEM;
>
> --
> 2.34.1
>
>


--
Ricardo Ribalda

