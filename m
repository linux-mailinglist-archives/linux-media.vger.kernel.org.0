Return-Path: <linux-media+bounces-48666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52283CB78DF
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5248301AB38
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AD5285CBA;
	Fri, 12 Dec 2025 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="bTT6QHCD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62926B0B7;
	Fri, 12 Dec 2025 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503567; cv=none; b=sDs8I8U14YQoPJFegL7ETKyP9ghNfs+VV/SHeaJhXGdxvFgzaJi45GcAn3DIUqKsa2JSTJmrnVqX53vfwZLlm4tyb+caToZTWQRX5tdrcf8hq4AMFtGVaHyAqgUrpCH+O+/LavVV/ql758C3ObZDCq5QWEfoNm8ReFYtNJAh6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503567; c=relaxed/simple;
	bh=1IXJ+R/nRF1p2OiDUhcU6Qic+YoyTSQGka6/QxALgRs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G41uoxRnLcd8ka7kOpgpyTK2aNEuFyZB4nnKtrJZ2RHfSMp1A5eYc1KbKqnUFnWV4Fopzo7aWgDdU27VU5Q1Fxfl95jL23qsnIT6HVTwrR6j+viH6gj7pexbC9YSjciDHWVx8HRE7/ZXhH25ZJRIVKkyMgNjyA28+F3Ae3eBr/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=bTT6QHCD; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1765503554; x=1765762754;
	bh=7PimDlet7X+DGcrSzNbhUu2K67E0rLe6upjfsSMVgQg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bTT6QHCDhT7zmEQGDFMBzuJtGE/+gQkhMtDya/mfaoRzZABPN9nxdFM3e9Nr82GtL
	 9eVwjlW0aIxNQM98sx5q88kEBbu9GCF3RG2azOjGncLUVpITIB3ViOhr+H10vfQYJC
	 Gs7UJUBx2LP5ZSvzpXahfuFlSekLInu636SPx8t5KRQIbXtimi75JfZUTftMTO2vD7
	 39vUsGJYjtIsF4x60s9Yk/I89VifHxvQRoTIGNwNSKnFslO9jgmJSpJFy1Zahov1cb
	 7Bn2slQvd/DFBcI98wgZKtUbgds+gqfsfKW9DAXrpW/ePI4TBJ6Ojbux8gl1N3WbZ5
	 GLHUAa/eYDmUg==
Date: Fri, 12 Dec 2025 01:39:08 +0000
To: Richard Acayan <mailingradian@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Robert Mader <robert.mader@collabora.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sdm670: remove camss endpoint nodes
Message-ID: <b9bef9be-4d11-4ccb-be16-3036046bc153@nxsw.ie>
In-Reply-To: <20251211014846.16602-4-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com> <20251211014846.16602-4-mailingradian@gmail.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 07b1a71a1e78ac3d78205ea67d1d99dc32b09136
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/2025 01:48, Richard Acayan wrote:
> There is no need to add these by default for all of SDM670. Originally,
> they were added so there could be a label for each port. This is
> unnecessary if the endpoints are all added in a fixup to the camss node.
>=20
> This is required since dcf6fb89e6f7 ("media: qcom: camss: remove a check
> for unavailable CAMSS endpoint") was applied, forcing all endpoint nodes
> to be probed, even if they are marked as disabled. According to the body
> of this commit, there is "no valid or sane usecase".
>=20
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@lina=
ro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 12 ------------
>   1 file changed, 12 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index c33f3de779f6..c275089237e4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1768,26 +1768,14 @@ ports {
>=20
>   =09=09=09=09port@0 {
>   =09=09=09=09=09reg =3D <0>;
> -
> -=09=09=09=09=09camss_endpoint0: endpoint {
> -=09=09=09=09=09=09status =3D "disabled";
> -=09=09=09=09=09};
>   =09=09=09=09};
>=20
>   =09=09=09=09port@1 {
>   =09=09=09=09=09reg =3D <1>;
> -
> -=09=09=09=09=09camss_endpoint1: endpoint {
> -=09=09=09=09=09=09status =3D "disabled";
> -=09=09=09=09=09};
>   =09=09=09=09};
>=20
>   =09=09=09=09port@2 {
>   =09=09=09=09=09reg =3D <2>;
> -
> -=09=09=09=09=09camss_endpoint2: endpoint {
> -=09=09=09=09=09=09status =3D "disabled";
> -=09=09=09=09=09};
>   =09=09=09=09};
>   =09=09=09};
>   =09=09};
> --
> 2.52.0
>=20
>=20

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod


