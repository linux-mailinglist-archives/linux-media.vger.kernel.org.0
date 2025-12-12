Return-Path: <linux-media+bounces-48667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FEFCB78E8
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F20883025591
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A3D285056;
	Fri, 12 Dec 2025 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="GeXhcglI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F11372618
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 01:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765503672; cv=none; b=SFjIyLO+eE47YX9zfILIgy+pjabq4DnnaQC2q0ZfKuLqYUD+P49hmQQv0R+n0QIzCF5WxmYxZ0SJ51H2dUmgeH/iqI1CiGP3WrAgtm3XzhS5zOwHtN0MoCdyH9JzkeBzGkJs2mhcUbZI0sWaZegBEnfQp0X1OLhbU/ttESJvDVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765503672; c=relaxed/simple;
	bh=omWm0Lm1jtXCTL1Uq2LFKX4o32WRTfztHJp+NK0Vgz4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L2jJ6u+cmyKLy0IstT860B0KEMP3bKYLE27HzXBAz+saXmqwl9ZYCPwuFo09RcCnQTgo9OXuDyviZrk6cWuwNPFw9lAk6r3Ay00nAAMtAGoGD41VnNCll+ujeuAlUX5EGbBjFAvqZsrmLg5X4wxBBIqqA1Mye1frOU6vchamo6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=GeXhcglI; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1765503660; x=1765762860;
	bh=Vf2kTsjxiZVFiDHQSbPBSfFwenyj9EXJT5HKgrVc4f4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GeXhcglIIg7aUcm1AA6E6ZGg8pQqD+YDSy9iQPRbFD3a0nZVHjlRXuMiU2dx5OqTA
	 9wczflQ5ajnJU0E2M6f/6YJF13+slsBs7G0FjZI3mMwzBAi+xKatF5RCsyED0yVRdA
	 ybNRwbZD4AJBJlIZh6IV8KeGqJ4LxfCoNzZzgVRTYl5SeoXo8gopehep0ZH3uZR10K
	 nFYx/4VGO1eGFu5AiFo21CxMBr6PT/i8fabPpQPM6r+Elf5a84x92/bROwkY/KgSj5
	 dmSrDOBpuDJ9+dcaWssqob5QX2QuBdHJv/dX8o+5JK179YjCCcvVdtZccO12lMIuZM
	 av7J/OgFtgZrQ==
Date: Fri, 12 Dec 2025 01:40:54 +0000
To: Richard Acayan <mailingradian@gmail.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Robert Mader <robert.mader@collabora.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Message-ID: <fce2e252-64ed-436a-92f1-0cefe383c7b0@nxsw.ie>
In-Reply-To: <20251211014846.16602-5-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com> <20251211014846.16602-5-mailingradian@gmail.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 4e74b436191f5053f4bd93e069c8706c71fa0992
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/12/2025 01:48, Richard Acayan wrote:
> The camera subsystem is added for the SoC common devicetree, but the
> mclk pins should also be common across the SoC. Add the mclk pins for
> the cameras.
>=20
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.=
qualcomm.com
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index c275089237e4..69e84cd8ed27 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1190,6 +1190,27 @@ tlmm: pinctrl@3400000 {
>   =09=09=09gpio-ranges =3D <&tlmm 0 0 151>;
>   =09=09=09wakeup-parent =3D <&pdc>;
>=20
> +=09=09=09cam_mclk0_default: cam-mclk0-default-state {
> +=09=09=09=09pins =3D "gpio13";
> +=09=09=09=09function =3D "cam_mclk";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
> +=09=09=09cam_mclk1_default: cam-mclk1-default-state {
> +=09=09=09=09pins =3D "gpio14";
> +=09=09=09=09function =3D "cam_mclk";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
> +=09=09=09cam_mclk2_default: cam-mclk2-default-state {
> +=09=09=09=09pins =3D "gpio15";
> +=09=09=09=09function =3D "cam_mclk";
> +=09=09=09=09drive-strength =3D <2>;
> +=09=09=09=09bias-disable;
> +=09=09=09};
> +
>   =09=09=09cci0_default: cci0-default-state {
>   =09=09=09=09pins =3D "gpio17", "gpio18";
>   =09=09=09=09function =3D "cci_i2c";
> --
> 2.52.0
>=20
>=20

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---


