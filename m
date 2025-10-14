Return-Path: <linux-media+bounces-44478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F68BDB50A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 22:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1CB24EAB71
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 20:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6CB3074A2;
	Tue, 14 Oct 2025 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INYZIRSr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83747274B58;
	Tue, 14 Oct 2025 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760474965; cv=none; b=cYLbcmeJ2WRCSjd6OjL7jKiTcN8rwJNqZOvdYwbxhsZV0a3zfPgUheXHevbXOvLztRHHltrZDq/G/xdfsjvEjTNejgmw78BCr34aNqrzJAM1MM/3NU30fDR/5WnGwhpznh7pcO2BTn4ARdyKO3oiKiarDhxoxvTnMjoAfJzZjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760474965; c=relaxed/simple;
	bh=tXxoIaagHe+5VMj+FXUqlWujyDPl5vQQh4jPiiPWkL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrVuD4qYm4sS15ujdthRrhCWNLRgFkWHNDPjd0UQdAvSBRaEZsii9Y9xLqMpysTFZNEUBXkFZn2FbTu4QTrcM4vSj2JXJyuptRUTRQPuPsWk/+vonaWzWWAZHUZ+KMFfpYizYFuflBxv4Y9j76jKzfviw9O6HysB4KWO/YIeCDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INYZIRSr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AF3C4CEE7;
	Tue, 14 Oct 2025 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760474965;
	bh=tXxoIaagHe+5VMj+FXUqlWujyDPl5vQQh4jPiiPWkL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=INYZIRSrT7y702jE2lZ9osZtFn4C2FROtPO81si8JKVE5YyVwJ0X6M3nwdMo8tz11
	 ber2+g8dRiw6VZCKo7uTr+wwcUiCYCQ0lR2Qw9MGGrmpY8Hxo/rwwmlD5tWxY59HLM
	 72UDkgsf9SYxEwvbZDFneR4vUVIf4QjUlTAAemlNZjo0JjwBEAbcqJM1yC3iPsNXbB
	 G4x07ssr76MD4diwFdsXsMPIDdldl8V4BpfWR6ZltETs7ZQZ7ixBy6wQEFUzpaPo47
	 fnuja1AOJIpy1vvMy1z21tzlUcmVCaqEN2TRWEg8tAY/CH6WoHo62S6+Mcwxk1vX3O
	 o4FCOdB2nGOSQ==
Message-ID: <fa3c1732-328d-46a2-8514-2e7f9ca6c63f@kernel.org>
Date: Tue, 14 Oct 2025 21:49:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
 will@kernel.org, saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
 mchehab@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
 <hOs24ZavnUyKYyNwBWwRpYnrsefzBfp95yuy9zyp1ByxR9_3VacGX1Yntt8pCE4w3gllPwvevs1AZqghmwKoFg==@protonmail.internalid>
 <zcgn4xw2xghyna2eysavujbzbiydyki7p7upzzv7one5mdyjy6@sj7f75kc4vwu>
 <fb767586-a376-48eb-97b4-bf33061642b9@kernel.org>
 <a4WDx80rJP1GnGNEK0OOD5lh-m-MiAvireXdpiM9ETLKZ084sBJ2UthU_QqRbU_nwD4XtsdiyEqQ0AhxguzJ6g==@protonmail.internalid>
 <6gx74wxie4wcabq27wo5y7v36uuurez4jxlzanroepqazdlgtw@sdtv2ld47d3q>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <6gx74wxie4wcabq27wo5y7v36uuurez4jxlzanroepqazdlgtw@sdtv2ld47d3q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2025 19:35, Dmitry Baryshkov wrote:
>> Each function id can be associated with a device and a compat string
>> associated with it.
> So, which part of the hardware is described by the -cb device? What does
> it mean_here_?

The non-pixel path video encoder, the tz video encoder...

What's not clear about that ?

---
bod

