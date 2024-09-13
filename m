Return-Path: <linux-media+bounces-18262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18B978556
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 18:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BC5F2819FF
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 16:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC6256B72;
	Fri, 13 Sep 2024 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Goiv2YfA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14BD51C45
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726243324; cv=none; b=d5lz5UcouU1a0Ff2b7MkPgD3yo4x8PT3aKZ6j4gYEFXobdhb8kqs54t1F6aqgcKNufH890w4SiV+AAWpMn6wBD8Qsfckn1jBmD4oiHDNORSqrmXi88Kw02KYE6zL5AIgg266kO7Gy1GpWzXYf3DsTXsODQGiQ8gbELDJ8Ua8ZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726243324; c=relaxed/simple;
	bh=pxLvli7XY9DNqNJkJv5W2zovAIaVGedCMlMb1geIt/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5Z0Pit1vL9Tqc0IuB54tLcR9PLEczQ5aufj5gXnkb6DKD3aRWZXEKl1rX8Ff7HdO/4BJQhSZhrI5g59G/acL9sKMeoPOv6eXy+1bmJAKD7attrwqVx1iQ+9Dp+2HjKlGZao+bCmF7Z4VH8H274CVUO0ImAHPp/iIUrMY5b4GoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Goiv2YfA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2068bee21d8so25869475ad.2
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726243322; x=1726848122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzM6/OV8qdIGgwKBX7UNltc/3fIU3xfQUrD4TzIYLZg=;
        b=Goiv2YfAAJaAIm+RLvpwpEe9ybKQ9vjwbQKgar5YmzJ5lSs67qKH9Ym5NNHxVUmMjx
         XI2nrCRu6tNHxTrhm904s6A8V4CcvD51HcNgb0g7OcIEEBqNqId+gyFd3Wnf3yhANyAm
         UCDGDBQcaLaRpsA0AKfAQgGUKdiaaf8RGSz28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243322; x=1726848122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzM6/OV8qdIGgwKBX7UNltc/3fIU3xfQUrD4TzIYLZg=;
        b=Un0YeODpu0kM8ce4m9XVN27LLC4zU4qagi1uWRuDtxEfpENxOkDS89l/vZA45TE5oe
         Yz+XRWvPQ5MlBsZkf138Ae1COOg0MbDqIGCcPzehwanMG/4YK4HJlowQW5+aYcARCKjq
         78Jc8d2cUohI86+yImSsj6zx5uURgy5TOa1INcl9kX/tOM7VH7wFw5Dxoh/73J44bVI5
         FjviY75qO/BphpBtr6rrmZW87EX3dLqxE2mwiXjzxvIP0CsuqKWeBA/flxYXy3KHRvi3
         F4FYGOgURaR2JFsTCtIkP/XM4Acy4nrYsxvze8fxdFlKjKwExDFnoFOoLiBrupwq5e8a
         dc/Q==
X-Gm-Message-State: AOJu0YwTmq22d8ShP7SHkUSqKKa4LWF7T6DcgPAcjmmjh1WiXgPRvRvL
	KlUAgP7zf3oGFpxIgefgES21Xj7a474MWSgvBtLYNf1xGTjlVt3h7rulpAm6xCjhxGLxVCt/iW8
	=
X-Google-Smtp-Source: AGHT+IEgpyA+9wpgB3dTGNtxBMJZr9OPksA/fjuNGZKmkmdPwmP+oG5fuB74oyuziz2swhLhj+y6Zg==
X-Received: by 2002:a17:90a:6b4b:b0:2d8:e3f3:fd66 with SMTP id 98e67ed59e1d1-2dba0068017mr6863718a91.34.1726243321528;
        Fri, 13 Sep 2024 09:02:01 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9d1cacasm1946628a91.49.2024.09.13.09.02.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 09:02:00 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7d4f9e39c55so1708337a12.2
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 09:02:00 -0700 (PDT)
X-Received: by 2002:a17:90a:10c2:b0:2da:7b8b:ea0d with SMTP id
 98e67ed59e1d1-2db9ff798edmr6836638a91.8.1726243319554; Fri, 13 Sep 2024
 09:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912185133.1181322-1-cascardo@igalia.com> <20240912185133.1181322-2-cascardo@igalia.com>
 <CANiDSCsgJXONHX8HJ8a+ou-yLx7sKUVkVR6H2EadH4=A4iHB5w@mail.gmail.com> <ZuQzr2kvp6xCljm/@quatroqueijos.cascardo.eti.br>
In-Reply-To: <ZuQzr2kvp6xCljm/@quatroqueijos.cascardo.eti.br>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 13 Sep 2024 18:01:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCuZgseybtuyke+p622wFP1riNQfGwD7zJKyCewjA0h84w@mail.gmail.com>
Message-ID: <CANiDSCuZgseybtuyke+p622wFP1riNQfGwD7zJKyCewjA0h84w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel-dev@igalia.com, 
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Thadeu

On Fri, 13 Sept 2024 at 14:44, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
>
> On Fri, Sep 13, 2024 at 10:02:33AM +0200, Ricardo Ribalda wrote:
> > Hi Thadeu
> >
> > Take a look at checkpatch
> > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/63550656
> > , and the nit.
> >
> > After that feel free to add my
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> >
>
> Hi, Ricardo.
>
> Thanks a lot for the review. As for the order you pointed below, I totally
> agree. My fist version even had it intentionally like that. Sorry that I
> missed it here.
>
> As for the checkpatch nit, I wonder why it didn't catch this locally.
> Perhaps the CI is using a different version or using some parameters I am
> not familiar with?

You can run the same tests as the CI if you need to:
https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/README.md?ref_type=heads




>
>
> But as for the check itself:
>
> CHECK: spaces preferred around that '*' (ctx:VxV)
> #182: FILE: drivers/media/usb/uvc/uvc_driver.c:921:
> +                                           buffer[3], p + 1, 2*n);
>                                                                ^
>
> There are other uses of 2*n without any spaces around that line. I am happy to
> change that single instance in my patch, but I wonder if I should keep it as is
> to keep consistency, or perhaps send a separate patch fixing all the style
> issues related to that.

I'd rather just change it in the single instance in your patch. But it
is up to Laurent ;)


>
> Thoughs? Preferences?
>
> Thanks.
> Cascardo.
>
> > On Thu, 12 Sept 2024 at 20:52, Thadeu Lima de Souza Cascardo
> > <cascardo@igalia.com> wrote:
> > >
> > > Per UVC 1.1+ specification 3.7.2, units and terminals must have a non-zero
> > > unique ID.
> > >
> > > ```
> > > Each Unit and Terminal within the video function is assigned a unique
> > > identification number, the Unit ID (UID) or Terminal ID (TID), contained in
> > > the bUnitID or bTerminalID field of the descriptor. The value 0x00 is
> > > reserved for undefined ID,
> > > ```
> > >
> > > So, deny allocating an entity with ID 0 or an ID that belongs to a unit
> > > that is already added to the list of entities.
> > >
> > > This also prevents some syzkaller reproducers from triggering warnings due
> > > to a chain of entities referring to themselves. In one particular case, an
> > > Output Unit is connected to an Input Unit, both with the same ID of 1. But
> > > when looking up for the source ID of the Output Unit, that same entity is
> > > found instead of the input entity, which leads to such warnings.
> > >
> > > In another case, a backward chain was considered finished as the source ID
> > > was 0. Later on, that entity was found, but its pads were not valid.
> > >
> > > Here is a sample stack trace for one of those cases.
> > >
> > > [   20.650953] usb 1-1: new high-speed USB device number 2 using dummy_hcd
> > > [   20.830206] usb 1-1: Using ep0 maxpacket: 8
> > > [   20.833501] usb 1-1: config 0 descriptor??
> > > [   21.038518] usb 1-1: string descriptor 0 read error: -71
> > > [   21.038893] usb 1-1: Found UVC 0.00 device <unnamed> (2833:0201)
> > > [   21.039299] uvcvideo 1-1:0.0: Entity type for entity Output 1 was not initialized!
> > > [   21.041583] uvcvideo 1-1:0.0: Entity type for entity Input 1 was not initialized!
> > > [   21.042218] ------------[ cut here ]------------
> > > [   21.042536] WARNING: CPU: 0 PID: 9 at drivers/media/mc/mc-entity.c:1147 media_create_pad_link+0x2c4/0x2e0
> > > [   21.043195] Modules linked in:
> > > [   21.043535] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc7-00030-g3480e43aeccf #444
> > > [   21.044101] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
> > > [   21.044639] Workqueue: usb_hub_wq hub_event
> > > [   21.045100] RIP: 0010:media_create_pad_link+0x2c4/0x2e0
> > > [   21.045508] Code: fe e8 20 01 00 00 b8 f4 ff ff ff 48 83 c4 30 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 0f 0b eb e9 0f 0b eb 0a 0f 0b eb 06 <0f> 0b eb 02 0f 0b b8 ea ff ff ff eb d4 66 2e 0f 1f 84 00 00 00 00
> > > [   21.046801] RSP: 0018:ffffc9000004b318 EFLAGS: 00010246
> > > [   21.047227] RAX: ffff888004e5d458 RBX: 0000000000000000 RCX: ffffffff818fccf1
> > > [   21.047719] RDX: 000000000000007b RSI: 0000000000000000 RDI: ffff888004313290
> > > [   21.048241] RBP: ffff888004313290 R08: 0001ffffffffffff R09: 0000000000000000
> > > [   21.048701] R10: 0000000000000013 R11: 0001888004313290 R12: 0000000000000003
> > > [   21.049138] R13: ffff888004313080 R14: ffff888004313080 R15: 0000000000000000
> > > [   21.049648] FS:  0000000000000000(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
> > > [   21.050271] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   21.050688] CR2: 0000592cc27635b0 CR3: 000000000431c000 CR4: 0000000000750ef0
> > > [   21.051136] PKRU: 55555554
> > > [   21.051331] Call Trace:
> > > [   21.051480]  <TASK>
> > > [   21.051611]  ? __warn+0xc4/0x210
> > > [   21.051861]  ? media_create_pad_link+0x2c4/0x2e0
> > > [   21.052252]  ? report_bug+0x11b/0x1a0
> > > [   21.052540]  ? trace_hardirqs_on+0x31/0x40
> > > [   21.052901]  ? handle_bug+0x3d/0x70
> > > [   21.053197]  ? exc_invalid_op+0x1a/0x50
> > > [   21.053511]  ? asm_exc_invalid_op+0x1a/0x20
> > > [   21.053924]  ? media_create_pad_link+0x91/0x2e0
> > > [   21.054364]  ? media_create_pad_link+0x2c4/0x2e0
> > > [   21.054834]  ? media_create_pad_link+0x91/0x2e0
> > > [   21.055131]  ? _raw_spin_unlock+0x1e/0x40
> > > [   21.055441]  ? __v4l2_device_register_subdev+0x202/0x210
> > > [   21.055837]  uvc_mc_register_entities+0x358/0x400
> > > [   21.056144]  uvc_register_chains+0x1fd/0x290
> > > [   21.056413]  uvc_probe+0x380e/0x3dc0
> > > [   21.056676]  ? __lock_acquire+0x5aa/0x26e0
> > > [   21.056946]  ? find_held_lock+0x33/0xa0
> > > [   21.057196]  ? kernfs_activate+0x70/0x80
> > > [   21.057533]  ? usb_match_dynamic_id+0x1b/0x70
> > > [   21.057811]  ? find_held_lock+0x33/0xa0
> > > [   21.058047]  ? usb_match_dynamic_id+0x55/0x70
> > > [   21.058330]  ? lock_release+0x124/0x260
> > > [   21.058657]  ? usb_match_one_id_intf+0xa2/0x100
> > > [   21.058997]  usb_probe_interface+0x1ba/0x330
> > > [   21.059399]  really_probe+0x1ba/0x4c0
> > > [   21.059662]  __driver_probe_device+0xb2/0x180
> > > [   21.059944]  driver_probe_device+0x5a/0x100
> > > [   21.060170]  __device_attach_driver+0xe9/0x160
> > > [   21.060427]  ? __pfx___device_attach_driver+0x10/0x10
> > > [   21.060872]  bus_for_each_drv+0xa9/0x100
> > > [   21.061312]  __device_attach+0xed/0x190
> > > [   21.061812]  device_initial_probe+0xe/0x20
> > > [   21.062229]  bus_probe_device+0x4d/0xd0
> > > [   21.062590]  device_add+0x308/0x590
> > > [   21.062912]  usb_set_configuration+0x7b6/0xaf0
> > > [   21.063403]  usb_generic_driver_probe+0x36/0x80
> > > [   21.063714]  usb_probe_device+0x7b/0x130
> > > [   21.063936]  really_probe+0x1ba/0x4c0
> > > [   21.064111]  __driver_probe_device+0xb2/0x180
> > > [   21.064577]  driver_probe_device+0x5a/0x100
> > > [   21.065019]  __device_attach_driver+0xe9/0x160
> > > [   21.065403]  ? __pfx___device_attach_driver+0x10/0x10
> > > [   21.065820]  bus_for_each_drv+0xa9/0x100
> > > [   21.066094]  __device_attach+0xed/0x190
> > > [   21.066535]  device_initial_probe+0xe/0x20
> > > [   21.066992]  bus_probe_device+0x4d/0xd0
> > > [   21.067250]  device_add+0x308/0x590
> > > [   21.067501]  usb_new_device+0x347/0x610
> > > [   21.067817]  hub_event+0x156b/0x1e30
> > > [   21.068060]  ? process_scheduled_works+0x48b/0xaf0
> > > [   21.068337]  process_scheduled_works+0x5a3/0xaf0
> > > [   21.068668]  worker_thread+0x3cf/0x560
> > > [   21.068932]  ? kthread+0x109/0x1b0
> > > [   21.069133]  kthread+0x197/0x1b0
> > > [   21.069343]  ? __pfx_worker_thread+0x10/0x10
> > > [   21.069598]  ? __pfx_kthread+0x10/0x10
> > > [   21.069908]  ret_from_fork+0x32/0x40
> > > [   21.070169]  ? __pfx_kthread+0x10/0x10
> > > [   21.070424]  ret_from_fork_asm+0x1a/0x30
> > > [   21.070737]  </TASK>
> > >
> > > Reported-by: syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=0584f746fde3d52b4675
> > > Reported-by: syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
> > > Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
> > > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++++++++------------
> > >  1 file changed, 43 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index f0febdc08c2d..3daa93a29776 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -775,14 +775,27 @@ static const u8 uvc_media_transport_input_guid[16] =
> > >         UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
> > >  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
> > >
> > > -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > > -               unsigned int num_pads, unsigned int extra_size)
> > > +static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > > +                                              u16 id, unsigned int num_pads,
> > > +                                              unsigned int extra_size)
> > >  {
> > >         struct uvc_entity *entity;
> > >         unsigned int num_inputs;
> > >         unsigned int size;
> > >         unsigned int i;
> > >
> >
> > nit: I'd swap the order of the checks, !id is a much simpler check
> > than uvc_entity_by_id().
> >
> > > +       /* Per UVC 1.1+ spec 3.7.2, the ID is unique */
> > > +       if (uvc_entity_by_id(dev, id)) {
> > > +               dev_err(&dev->udev->dev, "Found multiple Units with the same ID.\n");
> > > +               return ERR_PTR(-EINVAL);
> > > +       }
> > > +
> > > +       /* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero */
> > > +       if (id == 0) {
> > > +               dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
> > > +               return ERR_PTR(-EINVAL);
> > > +       }
> > > +
> > >         extra_size = roundup(extra_size, sizeof(*entity->pads));
> > >         if (num_pads)
> > >                 num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> > > @@ -792,7 +805,7 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> > >              + num_inputs;
> > >         entity = kzalloc(size, GFP_KERNEL);
> > >         if (entity == NULL)
> > > -               return NULL;
> > > +               return ERR_PTR(-ENOMEM);
> > >
> > >         entity->id = id;
> > >         entity->type = type;
> > > @@ -904,10 +917,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
> > >                         break;
> > >                 }
> > >
> > > -               unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
> > > -                                       p + 1, 2*n);
> > > -               if (unit == NULL)
> > > -                       return -ENOMEM;
> > > +               unit = uvc_alloc_new_entity(dev, UVC_VC_EXTENSION_UNIT,
> > > +                                           buffer[3], p + 1, 2*n);
> > > +               if (IS_ERR(unit))
> > > +                       return PTR_ERR(unit);
> > >
> > >                 memcpy(unit->guid, &buffer[4], 16);
> > >                 unit->extension.bNumControls = buffer[20];
> > > @@ -1016,10 +1029,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >                         return -EINVAL;
> > >                 }
> > >
> > > -               term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
> > > -                                       1, n + p);
> > > -               if (term == NULL)
> > > -                       return -ENOMEM;
> > > +               term = uvc_alloc_new_entity(dev, type | UVC_TERM_INPUT,
> > > +                                           buffer[3], 1, n + p);
> > > +               if (IS_ERR(term))
> > > +                       return PTR_ERR(term);
> > >
> > >                 if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA) {
> > >                         term->camera.bControlSize = n;
> > > @@ -1075,10 +1088,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >                         return 0;
> > >                 }
> > >
> > > -               term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
> > > -                                       1, 0);
> > > -               if (term == NULL)
> > > -                       return -ENOMEM;
> > > +               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > > +                                           buffer[3], 1, 0);
> > > +               if (IS_ERR(term))
> > > +                       return PTR_ERR(term);
> > >
> > >                 memcpy(term->baSourceID, &buffer[7], 1);
> > >
> > > @@ -1097,9 +1110,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >                         return -EINVAL;
> > >                 }
> > >
> > > -               unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
> > > -               if (unit == NULL)
> > > -                       return -ENOMEM;
> > > +               unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> > > +                                           p + 1, 0);
> > > +               if (IS_ERR(unit))
> > > +                       return PTR_ERR(unit);
> > >
> > >                 memcpy(unit->baSourceID, &buffer[5], p);
> > >
> > > @@ -1119,9 +1133,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >                         return -EINVAL;
> > >                 }
> > >
> > > -               unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
> > > -               if (unit == NULL)
> > > -                       return -ENOMEM;
> > > +               unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3], 2, n);
> > > +               if (IS_ERR(unit))
> > > +                       return PTR_ERR(unit);
> > >
> > >                 memcpy(unit->baSourceID, &buffer[4], 1);
> > >                 unit->processing.wMaxMultiplier =
> > > @@ -1148,9 +1162,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >                         return -EINVAL;
> > >                 }
> > >
> > > -               unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
> > > -               if (unit == NULL)
> > > -                       return -ENOMEM;
> > > +               unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> > > +                                           p + 1, n);
> > > +               if (IS_ERR(unit))
> > > +                       return PTR_ERR(unit);
> > >
> > >                 memcpy(unit->guid, &buffer[4], 16);
> > >                 unit->extension.bNumControls = buffer[20];
> > > @@ -1290,9 +1305,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
> > >                 return dev_err_probe(&dev->udev->dev, irq,
> > >                                      "No IRQ for privacy GPIO\n");
> > >
> > > -       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > -       if (!unit)
> > > -               return -ENOMEM;
> > > +       unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> > > +                                   UVC_EXT_GPIO_UNIT_ID, 0, 1);
> > > +       if (IS_ERR(unit))
> > > +               return PTR_ERR(unit);
> > >
> > >         unit->gpio.gpio_privacy = gpio_privacy;
> > >         unit->gpio.irq = irq;
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda

