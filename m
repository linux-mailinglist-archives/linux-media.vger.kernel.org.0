Return-Path: <linux-media+bounces-63554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Tr/HzrwH2qesgAAu9opvQ
	(envelope-from <linux-media+bounces-63554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:13:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A963606C
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:13:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Jl+On8uF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63554-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63554-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84D8307B557
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C4E37754D;
	Wed,  3 Jun 2026 09:07:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E932D12F3;
	Wed,  3 Jun 2026 09:07:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477651; cv=none; b=gFyQLDsiU/KR49hBpMZK38FDBWtrGGw2J2hfCHkEVN8ibfRm3/kpkMdWgQ80pvZUW4CV3y3h6fpIKBCQH1qRtiJQWMcfhYBdc3BU5K/h6VriWwV8/UTZm74QhVCotO1SUm2RxQ1R+U0Y8Nn6vWW9eeTFTbbp/ZAX2karBLznQdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477651; c=relaxed/simple;
	bh=nctRHHM91Q3KfGygv1sBqhdOIKga/wuB4pkU3G09zXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t0plavQx7vvUIdMNrIws94ss0Ge4j9nmHwVFXeYGAHX44yOoam7F/8ojco30vvoCIE69hGQq1VuREm7hq4v4t1jIrym99Hx4DFMq8OqelxoFGLaxnbcx8tP1jV160S25okS1d8WKslty4mWhlpN2mhjUpdp76KSf+Ptw5rHE8J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl+On8uF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4036F1F00893;
	Wed,  3 Jun 2026 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477650;
	bh=DQTwL5So4VqJUGhWgGKdh4W3c6TR4XvB1Lfu7Mv4d1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jl+On8uFAF8grUALQmbWmkrSYYrQ5IDDqDS0cOIS1Iw4xeXFKdybsZkYJ2nB1oswg
	 MeY7llwQ9ZsKyV3JqYM+eQuAvoxK5qPfXbm0MF4CQN0lIO4sXx4eefCLbKxRYbisv5
	 ev+xS56+3zLygRxSVjUYdnnm/8cIwI3pKKYe/RSl/CAQsJtvR9d32SZ7MiiR/a1r5B
	 PHyfV3Gi050EydNqMMCKOhcKjuV0HwhjRIt1h6+5TQgb7pEBrBZasoHONRlzZC7DG4
	 SH9faUiNJRFWkYWateWjAte7JUArF4GrPIi8Mf8F/vQBAEwevTMaz5j+89/ft2zY+9
	 +QYUqh1dR9Zmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/14] media: mediatek: decoder: fill av1 buffer size
 with picinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603084045.17488-14-kyrie.wu@mediatek.com>
References: <20260603084045.17488-14-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 09:07:29 +0000
Message-Id: <20260603090730.4036F1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,mediatek.com:email,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-63554-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D61A963606C

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The C plane buffer size (`vref->c.size`) is completely missing ini=
tialization for reference frames, leaving it as zero in the shared hardware=
 structure.
--

commit a2c9dc4836cf2314c45a5c3f24634d8cb307be25
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: decoder: fill av1 buffer size with picinfo

The buffer size of y and c plane has been calculated in vcp/scp,
and this commit fills each frame buffer size directly using picinfo.

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1811,18 +1811,19 @@ static int vdec_av1_slice_setup_core_buffer(struc=
t vdec_av1_slice_instance *inst
>  {
>  	struct vb2_buffer *vb;
>  	struct vb2_queue *vq;
> -	int w, h, plane, size;
> +	int plane;
>  	int i;
> =20
>  	plane =3D instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
> -	w =3D vsi->frame.uh.upscaled_width;
> -	h =3D vsi->frame.uh.frame_height;
> -	size =3D ALIGN(w, VCODEC_DEC_ALIGNED_64) * ALIGN(h, VCODEC_DEC_ALIGNED_=
64);
> =20
>  	/* frame buffer */
>  	vsi->fb.y.dma_addr =3D fb->base_y.dma_addr;
> +
> +	vsi->fb.y.size =3D instance->ctx->picinfo.fb_sz[0];
> +	vsi->fb.c.size =3D instance->ctx->picinfo.fb_sz[1];
> +
>  	if (plane =3D=3D 1)
> -		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + size;
> +		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + vsi->fb.y.size;
>  	else
>  		vsi->fb.c.dma_addr =3D fb->base_c.dma_addr;

[ ... ]

> @@ -1845,8 +1846,9 @@ static int vdec_av1_slice_setup_core_buffer(struct =
vdec_av1_slice_instance *inst
>  		}
> =20
>  		vref->y.dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +		vref->y.size =3D vsi->fb.y.size;
>  		if (plane =3D=3D 1)
> -			vref->c.dma_addr =3D vref->y.dma_addr + size;
> +			vref->c.dma_addr =3D vref->y.dma_addr + vsi->fb.y.size;
>  		else
>  			vref->c.dma_addr =3D vb2_dma_contig_plane_dma_addr(vb, 1);
>  	}

[Severity: High]
Are we missing an assignment for vref->c.size here?

Earlier in vdec_av1_slice_setup_core_buffer(), vsi->fb.c.size is explicitly
initialized, but here for the reference frames only vref->y.size is assigne=
d.

Because the underlying vsi structure is backed by zero-initialized memory,
the C plane size for all reference frames will be left as zero.

Could this missing initialization cause visual corruption or trigger a
coprocessor fault when the firmware uses these reference buffer sizes for D=
MA
configuration and bounds checking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D13

