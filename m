Return-Path: <linux-media+bounces-67385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wtpPCkdCU2p7ZQMAu9opvQ
	(envelope-from <linux-media+bounces-67385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:29:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A69744109
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UiEnhstT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67385-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67385-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C3E3301A722
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 07:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268AF37186A;
	Sun, 12 Jul 2026 07:28:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46963370D55;
	Sun, 12 Jul 2026 07:28:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841330; cv=none; b=iy5a5bjoXQKwJL1LvhWMTr2m3XW5ilxzk5j+vRREE8WFc955xr5w4RlBqtuDWTwymyfn5KbbB9L7LUjaxtDrL9xylA1KyeQtKvmlB23Hsk5dqM+uoqbVzeWOKIaZxDVnskLaFR3r2aQpkZZyHyNpgrAD6wBuqKCySHcnQzQjkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841330; c=relaxed/simple;
	bh=5BOFacPND8ISS4crT9SHPgUhToi/2xztiD+LMeGDkm0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXYg/rps+4h2w/+i14pZYpnw+PE6/P7mMY4osY4BfYuGJO3IAhoLlA5WRPp4bVg/vwQvRK+ZpX3mvlAHgo8IQ4NN2t/vXIRKj3tHVyXdNE+4S6xl+A+ObfoYtcfpW4Fr56xBgmF++kPYJeKbrTJujcaGs2U6YMXkI3FPUUnOQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiEnhstT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667391F000E9;
	Sun, 12 Jul 2026 07:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783841328;
	bh=IyLG5vUJ5BxzOvkdssoUJgDbAacivAL1j1MZkWc9uFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UiEnhstTiFNFTxFAgLpH5KG4gl3knGP350GUup+JwXBTkNkYzokvasVMbiJUQchv3
	 csLW/F2hC2gxPpDe7rvduVMFl2lWvZRsWSTh/m5bAC3v69rxq7GXobHhM0JKR947TO
	 Iv2op/uipRnIWA5DkMaAQE3L5WWJvFSha0naRwHWoBesBpkOsGlDoTl5ARKy+SgFDQ
	 /Ub42YC82IhAfPh2aiBzV4sv8rmibKgo1G808XZ9pMUjCcFPMSF+1h3InTSTIiOv88
	 IE86JHbpdmW6HA+enuicnw26/fDSUE64XJ4NMxjLdwAFy8339fge1r0vTDLLIeC2TF
	 Tq9puB1E4Y0WA==
Date: Sun, 12 Jul 2026 09:28:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
 adelva@google.com, aesteve@redhat.com, changyeon@google.com,
 daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
 gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mst@redhat.com,
 nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
 xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
Message-ID: <20260712092836.488acb8d@foz.lan>
In-Reply-To: <20260622204343.1994418-2-briandaniels@google.com>
References: <20260622204343.1994418-1-briandaniels@google.com>
	<20260622204343.1994418-2-briandaniels@google.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67385-lists,linux-media=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,foz.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74A69744109

On Mon, 22 Jun 2026 16:43:36 -0400
Brian Daniels <briandaniels@google.com> wrote:

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

As I mentioned on v3, media also has events. Some userspace apps may 
need them to do some optimizations related to buffer sync, source
changes, motion detection and such. See the specs:

	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-dqevent.html#event-type
	https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-event.html

As the virtio driver may end needing such events in the future,
it needs to start numbering its private events after:

	#define V4L2_EVENT_PRIVATE_START                0x08000000

which is where driver-specific events should be placed.

Thanks,
Mauro

