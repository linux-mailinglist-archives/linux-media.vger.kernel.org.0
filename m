Return-Path: <linux-media+bounces-67382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dX5mNew6U2phZAMAu9opvQ
	(envelope-from <linux-media+bounces-67382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 08:57:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA174403C
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 08:57:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cmmzjy1i;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67382-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67382-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF2A43019806
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 06:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E116A371D01;
	Sun, 12 Jul 2026 06:57:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255C294A10;
	Sun, 12 Jul 2026 06:57:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783839454; cv=none; b=GAZqmiXS4dlX6AnkdwW2Gqbhx9yH4PEulSxQ7i9HlZI4v3h87jidYxrJOA/nISy6JlfzPd0rSl5BHp3QBwomk3B1CaqKOx1Wqh88Aivb54BYCBRQP8B9rz3mGE5QKMpeTy/5u3z2lVv6ZQXx43PbcyneLk/yQ3IyB4VM5Skd+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783839454; c=relaxed/simple;
	bh=GFCaSLNSScJ//dqUu5o6p0CRO08qcLaUShxnD3R10B0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=na1ZoW6lQb1Ckk1y2F/mT/IyCoR3WyIVFwGkmQskLUOx0r7GZ+o9XVqBqvbvkYHhyJAHdxYfp075lGMsWiNn3ToW9aqJyYy4nmbFPBoko6eP4vaPqNWC3h1OJDvF4nc25x7rXEuImZOu+LmmwnsB0bwKDDDWAkMmE+oR1MF7EVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cmmzjy1i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A971F000E9;
	Sun, 12 Jul 2026 06:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783839452;
	bh=dhGMExQh/HFe4nbc+VaK65uaA31w2opwa772L1FXRug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Cmmzjy1imjUZSXazjeITiREOS1Ct4RLUyEpNlVVWTWFb5gt4FmiP8hqhGa7KwOnPO
	 hpiTxyEXGgrHl6cCP3fdofs9hHGBv2n3S+1F3Z0wiYnisV/ZvtSRp9IVK0gz3h8Ukf
	 UkQ8rtPxWgGBfqm9Wf+ktwNkT62SQa2VjlUkBMC3N5CRqXZYghQOtFSu0ulbtB47to
	 WjFe8D7GdPE+LC9B0qQo/g0K66P9YQHuNSzFI+rCU+SBrXhLzUbGWjhsZoyQcn0t3k
	 stmoUscLzqYPNdmMU5w/mscNMLzBA7j4j/ray+XI7QLb4io4fQkBefrwNk1urj0lo0
	 VsktRzSnIMUTQ==
Date: Sun, 12 Jul 2026 08:57:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Brian Daniels <briandaniels@google.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, acourbot@google.com, adelva@google.com,
 aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com,
 eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com,
 hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
 virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
Message-ID: <20260712085726.19198fda@foz.lan>
In-Reply-To: <20260625201850.2981130-1-briandaniels@google.com>
References: <20260622171017-mutt-send-email-mst@kernel.org>
	<20260625201850.2981130-1-briandaniels@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mst@redhat.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67382-lists,linux-media=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,google.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33DA174403C

On Thu, 25 Jun 2026 16:18:48 -0400
Brian Daniels <briandaniels@google.com> wrote:

> > > From: Alexandre Courbot <gnurou@gmail.com>
> > > 
> > > virtio_media_driver.c provides the expected driver hooks, and support
> > > for mmapping and polling.
> > > 
> > > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > > ---
> > >  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++++++++
> > >  1 file changed, 959 insertions(+)
> > >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > > 
> > > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/virtio/virtio_media_driver.c
> > > new file mode 100644
> > > index 000000000..d6363c673
> > > --- /dev/null
> > > +++ b/drivers/media/virtio/virtio_media_driver.c
> > > @@ -0,0 +1,959 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > > +
> > > +/*
> > > + * Virtio-media driver.
> > > + *
> > > + * Copyright (c) 2024-2025 Google LLC.
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/scatterlist.h>
> > > +#include <linux/types.h>
> > > +#include <linux/videodev2.h>
> > > +#include <linux/vmalloc.h>
> > > +#include <linux/wait.h>
> > > +#include <linux/workqueue.h>
> > > +#include <linux/module.h>
> > > +#include <linux/moduleparam.h>
> > > +#include <linux/virtio.h>
> > > +#include <linux/virtio_config.h>
> > > +#include <linux/virtio_ids.h>
> > > +
> > > +#include <media/frame_vector.h>
> > > +#include <media/v4l2-dev.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/videobuf2-memops.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +
> > > +#include "protocol.h"
> > > +#include "session.h"
> > > +#include "virtio_media.h"
> > > +
> > > +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> > > +
> > > +/* ID of the SHM region into which MMAP buffer will be mapped. */
> > > +#define VIRTIO_MEDIA_SHM_MMAP 0
> > > +
> > > +/*
> > > + * Name of the driver to expose to user-space.
> > > + *
> > > + * This is configurable because v4l2-compliance has workarounds specific to
> > > + * some drivers. When proxying these directly from the host, this allows it to
> > > + * apply them as needed.
> > > + */
> > > +char *virtio_media_driver_name;
> > > +module_param_named(driver_name, virtio_media_driver_name, charp, 0660);  
> > 
> > 
> > Um. What? Not how it should be handled.  
> 
> I can remove this module param. I didn't end up using this when compliance testing.
> Instead, I patched v4l-utils:
> https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@google.com/
> 
> Let me know if you think the v4l-utils patch is a good approach, otherwise let
> me know how you'd prefer to address the v4l2-compliance driver-specific workounds
> when they're being proxied with virtio-media.

This kind of discussion should happen on a separate PR for v4l2-compliance,
c/c to the proper developers and maintainers of it.

> 
> > > +
> > > +/*
> > > + * Whether USERPTR buffers are allowed.
> > > + *
> > > + * This is disabled by default as USERPTR buffers are dangerous, but the option
> > > + * is left to enable them if desired.
> > > + */
> > > +bool virtio_media_allow_userptr;
> > > +module_param_named(allow_userptr, virtio_media_allow_userptr, bool, 0660);  
> > 
> > 
> > is this kind of thing common?  

There is one old media device that has it (saa7134).

> 
> To be honest, I don't really know. I'm also not that familiar with the USERPTR
> issues. I see a few references online about their use being discouraged due to
> possible race conditions, perhaps that was the original motivation for this
> parameter (I'm not the original author of this driver).
> 
> I'm open to alternatives, feel free to let me know if you have a preference.

We tend to not implement USERPTR on newer drivers. I suggest you
to place the logic with regards to V4L2_MEMORY_USERPTR on a separate
patch for further discussions.

> 
> > > +
> > > +/**
> > > + * virtio_media_session_alloc - Allocate a new session.
> > > + * @vv: virtio-media device the session belongs to.
> > > + * @id: ID of the session.
> > > + * @nonblocking_dequeue: whether dequeuing of buffers should be blocking or
> > > + * not.
> > > + *
> > > + * The ``id`` and ``list`` fields must still be set by the caller.  
> > 
> > still in what sense?  
> 
> Based on the code below, I'm not so sure that the caller is responsible for
> setting these values. They seem to be initialized in the function.
> 
> Perhaps Alexandre Courbot (the original author) would know more. Unless he
> says otherwise though I'm inclined to remove this comment.
> 
> > > + */
> > > +static struct virtio_media_session *
> > > +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> > > +			   struct file *file)
> > > +{
> > > +	struct virtio_media_session *session;
> > > +	int i;
> > > +	int ret;
> > > +
> > > +	session = kzalloc_obj(*session, GFP_KERNEL);
> > > +	if (!session)
> > > +		goto err_session;
> > > +
> > > +	session->shadow_buf = kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNEL);
> > > +	if (!session->shadow_buf)
> > > +		goto err_shadow_buf;
> > > +
> > > +	ret = sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> > > +			     GFP_KERNEL);
> > > +	if (ret)
> > > +		goto err_payload_sgs;
> > > +
> > > +	session->id = id;
> > > +	session->nonblocking_dequeue = file->f_flags & O_NONBLOCK;
> > > +
> > > +	INIT_LIST_HEAD(&session->list);
> > > +	v4l2_fh_init(&session->fh, &vv->video_dev);
> > > +	virtio_media_session_fh_add(session, file);
> > > +
> > > +	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> > > +		INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> > > +	mutex_init(&session->queues_lock);
> > > +
> > > +	init_waitqueue_head(&session->dqbuf_wait);
> > > +
> > > +	mutex_lock(&vv->sessions_lock);
> > > +	list_add_tail(&session->list, &vv->sessions);
> > > +	mutex_unlock(&vv->sessions_lock);
> > > +
> > > +	return session;
> > > +
> > > +err_payload_sgs:
> > > +	kfree(session->shadow_buf);
> > > +err_shadow_buf:
> > > +	kfree(session);
> > > +err_session:
> > > +	return ERR_PTR(-ENOMEM);
> > > +}
> > > +
> > > +/**
> > > + * virtio_media_session_free - Free all resources of a session.
> > > + * @vv: virtio-media device the session belongs to.
> > > + * @session: session to destroy.
> > > + *
> > > + * All the resources of @sesssion, as well as the backing memory of @session
> > > + * itself, are freed.  
> > 
> > why @ here and `` above? And typo in the name.  
> 
> The `@` here was an attempt to follow the guide here for referencing function
> parameters:
> https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cross-references

Yes. This is part of Linux Kernel kernel-doc markup: when referring to
struct fields, you should use @field (or ``field`` if one wants to place an
asterisk on it, like ``*field``).

> 
> That being said, I don't believe this file is 100% consistent with that. I will
> spend some time cleaning up the comments throughout this patch set to get them
> consistent for v5. Thanks!

Please use it on a consistent way along the driver.


Thanks,
Mauro

