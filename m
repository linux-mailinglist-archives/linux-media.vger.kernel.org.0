Return-Path: <linux-media+bounces-53855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SINiBD5Wo2nW/AQAu9opvQ
	(envelope-from <linux-media+bounces-53855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:55:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0D1C89E4
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41744305DD10
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 20:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445333090E2;
	Sat, 28 Feb 2026 20:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr26O0Y4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB9243387
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772312076; cv=none; b=U1HNyDyCqBG4S5fylh+/ZGTxHlvYplxSNG+MSmdGMH0x+Ewwbm7Zi8mLHT3JkCDr2wTHijZgQqoA9LdEFiSoSk0vfmkMSaxEXLMJ3XDSGw3ed8YKGEAeMUIHoLxtFnO6lJo4QEwo93kVEi9Jyw2eJiSzRlU5UKd5rLBV3Pfs5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772312076; c=relaxed/simple;
	bh=A54o0fRlYXYiX6f5a1IPgxuDtjkOjMBT1FuckY80TuY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fGdizB6IOmRwf5k3LU8x3C0G6TDurrnXYWwb+517vki51wv/nXwIUj50qOlfNhFTVdVzXqvGVuCCC0k1Pw7rioKqCppySWC+hhoVrn5DFtuaHoDl1h3SmfqgFcaFNNmarOvO9VpGuFkSIaEcj/MiPvtDJKRaUGRR6Vgz37RDUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr26O0Y4; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65b9d8d6b7dso5248199a12.2
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772312074; x=1772916874; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN2+88bWo1z1i+3BXW1R0w5iwrpOTleYOh4/PvtS7kQ=;
        b=Sr26O0Y4QHHJWtRdnKGN3IllO4lqd/f5FRQbOzqsbJWkaWvMM4SdvdOY8Js+diW1SE
         eBkfIH9yttgwJOevM4Z+XEvy7K6hZEgejeln/Q7UXl6kIT5M3vl5C2a6QIaXfLPyRQkY
         mtiU8DlVNJVKhwM8LPLXUd8TAv1ufKvwroVAVMbu9xt+99EICif136HbgxOrcuCWQmyH
         Kvy505G+fohxORqNdM7LWxpGJ1S50D6SezGDiXFUgdA/hU9V309EsgUctmv6rW416Hea
         /iTM4ubnCGFV6FlKZJNBeaGfh49VmknD1Q0dqu0vOAGgt1Jd0A0WjpqCwt0zopU81OOM
         lo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772312074; x=1772916874;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN2+88bWo1z1i+3BXW1R0w5iwrpOTleYOh4/PvtS7kQ=;
        b=nSB7p48XXo5nNoM14sYHXxJIgtLa6C/VHqL5jjGO7oFUFn1qAXlrmul9GIdQepUsZa
         PaLpVnjLsLSPX437KqjnYK7PsLi03W81AdxeJMaikyAtsxHWeepiBoojGRn3lrDZ4zgh
         uU1mClY6f/JvY3CCMrf6nIzPHWtELkrk3WWf+onuciboqy3Ps7yNsAntxlwHOM2k6gMe
         kldn4sp0Wn54JhJ40WVk3+iXenmh0Gd6bOtTyhspy7OZjHm/JyFokjnYaNM2FBYGu4D8
         Jg2I7HJ/Cxzyoktl9INhMQL8w/9PkaQ14XRReIF/SPfpOjbHQ7zMy7MbcKz0lRP9+heY
         nFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBvNVsFF6c/4HdOaKGZBx+V3TZoVssCi7cAgShw6FSpXMaOJILzjH4fnMa4jHORGJ3QPsa2SYO1wyQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxl15EkEG4TZsAw02n+NWUyQhdIyMC8MhHGuMuAQs4Y84H7B9h
	ynyofc2IpS9p7tHF3s2ipdSok3PK/+bMP2buAVSNLJCeWZJXoEX6Seuu
X-Gm-Gg: ATEYQzyXceEUpUx8QkpFTvkFlybmTWWNj5eJ2LJ+Znv/vIsFte3q56LmCcy4RB02Bke
	2YU94UlyvL2D1rI2tU/dQGtsqNKVTDGIL+gibLSOJK9AtvMFMywjL3zfeEDV2SAT9cj+QOllPIH
	3ZcQbBWp11Lx2/hvojceNClth7pBa/H0dUO3XPhmxsHNkTQVZ8zqKw+Dz5POipHDIBaIlAneFJ+
	tFpWTp2tgr3gf/oiuaBgXMwJl9loWMHOMBQHOXuCaxOLwbO34ML/4KxH3iw+3J1CeHMaiaTY+Av
	xYb1Nt//dogs+/v9Ap2djoklBro4a0pMfknWe/gpld8C5Uzbhl/sUi2GcSakOGvNeJUkcaZeArM
	ffsfGMlW665XRPc/0uAG4GcSkhVd8lAQ84JwyRsmUTc5pYwkxnbKvZ7Tblv/pU1AuSRV77MOmvl
	NJCiNWZWCxEL0Y4sZg2RCOX+V4awtaqwWCLjHnwW1gHSgv9Enim2lJAWHJonU3iLlixuJ0BNC1f
	Yka4hvxsPRCLPwOd8eWTDY5xuxXKxsRyX16znPlop5fTlX738cMlfwg6/48FcMBmQ==
X-Received: by 2002:a17:907:2d2c:b0:b88:713e:7895 with SMTP id a640c23a62f3a-b937636ce1fmr468067366b.3.1772312073608;
        Sat, 28 Feb 2026 12:54:33 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac70b01sm272676466b.23.2026.02.28.12.54.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Feb 2026 12:54:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] media: venus: allow interlaced video streams
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 21:54:20 +0100
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53855-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B0A0D1C89E4
X-Rspamd-Action: no action



> Wiadomo=C5=9B=C4=87 napisana przez Dmitry Baryshkov =
<dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
>=20
> Venus driver errors out on the interlaced streams with the 'field =
isn't
> supported' error message, which e.g. prevents decoding of the MPEG2
> video streams. Don't error out if the buffer is set to contain
> interlaced data.
>=20
> Tested with the fluster enabled to handle MPEG2 through Gstreamer:
>=20
> ./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so =
venus-mpeg2.md -j 1
>=20
> GLOBAL SUMMARY
> |TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> |-|-|
> |TOTAL|30/52|
> |TOTAL TIME|75.526s|
> |-|-|
> |Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> |MAIN|26/32|
> |PROFILE_4_2_2|0/9|
> |SIMPLE|4/11|
> |-|-|
>=20
> Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf =
field")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> drivers/media/platform/qcom/venus/helpers.c | 5 -----
> 1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/helpers.c =
b/drivers/media/platform/qcom/venus/helpers.c
> index 747c388fe25f..71e79093a4c7 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct =
vb2_buffer *vb)
> if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> vbuf->field =3D V4L2_FIELD_NONE;
> - if (vbuf->field !=3D V4L2_FIELD_NONE) {
> - dev_err(inst->core->dev, "%s field isn't supported\n",
> - __func__);
> - return -EINVAL;
> - }
> }
>=20
> if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>=20
> ---
> base-commit: 779cae956c8316aebc1946ef86ca001f99658270
> change-id: 20260228-venus-mpeg2-495f9187a1ec
>=20
> Best regards,
> --=20
> With best wishes
> Dmitry
>=20
>=20


Dmitry,
I applied this on 6.19.4 mainline and give run with interlaced content =
(hd tv) on qcs6490 (radxa dragon sbc).
Playback fails like this: =
https://gist.github.com/warpme/a368983678af0a76af85314808773076
pls see a bootom kernel output showing venus failure.
my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause =
isn't in my userspace....
pls let me know if anything extra is required to fix venus decoder =
issue.
br=20
  =20=

