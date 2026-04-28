Return-Path: <linux-media+bounces-59887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCftDYgN8Wn1cAEAu9opvQ
	(envelope-from <linux-media+bounces-59887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:42:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835148B3E9
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F917305761A
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C0338BF75;
	Tue, 28 Apr 2026 19:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O2Jrx7eg"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC32EA498;
	Tue, 28 Apr 2026 19:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405269; cv=none; b=hRtMksGjrL4cGXS+WiGqgzXd7UXlljTYCjnCsojJ69t9LCzVtKvYGRJCZK+xYtjuaA3ngOGEJdXnTro+19b3zeVx6Hv2eEFCc8bBn48gctzHrm1b1uSYUI0wiHyRCKEHkxP6k77LbLYIfo5VkOAYer4C8u87c1/iWjnopBml9AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405269; c=relaxed/simple;
	bh=OLk9eY4xezvz9+DAPYOerAqqqeIZ4b5yBW/4U6YrOg8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwUwKe3eIvm3BYTAJjOo4psVJnjKJqR8A0MOj5H76ExaMpyLNTEDvbhfLuLC1TBiLjriZI5nZgVKW6tMqWozQpclk7XYqADAkc/Xs4i3cckur+47OVh93Tkz9ahIPTR+/sxwgHFnZR16ebh9U8mDuVZpixRkWqw7IQ6pC61X95Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O2Jrx7eg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777405265;
	bh=OLk9eY4xezvz9+DAPYOerAqqqeIZ4b5yBW/4U6YrOg8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O2Jrx7eg+ftQqnxrsrTNhEJR47eXRhP/ArA+uPDT4ddmag/Wv19rFga4TyoqjJpyR
	 VY/GxjOWjBxDhZxGZckggl0B981VF6cteS6VsbSa7+all6ngTP5y5ekdVKcaCIGSPU
	 0I8uC/yTucPTeE/PddfV0QWMUc33Clmu+YWFDm2rS+WGIMb/5grU7QbPmIFahGOr/e
	 y4xqP9PzqR/q1VFaLwQ4GsnV563OsNL+T5YyYiV31Xr3Sw0SPyTK0zdl5dnOlWyDN3
	 BB45e1A6CHqo4L/2Da2u+zOt004uRfD9e4cZfieB8tpCu3ICifzzfj6fmc/1H/YSXj
	 +IktcUs+icVJw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 506E017E0615;
	Tue, 28 Apr 2026 21:41:03 +0200 (CEST)
Message-ID: <b5edc1a6931a3b9f63d53c8267ea2117fd690471.camel@collabora.com>
Subject: Re: [PATCH 11/11] media: hantro: Add fdinfo callback
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi	 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, 	kernel@collabora.com
Date: Tue, 28 Apr 2026 15:41:02 -0400
In-Reply-To: <20260212162328.192217-12-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-12-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mPo9ivf2B9N/Jc9BUcpD"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8835148B3E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59887-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--=-mPo9ivf2B9N/Jc9BUcpD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> The fdinfo shows the number of buffers in each queue and the total amount
> of video buffer memory.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Notice that the FD info is not linked with all the ftrace work, and could h=
ave
been kept separate. I think overall that this fdinfo implementation is a bi=
t
limited, and lack helpers or introducing of common statistics that would be
opted in by other drivers. I would hold on that until we have a bigger and
robust plan.

Nicolas

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/verisilicon/hantro_drv.c=C2=A0 | 15 ++++++++=
+++++++
> =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 10 +++++++++-
> =C2=A03 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h
> b/drivers/media/platform/verisilicon/hantro.h
> index d5cddc783688..9e9fc0658586 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -268,6 +268,7 @@ struct hantro_ctx {
> =C2=A0	const struct hantro_codec_ops *codec_ops;
> =C2=A0	struct hantro_postproc_ctx postproc;
> =C2=A0	bool need_postproc;
> +	u64 stats_buf_memory;
> =C2=A0
> =C2=A0	/* Specific for particular codec modes. */
> =C2=A0	union {
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c
> b/drivers/media/platform/verisilicon/hantro_drv.c
> index 8dd26ca32459..86d316a8a3e8 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/pm.h>
> =C2=A0#include <linux/pm_runtime.h>
> +#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <linux/workqueue.h>
> @@ -711,6 +712,19 @@ static int hantro_release(struct file *filp)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void hantro_show_fdinfo(struct seq_file *m, struct file *filp)
> +{
> +	struct hantro_ctx *ctx =3D
> +		container_of(filp->private_data, struct hantro_ctx, fh);
> +
> +	struct vb2_queue *src_q =3D v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
> +	struct vb2_queue *dst_q =3D v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
> +
> +	seq_printf(m, "src-queued-count: %04u\n", src_q->queued_count);
> +	seq_printf(m, "dst-queued-count: %04u\n", dst_q->queued_count);
> +	seq_printf(m, "buf-size: %llu\n", ctx->stats_buf_memory);
> +}
> +
> =C2=A0static const struct v4l2_file_operations hantro_fops =3D {
> =C2=A0	.owner =3D THIS_MODULE,
> =C2=A0	.open =3D hantro_open,
> @@ -718,6 +732,7 @@ static const struct v4l2_file_operations hantro_fops =
=3D {
> =C2=A0	.poll =3D v4l2_m2m_fop_poll,
> =C2=A0	.unlocked_ioctl =3D video_ioctl2,
> =C2=A0	.mmap =3D v4l2_m2m_fop_mmap,
> +	.show_fdinfo =3D hantro_show_fdinfo,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_hantro_match[] =3D {
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index fcf3bd9bcda2..6d129613ea3d 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -820,18 +820,26 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned i=
nt
> *num_buffers,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> +	ctx->stats_buf_memory =3D 0;
> +
> =C2=A0	if (*num_planes) {
> =C2=A0		if (*num_planes !=3D pixfmt->num_planes)
> =C2=A0			return -EINVAL;
> -		for (i =3D 0; i < pixfmt->num_planes; ++i)
> +		for (i =3D 0; i < pixfmt->num_planes; ++i) {
> =C2=A0			if (sizes[i] < pixfmt->plane_fmt[i].sizeimage)
> =C2=A0				return -EINVAL;
> +			ctx->stats_buf_memory +=3D pixfmt-
> >plane_fmt[i].sizeimage;
> +		}
> +
> +		ctx->stats_buf_memory *=3D *num_buffers;
> +
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> =C2=A0	*num_planes =3D pixfmt->num_planes;
> =C2=A0	for (i =3D 0; i < pixfmt->num_planes; ++i)
> =C2=A0		sizes[i] =3D pixfmt->plane_fmt[i].sizeimage;
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

--=-mPo9ivf2B9N/Jc9BUcpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafENTgAKCRDZQZRRKWBy
9BsUAP9keTpZV1Y5F4NDekycFkwncQ+O5HeqmyFBR0miRmeESwD+MCMHlCAyPRsd
wcOQ8R0TcqNfmy46huIbDq7Nt3JFwA0=
=DWyo
-----END PGP SIGNATURE-----

--=-mPo9ivf2B9N/Jc9BUcpD--

