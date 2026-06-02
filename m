Return-Path: <linux-media+bounces-63393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i7wOIz3fHmpfXAAAu9opvQ
	(envelope-from <linux-media+bounces-63393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:48:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482962EA5F
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:48:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GoF7GIve;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63393-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63393-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBC7C31743E6
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B3A3E277E;
	Tue,  2 Jun 2026 13:39:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881EE56A
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407589; cv=none; b=TC9wrO2+4sW8lIIS6ITnCLix9W17z4uWYCTYo+WgF9yRKCi+xYgzrwWOEDn7Ie/Jb4eyjMuXV5eqLyEP5kQdZmrtBWlu/4zjvb/azKu9vUT91LOThqBDn+rWLbRvKMih4CBekL/9rzS63//i892JpCqdq/FlOmX+VAywQCniXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407589; c=relaxed/simple;
	bh=Shm3WcCUfTJQscpuEOQvcmMpkkKSKAbGe6gdJI1yhmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q047OaOxh4iH4WC/bG/j0cZJP13yQLLt+UB+2yYfRCf/lmeMGCCZvcDL2fA9uF8y31ihbJhvOSBgTZDzgKwrJ0oSQTa+O/Gk5G+TaN5gKd1DI2m8Go4yMWYVSdZ5GkGvKfl+Wgk1jeKZt28gRNAU3xQ8v6nU4hH94+01FV+iR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoF7GIve; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629B91F00893;
	Tue,  2 Jun 2026 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407588;
	bh=imegD99WM1DksCH/O7LVjFfKTD/TRWvDDcjjjgYab1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GoF7GIveYn9d1MErmGvemTAG+nOjQjfMuUBVQgv6jABLfkMQoP0pkBEZ6Pn0VSD1R
	 MxWAeFFGrulrqbngFuw4qCX4U6FwTbEY7r6flh85s5d7AuclthwpbiW0GzbgTWyClw
	 /LI+C1lbECtav9osDhqZcN9xazmGvN4a/L7+Kymjot7ka/mHvJSt8H4hw6e5Ye5HeP
	 VNLacE0xncAdp1kIAraQydvoADre7g23vymPbGCsuaWAmD4m3Q39lJ6TPG4Eu8m7JE
	 /H1+alO1EVj/mqYgGY2vM4/MfIzE1rmFPvqIT4EuObYcCfb0tcjiRPhAx4HxPY24j/
	 QQtg96PbmGZ1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] media: stm32: dcmipp: rename bytecap into
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-12-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-12-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:39:48 +0000
Message-Id: <20260602133948.629B91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63393-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,st.com:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3482962EA5F

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver calculates pixel alignment requirements using an unvali=
dated user format, resulting in missed hardware alignment constraints and u=
naligned memory access.
- [Low] Stale comment references the old `dcmipp_bytecap_device` structure =
name.

Pre-existing issues:
- [High] The `dcmipp_capture_start_streaming` function leaks queued buffers=
 if the source subdev cannot be found.
--

commit c041aaac664f7bb802b626e9d71a0c93fba4ced4
Author: Alain Volmat <alain.volmat@foss.st.com>
Subject: media: stm32: dcmipp: rename bytecap into capture

Since the bytecap video driver is now handling all capture (byte & pixel),
rename the file and structs into capture.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.=
c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
[ ... ]
> @@ -371,7 +371,7 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file=
 *file, void *priv,
>  	u32 in_w, in_h;
> =20
>  	/* Don't accept a pixelformat that is not on the table */
> -	if (!dcmipp_bytecap_is_format_valid(vcap, format->pixelformat))
> +	if (!dcmipp_capture_is_format_valid(vcap, format->pixelformat))
>  		format->pixelformat =3D fmt_default.pixelformat;

[Severity: High]
Does this code fail to enforce hardware alignment if the user requests an
invalid format?

When the walign variable is computed at the start of this function, the
user's format->pixelformat hasn't been validated yet. If the format is
invalid, hdw_pixel_alignment() returns 0, leaving walign as 0.=20

When the invalid format is then overridden to fmt_default.pixelformat here,
walign is never recalculated. This allows the subsequent
v4l_bound_align_image() call to use walign =3D 0, which could result in an
unaligned bytesperline and stride.

Could this cause a WARN_ON() in dcmipp_capture_buf_prepare() and unaligned
memory accesses in the DMA engine?

[ ... ]
> @@ -580,7 +580,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_=
queue *vq,
> =20
>  	/*
>  	 * Get source subdev - since link is IMMUTABLE, pointer is cached
> -	 * within the dcmipp_bytecap_device structure
> +	 * within the dcmipp_capture_device structure
>  	 */
>  	if (!vcap->s_subdev) {
>  		pad =3D media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
>  		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>  			return -EINVAL;

[Severity: High]
This is a pre-existing issue, but does this early return leak queued buffer=
s?

According to the videobuf2 API contract, if start_streaming fails, the driv=
er
must return all queued buffers to the QUEUED state so userspace regains
ownership.

If media_pad_remote_pad_first() fails, this code returns -EINVAL directly
instead of going to the err_buffer_done label. This bypasses the cleanup pa=
th
and leaves the buffers stranded in vcap->buffers. Should this return be
changed to jump to a cleanup label?

[ ... ]
> @@ -1130,10 +1130,10 @@ static int dcmipp_name_to_pipe_id(const char *nam=
e)
>  		return -EINVAL;
>  }
> =20
> -struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_nam=
e,
> +struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_nam=
e,
>  						  struct dcmipp_device *dcmipp)
>  {
> -	struct dcmipp_bytecap_device *vcap;
> +	struct dcmipp_capture_device *vcap;
>  	struct device *dev =3D dcmipp->dev;
>  	struct video_device *vdev;
>  	struct vb2_queue *q;
>  	const unsigned long pad_flag =3D MEDIA_PAD_FL_SINK;
>  	int ret =3D 0;
>=20
>  	/* Allocate the dcmipp_bytecap_device struct */

[Severity: Low]
This isn't a bug, but should this comment also be updated to reflect the
new dcmipp_capture_device structure name?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D12

