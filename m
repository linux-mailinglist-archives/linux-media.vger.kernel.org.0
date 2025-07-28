Return-Path: <linux-media+bounces-38593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFEB142E3
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 22:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0F53542C6A
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 20:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E39C274670;
	Mon, 28 Jul 2025 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xk+exa4K"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56E217F23;
	Mon, 28 Jul 2025 20:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734160; cv=none; b=HIJ5u45wrGl90O55EklR+wprEzaBQT+SOdctE9kQfE8YCuFpflLb+kFX6SBnXoenfwgu4/KWq+E65PeKDwa+Ta3WmA83lz22mIbolcR7ngxpQ+xBpP42kQdyDiKU9AgqOjm38cJ30igYKAR0k7/gWBnIAkV06V4A/yuOtnIAbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734160; c=relaxed/simple;
	bh=kHf9urtE6dhy3OGMYKIpupIQffnnwOTxLGJgRdWr7OU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pk4rFxOlX9Mbvy2l4BjU/Thwcvh8jlvHIsCSgHP2W5IueGL1EWC261KRhgA+LA16S/3maQ8cirubyB6pI1rJoHvdSNK/qoNCsQq++P8FjdeHZTzKdHuCjhS5J2N1HksL4DB8pGaBPq9I/rEeCtog00ew8JGxeCXCoLLR2Fn0x5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xk+exa4K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753734156;
	bh=kHf9urtE6dhy3OGMYKIpupIQffnnwOTxLGJgRdWr7OU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Xk+exa4KMs7J1kipivohRSl/HGbJ2fsmhK/R+5H3q0OE7nxir3RDNDP0z4adNx5l2
	 dcqvXXQv6GARnoKnpZpSpIhdy2J2NT8ujdBxvh+iSWYtfi59GbVOs23a0k5odlkFbX
	 EvLgws3tlGfTpM0cqWM9r8124VqsFl0iPeFu9tZdQKhYwT/gH6WTIoMCGbHXBXiZmc
	 k+8r0M4KIppVWWUz0nGeeoIxpbGrQWTMyxnn/M6Y62R7RhJOC+UoB+lp/HKvQ9VDwt
	 Ol1D9+RYptCF75n2qAwgv+nWKfR9sOxDemIipoZri+9V02fsggOQY1xreRQEXjy+Jm
	 HKTqG9WWpXH2w==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E513817E11FE;
	Mon, 28 Jul 2025 22:22:34 +0200 (CEST)
Message-ID: <75207b49155acaa83e2ed0182fd1a78a9242aab7.camel@collabora.com>
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: detlev.casanova@collabora.com, heiko@sntech.de, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	mchehab@kernel.org, nicolas.frattaroli@collabora.com, jonas@kwiboo.se, 
	benjamin.gaignard@collabora.com
Date: Mon, 28 Jul 2025 16:22:32 -0400
In-Reply-To: <20250718093746.631072-1-liujianfeng1994@gmail.com>
References: <20250714144610.258372-1-liujianfeng1994@gmail.com>
	 <20250718093746.631072-1-liujianfeng1994@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-JxB+zX8IA3mywv/uYbEy"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-JxB+zX8IA3mywv/uYbEy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 18 juillet 2025 =C3=A0 17:37 +0800, Jianfeng Liu a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> On Mon, 14 Jul 2025 22:46:10 +0800, Jianfeng Liu wrote:
> > You are right, the code of chromium should be fixed for frame size type
> > V4L2_FRMSIZE_TYPE_CONTINUOUS.
>=20
> I have just sent a cr at chromium[1] to fix this.
>=20
> > I have checked that this issue is not introduced by your series. After
> > reverting this commit[2] which adds Support High 10 and 4:2:2 profiles,
> > chromium can play video well on rk3399. I will investigate further.
>=20
> I found that this issue is caused by this code block[2]. Before adding
> .get_image_fmt, rkvdec_s_ctrl will just return 0. But now when detecting
> image format change(usually from RKVDEC_IMG_FMT_ANY to real video format
> like RKVDEC_IMG_FMT_420_8BIT), it will return -EBUSY, then I get green
> frame at chromium.
>=20
> After taking a look at hantro's code, I find that it is not necessary to
> let .s_ctrl return -EBUSY when format changes, here is a commit[3]
> disabling this check in hantro_set_fmt_cap. I have written a patch that
> can fix my issue with chromium, you can see it at the bottom of my mail.
>=20
> [1] https://chromium-review.googlesource.com/c/chromium/src/+/6767118
> [2]
> https://github.com/torvalds/linux/blob/v6.16-rc6/drivers/staging/media/rk=
vdec/rkvdec.c#L143-L146
> [3]
> https://github.com/torvalds/linux/commit/bbd267daf4fc831f58bf4a2530a8b648=
81779e6a
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 5d86fb7cdd6..7800d159fad 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -185,7 +185,6 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0	struct rkvdec_ctx *ctx =3D container_of(ctrl->handler, struct
> rkvdec_ctx, ctrl_hdl);
> =C2=A0	const struct rkvdec_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> =C2=A0	enum rkvdec_image_fmt image_fmt;
> -	struct vb2_queue *vq;
> =C2=A0
> =C2=A0	/* Check if this change requires a capture format reset */
> =C2=A0	if (!desc->ops->get_image_fmt)
> @@ -193,11 +192,6 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0
> =C2=A0	image_fmt =3D desc->ops->get_image_fmt(ctx, ctrl);
> =C2=A0	if (rkvdec_image_fmt_changed(ctx, image_fmt)) {
> -		vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> -		if (vb2_is_busy(vq))
> -			return -EBUSY;
> -

Hantro driver have extra code to protect against the fact that the queue fo=
rmat
may not match the currently allocated buffer size. This change alone seems
unsafe and may allow tricking the driver into buffer overflow. It believe s=
ome
further thought and care need to be put into this.

Nicolas

> =C2=A0		ctx->image_fmt =3D image_fmt;
> =C2=A0		rkvdec_reset_decoded_fmt(ctx);
> =C2=A0	}

--=-JxB+zX8IA3mywv/uYbEy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaIfcCAAKCRBxUwItrAao
HKJ9AJ9lIeksQ/frtYIbyb7342kuZLSytQCeIu9nWl2kX0opPHtm8enN8Fx5jFo=
=1i09
-----END PGP SIGNATURE-----

--=-JxB+zX8IA3mywv/uYbEy--

