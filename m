Return-Path: <linux-media+bounces-44057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77499BC8124
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 10:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FBA3B5ED9
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B3F2C027C;
	Thu,  9 Oct 2025 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncgEQSIy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F98534BA38;
	Thu,  9 Oct 2025 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999091; cv=none; b=AalnT+QPiKinMCu+1guthmcheofWgUX+ZeVa/a7MSiqVqSp3kijqqoe/WP2h54CFXbpxqw/m5IdxK3z6q+i4so4at9Ll+2R9RkC6l1Dm3okMzfYsEV/HAWFEqxFnUazNjNkisbSNjFZk/sIs+jgrrO9w8xOL95/Qdq1Xpq7x8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999091; c=relaxed/simple;
	bh=a+tmJW52l+C47Xfe44WbKAMzHqsgzWS+A4gTMEC4+50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAt56FLw1WX4GuaztcDaLWQkh01izUrx82SkU8Hixnszq5ga70084j9YAqiBWMIlTRpK0M8LKTCYbWJyqgo6zQQqo9eDpWYes3UXwoFHHkrC9qSZHkQtT9kQkkaDCFH+T6DTpb/D3W31xVw4Y9LQRZ8G+IybyBUvgP8wm4KlfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncgEQSIy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D3CC4CEE7;
	Thu,  9 Oct 2025 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759999090;
	bh=a+tmJW52l+C47Xfe44WbKAMzHqsgzWS+A4gTMEC4+50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ncgEQSIymNaCXW0g7/W1ZVhP8A0hAuoKyvSoLz9wTu9dGnpkcP+B3suYPJbUfzRDv
	 CGzXBqqM3Id0WlAZ7Z+lapFKq8wUd6jsIekBGFt/0LLPzIIoRnU10KL2CiuJ5iwv7M
	 teOFFb1oR7Shm/sk/MmIdi0os3NuqioR9vjRuBEd0H4S2pLP82fRZsTf9YbhwbPyCw
	 vspRCse7nQsv2OryOft+UlwWKbCpRCDsxRnazpNPxKjsQCchVqygCaJoxchLN2DZ8m
	 3BqggeuAJKMihMG9bPEdnLE3h4dasslUOqoE6t6WD/14deaaYaXiyx4RpOAer5Qm5Q
	 d6IaVbtspoNsg==
Message-ID: <7ba3953a-166f-4c67-8f54-666b0c488b12@kernel.org>
Date: Thu, 9 Oct 2025 09:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <MMSKAu89Ew7StAeFBV442KfKNzmqbTSQ-maFG35Jr9d8PkUV2L4sx44R2DRevXA8mC45vkA398l2mvVzarZwew==@protonmail.internalid>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
 <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
 <GyrcG3qBN7c5C7ajCs3EV81hWvuaVbg64CpzQ-X3d_p6EauoiKxSoG2aOKE21-j12SWFjNDjV-kVSwYYqVm_lQ==@protonmail.internalid>
 <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
 <98e6acf8-80d7-4894-b4ce-ce74660722ef@kernel.org>
 <soFAWqHDNosrZui972Ip7EvMCfB6tepD-HxHkc17RKmilPJpQZjMzni9LmMOpvKumHqFEibe5FdNkkJG8DKlcw==@protonmail.internalid>
 <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2025 02:04, Krzysztof Kozlowski wrote:
>> The iommu description for this platform basically lacks the data that
>> _should_ be there -> FUNCTION_ID.
> No. The index tells that already.

Hmm.
>> The rule is that the DT should really describe the hardware right ?
> It already does. Same as I wrote on IRC, DT already has all the
> information. Entry 0 has function ID-foo. Entry 1 has function ID-bar.
> Entry 2 has function ID-bar or whatever.

That's the part I don't believe is true its a 1:Many relationship 
between FUNCTION_ID:SIDs

Let me check the docs...

Here's the example I gave on IRC for lore

SID 0x1940 maps to AC_VM_HLOS (Linux)
SID 0x1941 maps to AC_VM_CP_BITSTREAM - protected bitstream
SID 0x1945 maps to AC_WM_CP_BITSTREAM

The xls for these mappings runs to a few hundred lines.

Seems to me like a good argument - at least for the qcom iommus to add a 
cell entry and then teach the generic iommu code about it.

---
bod

