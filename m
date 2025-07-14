Return-Path: <linux-media+bounces-37673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB8B042B2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C18188E0C4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E561825BEE6;
	Mon, 14 Jul 2025 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bspY621b";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bspY621b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84311259CA0;
	Mon, 14 Jul 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505702; cv=none; b=RcUqXfyuO3UIpYSflj14xkixPkRzVcSdOtY8HOSXeVUZGwdT0GqJK9ywUh/8ucZGN1tKuntv+4YTOTEgAGm4xTyCQkwG1pWiMSMVFfTBNH8eBIze6zCZ0KXlUxStSRfyLwGOd6uGOuEImoPtfwxqDjQAvdtFhA13aYZr0YsWdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505702; c=relaxed/simple;
	bh=pm1kFbFPyW13GRr3apbRou0GauefSTkU75vCZ5hpLZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nl+77kKShCA8xkEZvEHCHkaMCxEyBzHyORZIYMbllvJ0I1irUH0CmT2/oC99th/o7rUymeMd3URI8k220jtxdfLhiQijrorb5gJgrX2ldz7JfMHdSP3Yg9XF912ojvzkQMZcecHtJ0iZmL6/aHRDexMJK+ld0WWR+43WuoxoKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bspY621b; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bspY621b; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1752505139; bh=pm1kFbFPyW13GRr3apbRou0GauefSTkU75vCZ5hpLZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bspY621batrJ0gWabtq4zBNa3xRXyHyzG6r6K/OXMQs8yYuOC2vRlBgcUOy9sM8Jb
	 E0uMow+5XJlRUFF2mJr9FMaNrBEq6c3jU0gq2ml2jUxgSkjbNTa/EvfAs7dRb9IhIg
	 uE33OqWst1GKKzCnbKnDNC9T71Q36A+wKq8tQLnPoX1n01E3OQcxue8ntDQU3EOS9o
	 rgCDTbTpioeIcwW1th7xfnFzRBWtf3zNW8lYNw2qZC3FlXM10GksX23hQt4rlyzSkb
	 TYuQjVR/eNPSFchLYJxmzVId2/CbWOrDWL1B+8suZEG8IRmdhPVfr/9kUObfFrT93S
	 W+DjEU5I+NV+Q==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 1F5523C8846;
	Mon, 14 Jul 2025 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1752505139; bh=pm1kFbFPyW13GRr3apbRou0GauefSTkU75vCZ5hpLZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bspY621batrJ0gWabtq4zBNa3xRXyHyzG6r6K/OXMQs8yYuOC2vRlBgcUOy9sM8Jb
	 E0uMow+5XJlRUFF2mJr9FMaNrBEq6c3jU0gq2ml2jUxgSkjbNTa/EvfAs7dRb9IhIg
	 uE33OqWst1GKKzCnbKnDNC9T71Q36A+wKq8tQLnPoX1n01E3OQcxue8ntDQU3EOS9o
	 rgCDTbTpioeIcwW1th7xfnFzRBWtf3zNW8lYNw2qZC3FlXM10GksX23hQt4rlyzSkb
	 TYuQjVR/eNPSFchLYJxmzVId2/CbWOrDWL1B+8suZEG8IRmdhPVfr/9kUObfFrT93S
	 W+DjEU5I+NV+Q==
Message-ID: <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
Date: Mon, 14 Jul 2025 17:58:57 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250714_145859_151169_935C6CCA 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message. 

On 7/14/25 17:43, Bryan O'Donoghue wrote:
> On 14/07/2025 15:16, Vladimir Zapolskiy wrote:
>>> +#define DEBUG
>>
>> Still under debugging?..
> 
> oops thanks.
> 
>> Well, the phy should be a multimedia device, and this driver is not
>> the one, thus you can not use it to connect sensors and put the IP
>> into a media pipeline.
> Ah no, I don't agree.
> Please see my previous email.
> 

I believe there is very little room to disagree...

This proposed device node scheme does not solve the known and already
discussed technical issue expectedly, namely there is no given way
to describe a combo mode hardware configuration, when two independant
sensors are wired to the same CSIPHY. This is an unsolvable problem
with this design.

Sensors are conneced to CSIPHY IP blocks, CSIPHY is connected to CSID.

--
Best wishes,
Vladimir

