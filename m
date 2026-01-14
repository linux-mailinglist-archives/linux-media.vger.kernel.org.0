Return-Path: <linux-media+bounces-50711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9160D201E1
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 17:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3961A30198A2
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E893A1D1F;
	Wed, 14 Jan 2026 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="RSoEmvBI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5572DE70A
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768407247; cv=none; b=o9YPms3K+fwtgcmD7c5JVFd5BFA0CXonGCWKrumTsp+qwILytuwKjogHyhxoz6mKdgYmWP3zISairgAHj6lD6ZvrdqVJ96yJman5KERp3727WvhJ0GRgaUCmg9POZbPmJvYnofVN6Pq388l+WPMxWk7H2fL+evjfitPlezwg1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768407247; c=relaxed/simple;
	bh=iJ0Aganr8KuPuLSs0mhZBFYNZP7jxgYftfZB3bUJhnM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtMmtq1xvTYDUoqph/HiNPvuhztm+k5bapTBlJDvRmPayLDKejBwMF3E+gyorUCgguEgF9kIWvjwwxdb87xYYEHTQLCalLp5io5el1EDE/fI9xGsrnP1QYx5WSbbU0cilz6LG2IemYdx0Ui4RHPFoOA+9haEshUxoJkjdZg9eqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=RSoEmvBI; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ed82ee9e57so117124511cf.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768407245; x=1769012045; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e5+clJajQNm6silgVV5Zi3EM4F+meGHkoI3LcAyLzCA=;
        b=RSoEmvBIzl/pkpxkG1v8AKeoNFCXMWknnZA07Dr1zN2MPatcmjmKoQCXtCuWpT5c3O
         zHbe+aiDda8WP+DbrtpXThiZreg3DZpAQkyWE0IqIpMONJeQN3CNbxvvjaO6lPMlaznf
         g/goa6fAGUtrQRhhokpBDjRrijfceB5BfcnV4AZDaEVCnk3gu9W3Ba6MwSXUp6sjihwe
         6CPq6g+kxgIs9Fj6jHfwYF+OOtjQ6oXqZF+o2XxETNk14WGe86AeNacYaLh0Iqofn5K7
         nodBeVcHvhc9HJ0XmZShkJGpONZKhLqQui1qwLaqwppZaNOiQBbOlUqTbFD/UsNJbbz7
         SwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407245; x=1769012045;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5+clJajQNm6silgVV5Zi3EM4F+meGHkoI3LcAyLzCA=;
        b=i+atvaDPujgvVe6QPSoOVXRKyRCIa8W404LQC3WZhNMm7v5fL+Ti/gWC0Ood0PVFNC
         /l8AGN6LZV3uUXKsOakfsAyF7AGimSfxjleMRSmjpoNX6gvjl+gQ/9BWBaFz3s3joZen
         qGEMpMSq8m3Ja1GMMHw7zioRa6K5SUeEXk8JCp+movRkUbnOiNkHZLtR11S/XGqPf0Yr
         rhFqF59zL/ZQMFJa4XmDhjT+/TLNFA649zf77N1yUrbTP2BUDlfE4uKi+oSN3IFAHjSQ
         VaozotlPXS8VSAaoHZe7ImrYFmhsQ+LPj/HAClmBKT8tsHrdM9ydBIanBOMLy+GtAacN
         LMGQ==
X-Gm-Message-State: AOJu0YzWcMRb4GudqvmfrozN0WsPQvs+2O2FM2fiGBQ5jGex8gpy1rUr
	o+cfPJzxXZPmBwRSzBuKaEQ6MGxGmMs6F3R0fmgUqlbd7PjEgBAqfzlW+iRYUP3xoq0=
X-Gm-Gg: AY/fxX6G6hr8cUpzyRrMr5ksIE38+VOO1CfhjWZ3bo8PTvaH0isyyd3iaI2Qfrz+RjM
	/6dhN2dH5mfgUbhn1bwVQI4SpqiRFErfx5rwzwU9zf2AU8YFQ8owu+STJ/jAbhlEz86GDa3C2Mn
	DJ/t1rDuj873fZEi946qkLw551+6b0cswcQeWg//2vlKA8AX+Ras1jJXcdfYWf466f3RKTa/t+u
	VaBVjPqR/bVELfYPS8Cdl169Hylg06DfdDdDONiXmwWamhZ8e6bpu5YEL4/axS3RsKKngAMm3RC
	lt93ofgexaIJr7LgvsN7K1/U/8RnqN2BoBIlZnC9JXa+ZpWCAUxiW14HWe78iFeR8Od3IPDWlkk
	gHk8WPcsavBEg64xKE0pbdB5G9MklS2+A9i0gYQMSlIE4FkNFYj34VuWGdLA64r6j7XXe1gDOAn
	D4uGe802atLofND7bz
X-Received: by 2002:a05:622a:4203:b0:4ee:1db1:a605 with SMTP id d75a77b69052e-501481f8beemr45956951cf.20.1768407244604;
        Wed, 14 Jan 2026 08:14:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148dd7454sm15536331cf.6.2026.01.14.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:14:03 -0800 (PST)
Message-ID: <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Wed, 14 Jan 2026 11:14:02 -0500
In-Reply-To: <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
	 <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6Rnm5V13JnzOOMbNyzHt"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6Rnm5V13JnzOOMbNyzHt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 13 janvier 2026 =C3=A0 12:33 -0800, Deepa Guthyappa Madivalara a =
=C3=A9crit=C2=A0:
> Add compound control, V4L2_CID_MPEG_VIDEO_ENC_ROI, for
> video encoder Region of Interest to allow applications to specify
> different quality levels for specific regions in video frames. Define
> struct v4l2_ctrl_enc_roi_params to hold up to 10 rectangular ROI,
> regions and their corresponding delta_qp value (v4l2_roi_param)
> that adjust quantization relative to the frame's base value.
>=20
> This enables use cases like prioritizing quality for faces in video
> conferencing or important objects in surveillance footage while reducing
> bitrate for less critical areas.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> =C2=A0.../userspace-api/media/v4l/ext-ctrls-codec.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0include/media/v4l2-ctrls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
> =C2=A04 files changed, 26 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index c8890cb5e00ac05649e6c344c2a6b938b2ec1b24..0eecb46bb356c01411dfc313b=
92376593bcd86f6 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1668,6 +1668,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
> =C2=A0=C2=A0=C2=A0=C2=A0 Codecs need to always use the specified range, r=
ather then a HW custom range.
> =C2=A0=C2=A0=C2=A0=C2=A0 Applicable to encoders
> =C2=A0
> +``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
> +=C2=A0=C2=A0=C2=A0 Defines the control id to configure specific delta QP=
 for one or more
> +=C2=A0=C2=A0=C2=A0 rectangular regions of interest. The struct v4l2_ctrl=
_enc_roi_params
> +=C2=A0=C2=A0=C2=A0 is defined to hold up to 10 v4l2_rect regions and the=
ir corresponding
> +=C2=A0=C2=A0=C2=A0 delta_qp with a range of -31 to 30.
> +=C2=A0=C2=A0=C2=A0 Applicable to encoders

Any justification for this range ? Also, I believe I've seen hardware suppo=
rt
both delta and absolute values. Since it meant to be generic, some research=
 is
needed. If we delibaritly ignore absolute, perhaps the CID should be named
accordingly ? Something like V4L2_CID_MPEG_VIDEO_ENC__DELTAQP_ROI ?

> +
> =C2=A0.. raw:: latex
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 \normalsize
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 31fc1bee3797bfe532931889188c8f7a9dedad39..c44fad7f51db45a437dd3287a=
a16830585ac42f3 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -91,6 +91,7 @@ union v4l2_ctrl_ptr {
> =C2=A0	struct v4l2_ctrl_av1_frame *p_av1_frame;
> =C2=A0	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> =C2=A0	struct v4l2_rect *p_rect;
> +	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
> =C2=A0	void *p;
> =C2=A0	const void *p_const;
> =C2=A0};
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..5f2621365593ee19a7792fb25=
ea29acf6a7860f1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -918,6 +918,7 @@ enum v4l2_mpeg_video_av1_level {
> =C2=A0};
> =C2=A0
> =C2=A0#define V4L2_CID_MPEG_VIDEO_AVERAGE_QP=C2=A0 (V4L2_CID_CODEC_BASE +=
 657)
> +#define V4L2_CID_MPEG_VIDEO_ENC_ROI=C2=A0 (V4L2_CID_CODEC_BASE + 658)
> =C2=A0
> =C2=A0/*=C2=A0 MPEG-class control IDs specific to the CX2341x driver as d=
efined by V4L2 */
> =C2=A0#define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1=
000)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index add08188f06890182a5c399a223c1ab0a546cae1..18a5ae34842721c2647a7a763=
65e4d299d2b8a44 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1909,6 +1909,7 @@ struct v4l2_ext_control {
> =C2=A0		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
> =C2=A0		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
> =C2=A0		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_masterin=
g_display;
> +		struct v4l2_ctrl_enc_roi_params __user *p_enc_roi_params;
> =C2=A0		void __user *ptr;
> =C2=A0	} __attribute__ ((packed));
> =C2=A0} __attribute__ ((packed));
> @@ -1990,6 +1991,8 @@ enum v4l2_ctrl_type {
> =C2=A0	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY =3D 0x281,
> =C2=A0	V4L2_CTRL_TYPE_AV1_FRAME	=C2=A0=C2=A0=C2=A0 =3D 0x282,
> =C2=A0	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	=C2=A0=C2=A0=C2=A0 =3D 0x283,
> +
> +	V4L2_CTRL_TYPE_ENC_ROI_PARAMS	=C2=A0=C2=A0=C2=A0 =3D 0x284,
> =C2=A0};
> =C2=A0
> =C2=A0/*=C2=A0 Used in the VIDIOC_QUERYCTRL ioctl for querying controls *=
/
> @@ -2540,6 +2543,20 @@ struct v4l2_streamparm {
> =C2=A0	} parm;
> =C2=A0};
> =C2=A0
> +/* Roi format
> + */
> +#define VIDEO_MAX_ROI_REGIONS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 10

Let's not hardcode hardware spececific constraints in the API. We have dyna=
mic
arrays now in compount controls, and you can define the maximum dimension a=
nd
all.


> +
> +struct v4l2_roi_param {
> +	struct v4l2_rect roi_rect;
> +	__s32 delta_qp;
> +};
> +
> +struct v4l2_ctrl_enc_roi_params {
> +	__u32 num_roi_regions;

With the dynamic arrays, this will not be needed.

cheers,
Nicolas

> +	struct v4l2_roi_param roi_params[VIDEO_MAX_ROI_REGIONS];
> +};
> +
> =C2=A0/*
> =C2=A0 *	E V E N T S
> =C2=A0 */

--=-6Rnm5V13JnzOOMbNyzHt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWfAygAKCRDZQZRRKWBy
9DzvAP9nsdCtF+aeXH1MtJKut66iQShnnlyAUMVBmFMBNIkVywD/TcE6RkJCj22m
E2ePASDSKHx3PUQkirNtWgG8ZR5SFgo=
=lVyf
-----END PGP SIGNATURE-----

--=-6Rnm5V13JnzOOMbNyzHt--

