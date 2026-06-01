Return-Path: <linux-media+bounces-63251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI3kGneAHWpZbQkAu9opvQ
	(envelope-from <linux-media+bounces-63251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:52:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C453061F94F
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ABCA30269CA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDA33769E0;
	Mon,  1 Jun 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aktPVIFE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A5246770
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318244; cv=none; b=nz/W3j9d+MBAAD5GwZTsMH5Pr1Lm/WZ4l90RCh3Lc4G5NOFnnSzP2v7t+9LBOl+MOs3KFnzR2Z93tXSX8qw6Gi3WEkaALuy+VbKMMzcz7Qip7V5tcFBpeU93AJ2I4LJkt/PGwY73rG1OsvbPnf6+QN/20bQ7L6liX9M0MmVisdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318244; c=relaxed/simple;
	bh=2JdcsyaEGGrOr8N99JHUsI3L5YXJXhPMIQjnaWuvxSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e3UdHdL4CP8deGAKKt7EuoFScg5PGCO3IJjmlDhgfGAtyfDTIqKhhl7oV3Rt3r+1KmU6FGGLy8AFuwtXFDzHbvuMXwtOKHvNDFEBw46mAytOcK8JFNMnOx6gT0Ms3N29hdoLDq7Slm/gAqB9BnAamXhlsdsIb0jSg6ux1+vl+8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aktPVIFE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15CE1F00893;
	Mon,  1 Jun 2026 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318242;
	bh=bCDoeltTH/cH+7qfZRWm9u97ayPTsUMkpPQ+HNass+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aktPVIFEdUjvniiy5CK+EUizbEFhsz1IPLbfsZlrNBuekcvokYTc+eKgCtNfiMNj9
	 uzrDQY4VexpLHQFFuOnGkX/66sXatIl9jI15m81Lyh8suqFx88OskYfbS0UH6+Ut3y
	 QbeNaM9eZFalxvNLnwwedstB/ynMVY50BTlVJHYjh68ylDRwa2achsiK2l7LIczJkZ
	 CILUyg01RdKv2zIYidh8p3dZuN7E481CUcezpGLvxDGlifMp/hICF2Uki6jzsVIjjP
	 Z21f6iGxbOGlAYkxrThPA86sPEA6RUwt8kYGcyRK/lha3HF0AoKpZSKkNYYX1c9tfH
	 wIj26MZ2gTS3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: vicodec: fix out-of-bounds write on capture
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junrui Luo" <moonafterrain@outlook.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <SYBPR01MB7881A4E2AC434488ABFA775CAF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB7881A4E2AC434488ABFA775CAF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 12:50:42 +0000
Message-Id: <20260601125042.A15CE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63251-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:email,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: C453061F94F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Lockless iteration over queue buffers in device_process() can =
race with VIDIOC_REMOVE_BUFS, leading to a Use-After-Free.
--

commit a2993f206927bcf1dd8329afeff59be102417b4f
Author: Junrui Luo <moonafterrain@outlook.com>

media: vicodec: fix out-of-bounds write on capture buffer

This commit fixes an out-of-bounds write on the capture buffer by guarding
the decode site in device_process() against the sizeimage of the destinatio=
n.

> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/=
media/test-drivers/vicodec/vicodec-core.c
> index 318e8330f16ae..2950d42c8c639 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -321,6 +321,8 @@ static int device_process(struct vicodec_ctx *ctx,

[Severity: Critical]
This is a pre-existing issue, but could the lockless iteration over queue
buffers earlier in device_process() race with VIDIOC_REMOVE_BUFS and cause
a use-after-free?

When acting as a stateless decoder processing a P-frame, device_process()
finds the reference frame without holding the queue lock:

device_process() {
    ...
    ref_vb2_buf =3D vb2_find_buffer(vq_cap, ctx->state.ref_frame_ts);
    if (!ref_vb2_buf)
        ...
    if (ref_vb2_buf->state =3D=3D VB2_BUF_STATE_ERROR)
}

And vb2_find_buffer() iterates through q->bufs and dereferences pointers:

drivers/media/common/videobuf2/videobuf2-v4l2.c:vb2_find_buffer() {
    for (i =3D 0; i < q->max_num_buffers; i++) {
        vb2 =3D vb2_get_buffer(q, i);
        if (!vb2)
            continue;
        if (vb2->copied_timestamp && vb2->timestamp =3D=3D timestamp)
            return vb2;
    }
}

Since device_process() operates locklessly in the m2m worker thread,
if userspace concurrently triggers VIDIOC_REMOVE_BUFS on a dequeued
reference buffer, vb2_core_remove_bufs() will acquire the queue lock and
free the memory.

Can this lead to the kernel reading a freed vb2_buffer struct and
accessing its memory planes?

>  		q_dst =3D get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  		if (comp_frame_size > ctx->comp_max_size)
>  			return -EINVAL;
> +		if (vb2_plane_size(&dst_vb->vb2_buf, 0) < q_dst->sizeimage)
> +			return -EINVAL;
>  		state->info =3D q_dst->info;
>  		ret =3D v4l2_fwht_decode(state, p_src, p_dst);
>  		if (ret < 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/SYBPR01MB7881A4E2AC=
434488ABFA775CAF152@SYBPR01MB7881.ausprd01.prod.outlook.com?part=3D1

