Return-Path: <linux-media+bounces-41981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B95F8B48A48
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E43751B25677
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88982FB988;
	Mon,  8 Sep 2025 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fNxkYAtp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06662FB080
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757327748; cv=none; b=CSHpODZFwOdkCyzjK3AgLTtYpcR/usmt00HhfhuVxp/MTYuv179a7c8GNKddZrxU2KvwykYQtBYLc+0RAToxGTDtro1QHdlTW1bMkaFxLXSW6WxCDYwJ6RxNvYBpIFZOpr7RO/SESGk3Wgkqvm11yB3+xfu/Cv/kJgJWRybooW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757327748; c=relaxed/simple;
	bh=0vpTaONNsXDvEHxLYnAi/l4GqqNBsDXzZ6dXnppbnHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZ+kGztjnuLLeLqG0Uob89bkSr5Elh19zNUOa2oEBYO+u4lvgSNPHiRCgA+ajxLLQSslU5F6jEr0YKaAHiNtwmpsp4zThN4yR9NzMAhxLjuPXbZ+v4r7vW0XLEzSYPYrdcQs7TtW7HtxW89z5BdefhvgobZAoEm5GDFnJkjIcsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fNxkYAtp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso4863367e87.0
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757327744; x=1757932544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H0OjuamAg1AYYzYDT7KWHOcNN/ieOqYf9J7+RttcE7k=;
        b=fNxkYAtpGV4RCj4uHEb+3tp+WJvrxwjKSXVTuB6cS6Dv8uuggWMioUgzqij0BuHkKN
         3+5dn7cJ9iIAL9u8CgboyiVUhN+q2yslNPzt7JH+rEehDB66RoGcAQPEb0nvSghg0d0T
         ISQDl8fK72dPveWmxBTlWwhgzAH6umQti9HqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757327744; x=1757932544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0OjuamAg1AYYzYDT7KWHOcNN/ieOqYf9J7+RttcE7k=;
        b=rclLuDQusVtZnnWukjzA0K0oGJbcGQrxhnvUBiuF2/emUh20zMMQI0gWGpuQ2nimYs
         m7TDKBaPYyJE5idKEDfD2HXNoXe8bPZWYVQ/SF9QJMDnEtoomNWX5t3mw2X6ehcWZVOB
         IWQqF/m+VuiX2+MZcqRkmB0F9NghcbsyAAin6wb/Lu7Si6kgcg13I3omw9Xhp0w4y/YD
         XAVbBCpPZDKQD41moyRfe0jSckjSPyd800AzibDTGEeh9nKUgMieNq3aRhR4xVhiS+VE
         MKjmSQma3oVNYZkm9D70DHJaFruAu9OG740ewtP3373X+zeu9bpGQruTYnNmbSwkYpap
         7/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXi3VbiODqK9KHPaxGPdKLN1BF/NxDkeXKt2BXMO7eN+YyOd2Bp89NquTCYAY6UEnj8eeu65YLZXVgoyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkk+Wbkn+GXG2ci7X+HrCtoz4aBcRr8K9vpcY05dnW3yLHyRZZ
	QmR6cVSvi0dDHaAK+8SBFMXbIvfTqT0N8oVtVUZK3gGWGcAOljLDl6USO7f929laBLYPP30tgta
	YqTE=
X-Gm-Gg: ASbGncsVm9ffjWG9bNdxl7o5KNIzbXzM+aKM/a80a2dcXUaHKHrCEwC3qqNMtbzN7F5
	BxCKzabOLnLj6tBWNXItXHLQ7EuLefNCq547xEB07s86SGxl4mFIRHxzV50wQx50Mt1QocW1ZtQ
	bXRFBlJw75fyBF0IPsBZmN0TVNQ+xSxrLk4I4IGM0gFaO9WQX3qyfWYY/o5DGZIcNW7ktSF7GY8
	242LC+7GfOfsCd2iJwxL6GuMMV2zg5sZmb08ixrjn4T4SH05FspN+jgWQ+PNU+w5758V2BGXzXA
	J3ZKiaINFjepRWHVudBOL9TB/4AzoK1YGncqruu4fJiiRuPrtSLPXX7sML8RUVOTZashNl3hyV3
	EOQqzo9jZge/DZgFihdhpvLhozIKbmVGIHzfrJnEV2E1SyF5WbTVCRtyJY6v1
X-Google-Smtp-Source: AGHT+IEA5Qz6VFerI1WJRstGbvmzWxN+VvvPeLaNQL6KXZm1JVXukVpVqbybo3BdFbUVmnEHt7RwWA==
X-Received: by 2002:a05:6512:1322:b0:55f:4926:df1c with SMTP id 2adb3069b0e04-5626310e5famr1856636e87.46.1757327743465;
        Mon, 08 Sep 2025 03:35:43 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc63c8sm3548970e87.61.2025.09.08.03.35.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 03:35:42 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6f434c96so3870669e87.2
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 03:35:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6iMQYz5xXVGT35cvs0dLIuYrPRPidQDZe/g+zY1Mf1dQ6vPKyK5InM9N5jGv4h4qWbKlctR8I2Iv3fg==@vger.kernel.org
X-Received: by 2002:a05:6512:1507:10b0:562:d04d:fa0a with SMTP id
 2adb3069b0e04-562d04dfb44mr2000620e87.31.1757327740719; Mon, 08 Sep 2025
 03:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820-uvc-thadeu2-v1-1-a04a7cc8fc76@chromium.org> <20250908103306.GD26062@pendragon.ideasonboard.com>
In-Reply-To: <20250908103306.GD26062@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 8 Sep 2025 12:35:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCvJjqczwLRH7TNqO7mocPfJeFeFVbKErXsDNX-qj1NwDA@mail.gmail.com>
X-Gm-Features: Ac12FXx-tZDxRPG0HD-FdSc9X6vVC9nlrw4wr3Q1WEkqH9s7ID8PO9T15kSvMcI
Message-ID: <CANiDSCvJjqczwLRH7TNqO7mocPfJeFeFVbKErXsDNX-qj1NwDA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Sikora <sikora.tomus@gmail.com>, 
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 12:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Ricardo,
>
> Thank you for the patch.
>
> On Wed, Aug 20, 2025 at 04:08:16PM +0000, Ricardo Ribalda wrote:
> > From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >
> > Per UVC 1.1+ specification 3.7.2, units and terminals must have a non-zero
> > unique ID.
> >
> > ```
> > Each Unit and Terminal within the video function is assigned a unique
> > identification number, the Unit ID (UID) or Terminal ID (TID), contained in
> > the bUnitID or bTerminalID field of the descriptor. The value 0x00 is
> > reserved for undefined ID,
> > ```
> >
> > If we add a new entity with id 0 or a duplicated ID, it will be marked
> > as UVC_INVALID_ENTITY_ID.
> >
> > In a previous attempt commit 3dd075fe8ebb ("media: uvcvideo: Require
> > entities to have a non-zero unique ID"), we ignored all the invalid units,
> > this broke a lot of non-compatible cameras. Hopefully we are more lucky
> > this time.
> >
> > This also prevents some syzkaller reproducers from triggering warnings due
> > to a chain of entities referring to themselves. In one particular case, an
> > Output Unit is connected to an Input Unit, both with the same ID of 1. But
> > when looking up for the source ID of the Output Unit, that same entity is
> > found instead of the input entity, which leads to such warnings.
> >
> > In another case, a backward chain was considered finished as the source ID
> > was 0. Later on, that entity was found, but its pads were not valid.
> >
> > Here is a sample stack trace for one of those cases.
> >
> > [   20.650953] usb 1-1: new high-speed USB device number 2 using dummy_hcd
> > [   20.830206] usb 1-1: Using ep0 maxpacket: 8
> > [   20.833501] usb 1-1: config 0 descriptor??
> > [   21.038518] usb 1-1: string descriptor 0 read error: -71
> > [   21.038893] usb 1-1: Found UVC 0.00 device <unnamed> (2833:0201)
> > [   21.039299] uvcvideo 1-1:0.0: Entity type for entity Output 1 was not initialized!
> > [   21.041583] uvcvideo 1-1:0.0: Entity type for entity Input 1 was not initialized!
> > [   21.042218] ------------[ cut here ]------------
> > [   21.042536] WARNING: CPU: 0 PID: 9 at drivers/media/mc/mc-entity.c:1147 media_create_pad_link+0x2c4/0x2e0
> > [   21.043195] Modules linked in:
> > [   21.043535] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc7-00030-g3480e43aeccf #444
> > [   21.044101] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
> > [   21.044639] Workqueue: usb_hub_wq hub_event
> > [   21.045100] RIP: 0010:media_create_pad_link+0x2c4/0x2e0
> > [   21.045508] Code: fe e8 20 01 00 00 b8 f4 ff ff ff 48 83 c4 30 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 0f 0b eb e9 0f 0b eb 0a 0f 0b eb 06 <0f> 0b eb 02 0f 0b b8 ea ff ff ff eb d4 66 2e 0f 1f 84 00 00 00 00
> > [   21.046801] RSP: 0018:ffffc9000004b318 EFLAGS: 00010246
> > [   21.047227] RAX: ffff888004e5d458 RBX: 0000000000000000 RCX: ffffffff818fccf1
> > [   21.047719] RDX: 000000000000007b RSI: 0000000000000000 RDI: ffff888004313290
> > [   21.048241] RBP: ffff888004313290 R08: 0001ffffffffffff R09: 0000000000000000
> > [   21.048701] R10: 0000000000000013 R11: 0001888004313290 R12: 0000000000000003
> > [   21.049138] R13: ffff888004313080 R14: ffff888004313080 R15: 0000000000000000
> > [   21.049648] FS:  0000000000000000(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
> > [   21.050271] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   21.050688] CR2: 0000592cc27635b0 CR3: 000000000431c000 CR4: 0000000000750ef0
> > [   21.051136] PKRU: 55555554
> > [   21.051331] Call Trace:
> > [   21.051480]  <TASK>
> > [   21.051611]  ? __warn+0xc4/0x210
> > [   21.051861]  ? media_create_pad_link+0x2c4/0x2e0
> > [   21.052252]  ? report_bug+0x11b/0x1a0
> > [   21.052540]  ? trace_hardirqs_on+0x31/0x40
> > [   21.052901]  ? handle_bug+0x3d/0x70
> > [   21.053197]  ? exc_invalid_op+0x1a/0x50
> > [   21.053511]  ? asm_exc_invalid_op+0x1a/0x20
> > [   21.053924]  ? media_create_pad_link+0x91/0x2e0
> > [   21.054364]  ? media_create_pad_link+0x2c4/0x2e0
> > [   21.054834]  ? media_create_pad_link+0x91/0x2e0
> > [   21.055131]  ? _raw_spin_unlock+0x1e/0x40
> > [   21.055441]  ? __v4l2_device_register_subdev+0x202/0x210
> > [   21.055837]  uvc_mc_register_entities+0x358/0x400
> > [   21.056144]  uvc_register_chains+0x1fd/0x290
> > [   21.056413]  uvc_probe+0x380e/0x3dc0
> > [   21.056676]  ? __lock_acquire+0x5aa/0x26e0
> > [   21.056946]  ? find_held_lock+0x33/0xa0
> > [   21.057196]  ? kernfs_activate+0x70/0x80
> > [   21.057533]  ? usb_match_dynamic_id+0x1b/0x70
> > [   21.057811]  ? find_held_lock+0x33/0xa0
> > [   21.058047]  ? usb_match_dynamic_id+0x55/0x70
> > [   21.058330]  ? lock_release+0x124/0x260
> > [   21.058657]  ? usb_match_one_id_intf+0xa2/0x100
> > [   21.058997]  usb_probe_interface+0x1ba/0x330
> > [   21.059399]  really_probe+0x1ba/0x4c0
> > [   21.059662]  __driver_probe_device+0xb2/0x180
> > [   21.059944]  driver_probe_device+0x5a/0x100
> > [   21.060170]  __device_attach_driver+0xe9/0x160
> > [   21.060427]  ? __pfx___device_attach_driver+0x10/0x10
> > [   21.060872]  bus_for_each_drv+0xa9/0x100
> > [   21.061312]  __device_attach+0xed/0x190
> > [   21.061812]  device_initial_probe+0xe/0x20
> > [   21.062229]  bus_probe_device+0x4d/0xd0
> > [   21.062590]  device_add+0x308/0x590
> > [   21.062912]  usb_set_configuration+0x7b6/0xaf0
> > [   21.063403]  usb_generic_driver_probe+0x36/0x80
> > [   21.063714]  usb_probe_device+0x7b/0x130
> > [   21.063936]  really_probe+0x1ba/0x4c0
> > [   21.064111]  __driver_probe_device+0xb2/0x180
> > [   21.064577]  driver_probe_device+0x5a/0x100
> > [   21.065019]  __device_attach_driver+0xe9/0x160
> > [   21.065403]  ? __pfx___device_attach_driver+0x10/0x10
> > [   21.065820]  bus_for_each_drv+0xa9/0x100
> > [   21.066094]  __device_attach+0xed/0x190
> > [   21.066535]  device_initial_probe+0xe/0x20
> > [   21.066992]  bus_probe_device+0x4d/0xd0
> > [   21.067250]  device_add+0x308/0x590
> > [   21.067501]  usb_new_device+0x347/0x610
> > [   21.067817]  hub_event+0x156b/0x1e30
> > [   21.068060]  ? process_scheduled_works+0x48b/0xaf0
> > [   21.068337]  process_scheduled_works+0x5a3/0xaf0
> > [   21.068668]  worker_thread+0x3cf/0x560
> > [   21.068932]  ? kthread+0x109/0x1b0
> > [   21.069133]  kthread+0x197/0x1b0
> > [   21.069343]  ? __pfx_worker_thread+0x10/0x10
> > [   21.069598]  ? __pfx_kthread+0x10/0x10
> > [   21.069908]  ret_from_fork+0x32/0x40
> > [   21.070169]  ? __pfx_kthread+0x10/0x10
> > [   21.070424]  ret_from_fork_asm+0x1a/0x30
> > [   21.070737]  </TASK>
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=0584f746fde3d52b4675
> > Reported-by: syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
> > Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > Co-developed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > This is a new attempt to land a Thadeu's patch, but being a bit more
> > benevolent on the non-compliant cameras.
> >
> > I have kept most of Thadeu's code, but instead of returning an error
> > when trying to allocate an invalid entity, I replace its id with a
> > special ID.
> >
> > Thadeu can you validate this new version?
> >
> > Tomasz can you also check this patch with your non compliant camera?
> >
> > Thanks!
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 73 ++++++++++++++++++++++++--------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  2 files changed, 48 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 775bede0d93d9b3e5391914aa395326d3de6a3b1..46923cd85f0b6790f01ae6b393571ca7660900f7 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -137,6 +137,9 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id)
> >  {
> >       struct uvc_entity *entity;
> >
> > +     if (id == UVC_INVALID_ENTITY_ID)
> > +             return NULL;
> > +
> >       list_for_each_entry(entity, &dev->entities, list) {
> >               if (entity->id == id)
> >                       return entity;
> > @@ -795,14 +798,27 @@ static const u8 uvc_media_transport_input_guid[16] =
> >       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> >
> > -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > -             unsigned int num_pads, unsigned int extra_size)
> > +static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > +                                            u16 id, unsigned int num_pads,
> > +                                            unsigned int extra_size)
> >  {
> >       struct uvc_entity *entity;
> >       unsigned int num_inputs;
> >       unsigned int size;
> >       unsigned int i;
> >
> > +     /* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
> > +     if (id == 0) {
> > +             dev_err(&dev->intf->dev, "Found Unit with invalid ID 0.\n");
>
> s/0./0/
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Should I wait for Thadeu and Tomasz to check this new patch before
> applying it ?

It has been almost 3 weeks of radio-silence... I'd recommend to apply it.

We can always fix it afterwards.

>
> > +             id = UVC_INVALID_ENTITY_ID;
> > +     }
> > +
> > +     /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > +     if (uvc_entity_by_id(dev, id)) {
> > +             dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > +             id = UVC_INVALID_ENTITY_ID;
> > +     }
> > +
> >       extra_size = roundup(extra_size, sizeof(*entity->pads));
> >       if (num_pads)
> >               num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> > @@ -812,7 +828,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> >            + num_inputs;
> >       entity = kzalloc(size, GFP_KERNEL);
> >       if (entity == NULL)
> > -             return NULL;
> > +             return ERR_PTR(-ENOMEM);
> >
> >       entity->id = id;
> >       entity->type = type;
> > @@ -924,10 +940,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
> >                       break;
> >               }
> >
> > -             unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
> > -                                     p + 1, 2*n);
> > -             if (unit == NULL)
> > -                     return -ENOMEM;
> > +             unit = uvc_alloc_new_entity(dev, UVC_VC_EXTENSION_UNIT,
> > +                                         buffer[3], p + 1, 2 * n);
> > +             if (IS_ERR(unit))
> > +                     return PTR_ERR(unit);
> >
> >               memcpy(unit->guid, &buffer[4], 16);
> >               unit->extension.bNumControls = buffer[20];
> > @@ -1036,10 +1052,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return -EINVAL;
> >               }
> >
> > -             term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
> > -                                     1, n + p);
> > -             if (term == NULL)
> > -                     return -ENOMEM;
> > +             term = uvc_alloc_new_entity(dev, type | UVC_TERM_INPUT,
> > +                                         buffer[3], 1, n + p);
> > +             if (IS_ERR(term))
> > +                     return PTR_ERR(term);
> >
> >               if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA) {
> >                       term->camera.bControlSize = n;
> > @@ -1095,10 +1111,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return 0;
> >               }
> >
> > -             term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
> > -                                     1, 0);
> > -             if (term == NULL)
> > -                     return -ENOMEM;
> > +             term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > +                                         buffer[3], 1, 0);
> > +             if (IS_ERR(term))
> > +                     return PTR_ERR(term);
> >
> >               memcpy(term->baSourceID, &buffer[7], 1);
> >
> > @@ -1117,9 +1133,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return -EINVAL;
> >               }
> >
> > -             unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
> > -             if (unit == NULL)
> > -                     return -ENOMEM;
> > +             unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> > +                                         p + 1, 0);
> > +             if (IS_ERR(unit))
> > +                     return PTR_ERR(unit);
> >
> >               memcpy(unit->baSourceID, &buffer[5], p);
> >
> > @@ -1139,9 +1156,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return -EINVAL;
> >               }
> >
> > -             unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
> > -             if (unit == NULL)
> > -                     return -ENOMEM;
> > +             unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3], 2, n);
> > +             if (IS_ERR(unit))
> > +                     return PTR_ERR(unit);
> >
> >               memcpy(unit->baSourceID, &buffer[4], 1);
> >               unit->processing.wMaxMultiplier =
> > @@ -1168,9 +1185,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >                       return -EINVAL;
> >               }
> >
> > -             unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
> > -             if (unit == NULL)
> > -                     return -ENOMEM;
> > +             unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> > +                                         p + 1, n);
> > +             if (IS_ERR(unit))
> > +                     return PTR_ERR(unit);
> >
> >               memcpy(unit->guid, &buffer[4], 16);
> >               unit->extension.bNumControls = buffer[20];
> > @@ -1315,9 +1333,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
> >               return dev_err_probe(&dev->intf->dev, irq,
> >                                    "No IRQ for privacy GPIO\n");
> >
> > -     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > -     if (!unit)
> > -             return -ENOMEM;
> > +     unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> > +                                 UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > +     if (IS_ERR(unit))
> > +             return PTR_ERR(unit);
> >
> >       unit->gpio.gpio_privacy = gpio_privacy;
> >       unit->gpio.irq = irq;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 70dc80e2b213dff333665022b3410b175d072793..881bfa0caab22714c26a3260cc843bda8e2706a4 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -41,6 +41,8 @@
> >  #define UVC_EXT_GPIO_UNIT            0x7ffe
> >  #define UVC_EXT_GPIO_UNIT_ID         0x100
> >
> > +#define UVC_INVALID_ENTITY_ID          0xffff
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> >   */
> >
> > ---
> > base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > change-id: 20250820-uvc-thadeu2-25723a961bd8
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

