Return-Path: <linux-media+bounces-48686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BDCB7A9B
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC01C302BA88
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7BF267731;
	Fri, 12 Dec 2025 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="CBwVWto5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03451DE4CE;
	Fri, 12 Dec 2025 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765506064; cv=none; b=MfGA/WWhoADNYJ8DAwlM8+hsIPiEZK9aS7m8Tzl+/x7mLYg8DtRTbkVtfEKCYvsf8mFtA7z9+Ri5tpE3FmNyHIVpVGtJnMmtTbr9QTFmZnpZ2mCGqCMezElxVRj/O879sgvxkEAF+XZkbwKGH8pxFSgAMPt6udJ85ruK5B2cu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765506064; c=relaxed/simple;
	bh=O/3l2CepK2qgQr5KuIjsMlLs9pGy2jJUiJ2sEuBxLoc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PBBeSQbdbaHRPos561j4XpqHamjLShoWrC5wi+Tgd5V5v5goyiRcZQBbDTdzhSNrKJOiNOm6mD6G4hW1EdD7toYsPfLBq7JZHnpS2pVXgwCNkkkiZrywnUoPZJpmhPFEZm9bD/XQ8xuAZp02zKZ9oiEMdLGXwDYDqEo0YQD8fH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=CBwVWto5; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail3; t=1765506059; x=1765765259;
	bh=LsbgIYYKc85t8t0G1uxzrHhXL5/jAfCkvGvds6Wvcog=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CBwVWto5PCzosbHyooHfhje4S7MDxlVtibXL42q+8rmQ7tV4xQB/vLVWe+R/uGEL4
	 KXKwBlvf3Hv0oEg2hQrb4A0tr3Tw3+XFdz00jN1kjJx2MNwu4VSuQqLLOa1qbqM4bV
	 +4R4oZL8i7oHCERyRbhs8eO6P3f2VeGJAkb0kklSGudLEmRBOZJx5ND7DJCCh/ZkL6
	 +2uP6eU7P0TM9RJeYgIjjO3NAKRRzBo7fv2lBX8u1j1KG5piqMphXgCLDMYbcCd0Og
	 hlcyMPtO2nGsW2tm+QVtSWCP6eptbSzQOCF7BzqrsfX79B+VDTuyFBudgZcmx4nOE0
	 FSRLwmUg4+aIg==
Date: Fri, 12 Dec 2025 02:20:53 +0000
To: Richard Acayan <mailingradian@gmail.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
Message-ID: <107815a6-6e5c-472a-bf37-ff0719ca7186@nxsw.ie>
In-Reply-To: <aTt7lGXU5IPfANxq@rdacayan>
References: <20251211014846.16602-1-mailingradian@gmail.com> <20251211014846.16602-6-mailingradian@gmail.com> <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot> <aTtkwQb2gOeWAFuv@rdacayan> <2fff55c6-aea5-4019-bcb9-eaff3b44474e@nxsw.ie> <aTt7lGXU5IPfANxq@rdacayan>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 0e1cb3415bf300d71fedaeaea847b52befbdcdd2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/12/2025 02:19, Richard Acayan wrote:
> On Fri, Dec 12, 2025 at 01:45:52AM +0000, Bryan O'Donoghue wrote:
>> On 12/12/2025 00:41, Richard Acayan wrote:
>>>> This would be much better:
>>>>
>>>>     &camss_endpoint1: {
>>>>         clock-lanes, data-lanes, remote-endpoint here
>>>>     };
>>> I'm not sure what you mean, there might be some typo.
>>
>> At least for me the endpoint name could be improved see:
>>
>> Take arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>>
>> Also since you likely have more than one sensor I'd suggest endpoint@0
>=20
> Uh... the front and rear camera here are on different CSI ports.
>=20
> Something like:
>=20
> =09&camss {
> =09=09ports {
> =09=09=09port@0 {
> =09=09=09=09endpoint {
> =09=09=09=09=09... // rear camera endpoint goes here
> =09=09=09=09};
> =09=09=09};
>=20
> =09=09=09port@1 {
> =09=09=09=09endpoint {
> =09=09=09=09=09... // front camera endpoint goes here
> =09=09=09=09};
> =09=09=09};
> =09=09};
> =09};
>=20
> Would they both be endpoint@0? Or would the front camera be endpoint@1?

Yeah no fair point you're right, that @0 is useless.

Ignore.

---
bod


