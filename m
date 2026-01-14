Return-Path: <linux-media+bounces-50710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F6D201A8
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 17:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A76F30A2573
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2429E3A1E60;
	Wed, 14 Jan 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jlP+BieU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9752848A1
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406900; cv=none; b=cc4nWd8+tcAgBkTEAsjcaOQ5k3m6UtTKzY7hNgQ3Qv98igAJjqu8Q2WBbGzMQYBLuW+7R3Z4VBHzh2i5LCr8M4rd2pxxpG/wEr9pvYo3ZIMVvp7mZAoB0BnZCPgRd0PUGHiRbcIv/Fnh5za0MyjYrQoXXZYCzqShv60VhqqkI3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406900; c=relaxed/simple;
	bh=VN+sc/PCbmrTU2eqySY5vF+P4Mai8eNMaxaFpZ0Q+s4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsBXaPKzfMW38TyA4HhivdM50BoGSRqx3YlKv3/sX+t8LJkZnExdveDHlKZDJAzH9ilRjCd2kxUbQe8ZZMh774+ozB7SPpYyZnr29N6mUsgofVyDRKr6Aoe23MPnBWukI4ztwffurehcSVUoX6nkyHTnH7bRMMz99DEudJzZ+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jlP+BieU; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c0f13e4424so899376085a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1768406898; x=1769011698; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VN+sc/PCbmrTU2eqySY5vF+P4Mai8eNMaxaFpZ0Q+s4=;
        b=jlP+BieU0secmiKx8eAI4aczWVbVXHCMaWZeSVv/hNW2zRP4GRMi5iMFm4zfWWLqMU
         DEJn9Q8/5/OBHNtAdeJ7Bncfx+531QR0D2ql2I5rhkaYcCYMXGMY1TokbacwyTYcXt5z
         MTCYPxk3QtBZeLCX0Fmg4UobAmlpzpsnPXvW6TW9abnBhMzBy4ZCkkwXh7QnaU62Uayf
         5Ih/CXI6xFFgpHwdtW8mllRJHkQTRGPHdiRwIxwP1aQKyq+bS2Q5Z+1b2tWaYMSUCW4C
         AFCxJon5GGTlcv12wy8JEggnUuS+wWiy//JpR18Yaq3H9ffeMMaFecysuDoK0JSTXyOI
         IZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406898; x=1769011698;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN+sc/PCbmrTU2eqySY5vF+P4Mai8eNMaxaFpZ0Q+s4=;
        b=YSXuWwg4AOya9vP8JuOYt5OqBLBP97vMY0Y8fzVLYeFqjcKKEx3aQvEfuMxJJglr9/
         B3Poy4ZIX8iMCxIFBEqbZRMv3kBRb/d3Q4z60h6MacJQ1Cl/I/uGXmJ1EaWGJjJ6AG3s
         nQkxG1UeMHdlVFzgYjem54nbS8pTw2iJMc/VwpJjXQusmyLmmWlv97pZtJ3VTUC+B2XA
         SvHke5gAuwWd0SlfU0i4rOj7i6UKaPv/Us1mna0NbGqTJE8JGXRxBlgN67RpSnsx0USL
         lgIcVikPL921rKlitHSD3GeywZLqUavO7PUX2ApNFOFRspL+r/TsG+O4MGUOLfS0owYx
         6qPw==
X-Gm-Message-State: AOJu0YwnBTTrapx3uKLROE9Z8JU8yzdY5GvV8QX2fK6WQzJFWRrEnW7M
	lIhGfoXVOXbtIb2dbm3v9Y0AJACRP3cQq78hL4BJgcbINES6fgqre+Ony7j4SN8UG8I=
X-Gm-Gg: AY/fxX7Jb89QbyuokHzU+mLUFiOl3/zXP2NjzLJnRJ0jIhOWXH4F1hH+DuE8yqmIqbH
	tBEtoPW6Su48w9gst2SQl7A1qxynTlfwZawyw70zee2d5YlHESaek/8HxVyJkyWYx4gbdMU/gdj
	o3Hxu70FYetCc0+5WCNQe6goYaI6+TqqgrVWJ7N8XPKu5PFWZ7RVI3Lb/rhf0im10kQRl1AifKd
	ThqUNVVdkJ6j4TxuoR54CrCsE0pCGYOJGT7MQZHWP0/T/ln6v/v02Ml8tDk4jfDEr5+ZQrmxrPD
	O3Mqeu2R6B8UEJpuLupVK2qWkdastlIHJk5RJRB2C0E703IYihsDdYX0Vojcy7YkUadCApqr7P9
	4zvS2oDc8SzYLB0I5OmwQy05slfktb/2emnrUl80zgpwzc7OM+qy4loDpRT7kSKY6nbwaL58otA
	GuQr2NYiLc7+n4IHDI
X-Received: by 2002:ad4:5c43:0:b0:888:89fd:a720 with SMTP id 6a1803df08f44-89275ae028amr37603396d6.11.1768406897648;
        Wed, 14 Jan 2026 08:08:17 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772681desm180568616d6.51.2026.01.14.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:08:16 -0800 (PST)
Message-ID: <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Wed, 14 Jan 2026 11:08:15 -0500
In-Reply-To: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-RZ3MD85+AD47PzpQ7mde"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-RZ3MD85+AD47PzpQ7mde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 13 janvier 2026 =C3=A0 12:33 -0800, Deepa Guthyappa Madivalara a =
=C3=A9crit=C2=A0:
> Hi all,
>=20
> This patch set implements region of interest(ROI) support
> for video encoder to be configured as a rectangular
> region, and corresponding delta QP parameter. A new compound
> control V4L2_CID_MPEG_VIDEO_ENC_ROI which maps to struct
> v4l2_ctrl_enc_roi_params is implemented to achieve this.=C2=A0=20

My very first question will be why ROI rather then QP Map ? Its seems that
modern API such as D3D12 and Vulkan Video aims for QP Map instead of a limi=
ted
set of rectangles, while older hardware / firmware have ROI, but since you =
are
saying that this is not yet implemented in your firmware, I thought it was =
worth
asking.

The ROI are relatively easy to convert into QP Maps, but the opposite is go=
ing
to be a lot less accurate. That being said, the number of ROI can be extrem=
ely
limited, at least this is the case for Samsung MFC firmware and Hantro enco=
ders
(no upstream driver yet).

let us know your thought, should we adopt just one, and have driver transla=
te
once HW moved to the new approach ? Should we enventually support both ?

Nicolas

>=20
> I'm sharing this series as an RFC because adding support
> in the firmware and framework for testing, gstreamer testing
> is still in progress. I would appreciate early feedback on
> the design, implementation, and fixes before moving to a
> formal submission.
>=20
> v4l2-ctl -d /dev/video1 --list-ctrls
> ..
> hevc_b_frame_maximum_qp_value 0x00990b8c (int): min=3D1 max=3D51 step=3D1
> default=3D51 value=3D51 flags=3Dhas-min-max
> video_encoder_roi_params 0x00990b92 (unknown): type=3D284
> value=3Dunsupported payload type flags=3Dhas-payload
>=20
> Thanks,
> Deepa
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> Deepa Guthyappa Madivalara (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: uapi: Introduce new control for vid=
eo encoder ROI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: v4l2-core: Add support for video en=
coder ROI control
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add ROI support framework for=
 video encoder
>=20
> =C2=A0.../userspace-api/media/v4l/ext-ctrls-codec.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +++
> =C2=A0drivers/media/platform/qcom/iris/iris_ctrls.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 54
> +++++++++++++++++++++-
> =C2=A0drivers/media/platform/qcom/iris/iris_ctrls.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../platform/qcom/iris/iris_platform_common.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0.../media/platform/qcom/iris/iris_platform_gen2.c=C2=A0 |=C2=A0 8 +=
+++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++++-
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
> =C2=A0include/media/v4l2-ctrls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 17 +++++++
> =C2=A010 files changed, 110 insertions(+), 2 deletions(-)
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260112-iris_enc_roi-8898f9a2455f
>=20
> Best regards,

--=-RZ3MD85+AD47PzpQ7mde
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaWe/bwAKCRDZQZRRKWBy
9IIOAP0ctElbfVB1Z85B09FYWfrcfWYAKUKe2ShV+mhVxbj9UQEAnSFbEkJj8yR9
8dLb3xM7LiIxv4Jr2SdjB6Yg4dQ6dQg=
=lJlC
-----END PGP SIGNATURE-----

--=-RZ3MD85+AD47PzpQ7mde--

