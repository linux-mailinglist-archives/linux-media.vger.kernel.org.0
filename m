Return-Path: <linux-media+bounces-58770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKOaI9nQ3ml0IgAAu9opvQ
	(envelope-from <linux-media+bounces-58770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 01:42:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 081573FF1E0
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 01:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00EED30811BD
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 23:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3593CAE90;
	Tue, 14 Apr 2026 23:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="jKd1dHOu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907DE3BE145
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 23:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209951; cv=none; b=BSaUqnGmQEwimkAIxW5mtDNRRKZG+95CnV/0xkg9zufQVrvAT5PDZV5jgOHi0TtLVEQlkWzQlJrtiGeaReM0E3AoWzfpTX2z7oG6UOhERmK0QIiAHHS1zMslP5gh8zrTgL2+v23G2bdtg61lXO0zC2N9WLs79/e2xiVsXHZxmq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209951; c=relaxed/simple;
	bh=ZQsOBkB1S3n0//aolM4avdvsGyqltWWjuQg9TpDOfeM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P3hWLbH3XJgxMp+tL2s3vJe3zR0zZrBBzOee/TayfipC6ndt0mooFfXjFnHFQK24D49wTQC7P8a6P0uByjhsW/QjfWY1i5iMf5hCZ0yycwCN1bNAJ2KESbUgYnuzVr3N40Mk6TJKgsffMcj993sDCnxRBAcTayDBjUXUCUajk2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=jKd1dHOu; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a08fa355a1so87072206d6.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1776209948; x=1776814748; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xdcDizxUzZtD3adFCvdchJhJRQ2hD09xTn0vHjtmQjM=;
        b=jKd1dHOu8CUFco7qVVWGRl5mBx40cygBhTdsm1y5zcT2TZgT5p72fpNiJUhY0XcBAK
         qfuM6d2pesrt56hgSRWt4wnnWPrKoAjncqvgPr1KF+kB7z5ITjeUqovogWQ2an3I2AsH
         +BgLVtA/1YwsYmkfSvFKpf2ksqtco007lEGXCWQi/n4hlxwy3BuS75rKHtuOE0k1S+91
         mTppkSzayK48PfHHbiB5QcssB4sGuHDfq1QhkLaZaokPLhKnmNYeknO6o7u5d7T6isR7
         7e4fHNdOHW/iNft/GtB+o8hgfvAShhTBn6+B4DHkNOMzvGogXsgsNR6/RLbyHzHEDvsY
         X2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209948; x=1776814748;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdcDizxUzZtD3adFCvdchJhJRQ2hD09xTn0vHjtmQjM=;
        b=nzt8ZPc4txqnaSBsLxR8XDvXYVWPTbqdSv7+2LYkmvxBW3wls3Oo8eyLReBatE0DIx
         GgnCYTarnrnCRIv6ElHtZJ0iarjbitujGie3QjPcf8DUQff5EwcGJZLSB/rKxpQlDb3V
         4+KcgA3SLrPOOhA/9jNsJLi10J3wJ+IHqFw581DO6FbHuVclwdUT4biiDs4zqhMrm7fe
         TOx85hBeoMp8m5mCDIxdg7nQ4I1owlMtsGXlCuV+6AqkXRHd69WaRLCh0+UrdJrpbiSH
         sjfXHNPpp+WEsFIoP7Gk3eehyOe51HNiN4FObzD0gIlgWnzUaJtLDuZ20j0W/wnHGP2W
         4zgw==
X-Gm-Message-State: AOJu0Yxxp1wsCl4HAUxRnVJaLHVEC+uUd6Ei1ZumiVoOZRhIC9Vqb/Gs
	N9KC9nvi1rWJblK+EP+k3yB6Jp2FaaC1/wViVGx4d/TX9S0l3SEFjdLaF6aLGZPyw5g=
X-Gm-Gg: AeBDievQS25bJiltzPpZt3gf2OC5SF29C/jBp3Rl24z8yT/V2F5THVf8XDU+1k8yw9G
	BqnlWyej+c05db9QqQn3TFl/E8d3aCH6fugMxyOJ06bVzzGXtZNNPDH7jsURBbZl3oYEDQTx8Mf
	5Nt8w9tFcOcdft0fUbov1/6DqDvVidY1NCU07nyBS44iZDeVMVd8kHZ8ch8Gq7KBObBYM0gI9md
	Tr/1SJcBSRvDgjiNht0ibSMU5EEdJt1aW8Ef/0dVRHLBs2Ki+dBMRTnhFIS7RgoN8pc97PqV/ui
	syIHp+2uOar2PcBe1cnnzX44Lgqubh038akCHRwnludMz7lv4Go9Jil9p0LiCdV8ES9Q6a7GcGe
	vWPHkl+iRQkZSExFEdYz5PP2TTFAWO/Wk3i1MoyRYGcdNGKouWUYVYJSQVdFbMfVj7PPpR4Pe81
	j769TIdX0B04ScmZmW6zAFSQmyW+zYIuCxpvJBVYI=
X-Received: by 2002:a05:6214:2503:b0:8ac:b204:3238 with SMTP id 6a1803df08f44-8acb20435f5mr139156866d6.30.1776209948439;
        Tue, 14 Apr 2026 16:39:08 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8aca5222c8esm93751436d6.28.2026.04.14.16.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 16:39:07 -0700 (PDT)
Message-ID: <5d9c38edcfa4faffdf9d02a318f87355a5c9a021.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vishnu Reddy	
 <busanna.reddy@oss.qualcomm.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 14 Apr 2026 19:39:05 -0400
In-Reply-To: <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
References: 
	<20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
	 <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
	 <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
	 <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
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
	protocol="application/pgp-signature"; boundary="=-CdX+pDs4e4UxKbXGxFhm"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-58770-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 081573FF1E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-CdX+pDs4e4UxKbXGxFhm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 avril 2026 =C3=A0 13:59 +0200, Neil Armstrong a =C3=A9crit=
=C2=A0:
> On 4/10/26 12:10, Vishnu Reddy wrote:
> >=20
> > On 4/8/2026 10:13 PM, Neil Armstrong wrote:
> > > Update the gen2 response and vdec s_fmt code to take in account
> > > the P010 and QC010 when calculating the width, height and stride.
> > >=20
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > > =C2=A0 .../platform/qcom/iris/iris_hfi_gen2_response.c=C2=A0=C2=A0=C2=
=A0=C2=A0 | 19
> > > ++++++++++++++++---
> > > =C2=A0 drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 21
> > > ++++++++++++++++++---
> > > =C2=A0 2 files changed, 34 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.=
c
> > > b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index 8e19f61bbbf9..d268149191ea 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -542,9 +542,22 @@ static void
> > > iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_ip->width =3D width;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_ip->height =3D height;
> > > -=C2=A0=C2=A0=C2=A0 pixmp_op->width =3D ALIGN(width, 128);
> > > -=C2=A0=C2=A0=C2=A0 pixmp_op->height =3D ALIGN(height, 32);
> > > -=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].bytesperline =3D ALIGN(wid=
th, 128);
> > > +=C2=A0=C2=A0=C2=A0 pixmp_op->width =3D pixmp_op->pixelformat =3D=3D =
V4L2_PIX_FMT_QC10C ?
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(width, 192) : ALIGN=
(width, 128);
> > > +=C2=A0=C2=A0=C2=A0 pixmp_op->height =3D pixmp_op->pixelformat =3D=3D=
 V4L2_PIX_FMT_QC10C ?
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(height, 16) : ALIGN=
(height, 32);
> > > +=C2=A0=C2=A0=C2=A0 switch (pixmp_op->pixelformat) {
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_P010:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].by=
tesperline =3D ALIGN(width * 2, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC10C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].by=
tesperline =3D ALIGN(ALIGN(width, 192) * 4
> > > / 3, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_NV12:
> > > +=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC08C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].by=
tesperline =3D ALIGN(width, 128);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pixmp_op->plane_fmt[0].sizeimage =3D i=
ris_get_buffer_size(inst,
> > > BUF_OUTPUT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 matrix_coeff =3D subsc_params.color_in=
fo & 0xFF;
> > > diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
> > > b/drivers/media/platform/qcom/iris/iris_vdec.c
> > > index 719217399a30..ca0518c27834 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> > > @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, str=
uct
> > > v4l2_format *f)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt =3D inst->=
fmt_dst;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->type =3D =
V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_m=
p.pixelformat =3D f->fmt.pix_mp.pixelformat;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.width =3D=
 ALIGN(f->fmt.pix_mp.width, 128);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.height =
=3D ALIGN(f->fmt.pix_mp.height, 32);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_align =3D f->fmt.pi=
x_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC10C ?
> > > 192 : 128;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.width =3D=
 ALIGN(f->fmt.pix_mp.width, codec_align);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_align =3D f->fmt.pi=
x_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC10C ?
> > > 16 : 32;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.height =
=3D ALIGN(f->fmt.pix_mp.height,
> > > codec_align);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_m=
p.num_planes =3D 1;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_mp.plane_fmt=
[0].bytesperline =3D ALIGN(f-
> > > >fmt.pix_mp.width, 128);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (f->fmt.pix_mp.pix=
elformat) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_P010:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
mt->fmt.pix_mp.plane_fmt[0].bytesperline =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(f->fmt.pix_mp.width * 2, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC10C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
mt->fmt.pix_mp.plane_fmt[0].bytesperline =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_NV12:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_QC08C:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
mt->fmt.pix_mp.plane_fmt[0].bytesperline =3D f-
> > > >fmt.pix_mp.width;
> > In the removed code, bytesperline for NV12 and QC08C was aligned to 128
> > bytes.
> > In the new code, Is that alignment missed or not required?
>=20
> The alignment is done right before:
> 	codec_align =3D f->fmt.pix_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC10C ? 19=
2 :
> 128;
> 	fmt->fmt.pix_mp.width =3D ALIGN(f->fmt.pix_mp.width, codec_align);
>=20
> calling ALIGN(f->fmt.pix_mp.width, 128) again is a no-op.

What typically other drivers do is implement a static table that associate =
a
v4l2_frmsize_stepwise to each format, and possibly per HW generation. And t=
hen
uses v4l2_apply_frmsize_constraints() to apply them generically in their
try/s_fmt functions. This make lot cleaner and clearer code then the sate o=
f
this driver.

Nicolas

>=20
> Thanks,
> Neil
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
reak;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fmt.pix_m=
p.plane_fmt[0].sizeimage =3D
> > > iris_get_buffer_size(inst, BUF_OUTPUT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->buffers[=
BUF_OUTPUT].min_count =3D iris_vpu_buf_count(inst,
> > > BUF_OUTPUT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->buffers[=
BUF_OUTPUT].size =3D fmt-
> > > >fmt.pix_mp.plane_fmt[0].sizeimage;
> > >=20
>=20

--=-CdX+pDs4e4UxKbXGxFhm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCad7QGgAKCRDZQZRRKWBy
9OTVAQDjDrJmAqZEOXX8SZYq68g2MLgk/zHNCSipt8K3Kenp/wEAh/Y/BbqAEvAn
GwHnpqw/pVb+Q+MkJnLervpmdFlT6AY=
=itdH
-----END PGP SIGNATURE-----

--=-CdX+pDs4e4UxKbXGxFhm--

