Return-Path: <linux-media+bounces-65664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SYFKEGNPWoO4AgAu9opvQ
	(envelope-from <linux-media+bounces-65664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:19:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D96776C87A0
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=SX+FlhPS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65664-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65664-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F25C53067093
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 20:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8605A36606B;
	Thu, 25 Jun 2026 20:19:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3B331222
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 20:18:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782418742; cv=none; b=Tz1vIejX2gVWf5P2wKJSjOSa1TuaexynRN10v3MpwuTFUXxyOjN1KCm97wXui26WGBrnnbkGMS4UxTvipHCZnhkHDj3LfZUK4tmdGy2nRUu8rqIgUGiPKmQQv+i56hgE03FL2zY4Oyoly4XPELlYV1w7kGaPKf4lrqtKRTae71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782418742; c=relaxed/simple;
	bh=bJuLSlk9knMqZiFXiB6Kze4GoHFaJyzCWvYSaewoWBk=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=XPig+3eW5lEOHF2flNgaYOY87iwg4Q62lqy0XKWjJKnzYVCCjsueXs9lPxEXAZzq6q/Yxt+/XNK431rLk+P3vbFmW2PpSjyDUtSXrnaCWux77DOd0PhRcznvB1jaIA9XBkqFsfiZU+MYAWiRTCveyCbBNwQEX5xLvxy7/TgzyMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SX+FlhPS; arc=none smtp.client-ip=209.85.128.201
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-7ff58c89959so7258277b3.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782418738; x=1783023538; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWYiqST72L2rmGlhRaPOJ0y9NGANGEzpjFd9rrvOvoE=;
        b=SX+FlhPSoKJTy8T/Go4LgA9hCaVGmFFV/ckFmUFotxu7yyjSPSTouaFspoY/NwPgbL
         WMQj12k/iZsIrnRxcrcN1lLnGalIC461e2MIShZQiSy9Kj9FrFcsfkjrwgxihLFovtK0
         xOIWhJ37wgMAzuu+KZO7Cjpx19GSTY/H/ksbC8Cow2S3u6GlH0GYMujkT/A9Xdadjpsq
         HDwIYA3Kj1ygH6+o6gIp3XX9xw/X5BWp0BfP+dmYpjlaUAQunZT/yCigMjjOcXDt7v+2
         rf/afrW/lQck9yu/j5ThFViHM1YM9KTeyXFEHLqUQF0NuA0CU/PRAKrrIpifV1l/4lx9
         dAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782418738; x=1783023538;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWYiqST72L2rmGlhRaPOJ0y9NGANGEzpjFd9rrvOvoE=;
        b=tJr7j0vMBZn9iNqX6jZPRVM5FGzyV/XMBCNZ+iLQ3dv/9QAfSlLct/RxQM2j/qcXY9
         NElKJJYzjvrxVldyYzsFbI/CHbaQHfNQsoz8+ra0VaJ+F/WZidmJhXrRLaut/Bj+sKrO
         6r4oSr8ZiLPtEnAbaqsgfw3JQ459DPjKtXTEJ+ayRradUn7J4FNjRqV67kiB3w0+1IFg
         U7nTQ9j8uGM5+7+Vj0Ku5d492wCnuh1GvXjF4VH3h+iNWfzPry8SMsKx754I7UJ1x5gX
         80iP9keLUuSZIVKxA/xlDKbpsuKMfgkvDUkT8nflDg6p1A9qz8wiOueV2AYr+a+RS7/o
         63VA==
X-Forwarded-Encrypted: i=1; AHgh+RrPj2VW9rvTKobZuZclYnH1RtPguwO9jjpDDcT4DHHpr1Xy4KrLfO4MJ5xJudcl4E2ollHgPJQ+QFUnSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLvzdHtX3yQ2hbjFyEfJ0F4b3CYWqPRiMJz9sXH4V0FXVn7jd
	JoCiiyYHY32eq3YJ/Zvd+A0bAaUP8fcnE4rWTzcUceJV3dHq7Lz1MLzytp34Fddm5R2AI5HvF6k
	6kUjp/YsT5jm2b7L+srvb6Ws/SAzg
X-Received: from ywcw12.prod.google.com ([2002:a05:690c:c36c:b0:80a:9749:d2cf])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690c:c4ea:b0:7dc:313d:afec with SMTP id 00721157ae682-80a695c4831mr42868797b3.22.1782418737544;
 Thu, 25 Jun 2026 13:18:57 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:18:48 -0400
In-Reply-To: <20260622171017-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625201850.2981130-1-briandaniels@google.com>
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
From: Brian Daniels <briandaniels@google.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Brian Daniels <briandaniels@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com, 
	adelva@google.com, aesteve@redhat.com, changyeon@google.com, 
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com, 
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mst@redhat.com,m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65664-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D96776C87A0

> > From: Alexandre Courbot <gnurou@gmail.com>
> > 
> > virtio_media_driver.c provides the expected driver hooks, and support
> > for mmapping and polling.
> > 
> > Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> > Co-developed-by: Brian Daniels <briandaniels@google.com>
> > Signed-off-by: Brian Daniels <briandaniels@google.com>
> > ---
> >  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++++++++
> >  1 file changed, 959 insertions(+)
> >  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> > 
> > diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/virtio/virtio_media_driver.c
> > new file mode 100644
> > index 000000000..d6363c673
> > --- /dev/null
> > +++ b/drivers/media/virtio/virtio_media_driver.c
> > @@ -0,0 +1,959 @@
> > +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> > +
> > +/*
> > + * Virtio-media driver.
> > + *
> > + * Copyright (c) 2024-2025 Google LLC.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/mm.h>
> > +#include <linux/mutex.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/types.h>
> > +#include <linux/videodev2.h>
> > +#include <linux/vmalloc.h>
> > +#include <linux/wait.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/virtio.h>
> > +#include <linux/virtio_config.h>
> > +#include <linux/virtio_ids.h>
> > +
> > +#include <media/frame_vector.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/videobuf2-memops.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-ioctl.h>
> > +
> > +#include "protocol.h"
> > +#include "session.h"
> > +#include "virtio_media.h"
> > +
> > +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> > +
> > +/* ID of the SHM region into which MMAP buffer will be mapped. */
> > +#define VIRTIO_MEDIA_SHM_MMAP 0
> > +
> > +/*
> > + * Name of the driver to expose to user-space.
> > + *
> > + * This is configurable because v4l2-compliance has workarounds specific to
> > + * some drivers. When proxying these directly from the host, this allows it to
> > + * apply them as needed.
> > + */
> > +char *virtio_media_driver_name;
> > +module_param_named(driver_name, virtio_media_driver_name, charp, 0660);
> 
> 
> Um. What? Not how it should be handled.

I can remove this module param. I didn't end up using this when compliance testing.
Instead, I patched v4l-utils:
https://lore.kernel.org/all/20260528163448.4031965-1-briandaniels@google.com/

Let me know if you think the v4l-utils patch is a good approach, otherwise let
me know how you'd prefer to address the v4l2-compliance driver-specific workounds
when they're being proxied with virtio-media.

> > +
> > +/*
> > + * Whether USERPTR buffers are allowed.
> > + *
> > + * This is disabled by default as USERPTR buffers are dangerous, but the option
> > + * is left to enable them if desired.
> > + */
> > +bool virtio_media_allow_userptr;
> > +module_param_named(allow_userptr, virtio_media_allow_userptr, bool, 0660);
> 
> 
> is this kind of thing common?

To be honest, I don't really know. I'm also not that familiar with the USERPTR
issues. I see a few references online about their use being discouraged due to
possible race conditions, perhaps that was the original motivation for this
parameter (I'm not the original author of this driver).

I'm open to alternatives, feel free to let me know if you have a preference.

> > +
> > +/**
> > + * virtio_media_session_alloc - Allocate a new session.
> > + * @vv: virtio-media device the session belongs to.
> > + * @id: ID of the session.
> > + * @nonblocking_dequeue: whether dequeuing of buffers should be blocking or
> > + * not.
> > + *
> > + * The ``id`` and ``list`` fields must still be set by the caller.
> 
> still in what sense?

Based on the code below, I'm not so sure that the caller is responsible for
setting these values. They seem to be initialized in the function.

Perhaps Alexandre Courbot (the original author) would know more. Unless he
says otherwise though I'm inclined to remove this comment.

> > + */
> > +static struct virtio_media_session *
> > +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> > +			   struct file *file)
> > +{
> > +	struct virtio_media_session *session;
> > +	int i;
> > +	int ret;
> > +
> > +	session = kzalloc_obj(*session, GFP_KERNEL);
> > +	if (!session)
> > +		goto err_session;
> > +
> > +	session->shadow_buf = kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNEL);
> > +	if (!session->shadow_buf)
> > +		goto err_shadow_buf;
> > +
> > +	ret = sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> > +			     GFP_KERNEL);
> > +	if (ret)
> > +		goto err_payload_sgs;
> > +
> > +	session->id = id;
> > +	session->nonblocking_dequeue = file->f_flags & O_NONBLOCK;
> > +
> > +	INIT_LIST_HEAD(&session->list);
> > +	v4l2_fh_init(&session->fh, &vv->video_dev);
> > +	virtio_media_session_fh_add(session, file);
> > +
> > +	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> > +		INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> > +	mutex_init(&session->queues_lock);
> > +
> > +	init_waitqueue_head(&session->dqbuf_wait);
> > +
> > +	mutex_lock(&vv->sessions_lock);
> > +	list_add_tail(&session->list, &vv->sessions);
> > +	mutex_unlock(&vv->sessions_lock);
> > +
> > +	return session;
> > +
> > +err_payload_sgs:
> > +	kfree(session->shadow_buf);
> > +err_shadow_buf:
> > +	kfree(session);
> > +err_session:
> > +	return ERR_PTR(-ENOMEM);
> > +}
> > +
> > +/**
> > + * virtio_media_session_free - Free all resources of a session.
> > + * @vv: virtio-media device the session belongs to.
> > + * @session: session to destroy.
> > + *
> > + * All the resources of @sesssion, as well as the backing memory of @session
> > + * itself, are freed.
> 
> why @ here and `` above? And typo in the name.

The `@` here was an attempt to follow the guide here for referencing function
parameters:
https://docs.kernel.org/doc-guide/kernel-doc.html#highlights-and-cross-references

That being said, I don't believe this file is 100% consistent with that. I will
spend some time cleaning up the comments throughout this patch set to get them
consistent for v5. Thanks!

> > + */
> > +static void virtio_media_session_free(struct virtio_media *vv,
> > +				      struct virtio_media_session *session)
> > +{
> > +	int i;
> > +
> > +	mutex_lock(&vv->sessions_lock);
> > +	list_del(&session->list);
> > +	mutex_unlock(&vv->sessions_lock);
> > +
> > +	virtio_media_session_fh_del(session);
> > +	v4l2_fh_exit(&session->fh);
> > +
> > +	sg_free_table(&session->command_sgs);
> > +
> > +	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> > +		vfree(session->queues[i].buffers);
> > +
> > +	kfree(session->shadow_buf);
> > +	kfree(session);
> > +}
> > +
> > +/**
> > + * virtio_media_session_close - Close and free a session.
> > + * @vv: virtio-media device the session belongs to.
> > + * @session: session to close and destroy.
> > + *
> > + * This send the ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and frees
> 
> sends

Fix staged in v5

> > + * all resources used by @session.
> > + */
> > +static int virtio_media_session_close(struct virtio_media *vv,
> > +				      struct virtio_media_session *session)
> > +{
> > +	struct virtio_media_cmd_close *cmd_close = &session->cmd.close;
> > +	struct scatterlist cmd_sg = {};
> > +	struct scatterlist *sgs[1] = { &cmd_sg };
> > +	int ret;
> > +
> > +	mutex_lock(&vv->vlock);
> > +
> > +	cmd_close->hdr.cmd = VIRTIO_MEDIA_CMD_CLOSE;
> > +	cmd_close->session_id = session->id;
> > +
> > +	sg_set_buf(&cmd_sg, cmd_close, sizeof(*cmd_close));
> > +	sg_mark_end(&cmd_sg);
> > +
> > +	ret = virtio_media_send_command(vv, sgs, 1, 0, 0, NULL);
> > +	mutex_unlock(&vv->vlock);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	virtio_media_session_free(vv, session);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * virtio_media_find_session - Lookup for the session with a given ID.
> 
> a session

Fix staged in v5

> > + * @vv: virtio-media device to lookup the session from.
> > + * @id: ID of the session to lookup.
> > + */
> > +static struct virtio_media_session *
> > +virtio_media_find_session(struct virtio_media *vv, u32 id)
> > +{
> > +	struct list_head *p;
> > +	struct virtio_media_session *session = NULL;
> > +
> > +	mutex_lock(&vv->sessions_lock);
> > +	list_for_each(p, &vv->sessions) {
> > +		struct virtio_media_session *s =
> > +			list_entry(p, struct virtio_media_session, list);
> > +		if (s->id == id) {
> > +			session = s;
> > +			break;
> > +		}
> > +	}
> > +	mutex_unlock(&vv->sessions_lock);
> > +
> > +	return session;
> > +}
> > +
> > +/**
> > + * struct virtio_media_cmd_callback_param - Callback parameters to the virtio
> > + *                                          command queue.
> > + * @vv: virtio-media device in use.
> > + * @done: flag to be switched once the command is completed.
> > + * @resp_len: length of the received response from the command. Only valid
> > + * after @done_flag has switched to ``true``.
> 
> confusing indent

Fix staged in v5

> > + */
> > +struct virtio_media_cmd_callback_param {
> > +	struct virtio_media *vv;
> > +	bool done;
> > +	size_t resp_len;
> > +};
> > +
> > +/**
> > + * commandq_callback: Callback for the command queue.
> > + * @queue: command virtqueue.
> > + *
> > + * This just wakes up the thread that was waiting on the command to complete.
> > + */
> > +static void commandq_callback(struct virtqueue *queue)
> > +{
> > +	unsigned int len;
> > +	struct virtio_media_cmd_callback_param *param;
> > +
> > +process_bufs:
> > +	while ((param = virtqueue_get_buf(queue, &len))) {
> > +		param->done = true;
> > +		param->resp_len = len;
> > +		wake_up(&param->vv->wq);
> > +	}
> > +
> > +	if (!virtqueue_enable_cb(queue)) {
> > +		virtqueue_disable_cb(queue);
> > +		goto process_bufs;
> > +	}
> > +}
> > +
> > +/**
> > + * virtio_media_kick_command - send a command to the commandq.
> > + * @vv: virtio-media device in use.
> > + * @sgs: descriptor chain to send.
> > + * @out_sgs: number of device-readable descriptors in @sgs.
> > + * @in_sgs: number of device-writable descriptors in @sgs.
> > + * @resp_len: output parameter. Upon success, contains the size of the response
> > + * in bytes.
> 
> confusing indent
> 
> > + *
> 
> why an empty line?

Indent fixed and empty line removed in v5

> > + */
> > +static int virtio_media_kick_command(struct virtio_media *vv,
> > +				     struct scatterlist **sgs,
> > +				     const size_t out_sgs, const size_t in_sgs,
> > +				     size_t *resp_len)
> > +{
> > +	struct virtio_media_cmd_callback_param cb_param = {
> > +		.vv = vv,
> > +		.done = false,
> > +		.resp_len = 0,
> > +	};
> > +	struct virtio_media_resp_header *resp_header;
> > +	int ret;
> > +
> > +	ret = virtqueue_add_sgs(vv->commandq, sgs, out_sgs, in_sgs, &cb_param,
> > +				GFP_ATOMIC);
> 
> 
> can init with declaration.

Thanks, added to v5

> > +	if (ret) {
> > +		v4l2_err(&vv->v4l2_dev,
> > +			 "failed to add sgs to command virtqueue\n");
> > +		return ret;
> > +	}
> > +
> > +	if (!virtqueue_kick(vv->commandq)) {
> > +		v4l2_err(&vv->v4l2_dev, "failed to kick command virtqueue\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Wait for the response. */
> > +	ret = wait_event_timeout(vv->wq, cb_param.done, 5 * HZ);
> > +	if (ret == 0) {
> > +		v4l2_err(&vv->v4l2_dev,
> > +			 "timed out waiting for response to command\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	if (resp_len)
> > +		*resp_len = cb_param.resp_len;
> > +
> > +	if (in_sgs > 0) {
> > +		/*
> > +		 * If we expect a response, make sure we have at least a
> > +		 * response header - anything shorter is invalid.
> > +		 */
> > +		if (cb_param.resp_len < sizeof(*resp_header)) {
> > +			v4l2_err(&vv->v4l2_dev,
> > +				 "received response header is too short\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		resp_header = sg_virt(sgs[out_sgs]);
> > +		if (resp_header->status)
> > +			/* Host returns a positive error code. */
> > +			return -resp_header->status;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * virtio_media_send_command - Send a command to the device and wait for its
> > + * response.
> > + * @vv: virtio-media device in use.
> > + * @sgs: descriptor chain to send.
> > + * @out_sgs: number of device-readable descriptors in @sgs.
> > + * @in_sgs: number of device-writable descriptors in @sgs.
> > + * @minimum_resp_len: minimum length of the response expected by the caller
> > + * when the command is successful. Anything shorter than that will result in
> > + * ``-EINVAL`` being returned.
> > + * @resp_len: output parameter. Upon success, contains the size of the response
> > + * in bytes.
> > + */
> > +int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
> > +			      const size_t out_sgs, const size_t in_sgs,
> > +			      size_t minimum_resp_len, size_t *resp_len)
> > +{
> > +	size_t local_resp_len = resp_len ? *resp_len : 0;
> > +	int ret = virtio_media_kick_command(vv, sgs, out_sgs, in_sgs,
> > +					    &local_resp_len);
> > +	if (resp_len)
> > +		*resp_len = local_resp_len;
> > +
> > +	/*
> > +	 * If the host could not process the command, there is no valid
> > +	 * response.
> > +	 */
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Make sure the host wrote a complete reply. */
> > +	if (local_resp_len < minimum_resp_len) {
> > +		v4l2_err(&vv->v4l2_dev,
> > +			 "received response is too short: received %zu, expected at least %zu\n",
> > +			 local_resp_len, minimum_resp_len);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * virtio_media_send_event_buffer() - Sends an event buffer to the host so it
> > + * can return it with an event.
> > + * @vv: virtio-media device in use.
> > + * @event_buffer: pointer to the event buffer to send to the device.
> > + */
> > +static int virtio_media_send_event_buffer(struct virtio_media *vv,
> > +					  void *event_buffer)
> > +{
> > +	struct scatterlist *sgs[1], vresp;
> > +	int ret;
> > +
> > +	sg_init_one(&vresp, event_buffer, VIRTIO_MEDIA_EVENT_MAX_SIZE);
> > +	sgs[0] = &vresp;
> 
> what is this convoluted thing? why not pass &vresp directly?

`virtqueue_add_sgs` expects a `struct scatterlist **`. Passing `&vresp` is
only a single pointer and it needs a double pointer.

It could be written as:

  struct scatterlist *sgs, vresp;

  sg_init_one(&vresp, event_buffer, VIRTIO_MEDIA_EVENT_MAX_SIZE);
  sgs = &vresp;
  ret = virtqueue_add_sgs(vv->eventq, &sgs, 0, 1, event_buffer,

But I suspect it's written as is to match `virtqueue_add_sgs`'s function
declaration:

  int virtqueue_add_sgs(struct virtqueue *vq,
                        struct scatterlist *sgs[],
                        unsigned int out_sgs,
                        unsigned int in_sgs,
                        void *data,
                        gfp_t gfp);

> > +
> > +	ret = virtqueue_add_sgs(vv->eventq, sgs, 0, 1, event_buffer,
> > +				GFP_ATOMIC);
> 
> 
> This does not work uness event_buffer is aligned for dma.
> But it does not seem to be:
> 
>      for (i = 0; i < VIRTIO_MEDIA_NUM_EVENT_BUFS; i++) {
>             void *ebuf = vv->event_buffer + VIRTIO_MEDIA_EVENT_MAX_SIZE * i;
> 
>              ret = virtio_media_send_event_buffer(vv, ebuf);
>              if (ret)
>                      goto err_send_event_buffer;

Apologies if the following questions are bit basic, I'm  still pretty new to
this.

Is the dma alignment requirement a general requirement for calling the
`virtqueue_add_sgs` function? Or is the dma alignment requirement to allow the
driver to support DMABUF transfers? If its the later, I should note this driver
does not support DMABUF transfers yet when streaming frames.

If it's the former, then how would I go about ensuring its dma aligned?

From the code block you quoted above, `vv->event_buffer` is allocated like so:

  vv->event_buffer = devm_kzalloc(dev,
          VIRTIO_MEDIA_EVENT_MAX_SIZE *
          VIRTIO_MEDIA_NUM_EVENT_BUFS,
          GFP_KERNEL);
  if (!vv->event_buffer)
    return -ENOMEM;

Do I need to call something else besides `devm_kzalloc()` to ensure every
element within the vv->event_buffer array is dma aligned?

> 
> 
> > +	if (ret) {
> > +		v4l2_err(&vv->v4l2_dev,
> > +			 "failed to add sgs to event virtqueue\n");
> > +		return ret;
> > +	}
> > +
> > +	if (!virtqueue_kick(vv->eventq)) {
> > +		v4l2_err(&vv->v4l2_dev, "failed to kick event virtqueue\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * eventq_callback() - Callback for the event queue.
> > + * @queue: event virtqueue.
> > + *
> > + * This just schedules for event work to be run.
> > + */
> > +static void eventq_callback(struct virtqueue *queue)
> > +{
> > +	struct virtio_media *vv = queue->vdev->priv;
> > +
> > +	schedule_work(&vv->eventq_work);
> > +}
> > +
> > +/**
> > + * virtio_media_process_dqbuf_event() - Process a dequeued event for a session.
> > + * @vv: virtio-media device in use.
> > + * @session: session the event is addressed to.
> > + * @dqbuf_evt: the dequeued event to process.
> > + *
> > + * Invalid events are ignored with an error log.
> > + */
> > +static void
> > +virtio_media_process_dqbuf_event(struct virtio_media *vv,
> > +				 struct virtio_media_session *session,
> > +				 struct virtio_media_event_dqbuf *dqbuf_evt)
> > +{
> > +	struct virtio_media_buffer *dqbuf;
> > +	const enum v4l2_buf_type queue_type = dqbuf_evt->buffer.type;
> > +	struct virtio_media_queue_state *queue;
> > +	typeof(dqbuf->buffer.m) buffer_m;
> > +	typeof(dqbuf->buffer.m.planes[0].m) plane_m;
> > +	int i;
> > +
> > +	if (queue_type >= ARRAY_SIZE(session->queues)) {
> > +		v4l2_err(&vv->v4l2_dev,
> > +			 "unmanaged queue %d passed to dqbuf event",
> > +			 dqbuf_evt->buffer.type);
> > +		return;
> > +	}
> > +	queue = &session->queues[queue_type];
> > +
> > +	if (dqbuf_evt->buffer.index >= queue->allocated_bufs) {
> > +		v4l2_err(&vv->v4l2_dev,
> > +			 "invalid buffer ID %d for queue %d in dqbuf event",
> > +			 dqbuf_evt->buffer.index, dqbuf_evt->buffer.type);
> > +		return;
> > +	}
> > +
> > +	dqbuf = &queue->buffers[dqbuf_evt->buffer.index];
> > +
> > +	/*
> > +	 * Preserve the 'm' union that was passed to us during QBUF so userspace
> > +	 * gets back the information it submitted.
> > +	 */
> > +	buffer_m = dqbuf->buffer.m;
> > +	memcpy(&dqbuf->buffer, &dqbuf_evt->buffer, sizeof(dqbuf->buffer));
> > +	dqbuf->buffer.m = buffer_m;
> > +	if (V4L2_TYPE_IS_MULTIPLANAR(dqbuf->buffer.type)) {
> > +		if (dqbuf->buffer.length > VIDEO_MAX_PLANES) {
> > +			v4l2_err(&vv->v4l2_dev,
> > +				 "invalid number of planes received from host for a multiplanar buffer\n");
> > +			return;
> > +		}
> > +		for (i = 0; i < dqbuf->buffer.length; i++) {
> > +			plane_m = dqbuf->planes[i].m;
> > +			memcpy(&dqbuf->planes[i], &dqbuf_evt->planes[i],
> > +			       sizeof(struct v4l2_plane));
> > +			dqbuf->planes[i].m = plane_m;
> > +		}
> > +	}
> > +
> > +	/* Set the DONE flag as the buffer is waiting for being dequeued. */
> > +	dqbuf->buffer.flags |= V4L2_BUF_FLAG_DONE;
> > +
> > +	mutex_lock(&session->queues_lock);
> > +	list_add_tail(&dqbuf->list, &queue->pending_dqbufs);
> > +	queue->queued_bufs -= 1;
> > +	mutex_unlock(&session->queues_lock);
> > +
> > +	wake_up(&session->dqbuf_wait);
> > +}
> > +
> > +/**
> > + * virtio_media_process_events() - Process all pending events on a device.
> > + * @vv: device which pending events we want to process.
> > + *
> > + * Retrieves all pending events on @vv's event queue and dispatch them to their
> > + * corresponding session.
> > + *
> > + * Invalid events are ignored with an error log.
> > + */
> > +void virtio_media_process_events(struct virtio_media *vv)
> > +{
> > +	struct virtio_media_event_error *error_evt;
> > +	struct virtio_media_event_dqbuf *dqbuf_evt;
> > +	struct virtio_media_event_event *event_evt;
> > +	struct virtio_media_session *session;
> > +	struct virtio_media_event_header *evt;
> > +	unsigned int len;
> > +
> > +	mutex_lock(&vv->events_lock);
> > +
> > +process_bufs:
> > +	while ((evt = virtqueue_get_buf(vv->eventq, &len))) {
> > +		/* Make sure we received enough data */
> > +		if (len < sizeof(*evt)) {
> > +			v4l2_err(&vv->v4l2_dev,
> > +				 "event is too short: got %u, expected at least %zu\n",
> > +				 len, sizeof(*evt));
> > +			goto end_of_event;
> > +		}
> > +
> > +		session = virtio_media_find_session(vv, evt->session_id);
> > +		if (!session) {
> > +			v4l2_err(&vv->v4l2_dev, "cannot find session %d\n",
> > +				 evt->session_id);
> > +			goto end_of_event;
> > +		}
> > +
> > +		switch (evt->event) {
> > +		case VIRTIO_MEDIA_EVT_ERROR:
> > +			if (len < sizeof(*error_evt)) {
> > +				v4l2_err(&vv->v4l2_dev,
> > +					 "error event is too short: got %u, expected %zu\n",
> > +					 len, sizeof(*error_evt));
> > +				break;
> > +			}
> > +			error_evt = (struct virtio_media_event_error *)evt;
> > +			v4l2_err(&vv->v4l2_dev,
> > +				 "received error %d for session %d",
> > +				 error_evt->errno, error_evt->hdr.session_id);
> > +			virtio_media_session_close(vv, session);
> > +			break;
> > +
> > +		/*
> > +		 * Dequeued buffer: put it into the right queue so user-space
> > +		 * can dequeue it.
> > +		 */
> > +		case VIRTIO_MEDIA_EVT_DQBUF:
> > +			if (len < sizeof(*dqbuf_evt)) {
> > +				v4l2_err(&vv->v4l2_dev,
> > +					 "dqbuf event is too short: got %u, expected %zu\n",
> > +					 len, sizeof(*dqbuf_evt));
> > +				break;
> > +			}
> > +			dqbuf_evt = (struct virtio_media_event_dqbuf *)evt;
> > +			virtio_media_process_dqbuf_event(vv, session,
> > +							 dqbuf_evt);
> > +			break;
> > +
> > +		case VIRTIO_MEDIA_EVT_EVENT:
> > +			if (len < sizeof(*event_evt)) {
> > +				v4l2_err(&vv->v4l2_dev,
> > +					 "session event is too short: got %u expected %zu\n",
> > +					 len, sizeof(*event_evt));
> > +				break;
> > +			}
> > +
> > +			event_evt = (struct virtio_media_event_event *)evt;
> > +			v4l2_event_queue_fh(&session->fh, &event_evt->event);
> > +			break;
> > +
> > +		default:
> > +			v4l2_err(&vv->v4l2_dev, "unknown event type %d\n",
> > +				 evt->event);
> > +			break;
> > +		}
> > +
> > +end_of_event:
> > +		virtio_media_send_event_buffer(vv, evt);
> > +	}
> > +
> > +	if (!virtqueue_enable_cb(vv->eventq)) {
> > +		virtqueue_disable_cb(vv->eventq);
> > +		goto process_bufs;
> > +	}
> > +
> > +	mutex_unlock(&vv->events_lock);
> > +}
> > +
> > +static void virtio_media_event_work(struct work_struct *work)
> > +{
> > +	struct virtio_media *vv =
> > +		container_of(work, struct virtio_media, eventq_work);
> > +
> > +	virtio_media_process_events(vv);
> > +}
> > +
> > +/**
> > + * virtio_media_device_open() - Create a new session from an opened file.
> > + * @file: opened file for the session.
> > + */
> > +static int virtio_media_device_open(struct file *file)
> > +{
> > +	struct video_device *video_dev = video_devdata(file);
> > +	struct virtio_media *vv = to_virtio_media(video_dev);
> > +	struct virtio_media_cmd_open *cmd_open = &vv->cmd.open;
> > +	struct virtio_media_resp_open *resp_open = &vv->resp.open;
> > +	struct scatterlist cmd_sg = {}, resp_sg = {};
> > +	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
> > +	struct virtio_media_session *session;
> > +	u32 session_id;
> > +	int ret;
> > +
> > +	mutex_lock(&vv->vlock);
> > +
> > +	sg_set_buf(&cmd_sg, cmd_open, sizeof(*cmd_open));
> > +	sg_mark_end(&cmd_sg);
> > +
> > +	sg_set_buf(&resp_sg, resp_open, sizeof(*resp_open));
> > +	sg_mark_end(&resp_sg);
> > +
> > +	cmd_open->hdr.cmd = VIRTIO_MEDIA_CMD_OPEN;
> > +	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_open),
> > +					NULL);
> > +	session_id = resp_open->session_id;
> > +	mutex_unlock(&vv->vlock);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	session = virtio_media_session_alloc(vv, session_id, file);
> > +	if (IS_ERR(session))
> > +		return PTR_ERR(session);
> > +
> > +	file->private_data = &session->fh;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * virtio_media_device_close() - Close a previously opened session.
> > + * @file: file of the session to close.
> > + *
> > + * This sends to ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and close
> > + * the session on the driver side.
> > + */
> > +static int virtio_media_device_close(struct file *file)
> > +{
> > +	struct video_device *video_dev = video_devdata(file);
> > +	struct virtio_media *vv = to_virtio_media(video_dev);
> > +	struct virtio_media_session *session =
> > +		fh_to_session(file->private_data);
> > +
> > +	return virtio_media_session_close(vv, session);
> > +}
> > +
> > +/**
> > + * virtio_media_device_poll() - Poll logic for a virtio-media device.
> > + * @file: file of the session to poll.
> > + * @wait: poll table to wait on.
> > + */
> > +static __poll_t virtio_media_device_poll(struct file *file, poll_table *wait)
> > +{
> > +	struct virtio_media_session *session =
> > +		fh_to_session(file->private_data);
> > +	enum v4l2_buf_type capture_type =
> > +		session->uses_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
> > +				       V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +	enum v4l2_buf_type output_type =
> > +		session->uses_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
> > +				       V4L2_BUF_TYPE_VIDEO_OUTPUT;
> > +	struct virtio_media_queue_state *capture_queue =
> > +		&session->queues[capture_type];
> > +	struct virtio_media_queue_state *output_queue =
> > +		&session->queues[output_type];
> > +	__poll_t req_events = poll_requested_events(wait);
> > +	__poll_t rc = 0;
> > +
> > +	poll_wait(file, &session->dqbuf_wait, wait);
> > +	poll_wait(file, &session->fh.wait, wait);
> > +
> > +	mutex_lock(&session->queues_lock);
> > +	if (req_events & (EPOLLIN | EPOLLRDNORM)) {
> > +		if (!capture_queue->streaming ||
> > +		    (capture_queue->queued_bufs == 0 &&
> > +		     list_empty(&capture_queue->pending_dqbufs)))
> > +			rc |= EPOLLERR;
> > +		else if (!list_empty(&capture_queue->pending_dqbufs))
> > +			rc |= EPOLLIN | EPOLLRDNORM;
> > +	}
> > +	if (req_events & (EPOLLOUT | EPOLLWRNORM)) {
> > +		if (!output_queue->streaming)
> > +			rc |= EPOLLERR;
> > +		else if (output_queue->queued_bufs <
> > +			 output_queue->allocated_bufs)
> > +			rc |= EPOLLOUT | EPOLLWRNORM;
> > +	}
> > +	mutex_unlock(&session->queues_lock);
> > +
> > +	if (v4l2_event_pending(&session->fh))
> > +		rc |= EPOLLPRI;
> > +
> > +	return rc;
> > +}
> > +
> > +static void virtio_media_vma_close_locked(struct vm_area_struct *vma)
> > +{
> > +	struct virtio_media *vv = vma->vm_private_data;
> > +	struct virtio_media_cmd_munmap *cmd_munmap = &vv->cmd.munmap;
> > +	struct virtio_media_resp_munmap *resp_munmap = &vv->resp.munmap;
> > +	struct scatterlist cmd_sg = {}, resp_sg = {};
> > +	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
> > +	int ret;
> > +
> > +	sg_set_buf(&cmd_sg, cmd_munmap, sizeof(*cmd_munmap));
> > +	sg_mark_end(&cmd_sg);
> > +
> > +	sg_set_buf(&resp_sg, resp_munmap, sizeof(*resp_munmap));
> > +	sg_mark_end(&resp_sg);
> > +
> > +	cmd_munmap->hdr.cmd = VIRTIO_MEDIA_CMD_MUNMAP;
> > +	cmd_munmap->driver_addr =
> > +		(vma->vm_pgoff << PAGE_SHIFT) - vv->mmap_region.addr;
> > +	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_munmap),
> > +					NULL);
> > +	if (ret < 0) {
> > +		v4l2_err(&vv->v4l2_dev, "host failed to unmap buffer: %d\n",
> > +			 ret);
> > +	}
> > +}
> > +
> > +/**
> > + * virtio_media_vma_close() - Close a MMAP buffer mapping.
> > + * @vma: VMA of the mapping to close.
> > + *
> > + * Inform the host that a previously created MMAP mapping is no longer needed
> > + * and can be removed.
> > + */
> > +static void virtio_media_vma_close(struct vm_area_struct *vma)
> > +{
> > +	struct virtio_media *vv = vma->vm_private_data;
> > +
> > +	mutex_lock(&vv->vlock);
> > +	virtio_media_vma_close_locked(vma);
> > +	mutex_unlock(&vv->vlock);
> > +}
> > +
> > +static const struct vm_operations_struct virtio_media_vm_ops = {
> > +	.close = virtio_media_vma_close,
> > +};
> > +
> > +/**
> > + * virtio_media_device_mmap - Perform a mmap request from userspace.
> > + * @file: opened file of the session to map for.
> > + * @vma: VM area struct describing the desired mapping.
> > + *
> > + * This requests the host to map a MMAP buffer for us, so we can then make that
> > + * mapping visible into user-space address space.
> > + */
> > +static int virtio_media_device_mmap(struct file *file,
> > +				    struct vm_area_struct *vma)
> > +{
> > +	struct video_device *video_dev = video_devdata(file);
> > +	struct virtio_media *vv = to_virtio_media(video_dev);
> > +	struct virtio_media_session *session =
> > +		fh_to_session(file->private_data);
> > +	struct virtio_media_cmd_mmap *cmd_mmap = &session->cmd.mmap;
> > +	struct virtio_media_resp_mmap *resp_mmap = &session->resp.mmap;
> > +	struct scatterlist cmd_sg = {}, resp_sg = {};
> > +	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
> > +	int ret;
> > +
> > +	if (!(vma->vm_flags & VM_SHARED))
> > +		return -EINVAL;
> > +	if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&vv->vlock);
> > +
> > +	cmd_mmap->hdr.cmd = VIRTIO_MEDIA_CMD_MMAP;
> > +	cmd_mmap->session_id = session->id;
> > +	cmd_mmap->flags =
> > +		(vma->vm_flags & VM_WRITE) ? VIRTIO_MEDIA_MMAP_FLAG_RW : 0;
> > +	cmd_mmap->offset = vma->vm_pgoff << PAGE_SHIFT;
> > +
> > +	sg_set_buf(&cmd_sg, cmd_mmap, sizeof(*cmd_mmap));
> > +	sg_mark_end(&cmd_sg);
> > +
> > +	sg_set_buf(&resp_sg, resp_mmap, sizeof(*resp_mmap));
> > +	sg_mark_end(&resp_sg);
> > +
> > +	/*
> > +	 * The host performs reference counting and is smart enough to return
> > +	 * the same guest physical address if this is called several times on
> > +	 * the same
> > +	 * buffer.
> > +	 */
> > +	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_mmap),
> > +					NULL);
> > +	if (ret < 0)
> > +		goto end;
> > +
> > +	vma->vm_private_data = vv;
> > +	/*
> > +	 * Keep the guest address at which the buffer is mapped since we will
> > +	 * use that to unmap.
> > +	 */
> > +	vma->vm_pgoff = (resp_mmap->driver_addr + vv->mmap_region.addr) >>
> > +			PAGE_SHIFT;
> > +
> > +	/*
> > +	 * We cannot let the mapping be larger than the buffer.
> > +	 */
> > +	if (vma->vm_end - vma->vm_start > PAGE_ALIGN(resp_mmap->len)) {
> > +		dev_dbg(&video_dev->dev,
> > +			"invalid MMAP, as it would overflow buffer length\n");
> > +		virtio_media_vma_close_locked(vma);
> > +		ret = -EINVAL;
> > +		goto end;
> > +	}
> > +
> > +	ret = io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
> > +				 vma->vm_end - vma->vm_start,
> > +				 vma->vm_page_prot);
> > +	if (ret)
> > +		goto end;
> > +
> > +	vma->vm_ops = &virtio_media_vm_ops;
> > +
> > +end:
> > +	mutex_unlock(&vv->vlock);
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_file_operations virtio_media_fops = {
> > +	.owner = THIS_MODULE,
> > +	.open = virtio_media_device_open,
> > +	.release = virtio_media_device_close,
> > +	.poll = virtio_media_device_poll,
> > +	.unlocked_ioctl = virtio_media_device_ioctl,
> > +	.mmap = virtio_media_device_mmap,
> > +};
> > +
> > +static int virtio_media_probe(struct virtio_device *virtio_dev)
> > +{
> > +	struct device *dev = &virtio_dev->dev;
> > +	struct virtqueue *vqs[2];
> > +	static struct virtqueue_info vq_info[2] = {
> > +		{
> > +			.name = "command",
> > +			.callback = commandq_callback,
> > +		},
> > +		{
> > +			.name = "event",
> > +			.callback = eventq_callback,
> > +		},
> > +	};
> > +	struct virtio_media *vv;
> > +	struct video_device *vd;
> > +	int i;
> > +	int ret;
> > +
> > +	vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> > +	if (!vv)
> > +		return -ENOMEM;
> > +
> > +	vv->event_buffer = devm_kzalloc(dev,
> > +					VIRTIO_MEDIA_EVENT_MAX_SIZE *
> > +					VIRTIO_MEDIA_NUM_EVENT_BUFS,
> > +					GFP_KERNEL);
> > +	if (!vv->event_buffer)
> > +		return -ENOMEM;
> > +
> > +	INIT_LIST_HEAD(&vv->sessions);
> > +	mutex_init(&vv->sessions_lock);
> > +	mutex_init(&vv->events_lock);
> > +	mutex_init(&vv->vlock);
> > +
> > +	vv->virtio_dev = virtio_dev;
> > +	virtio_dev->priv = vv;
> > +
> > +	init_waitqueue_head(&vv->wq);
> > +
> > +	ret = v4l2_device_register(dev, &vv->v4l2_dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> > +	if (ret)
> > +		goto err_find_vqs;
> > +
> > +	vv->commandq = vqs[0];
> > +	vv->eventq = vqs[1];
> > +	INIT_WORK(&vv->eventq_work, virtio_media_event_work);
> > +
> > +	/* Get MMAP buffer mapping SHM region */
> > +	virtio_get_shm_region(virtio_dev, &vv->mmap_region,
> > +			      VIRTIO_MEDIA_SHM_MMAP);
> > +
> > +	vd = &vv->video_dev;
> > +
> > +	vd->v4l2_dev = &vv->v4l2_dev;
> > +	vd->vfl_type = VFL_TYPE_VIDEO;
> > +	vd->ioctl_ops = &virtio_media_ioctl_ops;
> > +	vd->fops = &virtio_media_fops;
> > +	vd->device_caps = virtio_cread32(virtio_dev, 0);
> > +	if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))
> > +		vd->vfl_dir = VFL_DIR_M2M;
> > +	else if (vd->device_caps &
> > +		 (V4L2_CAP_VIDEO_OUTPUT | V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> > +		vd->vfl_dir = VFL_DIR_TX;
> > +	else
> > +		vd->vfl_dir = VFL_DIR_RX;
> > +	vd->release = video_device_release_empty;
> > +	strscpy(vd->name, "virtio-media", sizeof(vd->name));
> > +
> > +	video_set_drvdata(vd, vv);
> > +
> > +	ret = video_register_device(vd, virtio_cread32(virtio_dev, 4), 0);
> > +	if (ret)
> > +		goto err_register_device;
> > +
> > +	for (i = 0; i < VIRTIO_MEDIA_NUM_EVENT_BUFS; i++) {
> > +		void *ebuf = vv->event_buffer + VIRTIO_MEDIA_EVENT_MAX_SIZE * i;
> > +
> > +		ret = virtio_media_send_event_buffer(vv, ebuf);
> > +		if (ret)
> > +			goto err_send_event_buffer;
> > +	}
> > +
> > +	virtio_device_ready(virtio_dev);
> > +
> > +	return 0;
> > +
> > +err_send_event_buffer:
> > +	video_unregister_device(&vv->video_dev);
> > +err_register_device:
> > +	virtio_dev->config->del_vqs(virtio_dev);
> > +err_find_vqs:
> > +	v4l2_device_unregister(&vv->v4l2_dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void virtio_media_remove(struct virtio_device *virtio_dev)
> > +{
> > +	struct virtio_media *vv = virtio_dev->priv;
> > +	struct list_head *p, *n;
> > +
> > +	cancel_work_sync(&vv->eventq_work);
> > +	virtio_reset_device(virtio_dev);
> > +
> > +	v4l2_device_unregister(&vv->v4l2_dev);
> > +	virtio_dev->config->del_vqs(virtio_dev);
> > +	video_unregister_device(&vv->video_dev);
> > +
> > +	list_for_each_safe(p, n, &vv->sessions) {
> > +		struct virtio_media_session *s =
> > +			list_entry(p, struct virtio_media_session, list);
> > +
> > +		virtio_media_session_free(vv, s);
> > +	}
> > +}
> > +
> > +static struct virtio_device_id id_table[] = {
> > +	{ VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> > +	{ 0 },
> > +};
> > +
> > +static unsigned int features[] = {};
> > +
> > +static struct virtio_driver virtio_media_driver = {
> > +	.feature_table = features,
> > +	.feature_table_size = ARRAY_SIZE(features),
> > +	.driver.name = VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> > +	.driver.owner = THIS_MODULE,
> > +	.id_table = id_table,
> > +	.probe = virtio_media_probe,
> > +	.remove = virtio_media_remove,
> > +};
> > +
> > +module_virtio_driver(virtio_media_driver);
> > +
> > +MODULE_DEVICE_TABLE(virtio, id_table);
> > +MODULE_DESCRIPTION("virtio media driver");
> > +MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
> > +MODULE_LICENSE("Dual BSD/GPL");

