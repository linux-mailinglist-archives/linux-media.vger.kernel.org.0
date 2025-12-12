Return-Path: <linux-media+bounces-48702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D803BCB8D5F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D88E53012DCD
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 12:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4D531D38F;
	Fri, 12 Dec 2025 12:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="SIDmzhaa";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="SIDmzhaa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAB2DEA7E;
	Fri, 12 Dec 2025 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544128; cv=none; b=D7KntCtAB8cFSDDB/1efRVlsQkxDiuYA6prsQL21ZPvGDRD2jdHxwKWy8LpZTTgK/Qjg8tCeDLTpIm7Jk6VWmvIpU16uLdAOs7M0WuHvtmdXb0LRiQg/h+Qwok2fOp2E6ITt3i5ZOt5NOTMBiIGiLSYRxB/btW4yCf7vEa3VGdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544128; c=relaxed/simple;
	bh=E9TnXrsnB7lsT6PhDe9c6feEUyEWweothBeOpCejcwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AP9FRViIrfLQpOoCs+n0UTYXb4lVInkpEqzZuwYIsn+cKk3CHm1/7iH9P6UOD3EB8b0hwm77KWzsXLxxSduR+2ae53Ly0f0aOxxWL1TlodtRz+YNzcpvXUZQIrLsmaI3Ws7sJPzJ6KuTbcwq41h93WPTZuP+6xGdQGf5AC3oBLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=SIDmzhaa; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=SIDmzhaa; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1765543769; bh=E9TnXrsnB7lsT6PhDe9c6feEUyEWweothBeOpCejcwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SIDmzhaa8CmrTH/GoppH0Vf10xyiAFOjjuKM5MM801ZUi7s3tHT8V/w6gY3Qjmd16
	 9i4+G4PauDUcGs+54tlbJB93w8L2eFCuvAqTvK3nlFlmFI6QpyTxXUSS8UWQHLK7+W
	 qS7TM4dp+UKCPaYEFnbS/5tRAPEPaf/XT5rzihuHGNgkg/O8sx6BEXoidtCSglweI3
	 IomN5f1bnomdpCrKXcdK+zm7l0MnQ8mRmpnlAb6aZkl+QMAEfX6esYhmAAfN+YyQdF
	 QIXxEo1Pmi3xp1EG3598lhSYj11SctxlBfo3mlC8uhYMTxtOSRp/uaP5QQmQcQM1Ij
	 DRjUCf4JieV6w==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 85D2A3E64F8;
	Fri, 12 Dec 2025 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1765543769; bh=E9TnXrsnB7lsT6PhDe9c6feEUyEWweothBeOpCejcwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SIDmzhaa8CmrTH/GoppH0Vf10xyiAFOjjuKM5MM801ZUi7s3tHT8V/w6gY3Qjmd16
	 9i4+G4PauDUcGs+54tlbJB93w8L2eFCuvAqTvK3nlFlmFI6QpyTxXUSS8UWQHLK7+W
	 qS7TM4dp+UKCPaYEFnbS/5tRAPEPaf/XT5rzihuHGNgkg/O8sx6BEXoidtCSglweI3
	 IomN5f1bnomdpCrKXcdK+zm7l0MnQ8mRmpnlAb6aZkl+QMAEfX6esYhmAAfN+YyQdF
	 QIXxEo1Pmi3xp1EG3598lhSYj11SctxlBfo3mlC8uhYMTxtOSRp/uaP5QQmQcQM1Ij
	 DRjUCf4JieV6w==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 5C76C3E5F59;
	Fri, 12 Dec 2025 12:49:28 +0000 (UTC)
Message-ID: <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
Date: Fri, 12 Dec 2025 14:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251212_124929_579574_BBD90668 
X-CRM114-Status: GOOD (  11.70  )

On 11/18/25 20:44, Konrad Dybcio wrote:
> On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
>>
>> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>>
>>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>>>
>>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>>
>>> Same here.
>> Hi Bryan, HLOS does not have access to those registers. They are configured by the Hyp.
> 
> If that's hyp, please add them. We already have platforms without
> Gunyah. Remember, bindings are defined once and for good and I wouldn't
> call it impossible that someone would want to run that configuration on
> Kaanapali some day
> 

If the ICP register block is added now, then it will practically exclude
an option to run hardware demosaic on Kaanapali. There were notorious
and still unresolved problems with CSIPHY blocks, which shall be split
from CSID/VFE CAMSS on device tree level also, for similar reasons the
same should be done with ICP or other blocks. It makes exactly zero
sense to pile everything into a monolythic device tree node, and doing
so undermines any future advances in CAMSS support in the upstream
Linux, the hardware description in downstream is done thoughtfully better,
and not for no reason.

-- 
Best wishes,
Vladimir

