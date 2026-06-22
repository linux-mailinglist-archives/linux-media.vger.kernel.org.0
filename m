Return-Path: <linux-media+bounces-65415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dulUKYCkOWqmvwcAu9opvQ
	(envelope-from <linux-media+bounces-65415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:09:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E366B2699
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:09:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=UhhAbWLN;
	dkim=pass header.d=redhat.com header.s=google header.b=E8uj8FFv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65415-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65415-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D438D30103AA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 21:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0FD367F25;
	Mon, 22 Jun 2026 21:08:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580F93546CF
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 21:08:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162538; cv=none; b=gAy45xF2ynTGFfFq/el7n+DyrrcEbO4B/hSnwfPsH3a3RUX9wjQuGzQuDu1V7stkWLzNV7SgXXMESr7tJz0c2ioe33oq9gfXY4EERYTF3HE62A4fRU85ahSGWtpk9Y/Q2WV82Ti6yjEi7z51NijPlju+f60wXc2zZ/ao3DS9544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162538; c=relaxed/simple;
	bh=pmBo+w73eRHOywxv/S6NXnxFU3GqCpF8V0YmuW/oaTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaL/QXr10K2j7bwUlkYtnA/vmOioYx/1GGfU8V+TVMXBhvohJGniHM7KC+Q/8BobdIrWyrspB3PoaOrZeD/l7sPk8DAXapaZBzY8CDdPhk5A0JT6HhjI2mQ0iDQENIEygfeCZZZCG0Q17WQcPIL57WenghVnMlFlnlXRsXfs2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhhAbWLN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8uj8FFv; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782162535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8vqJMSqKfx+sunQXyB2WFWU85NOrm3GPszXiiWd5EI=;
	b=UhhAbWLNVLWPuHAwk8q1CKMYKkxV8nvH1SqOs+n3rjvit/JKpiRGFvz5bpIRFy5350vl4F
	Fnf/EcP0TRS00a1IGxzmHke1klKB8B+yRLHzyqyPKWJtwLDAXkVBEZtjDdViAeAUx6rsKA
	bjDzPrBrbaiuR00VuoXa8peDNl5GRZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-esVH0NYkMoyfJm7dSTsFhw-1; Mon, 22 Jun 2026 17:08:53 -0400
X-MC-Unique: esVH0NYkMoyfJm7dSTsFhw-1
X-Mimecast-MFC-AGG-ID: esVH0NYkMoyfJm7dSTsFhw_1782162533
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490b61243easo65515115e9.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782162532; x=1782767332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8vqJMSqKfx+sunQXyB2WFWU85NOrm3GPszXiiWd5EI=;
        b=E8uj8FFv2rlEfiqEBqYwMQ7Wtwc8tAWc3rOni9e2JYwMFEwxB/3bF/u2+BaG8pd1gz
         0+7mu3D6B7OZBsB+ksv8y3Dw6I9rrjKInAhv9FM0wPb7fsuA5WZCcT+MKK1HlIzp82fh
         cbUuCZcrtjaSZzHicOfIRGCZ4cAaogI6QKg38k8vzFDGuHyTjKz1b5RVYgaHSXXJ1elR
         YN2oiAEjp6EDHNSYf7A8vUBjxN+9UXKhMB9KzPnEZKEV46yaBYja2C396kX8umwF9+el
         jldoGO0OCWPtWeF458iKZ3du+zmXMs1PHFZzTJ+5UNBa6m4SAVkQ1QRqZ2pLdi/y8yRQ
         bgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782162532; x=1782767332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8vqJMSqKfx+sunQXyB2WFWU85NOrm3GPszXiiWd5EI=;
        b=dwVYFScv1+QNAwi6tyDxXXF4kAJWwx7/2jUG1hOXITk7opMwXnPII9ErIB1K741u+h
         ie7CuasiXVAEQOsRiZ2NZ8YcstWPf2KGLWIufnrxvTMcjYH8Hw5mwHcgEq4/I+3U978a
         fPt4YQwhVCzOXVmIe0xrS1sgBjq195OVyrYdazuc5ex9nEyZEYUCfrzhB2O0kLjAOM9w
         9He2FlUWXTBij/EL+aiH0qwRN1Kku+p47gM9kfBYEUoEwu79Og2zWJgclRzHs/5ACi64
         SVsAXDMRD5EJ35gSZmb9FZVOgDwRN6ffmUlTq0Ac5oABZjHUQew+t4KDHwnGCVY9Rrea
         IRfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IQE3OyxOrgbkdas3wLc9WWA+P6ZwYAl5jzf4kZQfh2gfIKU/MQk8LfMzfhOlDWYivkU6Y+/GWzUryjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwlByx9oZTZ37MvhnB5M9AHCc6swDki/utuHDppcdvBh0k08h
	W2owN+5C4+qWfRb8mniVlaCO0JqTbe8Bp5JDoz6jEwMGYJmB4EQ5XcbRNGzXxlEI3CtaaVaVxMF
	zo9V1YKw7M1ILoCWOvCRb4Ihg7wNhrN6WX83JwciOTaFFDyPZujVL2ofwYXNnYdPC
X-Gm-Gg: AfdE7ckfPB41XpJIsTYgA1ttnJm+RpFlCsx+wwfgu46sYEprxX4tQYpYkUzR6oJI0B8
	60cQFODY58BdR0AB1A4kTI/xnralFbFs9EfWzIuTjZPWpWk1/AvF1tdimGl03XlQk34o0ecVjxN
	+tr7JW4nf0O4BBf/+YjMkzQROXMNaDU0o3Skc4YGaqUT7Tpu4ebZsKn+ug0hPc7dfGtClWcCToU
	3nRLIJFEl+6TG1Spc0Ubh6+xtMFZjGKU/4T2/rJn6ApZqV3MUnUgDmgKPoM/y/taw8d9f1M2vUX
	hlurxNTM46lf2UEXZMVJXMiT2TAHOQhjxQdNAaWYu8nBoGtyKAKtZA0QdoO+lfpQaggHnwiQGWv
	vCPpz+eDzfSPQBE28XNvC5y5Svsx/Ta6e
X-Received: by 2002:a05:600c:3781:b0:490:e104:7943 with SMTP id 5b1f17b1804b1-49240e85dd3mr196042595e9.18.1782162532490;
        Mon, 22 Jun 2026 14:08:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3781:b0:490:e104:7943 with SMTP id 5b1f17b1804b1-49240e85dd3mr196042355e9.18.1782162531951;
        Mon, 22 Jun 2026 14:08:51 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923392dsm448971425e9.2.2026.06.22.14.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 14:08:51 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:08:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 2/8] media: virtio: Add virtio-media driver structs
 and function declarations
Message-ID: <20260622170708-mutt-send-email-mst@kernel.org>
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-3-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622204343.1994418-3-briandaniels@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65415-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[responses.to:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06E366B2699

On Mon, Jun 22, 2026 at 04:43:37PM -0400, Brian Daniels wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
> 
> Add the structs and function declarations for the new virtio-media drvier.
> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  drivers/media/virtio/virtio_media.h | 95 +++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 drivers/media/virtio/virtio_media.h
> 
> diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio/virtio_media.h
> new file mode 100644
> index 000000000..52809d4e9
> --- /dev/null
> +++ b/drivers/media/virtio/virtio_media.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> +
> +/*
> + * Virtio-media structures & functions declarations.
> + *
> + * Copyright (c) 2024-2025 Google LLC.
> + */
> +
> +#ifndef __VIRTIO_MEDIA_H
> +#define __VIRTIO_MEDIA_H
> +
> +#include <linux/virtio_config.h>
> +#include <media/v4l2-device.h>
> +
> +#include "protocol.h"
> +
> +#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
> +
> +#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
> +
> +extern char *virtio_media_driver_name;
> +extern bool virtio_media_allow_userptr;
> +
> +/**
> + * struct virtio_media - Virtio-media device.
> + * @v4l2_dev: v4l2_device for the media device.
> + * @video_dev: video_device for the media device.
> + * @virtio_dev: virtio device for the media device.
> + * @commandq: virtio command queue.
> + * @eventq: virtio event queue.
> + * @eventq_work: work to run when events are received on @eventq.
> + * @mmap_region: region into which MMAP buffers are mapped by the host.
> + * @event_buffer: buffer for event descriptors.
> + * @sessions: list of active sessions on the device.
> + * @sessions_lock: protects @sessions and ``virtio_media_session::list``.
> + * @events_lock: prevents concurrent processing of events.
> + * @cmd: union of the device commands "open" and "munmap". The other
> + *       commands are handled by @struct virtio_media_session
> + * @resp: union of responses.to device commands "open" and "munmap". The
> + *        other responses are handled by @struct virtio_media_session
> + * @vlock: serializes access to the command queue.
> + * @wq: waitqueue for host responses on the command queue.
> + */
> +struct virtio_media {
> +	struct v4l2_device v4l2_dev;
> +	struct video_device video_dev;
> +
> +	struct virtio_device *virtio_dev;
> +	struct virtqueue *commandq;
> +	struct virtqueue *eventq;
> +	struct work_struct eventq_work;
> +
> +	struct virtio_shm_region mmap_region;
> +
> +	void *event_buffer;
> +
> +	struct list_head sessions;
> +	struct mutex sessions_lock; /* protects sessions list */
> +
> +	struct mutex events_lock; /* prevents concurrent event processing */
> +
> +	union {
> +		struct virtio_media_cmd_open open;
> +		struct virtio_media_cmd_munmap munmap;
> +	} cmd;
> +
> +	union {
> +		struct virtio_media_resp_open open;
> +		struct virtio_media_resp_munmap munmap;
> +	} resp;


You need DMA alignment padding for these things.

Which one can only see when I reads the actual driver 8 patches down.
Which is why it's not a sensible way to split patches.

A sensible way is to have a driver then add functionality
in logical pieces gradually.


> +
> +	struct mutex vlock; /* serializes command queue access */
> +	wait_queue_head_t wq;
> +};
> +
> +static inline struct virtio_media *
> +to_virtio_media(struct video_device *video_dev)
> +{
> +	return container_of(video_dev, struct virtio_media, video_dev);
> +}
> +
> +/* virtio_media_driver.c */
> +
> +int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
> +			      const size_t out_sgs, const size_t in_sgs,
> +			      size_t minimum_resp_len, size_t *resp_len);
> +void virtio_media_process_events(struct virtio_media *vv);
> +
> +/* virtio_media_ioctls.c */
> +
> +long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
> +			       unsigned long arg);
> +extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
> +
> +#endif // __VIRTIO_MEDIA_H
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog


