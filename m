Return-Path: <linux-media+bounces-65417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvzHL2CnOWoewAcAu9opvQ
	(envelope-from <linux-media+bounces-65417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:21:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A379B6B276E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=af6+mxor;
	dkim=pass header.d=redhat.com header.s=google header.b=IwRWYYfS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65417-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65417-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F68A3014206
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 21:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8452E367F25;
	Mon, 22 Jun 2026 21:21:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EC3451A7
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 21:21:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163290; cv=none; b=LUWr6xLNWvjvdfip3cl+vcwhLrsjzDGGdajQK8ph2nFQnrMViz1wXn1g8UJ7XCyX2rT3IlTwrV4Eo2bZNw9Jb0n/8fuGVrA4b/ALKmu28McL8UTXXiy2Kjse0KhUHRbf/7mdukL7tJHNzzNm0taTmvAlPdxoF5aXxCLLMs7CNkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163290; c=relaxed/simple;
	bh=FkNPTJxdN5+BfuC21n/4Eu2Ho1DTIFhtsy+tGkRK2Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+y8RKj6AeV+8GWI72unqqzubgm8grzDxq3Mr7QrRtxbmFqduMKEFfsgS1r9v/KunZanBTJj0Rsdz9dWoGkWoO425lUsGEQBwvOuu/E/1MaxivxjmLMpC3+GAUyU8k7Vc8/7dLbZqobQNpSLrXs1P9U14uhsVOVEjoMe2zXHZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=af6+mxor; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwRWYYfS; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782163285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvZJiAT8Soi5vgDZ6gcpIxz/iOMR0+T8poN5ViAQlkQ=;
	b=af6+mxorHFfSDGx7k9bvdJxJNYyhhdo7GYBEfKPEu9uBvYuZkKktS4+Euhq0PtBATNIai1
	RYMcqK9dOQ8uE4uQzCKrCX6AoV9KnMTZrsOFIk+37zclzsuK2/56ejgVmcXqy04c7nRrm6
	PP6EJ7NVkOK+CrUTxcBTf2sqVkfEHEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-vaeYDNJxOW-hDmp7L3WQMw-1; Mon, 22 Jun 2026 17:21:23 -0400
X-MC-Unique: vaeYDNJxOW-hDmp7L3WQMw-1
X-Mimecast-MFC-AGG-ID: vaeYDNJxOW-hDmp7L3WQMw_1782163283
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4924207e640so21683795e9.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782163283; x=1782768083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GvZJiAT8Soi5vgDZ6gcpIxz/iOMR0+T8poN5ViAQlkQ=;
        b=IwRWYYfSGvMOR659R9hHwq02HfulcYowUiTSdxSB7MojRLXUOKshrd06b+qCG2TduK
         E3GbsDQbK/tm5D+pbrhezm3Z7HXtf7ChNK00WH+3xSu81mTfzlxGzs5+ngNtTU/9jlkk
         lrggqY9Xc+5gtmt3AMvDYPsH6aNkn3m3BheVFNHfJTPE8JyXg85G//SvvfBsUQP7pqCj
         jAVknzA2dDFoUEWGTAtxNp329XV3PDthIMsUd/B6NiIrjpSt8Vpa6SJcVPkr7WVkzRDK
         fgWbymsaTk+hjNgXmKrwBpYIIs2Xif5U3RoaiDQvrfhbZdAK/d2sqt/05bS8/0C8uef4
         IhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782163283; x=1782768083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvZJiAT8Soi5vgDZ6gcpIxz/iOMR0+T8poN5ViAQlkQ=;
        b=pDjDNDy7AmX7SL00GjOcMp3CzeW33fZRZ1OUPyza8TeFsL+gKnyjIGZ5Zd69+yuWXa
         v7OjJ/1znvDYGPhzfkmBnkpP7mxPTcfg6ixbfTM3JfuhvjsXvqD+/PZVF2AH8O45HlkX
         jDtlJPskqEJsmOhbAN0e0TVZACqJPeVgHsOmVhwRQS1+BivOVAzwpV3cvEbg3ZqDx1rg
         y1ErEq2cGMmSdjUJdm1wyMcvtZ7ZsmtXvBxn9iiqRYvnF5+hLysK46ekgZcTpOoaijKt
         W4lQUxODACTQpkZafbwkdw5CYbe3VfIGcJMX7tSEAB/FHu3+smyK9gZ8unERLjgnbbRD
         RXRA==
X-Forwarded-Encrypted: i=1; AFNElJ+Oh6T7dVB2ID0MjuLHj0IF5nGfkQrjtCgcMD8hnP1JU76j9chCZsDlfFmPbXVkFDDI5WxXk32BQPUKIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zqWHHZ372Gj9rV4VEFnc5yw7ujYxaDx7ovC43ONMOrODIPHI
	7Z+jTrLGgN0oQ0oxtFfde2t1e9g7pHn93pNOlobdERPelJ2kO4fesRn6nhrEx1QjV+l54w8KY7Q
	P2pCuy7sVVAEJ3yrS1788JTrH6yMC8pNv3JWq1/lJSGaP7UAirDWaIxSWp0vfl7zW
X-Gm-Gg: AfdE7clVwz7JoQgxIv9r0NSLbrpO93NoE86hP83zF2EqxEWQxu0WVk9kJieh4kl1iwc
	HKCPHy6tMJWbxQWmps441UL1hedCqWGhhZfoftTAW0X90Wxp3KYwuXYarGXnsNKWgCelWlXqa8I
	Tq22DFq10O9g/Tx+hZ1RQ0BdmHDuppXCPD6TmwI0WKibjsLvSdFs34UVWuiCJPf2YCczKJemuRT
	PzBXLGLpLyNUAoBbGvE+bDj2fQr8jATfROR1FtZpVmtQBEvaFFCLj8BisCOfZy9XO1gEKhRioX8
	DgZ7zrCPm8YX6sTtgbG5ZOoHGZMe0f8cOneEY6HTpFf/n3rNAPtXeGVinUHEfxwnJSpvzPbw19I
	wd18VaTVM3jiNkNJv2aGNbSkaNkj5QYHH
X-Received: by 2002:a05:600c:6990:b0:490:b189:212d with SMTP id 5b1f17b1804b1-492490b7ea3mr161594335e9.33.1782163282326;
        Mon, 22 Jun 2026 14:21:22 -0700 (PDT)
X-Received: by 2002:a05:600c:6990:b0:490:b189:212d with SMTP id 5b1f17b1804b1-492490b7ea3mr161593935e9.33.1782163281714;
        Mon, 22 Jun 2026 14:21:21 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm28262162f8f.34.2026.06.22.14.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 14:21:21 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:21:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 6/8] media: virtio: Add virtio_media_driver
Message-ID: <20260622171017-mutt-send-email-mst@kernel.org>
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-7-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622204343.1994418-7-briandaniels@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65417-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A379B6B276E

On Mon, Jun 22, 2026 at 04:43:41PM -0400, Brian Daniels wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
> 
> virtio_media_driver.c provides the expected driver hooks, and support
> for mmapping and polling.
> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  drivers/media/virtio/virtio_media_driver.c | 959 +++++++++++++++++++++
>  1 file changed, 959 insertions(+)
>  create mode 100644 drivers/media/virtio/virtio_media_driver.c
> 
> diff --git a/drivers/media/virtio/virtio_media_driver.c b/drivers/media/virtio/virtio_media_driver.c
> new file mode 100644
> index 000000000..d6363c673
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_media_driver.c
> @@ -0,0 +1,959 @@
> +// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
> +
> +/*
> + * Virtio-media driver.
> + *
> + * Copyright (c) 2024-2025 Google LLC.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/mm.h>
> +#include <linux/mutex.h>
> +#include <linux/scatterlist.h>
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +#include <linux/vmalloc.h>
> +#include <linux/wait.h>
> +#include <linux/workqueue.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_ids.h>
> +
> +#include <media/frame_vector.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "protocol.h"
> +#include "session.h"
> +#include "virtio_media.h"
> +
> +#define VIRTIO_MEDIA_NUM_EVENT_BUFS 16
> +
> +/* ID of the SHM region into which MMAP buffer will be mapped. */
> +#define VIRTIO_MEDIA_SHM_MMAP 0
> +
> +/*
> + * Name of the driver to expose to user-space.
> + *
> + * This is configurable because v4l2-compliance has workarounds specific to
> + * some drivers. When proxying these directly from the host, this allows it to
> + * apply them as needed.
> + */
> +char *virtio_media_driver_name;
> +module_param_named(driver_name, virtio_media_driver_name, charp, 0660);


Um. What? Not how it should be handled.


> +
> +/*
> + * Whether USERPTR buffers are allowed.
> + *
> + * This is disabled by default as USERPTR buffers are dangerous, but the option
> + * is left to enable them if desired.
> + */
> +bool virtio_media_allow_userptr;
> +module_param_named(allow_userptr, virtio_media_allow_userptr, bool, 0660);


is this kind of thing common?

> +
> +/**
> + * virtio_media_session_alloc - Allocate a new session.
> + * @vv: virtio-media device the session belongs to.
> + * @id: ID of the session.
> + * @nonblocking_dequeue: whether dequeuing of buffers should be blocking or
> + * not.
> + *
> + * The ``id`` and ``list`` fields must still be set by the caller.

still in what sense?

> + */
> +static struct virtio_media_session *
> +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> +			   struct file *file)
> +{
> +	struct virtio_media_session *session;
> +	int i;
> +	int ret;
> +
> +	session = kzalloc_obj(*session, GFP_KERNEL);
> +	if (!session)
> +		goto err_session;
> +
> +	session->shadow_buf = kzalloc(VIRTIO_SHADOW_BUF_SIZE, GFP_KERNEL);
> +	if (!session->shadow_buf)
> +		goto err_shadow_buf;
> +
> +	ret = sg_alloc_table(&session->command_sgs, DESC_CHAIN_MAX_LEN,
> +			     GFP_KERNEL);
> +	if (ret)
> +		goto err_payload_sgs;
> +
> +	session->id = id;
> +	session->nonblocking_dequeue = file->f_flags & O_NONBLOCK;
> +
> +	INIT_LIST_HEAD(&session->list);
> +	v4l2_fh_init(&session->fh, &vv->video_dev);
> +	virtio_media_session_fh_add(session, file);
> +
> +	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> +		INIT_LIST_HEAD(&session->queues[i].pending_dqbufs);
> +	mutex_init(&session->queues_lock);
> +
> +	init_waitqueue_head(&session->dqbuf_wait);
> +
> +	mutex_lock(&vv->sessions_lock);
> +	list_add_tail(&session->list, &vv->sessions);
> +	mutex_unlock(&vv->sessions_lock);
> +
> +	return session;
> +
> +err_payload_sgs:
> +	kfree(session->shadow_buf);
> +err_shadow_buf:
> +	kfree(session);
> +err_session:
> +	return ERR_PTR(-ENOMEM);
> +}
> +
> +/**
> + * virtio_media_session_free - Free all resources of a session.
> + * @vv: virtio-media device the session belongs to.
> + * @session: session to destroy.
> + *
> + * All the resources of @sesssion, as well as the backing memory of @session
> + * itself, are freed.

why @ here and `` above? And typo in the name.

> + */
> +static void virtio_media_session_free(struct virtio_media *vv,
> +				      struct virtio_media_session *session)
> +{
> +	int i;
> +
> +	mutex_lock(&vv->sessions_lock);
> +	list_del(&session->list);
> +	mutex_unlock(&vv->sessions_lock);
> +
> +	virtio_media_session_fh_del(session);
> +	v4l2_fh_exit(&session->fh);
> +
> +	sg_free_table(&session->command_sgs);
> +
> +	for (i = 0; i <= VIRTIO_MEDIA_LAST_QUEUE; i++)
> +		vfree(session->queues[i].buffers);
> +
> +	kfree(session->shadow_buf);
> +	kfree(session);
> +}
> +
> +/**
> + * virtio_media_session_close - Close and free a session.
> + * @vv: virtio-media device the session belongs to.
> + * @session: session to close and destroy.
> + *
> + * This send the ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and frees

sends

> + * all resources used by @session.
> + */
> +static int virtio_media_session_close(struct virtio_media *vv,
> +				      struct virtio_media_session *session)
> +{
> +	struct virtio_media_cmd_close *cmd_close = &session->cmd.close;
> +	struct scatterlist cmd_sg = {};
> +	struct scatterlist *sgs[1] = { &cmd_sg };
> +	int ret;
> +
> +	mutex_lock(&vv->vlock);
> +
> +	cmd_close->hdr.cmd = VIRTIO_MEDIA_CMD_CLOSE;
> +	cmd_close->session_id = session->id;
> +
> +	sg_set_buf(&cmd_sg, cmd_close, sizeof(*cmd_close));
> +	sg_mark_end(&cmd_sg);
> +
> +	ret = virtio_media_send_command(vv, sgs, 1, 0, 0, NULL);
> +	mutex_unlock(&vv->vlock);
> +	if (ret < 0)
> +		return ret;
> +
> +	virtio_media_session_free(vv, session);
> +
> +	return 0;
> +}
> +
> +/**
> + * virtio_media_find_session - Lookup for the session with a given ID.

a session

> + * @vv: virtio-media device to lookup the session from.
> + * @id: ID of the session to lookup.
> + */
> +static struct virtio_media_session *
> +virtio_media_find_session(struct virtio_media *vv, u32 id)
> +{
> +	struct list_head *p;
> +	struct virtio_media_session *session = NULL;
> +
> +	mutex_lock(&vv->sessions_lock);
> +	list_for_each(p, &vv->sessions) {
> +		struct virtio_media_session *s =
> +			list_entry(p, struct virtio_media_session, list);
> +		if (s->id == id) {
> +			session = s;
> +			break;
> +		}
> +	}
> +	mutex_unlock(&vv->sessions_lock);
> +
> +	return session;
> +}
> +
> +/**
> + * struct virtio_media_cmd_callback_param - Callback parameters to the virtio
> + *                                          command queue.
> + * @vv: virtio-media device in use.
> + * @done: flag to be switched once the command is completed.
> + * @resp_len: length of the received response from the command. Only valid
> + * after @done_flag has switched to ``true``.

confusing indent

> + */
> +struct virtio_media_cmd_callback_param {
> +	struct virtio_media *vv;
> +	bool done;
> +	size_t resp_len;
> +};
> +
> +/**
> + * commandq_callback: Callback for the command queue.
> + * @queue: command virtqueue.
> + *
> + * This just wakes up the thread that was waiting on the command to complete.
> + */
> +static void commandq_callback(struct virtqueue *queue)
> +{
> +	unsigned int len;
> +	struct virtio_media_cmd_callback_param *param;
> +
> +process_bufs:
> +	while ((param = virtqueue_get_buf(queue, &len))) {
> +		param->done = true;
> +		param->resp_len = len;
> +		wake_up(&param->vv->wq);
> +	}
> +
> +	if (!virtqueue_enable_cb(queue)) {
> +		virtqueue_disable_cb(queue);
> +		goto process_bufs;
> +	}
> +}
> +
> +/**
> + * virtio_media_kick_command - send a command to the commandq.
> + * @vv: virtio-media device in use.
> + * @sgs: descriptor chain to send.
> + * @out_sgs: number of device-readable descriptors in @sgs.
> + * @in_sgs: number of device-writable descriptors in @sgs.
> + * @resp_len: output parameter. Upon success, contains the size of the response
> + * in bytes.

confusing indent

> + *

why an empty line?

> + */
> +static int virtio_media_kick_command(struct virtio_media *vv,
> +				     struct scatterlist **sgs,
> +				     const size_t out_sgs, const size_t in_sgs,
> +				     size_t *resp_len)
> +{
> +	struct virtio_media_cmd_callback_param cb_param = {
> +		.vv = vv,
> +		.done = false,
> +		.resp_len = 0,
> +	};
> +	struct virtio_media_resp_header *resp_header;
> +	int ret;
> +
> +	ret = virtqueue_add_sgs(vv->commandq, sgs, out_sgs, in_sgs, &cb_param,
> +				GFP_ATOMIC);


can init with declaration.

> +	if (ret) {
> +		v4l2_err(&vv->v4l2_dev,
> +			 "failed to add sgs to command virtqueue\n");
> +		return ret;
> +	}
> +
> +	if (!virtqueue_kick(vv->commandq)) {
> +		v4l2_err(&vv->v4l2_dev, "failed to kick command virtqueue\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Wait for the response. */
> +	ret = wait_event_timeout(vv->wq, cb_param.done, 5 * HZ);
> +	if (ret == 0) {
> +		v4l2_err(&vv->v4l2_dev,
> +			 "timed out waiting for response to command\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (resp_len)
> +		*resp_len = cb_param.resp_len;
> +
> +	if (in_sgs > 0) {
> +		/*
> +		 * If we expect a response, make sure we have at least a
> +		 * response header - anything shorter is invalid.
> +		 */
> +		if (cb_param.resp_len < sizeof(*resp_header)) {
> +			v4l2_err(&vv->v4l2_dev,
> +				 "received response header is too short\n");
> +			return -EINVAL;
> +		}
> +
> +		resp_header = sg_virt(sgs[out_sgs]);
> +		if (resp_header->status)
> +			/* Host returns a positive error code. */
> +			return -resp_header->status;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * virtio_media_send_command - Send a command to the device and wait for its
> + * response.
> + * @vv: virtio-media device in use.
> + * @sgs: descriptor chain to send.
> + * @out_sgs: number of device-readable descriptors in @sgs.
> + * @in_sgs: number of device-writable descriptors in @sgs.
> + * @minimum_resp_len: minimum length of the response expected by the caller
> + * when the command is successful. Anything shorter than that will result in
> + * ``-EINVAL`` being returned.
> + * @resp_len: output parameter. Upon success, contains the size of the response
> + * in bytes.
> + */
> +int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
> +			      const size_t out_sgs, const size_t in_sgs,
> +			      size_t minimum_resp_len, size_t *resp_len)
> +{
> +	size_t local_resp_len = resp_len ? *resp_len : 0;
> +	int ret = virtio_media_kick_command(vv, sgs, out_sgs, in_sgs,
> +					    &local_resp_len);
> +	if (resp_len)
> +		*resp_len = local_resp_len;
> +
> +	/*
> +	 * If the host could not process the command, there is no valid
> +	 * response.
> +	 */
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Make sure the host wrote a complete reply. */
> +	if (local_resp_len < minimum_resp_len) {
> +		v4l2_err(&vv->v4l2_dev,
> +			 "received response is too short: received %zu, expected at least %zu\n",
> +			 local_resp_len, minimum_resp_len);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * virtio_media_send_event_buffer() - Sends an event buffer to the host so it
> + * can return it with an event.
> + * @vv: virtio-media device in use.
> + * @event_buffer: pointer to the event buffer to send to the device.
> + */
> +static int virtio_media_send_event_buffer(struct virtio_media *vv,
> +					  void *event_buffer)
> +{
> +	struct scatterlist *sgs[1], vresp;
> +	int ret;
> +
> +	sg_init_one(&vresp, event_buffer, VIRTIO_MEDIA_EVENT_MAX_SIZE);
> +	sgs[0] = &vresp;

what is this convoluted thing? why not pass &vresp directly?

> +
> +	ret = virtqueue_add_sgs(vv->eventq, sgs, 0, 1, event_buffer,
> +				GFP_ATOMIC);


This does not work uness event_buffer is aligned for dma.
But it does not seem to be:

     for (i = 0; i < VIRTIO_MEDIA_NUM_EVENT_BUFS; i++) {
            void *ebuf = vv->event_buffer + VIRTIO_MEDIA_EVENT_MAX_SIZE * i;

             ret = virtio_media_send_event_buffer(vv, ebuf);
             if (ret)
                     goto err_send_event_buffer;




> +	if (ret) {
> +		v4l2_err(&vv->v4l2_dev,
> +			 "failed to add sgs to event virtqueue\n");
> +		return ret;
> +	}
> +
> +	if (!virtqueue_kick(vv->eventq)) {
> +		v4l2_err(&vv->v4l2_dev, "failed to kick event virtqueue\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * eventq_callback() - Callback for the event queue.
> + * @queue: event virtqueue.
> + *
> + * This just schedules for event work to be run.
> + */
> +static void eventq_callback(struct virtqueue *queue)
> +{
> +	struct virtio_media *vv = queue->vdev->priv;
> +
> +	schedule_work(&vv->eventq_work);
> +}
> +
> +/**
> + * virtio_media_process_dqbuf_event() - Process a dequeued event for a session.
> + * @vv: virtio-media device in use.
> + * @session: session the event is addressed to.
> + * @dqbuf_evt: the dequeued event to process.
> + *
> + * Invalid events are ignored with an error log.
> + */
> +static void
> +virtio_media_process_dqbuf_event(struct virtio_media *vv,
> +				 struct virtio_media_session *session,
> +				 struct virtio_media_event_dqbuf *dqbuf_evt)
> +{
> +	struct virtio_media_buffer *dqbuf;
> +	const enum v4l2_buf_type queue_type = dqbuf_evt->buffer.type;
> +	struct virtio_media_queue_state *queue;
> +	typeof(dqbuf->buffer.m) buffer_m;
> +	typeof(dqbuf->buffer.m.planes[0].m) plane_m;
> +	int i;
> +
> +	if (queue_type >= ARRAY_SIZE(session->queues)) {
> +		v4l2_err(&vv->v4l2_dev,
> +			 "unmanaged queue %d passed to dqbuf event",
> +			 dqbuf_evt->buffer.type);
> +		return;
> +	}
> +	queue = &session->queues[queue_type];
> +
> +	if (dqbuf_evt->buffer.index >= queue->allocated_bufs) {
> +		v4l2_err(&vv->v4l2_dev,
> +			 "invalid buffer ID %d for queue %d in dqbuf event",
> +			 dqbuf_evt->buffer.index, dqbuf_evt->buffer.type);
> +		return;
> +	}
> +
> +	dqbuf = &queue->buffers[dqbuf_evt->buffer.index];
> +
> +	/*
> +	 * Preserve the 'm' union that was passed to us during QBUF so userspace
> +	 * gets back the information it submitted.
> +	 */
> +	buffer_m = dqbuf->buffer.m;
> +	memcpy(&dqbuf->buffer, &dqbuf_evt->buffer, sizeof(dqbuf->buffer));
> +	dqbuf->buffer.m = buffer_m;
> +	if (V4L2_TYPE_IS_MULTIPLANAR(dqbuf->buffer.type)) {
> +		if (dqbuf->buffer.length > VIDEO_MAX_PLANES) {
> +			v4l2_err(&vv->v4l2_dev,
> +				 "invalid number of planes received from host for a multiplanar buffer\n");
> +			return;
> +		}
> +		for (i = 0; i < dqbuf->buffer.length; i++) {
> +			plane_m = dqbuf->planes[i].m;
> +			memcpy(&dqbuf->planes[i], &dqbuf_evt->planes[i],
> +			       sizeof(struct v4l2_plane));
> +			dqbuf->planes[i].m = plane_m;
> +		}
> +	}
> +
> +	/* Set the DONE flag as the buffer is waiting for being dequeued. */
> +	dqbuf->buffer.flags |= V4L2_BUF_FLAG_DONE;
> +
> +	mutex_lock(&session->queues_lock);
> +	list_add_tail(&dqbuf->list, &queue->pending_dqbufs);
> +	queue->queued_bufs -= 1;
> +	mutex_unlock(&session->queues_lock);
> +
> +	wake_up(&session->dqbuf_wait);
> +}
> +
> +/**
> + * virtio_media_process_events() - Process all pending events on a device.
> + * @vv: device which pending events we want to process.
> + *
> + * Retrieves all pending events on @vv's event queue and dispatch them to their
> + * corresponding session.
> + *
> + * Invalid events are ignored with an error log.
> + */
> +void virtio_media_process_events(struct virtio_media *vv)
> +{
> +	struct virtio_media_event_error *error_evt;
> +	struct virtio_media_event_dqbuf *dqbuf_evt;
> +	struct virtio_media_event_event *event_evt;
> +	struct virtio_media_session *session;
> +	struct virtio_media_event_header *evt;
> +	unsigned int len;
> +
> +	mutex_lock(&vv->events_lock);
> +
> +process_bufs:
> +	while ((evt = virtqueue_get_buf(vv->eventq, &len))) {
> +		/* Make sure we received enough data */
> +		if (len < sizeof(*evt)) {
> +			v4l2_err(&vv->v4l2_dev,
> +				 "event is too short: got %u, expected at least %zu\n",
> +				 len, sizeof(*evt));
> +			goto end_of_event;
> +		}
> +
> +		session = virtio_media_find_session(vv, evt->session_id);
> +		if (!session) {
> +			v4l2_err(&vv->v4l2_dev, "cannot find session %d\n",
> +				 evt->session_id);
> +			goto end_of_event;
> +		}
> +
> +		switch (evt->event) {
> +		case VIRTIO_MEDIA_EVT_ERROR:
> +			if (len < sizeof(*error_evt)) {
> +				v4l2_err(&vv->v4l2_dev,
> +					 "error event is too short: got %u, expected %zu\n",
> +					 len, sizeof(*error_evt));
> +				break;
> +			}
> +			error_evt = (struct virtio_media_event_error *)evt;
> +			v4l2_err(&vv->v4l2_dev,
> +				 "received error %d for session %d",
> +				 error_evt->errno, error_evt->hdr.session_id);
> +			virtio_media_session_close(vv, session);
> +			break;
> +
> +		/*
> +		 * Dequeued buffer: put it into the right queue so user-space
> +		 * can dequeue it.
> +		 */
> +		case VIRTIO_MEDIA_EVT_DQBUF:
> +			if (len < sizeof(*dqbuf_evt)) {
> +				v4l2_err(&vv->v4l2_dev,
> +					 "dqbuf event is too short: got %u, expected %zu\n",
> +					 len, sizeof(*dqbuf_evt));
> +				break;
> +			}
> +			dqbuf_evt = (struct virtio_media_event_dqbuf *)evt;
> +			virtio_media_process_dqbuf_event(vv, session,
> +							 dqbuf_evt);
> +			break;
> +
> +		case VIRTIO_MEDIA_EVT_EVENT:
> +			if (len < sizeof(*event_evt)) {
> +				v4l2_err(&vv->v4l2_dev,
> +					 "session event is too short: got %u expected %zu\n",
> +					 len, sizeof(*event_evt));
> +				break;
> +			}
> +
> +			event_evt = (struct virtio_media_event_event *)evt;
> +			v4l2_event_queue_fh(&session->fh, &event_evt->event);
> +			break;
> +
> +		default:
> +			v4l2_err(&vv->v4l2_dev, "unknown event type %d\n",
> +				 evt->event);
> +			break;
> +		}
> +
> +end_of_event:
> +		virtio_media_send_event_buffer(vv, evt);
> +	}
> +
> +	if (!virtqueue_enable_cb(vv->eventq)) {
> +		virtqueue_disable_cb(vv->eventq);
> +		goto process_bufs;
> +	}
> +
> +	mutex_unlock(&vv->events_lock);
> +}
> +
> +static void virtio_media_event_work(struct work_struct *work)
> +{
> +	struct virtio_media *vv =
> +		container_of(work, struct virtio_media, eventq_work);
> +
> +	virtio_media_process_events(vv);
> +}
> +
> +/**
> + * virtio_media_device_open() - Create a new session from an opened file.
> + * @file: opened file for the session.
> + */
> +static int virtio_media_device_open(struct file *file)
> +{
> +	struct video_device *video_dev = video_devdata(file);
> +	struct virtio_media *vv = to_virtio_media(video_dev);
> +	struct virtio_media_cmd_open *cmd_open = &vv->cmd.open;
> +	struct virtio_media_resp_open *resp_open = &vv->resp.open;
> +	struct scatterlist cmd_sg = {}, resp_sg = {};
> +	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
> +	struct virtio_media_session *session;
> +	u32 session_id;
> +	int ret;
> +
> +	mutex_lock(&vv->vlock);
> +
> +	sg_set_buf(&cmd_sg, cmd_open, sizeof(*cmd_open));
> +	sg_mark_end(&cmd_sg);
> +
> +	sg_set_buf(&resp_sg, resp_open, sizeof(*resp_open));
> +	sg_mark_end(&resp_sg);
> +
> +	cmd_open->hdr.cmd = VIRTIO_MEDIA_CMD_OPEN;
> +	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_open),
> +					NULL);
> +	session_id = resp_open->session_id;
> +	mutex_unlock(&vv->vlock);
> +	if (ret < 0)
> +		return ret;
> +
> +	session = virtio_media_session_alloc(vv, session_id, file);
> +	if (IS_ERR(session))
> +		return PTR_ERR(session);
> +
> +	file->private_data = &session->fh;
> +
> +	return 0;
> +}
> +
> +/**
> + * virtio_media_device_close() - Close a previously opened session.
> + * @file: file of the session to close.
> + *
> + * This sends to ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and close
> + * the session on the driver side.
> + */
> +static int virtio_media_device_close(struct file *file)
> +{
> +	struct video_device *video_dev = video_devdata(file);
> +	struct virtio_media *vv = to_virtio_media(video_dev);
> +	struct virtio_media_session *session =
> +		fh_to_session(file->private_data);
> +
> +	return virtio_media_session_close(vv, session);
> +}
> +
> +/**
> + * virtio_media_device_poll() - Poll logic for a virtio-media device.
> + * @file: file of the session to poll.
> + * @wait: poll table to wait on.
> + */
> +static __poll_t virtio_media_device_poll(struct file *file, poll_table *wait)
> +{
> +	struct virtio_media_session *session =
> +		fh_to_session(file->private_data);
> +	enum v4l2_buf_type capture_type =
> +		session->uses_mplane ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
> +				       V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	enum v4l2_buf_type output_type =
> +		session->uses_mplane ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
> +				       V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	struct virtio_media_queue_state *capture_queue =
> +		&session->queues[capture_type];
> +	struct virtio_media_queue_state *output_queue =
> +		&session->queues[output_type];
> +	__poll_t req_events = poll_requested_events(wait);
> +	__poll_t rc = 0;
> +
> +	poll_wait(file, &session->dqbuf_wait, wait);
> +	poll_wait(file, &session->fh.wait, wait);
> +
> +	mutex_lock(&session->queues_lock);
> +	if (req_events & (EPOLLIN | EPOLLRDNORM)) {
> +		if (!capture_queue->streaming ||
> +		    (capture_queue->queued_bufs == 0 &&
> +		     list_empty(&capture_queue->pending_dqbufs)))
> +			rc |= EPOLLERR;
> +		else if (!list_empty(&capture_queue->pending_dqbufs))
> +			rc |= EPOLLIN | EPOLLRDNORM;
> +	}
> +	if (req_events & (EPOLLOUT | EPOLLWRNORM)) {
> +		if (!output_queue->streaming)
> +			rc |= EPOLLERR;
> +		else if (output_queue->queued_bufs <
> +			 output_queue->allocated_bufs)
> +			rc |= EPOLLOUT | EPOLLWRNORM;
> +	}
> +	mutex_unlock(&session->queues_lock);
> +
> +	if (v4l2_event_pending(&session->fh))
> +		rc |= EPOLLPRI;
> +
> +	return rc;
> +}
> +
> +static void virtio_media_vma_close_locked(struct vm_area_struct *vma)
> +{
> +	struct virtio_media *vv = vma->vm_private_data;
> +	struct virtio_media_cmd_munmap *cmd_munmap = &vv->cmd.munmap;
> +	struct virtio_media_resp_munmap *resp_munmap = &vv->resp.munmap;
> +	struct scatterlist cmd_sg = {}, resp_sg = {};
> +	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
> +	int ret;
> +
> +	sg_set_buf(&cmd_sg, cmd_munmap, sizeof(*cmd_munmap));
> +	sg_mark_end(&cmd_sg);
> +
> +	sg_set_buf(&resp_sg, resp_munmap, sizeof(*resp_munmap));
> +	sg_mark_end(&resp_sg);
> +
> +	cmd_munmap->hdr.cmd = VIRTIO_MEDIA_CMD_MUNMAP;
> +	cmd_munmap->driver_addr =
> +		(vma->vm_pgoff << PAGE_SHIFT) - vv->mmap_region.addr;
> +	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_munmap),
> +					NULL);
> +	if (ret < 0) {
> +		v4l2_err(&vv->v4l2_dev, "host failed to unmap buffer: %d\n",
> +			 ret);
> +	}
> +}
> +
> +/**
> + * virtio_media_vma_close() - Close a MMAP buffer mapping.
> + * @vma: VMA of the mapping to close.
> + *
> + * Inform the host that a previously created MMAP mapping is no longer needed
> + * and can be removed.
> + */
> +static void virtio_media_vma_close(struct vm_area_struct *vma)
> +{
> +	struct virtio_media *vv = vma->vm_private_data;
> +
> +	mutex_lock(&vv->vlock);
> +	virtio_media_vma_close_locked(vma);
> +	mutex_unlock(&vv->vlock);
> +}
> +
> +static const struct vm_operations_struct virtio_media_vm_ops = {
> +	.close = virtio_media_vma_close,
> +};
> +
> +/**
> + * virtio_media_device_mmap - Perform a mmap request from userspace.
> + * @file: opened file of the session to map for.
> + * @vma: VM area struct describing the desired mapping.
> + *
> + * This requests the host to map a MMAP buffer for us, so we can then make that
> + * mapping visible into user-space address space.
> + */
> +static int virtio_media_device_mmap(struct file *file,
> +				    struct vm_area_struct *vma)
> +{
> +	struct video_device *video_dev = video_devdata(file);
> +	struct virtio_media *vv = to_virtio_media(video_dev);
> +	struct virtio_media_session *session =
> +		fh_to_session(file->private_data);
> +	struct virtio_media_cmd_mmap *cmd_mmap = &session->cmd.mmap;
> +	struct virtio_media_resp_mmap *resp_mmap = &session->resp.mmap;
> +	struct scatterlist cmd_sg = {}, resp_sg = {};
> +	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
> +	int ret;
> +
> +	if (!(vma->vm_flags & VM_SHARED))
> +		return -EINVAL;
> +	if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
> +		return -EINVAL;
> +
> +	mutex_lock(&vv->vlock);
> +
> +	cmd_mmap->hdr.cmd = VIRTIO_MEDIA_CMD_MMAP;
> +	cmd_mmap->session_id = session->id;
> +	cmd_mmap->flags =
> +		(vma->vm_flags & VM_WRITE) ? VIRTIO_MEDIA_MMAP_FLAG_RW : 0;
> +	cmd_mmap->offset = vma->vm_pgoff << PAGE_SHIFT;
> +
> +	sg_set_buf(&cmd_sg, cmd_mmap, sizeof(*cmd_mmap));
> +	sg_mark_end(&cmd_sg);
> +
> +	sg_set_buf(&resp_sg, resp_mmap, sizeof(*resp_mmap));
> +	sg_mark_end(&resp_sg);
> +
> +	/*
> +	 * The host performs reference counting and is smart enough to return
> +	 * the same guest physical address if this is called several times on
> +	 * the same
> +	 * buffer.
> +	 */
> +	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_mmap),
> +					NULL);
> +	if (ret < 0)
> +		goto end;
> +
> +	vma->vm_private_data = vv;
> +	/*
> +	 * Keep the guest address at which the buffer is mapped since we will
> +	 * use that to unmap.
> +	 */
> +	vma->vm_pgoff = (resp_mmap->driver_addr + vv->mmap_region.addr) >>
> +			PAGE_SHIFT;
> +
> +	/*
> +	 * We cannot let the mapping be larger than the buffer.
> +	 */
> +	if (vma->vm_end - vma->vm_start > PAGE_ALIGN(resp_mmap->len)) {
> +		dev_dbg(&video_dev->dev,
> +			"invalid MMAP, as it would overflow buffer length\n");
> +		virtio_media_vma_close_locked(vma);
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	ret = io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
> +				 vma->vm_end - vma->vm_start,
> +				 vma->vm_page_prot);
> +	if (ret)
> +		goto end;
> +
> +	vma->vm_ops = &virtio_media_vm_ops;
> +
> +end:
> +	mutex_unlock(&vv->vlock);
> +	return ret;
> +}
> +
> +static const struct v4l2_file_operations virtio_media_fops = {
> +	.owner = THIS_MODULE,
> +	.open = virtio_media_device_open,
> +	.release = virtio_media_device_close,
> +	.poll = virtio_media_device_poll,
> +	.unlocked_ioctl = virtio_media_device_ioctl,
> +	.mmap = virtio_media_device_mmap,
> +};
> +
> +static int virtio_media_probe(struct virtio_device *virtio_dev)
> +{
> +	struct device *dev = &virtio_dev->dev;
> +	struct virtqueue *vqs[2];
> +	static struct virtqueue_info vq_info[2] = {
> +		{
> +			.name = "command",
> +			.callback = commandq_callback,
> +		},
> +		{
> +			.name = "event",
> +			.callback = eventq_callback,
> +		},
> +	};
> +	struct virtio_media *vv;
> +	struct video_device *vd;
> +	int i;
> +	int ret;
> +
> +	vv = devm_kzalloc(dev, sizeof(*vv), GFP_KERNEL);
> +	if (!vv)
> +		return -ENOMEM;
> +
> +	vv->event_buffer = devm_kzalloc(dev,
> +					VIRTIO_MEDIA_EVENT_MAX_SIZE *
> +					VIRTIO_MEDIA_NUM_EVENT_BUFS,
> +					GFP_KERNEL);
> +	if (!vv->event_buffer)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&vv->sessions);
> +	mutex_init(&vv->sessions_lock);
> +	mutex_init(&vv->events_lock);
> +	mutex_init(&vv->vlock);
> +
> +	vv->virtio_dev = virtio_dev;
> +	virtio_dev->priv = vv;
> +
> +	init_waitqueue_head(&vv->wq);
> +
> +	ret = v4l2_device_register(dev, &vv->v4l2_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = virtio_find_vqs(virtio_dev, 2, vqs, vq_info, NULL);
> +	if (ret)
> +		goto err_find_vqs;
> +
> +	vv->commandq = vqs[0];
> +	vv->eventq = vqs[1];
> +	INIT_WORK(&vv->eventq_work, virtio_media_event_work);
> +
> +	/* Get MMAP buffer mapping SHM region */
> +	virtio_get_shm_region(virtio_dev, &vv->mmap_region,
> +			      VIRTIO_MEDIA_SHM_MMAP);
> +
> +	vd = &vv->video_dev;
> +
> +	vd->v4l2_dev = &vv->v4l2_dev;
> +	vd->vfl_type = VFL_TYPE_VIDEO;
> +	vd->ioctl_ops = &virtio_media_ioctl_ops;
> +	vd->fops = &virtio_media_fops;
> +	vd->device_caps = virtio_cread32(virtio_dev, 0);
> +	if (vd->device_caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))
> +		vd->vfl_dir = VFL_DIR_M2M;
> +	else if (vd->device_caps &
> +		 (V4L2_CAP_VIDEO_OUTPUT | V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> +		vd->vfl_dir = VFL_DIR_TX;
> +	else
> +		vd->vfl_dir = VFL_DIR_RX;
> +	vd->release = video_device_release_empty;
> +	strscpy(vd->name, "virtio-media", sizeof(vd->name));
> +
> +	video_set_drvdata(vd, vv);
> +
> +	ret = video_register_device(vd, virtio_cread32(virtio_dev, 4), 0);
> +	if (ret)
> +		goto err_register_device;
> +
> +	for (i = 0; i < VIRTIO_MEDIA_NUM_EVENT_BUFS; i++) {
> +		void *ebuf = vv->event_buffer + VIRTIO_MEDIA_EVENT_MAX_SIZE * i;
> +
> +		ret = virtio_media_send_event_buffer(vv, ebuf);
> +		if (ret)
> +			goto err_send_event_buffer;
> +	}
> +
> +	virtio_device_ready(virtio_dev);
> +
> +	return 0;
> +
> +err_send_event_buffer:
> +	video_unregister_device(&vv->video_dev);
> +err_register_device:
> +	virtio_dev->config->del_vqs(virtio_dev);
> +err_find_vqs:
> +	v4l2_device_unregister(&vv->v4l2_dev);
> +
> +	return ret;
> +}
> +
> +static void virtio_media_remove(struct virtio_device *virtio_dev)
> +{
> +	struct virtio_media *vv = virtio_dev->priv;
> +	struct list_head *p, *n;
> +
> +	cancel_work_sync(&vv->eventq_work);
> +	virtio_reset_device(virtio_dev);
> +
> +	v4l2_device_unregister(&vv->v4l2_dev);
> +	virtio_dev->config->del_vqs(virtio_dev);
> +	video_unregister_device(&vv->video_dev);
> +
> +	list_for_each_safe(p, n, &vv->sessions) {
> +		struct virtio_media_session *s =
> +			list_entry(p, struct virtio_media_session, list);
> +
> +		virtio_media_session_free(vv, s);
> +	}
> +}
> +
> +static struct virtio_device_id id_table[] = {
> +	{ VIRTIO_ID_MEDIA, VIRTIO_DEV_ANY_ID },
> +	{ 0 },
> +};
> +
> +static unsigned int features[] = {};
> +
> +static struct virtio_driver virtio_media_driver = {
> +	.feature_table = features,
> +	.feature_table_size = ARRAY_SIZE(features),
> +	.driver.name = VIRTIO_MEDIA_DEFAULT_DRIVER_NAME,
> +	.driver.owner = THIS_MODULE,
> +	.id_table = id_table,
> +	.probe = virtio_media_probe,
> +	.remove = virtio_media_remove,
> +};
> +
> +module_virtio_driver(virtio_media_driver);
> +
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +MODULE_DESCRIPTION("virtio media driver");
> +MODULE_AUTHOR("Alexandre Courbot <gnurou@gmail.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog


