Return-Path: <linux-media+bounces-59889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIoXIjAS8WmXcQEAu9opvQ
	(envelope-from <linux-media+bounces-59889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:01:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADA48B6B0
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D82FF30427CD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B3E384250;
	Tue, 28 Apr 2026 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="dc+70OqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D71729ACD7
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 20:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406470; cv=none; b=hyR08n2rwlS0iEpRd1zYgwIWTUmL/HvQbZpnjVb+93Cuw/Ew9e3DC3PUBldTt2FTZXGTODxL06UPyl1wpiOMbINCPUBJA6Wc5AhWW+ByxQCht7TJrahlL9Gut/HmMiCVdqr7czuZjZHo5yZIBZR9a838Jkb5DjoX/ph7MId67xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406470; c=relaxed/simple;
	bh=QRdiOGrj4HUbTORgQoEoPCiIo3474h0mYzvlqe1yKIw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WDrYlv7mrG350sobb0/bsiB0xN27NbBUdjXafMp7FVK0RRpl9wtfTiWmxgpKfeN2BZxY2tBzxXSxgESQzUpy5W532BxCZ7mS245FhOmOhlIaRdD7o1vJrD9eJ/sOryBVj68uicCqckJVJs3noVEO2tKzx7LJkvjEsYmhYcFE0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=dc+70OqZ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8d6d5e45c43so1308583885a.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777406468; x=1778011268; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lstCqvrjWV99QFwSMCRoELcDTEOLxvqfKgwC6/S0U14=;
        b=dc+70OqZ2TsgIu+SLJXatmaHFt7MCSKZU/szMvxcGppzcnFD+x9eKr+V0Sg/aECojL
         iLcRfqyFjA0aI8fSmzkNTxigdeSrKHX+qGXMpJxeSACLdHzmCMGv+QNwL/hqQvBFzOu/
         3FwnwFmsKxdq84VGw/GE6estS31H/7/6fOPKgbkhcRmjZOaKuqec94ajY+lpFUX8L4NR
         pjkzndIA6mZEMKyus+nAFT6QBpKwWfknTm5/tAbkqwKadOpdSavNps3WBuuSh4Cjsr95
         CgRSU8S9M4kozA1Z8EjB2E3+5RvkVzs5SYCoPY7jhLHH46efCpz/khX2Wtf7g3AOf0De
         2xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406468; x=1778011268;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lstCqvrjWV99QFwSMCRoELcDTEOLxvqfKgwC6/S0U14=;
        b=AW4aaluJPlLj0vCKB+9H0phEkbHkOPOaRtxgpwdX9jAS3E/EF9GGmHX56ZP6mIp6nw
         AAxOhJ0WvgU2ldj+4vTRla/C0mENPTmCmsww57KnnfTp8pc5N2wYJG7fLfXt0dnmiYVp
         7lRSUAeIdE8kEhJCaVRWK30s4v7qtcRsdEaHYgvRoaFPx9JHa1qwH7HhvDqfod3WdSWz
         f/yuephDUn6InnkGRzoziU5ldERtpZtQvFwbTiRl110H0jKPsf1xv0n/Ej7ijoracm67
         OFHZPS8WH49Nl3OTYlT/S0d9rhwKbZSFJptq/NAtoSmdvpVjQnlG20OTnGaBF0O+nLyh
         QJkg==
X-Gm-Message-State: AOJu0YymBNEZQk3v/2sp0UCZSyZflvYWBw19Id5laEnY2PfLArNzypHw
	YjDh1pHpReSLcwdZx6XqHr9BLpD+44pZ6ueMkDVDvadO74FypqwhFgyHI/LVqSakbAA=
X-Gm-Gg: AeBDievRWvojjyHYCAJcgdoqK79GPtznd30h/nzwuyK/FkhA1UWWhXBKfqHJkfFKFzH
	GtQnrQKy04ab1q0VaWfwOLDvA1lgADY7lo/ErzWD3ire3HUMi/kKqy+3km3IfZoGGcHMghMpsnW
	NZjNicpB4V6xLAy/U0jI0zD+JKhkEcDjeCFWUKs1Cq3zcMYSIiDmUWt+BAI8OC41WWtKq3yZeAI
	4IB4HMLO41Vsuk+foaYWGeSLUV4FBZUMMZIMA8pCj9u7CB4cFTHNVc+ZNIj8kL7M3bG6awHoAzW
	r2P4cuhg+0Ta2WoCi+ns8zU9riwXL5qOgbTfiQR0MqtRoRWJQiklWVvxZhUBafU1Ul3zScIajzw
	lji3D4yH/oUyqIEcuVGTPz/j/PeJMk5EKyfMJ/cFXQ6ejCVo51Euvzxyz6aSkPdRiVFGiuAlpgX
	Rvudg25LIn8si2QyasPBZaboBZmeQCj16bXVFIAMM=
X-Received: by 2002:a05:620a:1a08:b0:8ed:d6df:c778 with SMTP id af79cd13be357-8f7d8f0ec45mr605781885a.37.1777406467922;
        Tue, 28 Apr 2026 13:01:07 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f86831cf01sm206026185a.34.2026.04.28.13.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:01:06 -0700 (PDT)
Message-ID: <c4f61e530f12f61a5393b1f1f3ff67d81883e86c.camel@ndufresne.ca>
Subject: Re: [PATCH v1 1/4] media: v4l2-controls: Add control for background
 detection
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Tue, 28 Apr 2026 16:01:05 -0400
In-Reply-To: <20260324050400.218-2-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
	 <20260324050400.218-2-jackson.lee@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-bB5Qw/dgiGf+uWAWpSYg"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0CADA48B6B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-59889-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,ndufresne.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chipsnmedia.com:email]


--=-bB5Qw/dgiGf+uWAWpSYg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 14:03 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> Add a generic V4L2 boolean control V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTI=
ON
> that allows encoders to detect background regions in a frame and use fewe=
r
> bits or skip mode to encode them, potentially reducing bitrate for stream=
s
> with stationary scenes.
>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++++=
+
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 ++
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A03 files changed, 10 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index c8890cb5e00a..ab865a1a6ba9 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -737,6 +737,12 @@ enum v4l2_mpeg_video_frame_skip_mode -
> =C2=A0=C2=A0=C2=A0=C2=A0 Enable writing sample aspect ratio in the Video =
Usability
> =C2=A0=C2=A0=C2=A0=C2=A0 Information. Applicable to the H264 encoder.
> =C2=A0
> +``V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION (boolean)``
> +=C2=A0=C2=A0=C2=A0 If enabled, the encoder detect a background region in=
 frame and
> +=C2=A0=C2=A0=C2=A0 use low bits or skip mode to encode the background re=
gion.
> +=C2=A0=C2=A0=C2=A0 If a lot of scenes are stationary or background, It m=
ay help to
> +=C2=A0=C2=A0=C2=A0 reduce the video bitrate. Applicable to the encoder.
> +
> =C2=A0.. _v4l2-mpeg-video-h264-vui-sar-idc:
> =C2=A0
> =C2=A0``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-
> core/v4l2-ctrls-defs.c
> index 551426c4cd01..e062f2088490 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -889,6 +889,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> =C2=A0	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return
> "Display Delay";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return
> "Display Delay Enable";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return
> "Generate Access Unit Delimiters";
> +	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:		return
> "Background Detection";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263
> I-Frame QP Value";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263
> P-Frame QP Value";
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263
> B-Frame QP Value";
> @@ -1296,6 +1297,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum
> v4l2_ctrl_type *type,
> =C2=A0	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
> =C2=A0	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
> =C2=A0	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
> +	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
> =C2=A0	case V4L2_CID_WIDE_DYNAMIC_RANGE:
> =C2=A0	case V4L2_CID_IMAGE_STABILIZATION:
> =C2=A0	case V4L2_CID_RDS_RECEPTION:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-
> controls.h
> index 68dd0c4e47b2..affec0ab4781 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -464,6 +464,8 @@ enum v4l2_mpeg_video_intra_refresh_period_type {
> =C2=A0	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC	=3D 1,
> =C2=A0};
> =C2=A0
> +#define V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION	(V4L2_CID_CODEC_BASE
> + 238)
> +
> =C2=A0/* CIDs for the MPEG-2 Part 2 (H.262) codec */
> =C2=A0#define
> V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
> =C2=A0enum v4l2_mpeg_video_mpeg2_level {

--=-bB5Qw/dgiGf+uWAWpSYg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafESAQAKCRDZQZRRKWBy
9LsbAQCf2R5XIxqDK8BxtxeBUllVsm7tmdNQzzl/NMraaT99tQEAj12XNOlbVGkh
j2b1CiEVx7Gsh/QGN5Mb+ZFkzDsV/gU=
=u4EX
-----END PGP SIGNATURE-----

--=-bB5Qw/dgiGf+uWAWpSYg--

