Return-Path: <linux-media+bounces-21368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D262A9C6D3D
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 11:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95680B224B5
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6A61FF03D;
	Wed, 13 Nov 2024 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="B2a0E3KN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD818308A;
	Wed, 13 Nov 2024 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731495517; cv=none; b=b98TasY2TzhSM37sWKHUwiJuRXwDiOC8DG9jomowHSDRgrH0asbLM7h1dhx0ERTQ20Q8JE8AqqYKkduI8ggIFlvnquItue0EWKgUKNC2qQRjkV9pVqeC2RNWz0qhTsq7BtcRwO1DMqRnHe9YJTaydxTzvZAfzS8fJnwMXWl3MzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731495517; c=relaxed/simple;
	bh=hsJEgrTJHMEK3hICTwBLQOlExKHnDynPacohRZwezKM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=nMRcjWkv2dyyd1harGQ7PvmlBbBT9smO/OIlRpVfGslR/xcTpldfdZsgfFblUTwvtDZni02PVLkfWfZmnoVT+oQZP+VGaUy/SKDJgt6MZry0tV5LyavicMP1zn8q5Lj32uvdikdayl9RNG2eh6+2c1wIEDSaVF2DebNof4WyInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=B2a0E3KN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id DEC3AE44EA;
	Wed, 13 Nov 2024 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1731495512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeAs66+zxivqZ/vkvA1r4hoxKVIMtPgmr/Q5nHxUYUk=;
	b=B2a0E3KNDZuFvK1rq5OVWe1Bhyvw7ZWQ3Z2C1eXjvCxtGknkpcx3Ap7jJTOEgSguB1d+2s
	6fhPteAu5JAEITZdHL6pTVc6GcusZnUjqE61oUvbPeMmaQEZWRtmEstSAHHahwaplw01pN
	J9WTupkhm8pMI6FDHbBCRgZQSbMThHjScoH2U3aFyqHUoFpF3Ot6VijhGn+6bAnw56bGb0
	CQzS2fuyFBtf5V6HZZ7NmiLf6FvDcKVmkkUpOd/ZUX8O688TZKrolC0DkQDTWEUYGcpYan
	5EtvVHejCbI0Gr6+fUplw0UdtdcD98qHTHqS5YB0xVAz90Sqm7bsIVnWr+qZaQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 13 Nov 2024 11:58:32 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vladimir Lypak
 <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add MSM8953 resources
In-Reply-To: <7f8172ee-8285-4e7c-8ba3-826a5516fa9b@linaro.org>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
 <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
 <6833ebc6-9210-471a-8ca6-5f3605155f33@linaro.org>
 <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
 <7f8172ee-8285-4e7c-8ba3-826a5516fa9b@linaro.org>
Message-ID: <c09f206bee80d2c3d632ef07a5d17e4c@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-13 10:53, Bryan O'Donoghue wrote:
> On 13/11/2024 08:01, barnabas.czeman@mainlining.org wrote:
>>> I see that you do reuse csiphy_res_8x16 for this platform support, in
>>> this case let me ask you to double check/test that the "vdda" 
>>> regulator
>>> is actually a CSIPHY regulator, and if so, please move the 
>>> registration
>>> of the regulators to csiphy_res_8x16 as a preceding change.
>> It is placed in CSID at downstream and this is the documentation of
>> the downstream property:
>> - qcom,mipi-csi-vdd-supply : should contain regulator to be used for
>>      this csid core
>> so it should be a csid regulator as i understand.
>> It is also placed at CSIDs in msm8953-camera.dtsi
> 
> No, the regulator(s) supply voltage to the PHY.
On sm8250 it is for csiphy but on older soc like on msm8953, msm8917, 
msm8916
this regulator is placed in csid nodes.
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8953-camera.dtsi#L96
There is no regulator in csiphy nodes only PM domains.
I will check later move the regulator to the csiphy.
> 
> Make sure you have:
> 
> commit 44fdbb9d1a3892db92b2c9cf5f46e32ca4095d92
> Author: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Date:   Fri Sep 27 00:19:56 2024 +0300
> 
>     media: qcom: camss: add management of supply regulators to CSIPHY
> 
> and give the change a try.
> 
> ---
> bod

