Return-Path: <linux-media+bounces-33409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935BBAC4303
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 18:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 464267A2281
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BCC23E336;
	Mon, 26 May 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b="Z19Do2EK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailo.com (msg-3.mailo.com [213.182.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D7202C26;
	Mon, 26 May 2025 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276926; cv=none; b=mNS4WgMLqAw1g8iVE6KcRbh1yEgA9P+9yOtXbvad2FXBdWnulXyWv6+L27RICZJDtN/Ss/+4YzROhI3eWFAAFFx2HHulADtbyar//UnAHOmZzWGlLeB0gtDIkxPaprtwFXNMAF7k50Alk1yDkKqICe7iJW7X5QJ5b3/9eOur18A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276926; c=relaxed/simple;
	bh=WesYvToAs6WtM8/JvS/w8lPmZbCAauuQs9r0LMUFeFE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hhkbETGAzVDb6nb7b3An9f7PIZBuW5Mt31uEwM6I3CSblFzFor4ykdkPgpVdyYxssWfuxRc/in774rw7Xe8wf9kQ12bBQu0G/ONyQtwcJv3SqAAZmGR+TxPwqsWabF60H9Dcj59jp2oLvcs6F9jfFi8rTUsAUg2+T6y0+hjFax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org; spf=pass smtp.mailfrom=mailoo.org; dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b=Z19Do2EK; arc=none smtp.client-ip=213.182.54.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailoo.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1748276913; bh=WesYvToAs6WtM8/JvS/w8lPmZbCAauuQs9r0LMUFeFE=;
	h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Z19Do2EKRVwFrJHxN1AoJcz9J3VcCpGqfS0gsNY0Nn9dsvxE8wC1GwQFRJQI5tvk0
	 kQNNoZ13VhGNjRcgRrmwkXClnvzCaKD1GRO5Mb5Yo54me8ne+ZqYX43/VwQBY+1XtG
	 H+r53OMlqUbJzdLHXCzLzDPgPJsAxxZIzf044/98=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
	via ip-22.mailoo.org [213.182.54.22]
	Mon, 26 May 2025 18:28:31 +0200 (CEST)
X-EA-Auth: thZI+eq+wJnB9pJ071hare+VCuHcapIAEi1zIKZM2k/VH4RxG/+cQFwy5X4Kg1nKahXEAeXZY5flnhMcupOr8OYi0eaUG8aXoIBwG0RcQos=
Message-ID: <a1645a74b59c29a567477e4b3a42391f40ba0591.camel@mailoo.org>
Subject: Re: [PATCH v2 2/4] media: qcom: camss: Add support for MSM8939
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss	
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson	 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?ISO-8859-1?Q?Andr=E9?= Apitzsch
	 <git@apitzsch.eu>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Date: Mon, 26 May 2025 18:28:30 +0200
In-Reply-To: <cc43d9b7-13ba-44ea-9b37-fc54c0d1f2e0@linaro.org>
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
	 <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
	 <cc43d9b7-13ba-44ea-9b37-fc54c0d1f2e0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 26 mai 2025 =C3=A0 09:20 +0100, Bryan O'Donoghue a =C3=A9crit=C2=
=A0:
> On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> >=20
> > The camera subsystem for the MSM8939 is the same as MSM8916 except with
> > 3 CSID instead of 2, and some higher clock rates.
> >=20
> > As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> > (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> > This fixes black stripes across sensor and garbage in CSID TPG outputs.
> >=20
> > Add support for the MSM8939 camera subsystem.
> >=20
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > ---
> > =C2=A0 drivers/media/platform/qcom/camss/camss-csiphy.c=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss-ispif.c=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |=C2=A0=C2=A0=
 7 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss-vfe.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/media/platform/qcom/camss/camss.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 157 +++++++++++++++++++++
> > =C2=A0 drivers/media/platform/qcom/camss/camss.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 6 files changed, 173 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers=
/media/platform/qcom/camss/camss-csiphy.c
> > index c622efcc92ff3781d7fc3ace0253c2d64c91e847..6311fc2975aa1345e430a47=
7c8a6476f1d7e5663 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > @@ -605,6 +605,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
> > =C2=A0=C2=A0		return PTR_ERR(csiphy->base);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (camss->res->version =3D=3D CAMSS_8x16 ||
> > +	=C2=A0=C2=A0=C2=A0 camss->res->version =3D=3D CAMSS_8x39 ||
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 camss->res->version =3D=3D CAMSS_8x53 |=
|
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 camss->res->version =3D=3D CAMSS_8x96) =
{
> > =C2=A0=C2=A0		csiphy->base_clk_mux =3D
> > diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/=
media/platform/qcom/camss/camss-ispif.c
> > index 2dc585c6123dd248a5bacd9c7a88cb5375644311..aaf3caa42d33dcb641651e7=
f5bc0c2a564d85bfa 100644
> > --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> > +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> > @@ -1112,6 +1112,8 @@ int msm_ispif_subdev_init(struct camss *camss,
> > =C2=A0=C2=A0	/* Number of ISPIF lines - same as number of CSID hardware=
 modules */
> > =C2=A0=C2=A0	if (camss->res->version =3D=3D CAMSS_8x16)
> > =C2=A0=C2=A0		ispif->line_num =3D 2;
> > +	else if (camss->res->version =3D=3D CAMSS_8x39)
> > +		ispif->line_num =3D 3;
>=20
> > +		.interrupt =3D { "vfe0" },
> > +		.vfe =3D {
> > +			.line_num =3D 3,
>=20
> Hmm should we really be setting line_num inline in the code ?
>=20
> I don't believe we should.
>=20
> These parameters should be passed from the resources structures.
>=20
> ---
> bod

I've just followed suit, no strong opinion about it.
Can we agree this could be changed in another series ?



