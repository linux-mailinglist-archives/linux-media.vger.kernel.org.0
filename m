Return-Path: <linux-media+bounces-65414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rJGKdKjOWqUvwcAu9opvQ
	(envelope-from <linux-media+bounces-65414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:06:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EAB6B2678
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=hhjQeZDK;
	dkim=pass header.d=redhat.com header.s=google header.b=X6Pj7CYI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65414-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65414-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C85483022635
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 21:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726E3366051;
	Mon, 22 Jun 2026 21:06:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D44C3612F1
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 21:06:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782162362; cv=none; b=emtxRQPZUquDYTCuQO79NHRkFxE/5di31B6J4RiWy0vyr732OQx0mNkuMJCOeqxEbe7fmVR2KYFSypxMpwKnWFRI1V79Fr1n23AaGkOZVzkzvUAgUw8N/YQ4Z74F9/NP5c1uq7SGjxWaGFWKxlDfxTOSgQ3J5G1a6FeRWQeo+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782162362; c=relaxed/simple;
	bh=ELtXDgzXDc4ztjBq0AL0MrkCE7z1bTC3DcJes+5F9Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0ZGW71rTVW/Ig9XXfbkDnNlv8Bk1w2xIaYkssgfZj8GZOMAcGVNLrKTODNw4y77NSepbFHo4HovOPuNS1YDF8C+gl1HJeVafwu2ilmBe+LWU5xATOzaixPBLcKsk8QJ4+FNKsMeCl5SFntCI+VuvTsOUcWwZwPOSjXkTu/NLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhjQeZDK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X6Pj7CYI; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782162360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRcHobRBo9S79KO2uBGZWMFjZxC0rmFjmqFckJpRniw=;
	b=hhjQeZDKKOCqSPbRcuCTlqaBvhwatQgWq0Y/AeB3DBpdsJg7ffqTZ7EL22RB9U+492/O0v
	u1NHet9fl0dpKboIbBIG8yiBxbL4PbEe9Xo0LsxjWRpwXH4mQRBaw0GtmuvGYVNp3O+Q+f
	Rn7+zsJ9SV3x1CIEM3fTPS+VklGr9pI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-Iprg9A4bNQmL29OYwCV5xA-1; Mon, 22 Jun 2026 17:05:58 -0400
X-MC-Unique: Iprg9A4bNQmL29OYwCV5xA-1
X-Mimecast-MFC-AGG-ID: Iprg9A4bNQmL29OYwCV5xA_1782162358
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4923d2f0dedso19828155e9.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782162357; x=1782767157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRcHobRBo9S79KO2uBGZWMFjZxC0rmFjmqFckJpRniw=;
        b=X6Pj7CYIwUMNbZezkQCGPj/8ZEQ3kdGg5ypuOukv0pLqiSaaOXXdjNQ+vKF0iZBMCJ
         eeaj/mfVPa7oA4p85svlVWmJMlNfmhaYDmLmF5sHK8sp15AwoHSPItLYY3V7uyEkYHIA
         UGjihkcOyqBQQaUsjLviICAVk8y7pvjmIf/G9ov+ZfsI9BjLFiZnlH+WtjMCYVpLPQ7J
         KmhfiLkEV3or31qUOU4ZU/GRm6NgzE9tl8+bvGhPKrbofD0qXbKmvm4zLqmz7bkUKPhJ
         WzglzzSdEaKxmqyjrLvDOsOBvKViNRl3E2jU1FsYkTyjL+XUduiUDfVYXzsOJxtVzgXi
         KwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782162357; x=1782767157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRcHobRBo9S79KO2uBGZWMFjZxC0rmFjmqFckJpRniw=;
        b=qZk5efnTu8LlgNdskpAFETBvzf/XLzR+ZP00yamNTcoWMJU/QpSAjBvMDtzRHhRr1D
         1NOL83wQRhV74y+oohnvQBE3/K6yxl4OAz28XxojLb7992iuOlqc0OfwVeNrxDgblVrv
         7bq9tdQx61ZCXgBoFEPd3NC6O88nIKPSqILC9lYz2/zosr9kJTbSUI2VNlo5Ii5UQaMz
         MCV1b5jOEC2qK6khzNWQhffrVWpcRGamizAkZLjZH87YdGzd6eCYxUmCpPkI4hbfwoCb
         eExQijfHXe7w2PrEOccqcJz1KqTJ/vWpQz0FAiHl60iEJE19AaAfmkNILgYKiqeoXxvl
         +REw==
X-Forwarded-Encrypted: i=1; AFNElJ8+MmgORV7MWi9KqZSKP9NxvEv4T56QxY7Iz4hUkRnBk8e9mrKhqnCzhynPeUNKOivbw4IGJRCIGKLYiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOgDtLNL/CiJYE7eLHoDtkATThCVtvuggSsJWWnK+7pndJRfmd
	iqXxhKbgs6KzGZCzQegynFGZhj+TNUprgyG9jbNH0M1lwVt7VD4dhMISZ0q0vA7/661Btwwnh6Y
	b+f2QB6Nxl2ytOELxKsYZDHP+AHP5coChAUVN0I33aNzVhy0TVhIpZK0gM0nf5xW6
X-Gm-Gg: AfdE7cmNolx63Y+1vyIQORG+b3fwm/tS6R0Fh+VYP9k7/YNpIuRt8UGnf9zCuieufWs
	Zq0S3tMvLTZCJKazPy8R/6BSn+R2X/CAoMOqc5PtMYLi2/bwRDWiP/eXK+W7chmp5G3UduRiQ/8
	bUrwD74fRtgcb7CZBZI/Oxd0d8rP9n5OD1YXpVjMXutwiaS30z1RczTDnwWbda+DS6uOCka0emU
	iUMPVT0yYgxfGKZTLbvsmLZvxXkyqWIBOqiJLWiX2rjWnEkyVbZnvn3e/ao6zpkKi/pt+/oRXIH
	eCYM5P1UnWgLBYfzjFTNmVHUaeQGvm4DIQ8WECs4PQTzHHThsPPkebbGk6Nb+EnbYxoc6JxLDTL
	Bo5rgyfTaQVTpILBdTq0uj8XMC7xe9u4b
X-Received: by 2002:a05:600c:4f43:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49242592576mr225914005e9.30.1782162357499;
        Mon, 22 Jun 2026 14:05:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4f43:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49242592576mr225913575e9.30.1782162356953;
        Mon, 22 Jun 2026 14:05:56 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm350682075e9.14.2026.06.22.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 14:05:56 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:05:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
Message-ID: <20260622170054-mutt-send-email-mst@kernel.org>
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-2-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622204343.1994418-2-briandaniels@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65414-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oasis-open.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03EAB6B2678

On Mon, Jun 22, 2026 at 04:43:36PM -0400, Brian Daniels wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
> 
> Add the identifiers and structs used to implement the virtio interface
> as described in section 5.22 of version 1.4 of the virtio spec:
> 
> https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-82200022
> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>


Please put this under include/uapi/linux/virtio_media.h

we treat guest/host ABI similar to kernel/user ABI,
and tools know how to find it there.



> ---
>  drivers/media/virtio/protocol.h | 287 ++++++++++++++++++++++++++++++++
>  1 file changed, 287 insertions(+)
>  create mode 100644 drivers/media/virtio/protocol.h
> 
> diff --git a/drivers/media/virtio/protocol.h b/drivers/media/virtio/protocol.h
> new file mode 100644
> index 000000000..5878d107c
> --- /dev/null
> +++ b/drivers/media/virtio/protocol.h
> @@ -0,0 +1,287 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
> +
> +/*
> + * Definitions of virtio-media protocol structures.
> + *
> + * Copyright (c) 2024-2025 Google LLC.
> + */
> +
> +#ifndef __VIRTIO_MEDIA_PROTOCOL_H
> +#define __VIRTIO_MEDIA_PROTOCOL_H
> +
> +#include <linux/videodev2.h>
> +#include <linux/bits.h>
> +
> +/*
> + * Virtio protocol definition.
> + */
> +
> +/**
> + * struct virtio_media_cmd_header - Header for all virtio-media commands.
> + * @cmd: one of VIRTIO_MEDIA_CMD_*.
> + * @__reserved: must be set to zero by the driver.
> + *
> + * This header starts all commands from the driver to the device on the
> + * commandq.
> + */
> +struct virtio_media_cmd_header {
> +	u32 cmd;
> +	u32 __reserved;
> +};
> +
> +/**
> + * struct virtio_media_resp_header - Header for all virtio-media responses.
> + * @status: 0 if the command was successful, or one of the standard Linux error
> + * codes.
> + * @__reserved: must be set to zero by the device.
> + *
> + * This header starts all responses from the device to the driver on the
> + * commandq.
> + */
> +struct virtio_media_resp_header {
> +	u32 status;
> +	u32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
> + *
> + * This is the equivalent of calling `open` on a V4L2 device node. Upon
> + * success, a session id is returned which can be used to perform other
> + * commands on the session, notably ioctls.
> + */
> +#define VIRTIO_MEDIA_CMD_OPEN 1
> +
> +/**
> + * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_OPEN.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
> + */
> +struct virtio_media_cmd_open {
> +	struct virtio_media_cmd_header hdr;
> +};
> +
> +/**
> + * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CMD_OPEN.
> + * @hdr: header containing the status of the command.
> + * @session_id: if hdr.status == 0, contains the id of the newly created
> + *              session.
> + * @__reserved: must be set to zero by the device.
> + */
> +struct virtio_media_resp_open {
> +	struct virtio_media_resp_header hdr;
> +	u32 session_id;
> +	u32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
> + *
> + * This is the equivalent of calling `close` on a previously opened V4L2
> + * session. All resources associated with this session will be freed and the
> + * session ID shall not be used again after queueing this command.
> + *
> + * This command does not require a response from the device.
> + */
> +#define VIRTIO_MEDIA_CMD_CLOSE 2
> +
> +/**
> + * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD_CLOSE.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
> + * @session_id: id of the session to close.
> + * @__reserved: must be set to zero by the driver.
> + */
> +struct virtio_media_cmd_close {
> +	struct virtio_media_cmd_header hdr;
> +	u32 session_id;
> +	u32 __reserved;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
> + *
> + * This command asks the device to run one of the `VIDIOC_*` ioctls on the
> + * active session.
> + *
> + * The code of the ioctl is extracted from the VIDIOC_* definitions in
> + * `videodev2.h`, and consists of the second argument of the `_IO*` macro.
> + *
> + * Each ioctl has a payload, which is defined by the third argument of the
> + * `_IO*` macro defining it. It can be writable by the driver (`_IOW`), the
> + * device (`_IOR`), or both (`_IOWR`).
> + *
> + * If an ioctl is writable by the driver, it must be followed by a
> + * driver-writable descriptor containing the payload.
> + *
> + * If an ioctl is writable by the device, it must be followed by a
> + * device-writable descriptor of the size of the payload that the device will
> + * write into.
> + *
> + */
> +#define VIRTIO_MEDIA_CMD_IOCTL 3
> +
> +/**
> + * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD_IOCTL.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
> + * @session_id: id of the session to run the ioctl on.
> + * @code: code of the ioctl to run.
> + */
> +struct virtio_media_cmd_ioctl {
> +	struct virtio_media_cmd_header hdr;
> +	u32 session_id;
> +	u32 code;
> +};
> +
> +/**
> + * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_CMD_IOCTL.
> + * @hdr: header containing the status of the ioctl.
> + */
> +struct virtio_media_resp_ioctl {
> +	struct virtio_media_resp_header hdr;
> +};
> +
> +/**
> + * struct virtio_media_sg_entry - Description of part of a scattered guest
> + *                                memory.
> + * @start: start guest address of the memory segment.
> + * @len: length of this memory segment.
> + * @__reserved: must be set to zero by the driver.
> + */
> +struct virtio_media_sg_entry {
> +	u64 start;
> +	u32 len;
> +	u32 __reserved;
> +};
> +
> +#define VIRTIO_MEDIA_MMAP_FLAG_RW BIT(0)


Suggest just creating macros for bit numbers.
Users will either use BIT or whatever they want.

> +
> +/**
> + * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the driver's
> + * address space.
> + *
> + */
> +#define VIRTIO_MEDIA_CMD_MMAP 4
> +
> +/**
> + * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_MMAP.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
> + * @session_id: ID of the session we are mapping for.
> + * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
> + * @offset: mem_offset field of the plane to map, as returned by
> + *          VIDIOC_QUERYBUF.
> + */
> +struct virtio_media_cmd_mmap {
> +	struct virtio_media_cmd_header hdr;
> +	u32 session_id;
> +	u32 flags;
> +	u32 offset;
> +};
> +
> +/**
> + * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CMD_MMAP.
> + * @hdr: header containing the status of the command.
> + * @driver_addr: offset into SHM region 0 of the start of the mapping.
> + * @len: length of the mapping.
> + */
> +struct virtio_media_resp_mmap {
> +	struct virtio_media_resp_header hdr;
> +	u64 driver_addr;
> +	u64 len;
> +};
> +
> +/**
> + * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped using
> + * VIRTIO_MEDIA_CMD_MMAP.
> + */
> +#define VIRTIO_MEDIA_CMD_MUNMAP 5
> +
> +/**
> + * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CMD_MUNMAP.
> + * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
> + * @driver_addr: offset into SHM region 0 at which the buffer has been
> + *               previously
> + * mapped.
> + */
> +struct virtio_media_cmd_munmap {
> +	struct virtio_media_cmd_header hdr;
> +	u64 driver_addr;
> +};
> +
> +/**
> + * struct virtio_media_resp_munmap - Device response for
> + *                                   VIRTIO_MEDIA_CMD_MUNMAP.
> + * @hdr: header containing the status of the command.
> + */
> +struct virtio_media_resp_munmap {
> +	struct virtio_media_resp_header hdr;
> +};
> +
> +/* The values for these events are set by the virtio-media specification. */
> +#define VIRTIO_MEDIA_EVT_ERROR 0
> +#define VIRTIO_MEDIA_EVT_DQBUF 1
> +#define VIRTIO_MEDIA_EVT_EVENT 2
> +
> +/**
> + * struct virtio_media_event_header - Header for events on the eventq.
> + * @event: one of VIRTIO_MEDIA_EVT_*
> + * @session_id: ID of the session the event applies to.
> + */
> +struct virtio_media_event_header {
> +	u32 event;
> +	u32 session_id;
> +};
> +
> +/**
> + * struct virtio_media_event_error - Unrecoverable device-side error.
> + * @hdr: header for the event.
> + * @errno: error code describing the kind of error that occurred.
> + * @__reserved: must to set to zero by the device.
> + *
> + * Upon receiving this event, the session mentioned in the header is considered
> + * corrupted and closed.
> + *
> + */
> +struct virtio_media_event_error {
> +	struct virtio_media_event_header hdr;
> +	u32 errno;
> +	u32 __reserved;
> +};
> +
> +/* This is set to VIDEO_MAX_PLANES defined in include/uapi/linux/videodev2.h.
> + * It is renamed here to match the constant that is defined in the virtio-media
> + * specification.
> + */
> +#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
> +
> +/**
> + * struct virtio_media_event_dqbuf - Dequeued buffer event.
> + * @hdr: header for the event.
> + * @buffer: struct v4l2_buffer describing the buffer that has been dequeued.
> + * @planes: plane information for the dequeued buffer.
> + *
> + * This event is used to signal that a buffer is not being used anymore by the
> + * device and is returned to the driver.
> + */
> +struct virtio_media_event_dqbuf {
> +	struct virtio_media_event_header hdr;
> +	struct v4l2_buffer buffer;
> +	struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
> +};
> +
> +/**
> + * struct virtio_media_event_event - V4L2 event.
> + * @hdr: header for the event.
> + * @event: description of the event that occurred.
> + *
> + * This event signals that a V4L2 event has been emitted for a session.
> + */
> +struct virtio_media_event_event {
> +	struct virtio_media_event_header hdr;
> +	struct v4l2_event event;
> +};
> +
> +/* Maximum size of an event. We will queue descriptors of this size on the
> + * eventq.
> + */
> +#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event_dqbuf)
> +
> +#endif // __VIRTIO_MEDIA_PROTOCOL_H
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog


