Return-Path: <linux-media+bounces-41982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5DDB48A85
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61B6170BAA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DFC2F879;
	Mon,  8 Sep 2025 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="rHRRoMKi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FD11AAE13
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328464; cv=none; b=iz5ijspincrQLIISo1eZ2E8h9uQlh5mXl4Z8b7XOVMk9hvq2IqAz19pkkW3x4F9RarVX8Oos30l87OyDXjqExft9dH1Ih2XcmmkROXKbtJvtSROnx4GLprg+xm1TvNHG+XlPVuf7elpur5ByoP0xYasue3mCSdf8rO/3EPypJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328464; c=relaxed/simple;
	bh=GRAURU3Mqaf7KaktvQ1n9Gicg1JGR9+tA9y0iqtZSrw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETiGMzTvkOVDmG7RPtdJnsdEchz3AYm8YKiSny03iAL4/G47ZKO0QtTYpOmxTWenYvdAt2ZZQw07tZMlVNt9D+0/hM+ZS5OXVai3h2nG0IG+M1t+CGTObh6WH+65SRuml1KUeIL2G/J9u7qdOY86pqtoDFKNv9UFzWymivQSCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=rHRRoMKi; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757328453; x=1757587653;
	bh=GRAURU3Mqaf7KaktvQ1n9Gicg1JGR9+tA9y0iqtZSrw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rHRRoMKiSM2IqxK/L4hzKFWIdzT4Omy5CUfdK75ZKOXkMBT44K9qh4djCHzv13vWS
	 8y3TlB8Rr+MyqrLJlMv/Prh0+2eBS6smgYdNjK+7xjgCvb9PgeX+81cgPcPEHgp38y
	 rajgb0ozlR2a6pNhphhRxkS2n9+6c0vGTHVCu3cZMkvIy3QdsVEb1r45mHFLvXj5ee
	 P7vPxuBWlZIoqmaUkg+C6atj89phdhgsB8bW59T7QecoDbVoKN3HXF0m/XaM7dFfTU
	 4/J/VZXNHFAgOZUEUFGJjvlbD+XK1cyoavMuQc6FmyNizU6VRx2SLNm/5RJ4DbY3eb
	 QBy9qg40q+HcQ==
Date: Mon, 08 Sep 2025 10:47:27 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
Message-ID: <dMbLo1ph9fkRREvsauWvJiPeAWXSJwCHx1dgUC_1xcJvDPjOzydsGiEUipaM_KZqeiwgacNxZbAvSLndg1jo2LnFaKcnFJK72S-NFtjuHOA=@vinarskis.com>
In-Reply-To: <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com> <20250908-leds-v3-2-5944dc400668@vinarskis.com> <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com> <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org> <39b955b9-a152-458a-8e09-908efebaaccd@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: bdeaa268caab16c72c28850bbc5c56704aa415ad
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Monday, September 8th, 2025 at 09:36, Konrad Dybcio <konrad.dybcio@oss.q=
ualcomm.com> wrote:

>=20
>=20
> On 9/8/25 9:33 AM, Hans de Goede wrote:
>=20
> > Hi,
> >=20
> > On 8-Sep-25 09:20, Konrad Dybcio wrote:
> >=20
> > > On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> > >=20
> > > > A number of existing schemas use 'leds' property to provide
> > > > phandle-array of LED(s) to the consumer. Additionally, with the
> > > > upcoming privacy-led support in device-tree, v4l2 subnode could be =
a
> > > > LED consumer, meaning that all camera sensors should support 'leds'
> > > > and 'led-names' property via common 'video-interface-devices.yaml'.
> > > >=20
> > > > To avoid dublication, commonize 'leds' property from existing schem=
as
> > > > to newly introduced 'led-consumer.yaml'.
> > > >=20
> > > > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > > > ---
> > >=20
> > > [...]
> > >=20
> > > > + leds:
> > > > + minItems: 1
> > > > + maxItems: 1
> > >=20
> > > My brain compiler suggests this will throw a warning (minItems should
> > > be redundant in this case)

No complaints when running `dt_bindings_check` on this nor the camera senso=
r
that uses this binding. I thought it would be better to keep it even though
right now only one LED is supported, so that when `led-names` are extended
with new functions, one can just bump maxItems and not accidentally forget
to introduce minItems. No strong opinion though, perhaps Rob can decide
since he is the one that suggested to add minItems,maxItems that I didn't
think of?

> > >=20
> > > > +
> > > > + led-names:
> > > > + enum:
> > > > + - privacy-led
> > >=20
> > > Nit: "privacy" makes more sense without the suffix, as we inherently
> > > know this is supposed to be an LED
> >=20
> > Note "privacy-led" as name is already used on the x86/ACPI side and
> > the code consuming this will be shared.
> >=20
> > With that said if there is a strong preference for going with just
> > "privacy" the x86 side can be adjusted since the provider-info is
> > generated through a LED lookup table on the x86/ACPI side. So we can
> > just modify both the lookup table generation as well as the already
> > existing led_get(dev, "privacy-led") call to use just "privacy"
> > without problems.
>=20
>=20
> In that case, it may be cleaner to just go with what we have today
> (unless the dt maintainers have stronger opinions)

Sounds good, thanks both for the feedback.

Alex

>=20
> Konrad

