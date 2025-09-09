Return-Path: <linux-media+bounces-42085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8BB4A819
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3D09176DF6
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC7A2D9798;
	Tue,  9 Sep 2025 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="qIJhaLCL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA324285C9F;
	Tue,  9 Sep 2025 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410143; cv=none; b=E//JFMgxn7tLYsHyqlX+6TS85SgyDh4ufe6K8TSwJ/FMhe67w6UFi1crmrYrXAjj6+WisIYchnRTelYgFjpJzjm5h44QAliGw8CdRFxfjiepYGs0Zwdco7nEK/fTM6HMsQEEIjCHc6SaZTSXEKLVZwTUUCuStsjQgxALquboKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410143; c=relaxed/simple;
	bh=J2Bl0xNW+t7xKHTCiE/Unhi5wGlb90ytFuzPGIWWg4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1g2B0VZ7nXrzEo0i1WWyRcfGh1+TpCCvvUKUR/AxZkI812KLFgZjGVkcJqLub3x8fw9g4s9kF+4z1z9mXtVEbaJDUmg6NnPF4iNZx3rE2HR7yQvq18AcPIPSEQSn4UPOfm+y8G6t8fVp1Y4qmbQzU/BRraH0MVYTXcQDGKbbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=qIJhaLCL; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757410138; x=1757669338;
	bh=J2Bl0xNW+t7xKHTCiE/Unhi5wGlb90ytFuzPGIWWg4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qIJhaLCLFoLQ8mJLIStacgQB/GhMxGOdeSQxTZmwZeQEGnIXLReqexk0dosa6tkjp
	 dv4om6L0+625u8FE88x59O/yTA1pQFFO2+277zBSc82a7+KCFH9ludC08m9Jw3ijr+
	 T/GQWvxrryVzAXlQAjW3PUBZ3VC0GVqXCJA8wtTCIhdxtQRyX7RCZBza4CUhlYU6SZ
	 hcNwMPMEcLGloL7EXBKesZS2NnH1SYQVkTHDSZBjrMCGMrr0PxbQUoWI97phPFJdzX
	 6YnWJUPt75+kbC/vD1461hZI3fj/IepJ/h3y9WUeUU4LyCjAEOJLpK5RgvKGl8Wvhj
	 pZkkqD2FggAig==
Date: Tue, 09 Sep 2025 09:28:51 +0000
To: Hans de Goede <hansg@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Rob Herring <robh@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
Message-ID: <FVT6YHf1Lshr9lndhkSNVDowe3ZXPE31ULuotmmZ-brY_kmVRVj8oONZfWqE41lBIJyx4joIVRoqxdv1B_xvfGByECvOtQVS0G8xXQuDrwY=@vinarskis.com>
In-Reply-To: <bde582df-9522-48ae-9d84-fa3751c4a06d@kernel.org>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com> <20250908-leds-v3-2-5944dc400668@vinarskis.com> <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com> <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org> <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com> <20250908222247.GA1943768-robh@kernel.org> <bde582df-9522-48ae-9d84-fa3751c4a06d@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 8f3dfb17b09178de0610792c957aee4cb9802e43
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Tuesday, September 9th, 2025 at 11:21, Hans de Goede <hansg@kernel.org> =
wrote:

>=20
>=20
> Hi All,
>=20
> On 9-Sep-25 12:22 AM, Rob Herring wrote:
>=20
> > On Mon, Sep 08, 2025 at 09:36:39AM +0200, Konrad Dybcio wrote:
> >=20
> > > On 9/8/25 9:33 AM, Hans de Goede wrote:
> > >=20
> > > > Hi,
> > > >=20
> > > > On 8-Sep-25 09:20, Konrad Dybcio wrote:
> > > >=20
> > > > > On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> > > > >=20
> > > > > > A number of existing schemas use 'leds' property to provide
> > > > > > phandle-array of LED(s) to the consumer. Additionally, with the
> > > > > > upcoming privacy-led support in device-tree, v4l2 subnode could=
 be a
> > > > > > LED consumer, meaning that all camera sensors should support 'l=
eds'
> > > > > > and 'led-names' property via common 'video-interface-devices.ya=
ml'.
> > > > > >=20
> > > > > > To avoid dublication, commonize 'leds' property from existing s=
chemas
> > > > > > to newly introduced 'led-consumer.yaml'.
> > > > > >=20
> > > > > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > > > > ---
> > > > >=20
> > > > > [...]
> > > > >=20
> > > > > > + leds:
> > > > > > + minItems: 1
> > > > > > + maxItems: 1
> > > > >=20
> > > > > My brain compiler suggests this will throw a warning (minItems sh=
ould
> > > > > be redundant in this case)
> > > > >=20
> > > > > > +
> > > > > > + led-names:
> > > > > > + enum:
> > > > > > + - privacy-led
> > > > >=20
> > > > > Nit: "privacy" makes more sense without the suffix, as we inheren=
tly
> > > > > know this is supposed to be an LED
> > > >=20
> > > > Note "privacy-led" as name is already used on the x86/ACPI side and
> > > > the code consuming this will be shared.
> > > >=20
> > > > With that said if there is a strong preference for going with just
> > > > "privacy" the x86 side can be adjusted since the provider-info is
> > > > generated through a LED lookup table on the x86/ACPI side. So we ca=
n
> > > > just modify both the lookup table generation as well as the already
> > > > existing led_get(dev, "privacy-led") call to use just "privacy"
> > > > without problems.
> > >=20
> > > In that case, it may be cleaner to just go with what we have today
> > > (unless the dt maintainers have stronger opinions)
> >=20
> > Well, I do, but I guess it's fine. Please don't add the suffix on the
> > rest and add a comment for why it's there.
>=20
>=20
> As mentioned dropping the "-led" suffix is no big deal for the ACPI
> side and if we don't want the suffix then IMHO we should just drop
> it rather then making an exception here.
>=20
> Attached are 2 patches which drop the suffix on the ACPI side.
>=20
> If people agree with dropping the suffix I'll officially submit these
> upstream.

Sounds like this is the preferred way. Could you please CC me when you
submit it? I will then respin this series and indicate yours as
dependency.

Thanks,
Alex

>=20
> Regards,
>=20
> Hans

