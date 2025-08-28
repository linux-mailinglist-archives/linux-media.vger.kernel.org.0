Return-Path: <linux-media+bounces-41284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370BB3AA38
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 20:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 955CC7BA0B1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B58D280A5E;
	Thu, 28 Aug 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yo40kvN5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C0277C84;
	Thu, 28 Aug 2025 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406778; cv=none; b=AucUEtqjj6b2svKkgq88q43hT/vIdYTxF27zvXDbGwcANExn04oLa8lJdio8CNYAwEovb8zZzq9Md0pBcwJPUcnkHnm/Ssmp0vH9hVWoS4Fri6gbz1hTOSW7x7ILotW3GybRbDssEb8nABjCeU2mxur2aXV6WWvuG5SbxcFdnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406778; c=relaxed/simple;
	bh=TNn85gzNofrDwGqDuyZxKxtM8jgfBV7+bFFQD86FPfY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JkH2wVFrZeHK/0tSFky0+QqxnH10zpO4fNPFIO6JQ+ik7uRSpWtY/b/d9f1Tu5rV+orxFyiQzn5WhQvNNpqw8ZWnie5rcJCoiI3gRjw5Nr+HKX6+pQ3tatRbgbnL7GkKGlEgBRKROwsYuz03+c5Qf/xqAJDMpVNxAwv99tzZ8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Yo40kvN5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756406773;
	bh=TNn85gzNofrDwGqDuyZxKxtM8jgfBV7+bFFQD86FPfY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Yo40kvN5ehj2Ct7eVAW6wI3JzOUcxHeW4k76N/YcJJH/U7rAJKuhrMfZA09NHymvW
	 KecSWa1kv6I3aYlVuTFuGtUvGQLgPnbVKVY0yY3OLxiddjhRAQrm6KnjEeTdiIqKS4
	 G8bktGPZRauIzv/c0neE32We1Ty+NpniPM/fUpX0iYbcfaIkwYFAxZ7m09y55w3QwR
	 UcWtH95G/dWyD8abA9PU/LMSCIwash504Efit5ZD31fHB40yGLPxtYU4yLgJHCpqC7
	 N1Ag+Uqt1IdLiWu9aCwIKotAEtiX7JO1EYw8s4t1dkQ00XnPSWr0Gi+tTTQQCjgms/
	 AfGfSRDdAl/ag==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B5D017E046C;
	Thu, 28 Aug 2025 20:46:12 +0200 (CEST)
Message-ID: <868674ca3d248ff76ddb3855f9b0620812e103a4.camel@collabora.com>
Subject: Re: [PATCH v2 2/4] media: uapi: Cleanup tab after define in headers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 28 Aug 2025 14:46:11 -0400
In-Reply-To: <20250824180735.765587-3-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
	 <20250824180735.765587-3-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-RXPDGDOhP0P42/asDuBa"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-RXPDGDOhP0P42/asDuBa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 ao=C3=BBt 2025 =C3=A0 20:07 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> Some definitions use a tab after the define keyword instead of the
> usual single space. Replace it for better consistency.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0include/uapi/linux/v4l2-controls.h | 30 +++++++++++++++------------=
---
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++=
++---------
> =C2=A02 files changed, 24 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-
> controls.h
> index 4a483ff1c418..7aef88465d04 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1193,7 +1193,7 @@ enum v4l2_flash_strobe_source {
> =C2=A0#define V4L2_CID_JPEG_CLASS_BASE		(V4L2_CTRL_CLASS_JPEG |
> 0x900)
> =C2=A0#define V4L2_CID_JPEG_CLASS			(V4L2_CTRL_CLASS_JPEG | 1)
> =C2=A0
> -
> #define	V4L2_CID_JPEG_CHROMA_SUBSAMPLING	(V4L2_CID_JPEG_CLASS_BASE + 1)
> +#define V4L2_CID_JPEG_CHROMA_SUBSAMPLING	(V4L2_CID_JPEG_CLASS_BASE +
> 1)
> =C2=A0enum v4l2_jpeg_chroma_subsampling {
> =C2=A0	V4L2_JPEG_CHROMA_SUBSAMPLING_444	=3D 0,
> =C2=A0	V4L2_JPEG_CHROMA_SUBSAMPLING_422	=3D 1,
> @@ -1202,15 +1202,15 @@ enum v4l2_jpeg_chroma_subsampling {
> =C2=A0	V4L2_JPEG_CHROMA_SUBSAMPLING_410	=3D 4,
> =C2=A0	V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY	=3D 5,
> =C2=A0};
> -
> #define	V4L2_CID_JPEG_RESTART_INTERVAL		(V4L2_CID_JPEG_CLASS_BASE + 2)
> -
> #define	V4L2_CID_JPEG_COMPRESSION_QUALITY	(V4L2_CID_JPEG_CLASS_BASE + 3)
> +#define V4L2_CID_JPEG_RESTART_INTERVAL		(V4L2_CID_JPEG_CLASS_BASE +
> 2)
> +#define V4L2_CID_JPEG_COMPRESSION_QUALITY	(V4L2_CID_JPEG_CLASS_BASE +
> 3)
> =C2=A0
> -
> #define	V4L2_CID_JPEG_ACTIVE_MARKER		(V4L2_CID_JPEG_CLASS_BASE + 4)
> -#define	V4L2_JPEG_ACTIVE_MARKER_APP0		(1 << 0)
> -#define	V4L2_JPEG_ACTIVE_MARKER_APP1		(1 << 1)
> -#define	V4L2_JPEG_ACTIVE_MARKER_COM		(1 << 16)
> -#define	V4L2_JPEG_ACTIVE_MARKER_DQT		(1 << 17)
> -#define	V4L2_JPEG_ACTIVE_MARKER_DHT		(1 << 18)
> +#define V4L2_CID_JPEG_ACTIVE_MARKER		(V4L2_CID_JPEG_CLASS_BASE +
> 4)
> +#define V4L2_JPEG_ACTIVE_MARKER_APP0		(1 << 0)
> +#define V4L2_JPEG_ACTIVE_MARKER_APP1		(1 << 1)
> +#define V4L2_JPEG_ACTIVE_MARKER_COM		(1 << 16)
> +#define V4L2_JPEG_ACTIVE_MARKER_DQT		(1 << 17)
> +#define V4L2_JPEG_ACTIVE_MARKER_DHT		(1 << 18)
> =C2=A0
> =C2=A0
> =C2=A0/* Image source controls */
> @@ -1243,10 +1243,10 @@ enum v4l2_jpeg_chroma_subsampling {
> =C2=A0#define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
> =C2=A0#define V4L2_CID_DV_CLASS			(V4L2_CTRL_CLASS_DV | 1)
> =C2=A0
> -
> #define	V4L2_CID_DV_TX_HOTPLUG			(V4L2_CID_DV_CLASS_BASE + 1)
> -
> #define	V4L2_CID_DV_TX_RXSENSE			(V4L2_CID_DV_CLASS_BASE + 2)
> -
> #define	V4L2_CID_DV_TX_EDID_PRESENT		(V4L2_CID_DV_CLASS_BASE + 3)
> -
> #define	V4L2_CID_DV_TX_MODE			(V4L2_CID_DV_CLASS_BASE + 4)
> +#define V4L2_CID_DV_TX_HOTPLUG			(V4L2_CID_DV_CLASS_BASE + 1)
> +#define V4L2_CID_DV_TX_RXSENSE			(V4L2_CID_DV_CLASS_BASE + 2)
> +#define V4L2_CID_DV_TX_EDID_PRESENT		(V4L2_CID_DV_CLASS_BASE + 3)
> +#define V4L2_CID_DV_TX_MODE			(V4L2_CID_DV_CLASS_BASE + 4)
> =C2=A0enum v4l2_dv_tx_mode {
> =C2=A0	V4L2_DV_TX_MODE_DVI_D	=3D 0,
> =C2=A0	V4L2_DV_TX_MODE_HDMI	=3D 1,
> @@ -1267,7 +1267,7 @@ enum v4l2_dv_it_content_type {
> =C2=A0	V4L2_DV_IT_CONTENT_TYPE_NO_ITC	=C2=A0 =3D 4,
> =C2=A0};
> =C2=A0
> -
> #define	V4L2_CID_DV_RX_POWER_PRESENT		(V4L2_CID_DV_CLASS_BASE + 100)
> +#define V4L2_CID_DV_RX_POWER_PRESENT		(V4L2_CID_DV_CLASS_BASE +
> 100)
> =C2=A0#define V4L2_CID_DV_RX_RGB_RANGE		(V4L2_CID_DV_CLASS_BASE +
> 101)
> =C2=A0#define V4L2_CID_DV_RX_IT_CONTENT_TYPE		(V4L2_CID_DV_CLASS_BASE +
> 102)
> =C2=A0
> @@ -2552,7 +2552,7 @@ struct v4l2_ctrl_hevc_scaling_matrix {
> =C2=A0/* Stateless VP9 controls */
> =C2=A0
> =C2=A0#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
> -#define	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
> +#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 3dd9fa45dde1..64943f1a6149 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1607,8 +1607,8 @@ struct v4l2_bt_timings {
> =C2=A0} __attribute__ ((packed));
> =C2=A0
> =C2=A0/* Interlaced or progressive format */
> -#define	V4L2_DV_PROGRESSIVE	0
> -#define	V4L2_DV_INTERLACED	1
> +#define V4L2_DV_PROGRESSIVE	0
> +#define V4L2_DV_INTERLACED	1
> =C2=A0
> =C2=A0/* Polarities. If bit is not set, it is assumed to be negative pola=
rity */
> =C2=A0#define V4L2_DV_VSYNC_POS_POL	0x00000001
> @@ -2788,15 +2788,15 @@ struct v4l2_remove_buffers {
> =C2=A0 * Only implemented if CONFIG_VIDEO_ADV_DEBUG is defined.
> =C2=A0 * You must be root to use these ioctls. Never use these in applica=
tions!
> =C2=A0 */
> -#define	VIDIOC_DBG_S_REGISTER	 _IOW('V', 79, struct
> v4l2_dbg_register)
> -#define	VIDIOC_DBG_G_REGISTER	_IOWR('V', 80, struct
> v4l2_dbg_register)
> +#define VIDIOC_DBG_S_REGISTER	 _IOW('V', 79, struct v4l2_dbg_register)
> +#define VIDIOC_DBG_G_REGISTER	_IOWR('V', 80, struct v4l2_dbg_register)
> =C2=A0
> =C2=A0#define VIDIOC_S_HW_FREQ_SEEK	 _IOW('V', 82, struct v4l2_hw_freq_se=
ek)
> -#define	VIDIOC_S_DV_TIMINGS	_IOWR('V', 87, struct
> v4l2_dv_timings)
> -#define	VIDIOC_G_DV_TIMINGS	_IOWR('V', 88, struct
> v4l2_dv_timings)
> -#define	VIDIOC_DQEVENT		 _IOR('V', 89, struct v4l2_event)
> -#define	VIDIOC_SUBSCRIBE_EVENT	 _IOW('V', 90, struct
> v4l2_event_subscription)
> -#define	VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct
> v4l2_event_subscription)
> +#define VIDIOC_S_DV_TIMINGS	_IOWR('V', 87, struct v4l2_dv_timings)
> +#define VIDIOC_G_DV_TIMINGS	_IOWR('V', 88, struct v4l2_dv_timings)
> +#define VIDIOC_DQEVENT		 _IOR('V', 89, struct v4l2_event)
> +#define VIDIOC_SUBSCRIBE_EVENT	 _IOW('V', 90, struct
> v4l2_event_subscription)
> +#define VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct
> v4l2_event_subscription)
> =C2=A0#define VIDIOC_CREATE_BUFS	_IOWR('V', 92, struct v4l2_create_buffer=
s)
> =C2=A0#define VIDIOC_PREPARE_BUF	_IOWR('V', 93, struct v4l2_buffer)
> =C2=A0#define VIDIOC_G_SELECTION	_IOWR('V', 94, struct v4l2_selection)

--=-RXPDGDOhP0P42/asDuBa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLCj8wAKCRDZQZRRKWBy
9GXeAPsGMFbvbFgwtzgxYP9aUsooPkVrWV9DzKs5l2waQ6FBVwEAghEUigXpfr3j
tQuCLK72NgyEKYrUAbZ8293eUXPsVQs=
=6PBB
-----END PGP SIGNATURE-----

--=-RXPDGDOhP0P42/asDuBa--

