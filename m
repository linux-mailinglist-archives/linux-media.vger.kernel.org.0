Return-Path: <linux-media+bounces-59775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOCVKCxt8GmgTQEAu9opvQ
	(envelope-from <linux-media+bounces-59775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:17:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8F47FD40
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D32F310FB63
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE7B37CD5E;
	Tue, 28 Apr 2026 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlKQij8S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htbhCrvH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F52337C929
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363721; cv=none; b=tRKx51Js0a3uhTyNazQ3nRvWn+wrpAhLMI0c+Yn59c2mQbQwnFsi8jPwUIbdK2jwOigm8BLx+XlERpkro660g0J+AxHCf2+BW2gjvnjit2hrWXyccbCEU6g3DfXey2uAQCrv91PhDyLcSqcfFpu9ZWh0N0khA+WtUBREHkYPYOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363721; c=relaxed/simple;
	bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JUQpKK/jWWQIk7TMAWFrLQ8RiDKbbwDyCeyby9LLOuYQhyamDhi3rGxlqbGQ71vPXao63XUu3vSlhyccYm8ccbEVsL8BzakrF1qA0Fcvg0X2S7Nb4KQylCrHKTYMaFueSbbtFvr5dFiQzUxnJfNwS40h12Wp0XNNx8nXiNLpoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlKQij8S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htbhCrvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42uEB1329549
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 08:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=; b=WlKQij8S0tlpwaSO
	1N8mKTGe5H1O52lOrh8HwAaeYcsufyFNNcIorv+KdFUNLiBSiQBNzS7GwtQdlmZC
	e3nBU7TOmAviuumnLZClaHbMliqdhnkpNxQHYvBv3XSMvOl5fSYNfWH+8YdkVblj
	8XCiobRpobU8y/FFR/HJxrc9hk17Nx/n5BrfZHIAIruBSwRA230ESvBkd1B9hEBR
	plQGKdj4RVOxcGLN/tsqn+VjkbadOwtdkBRA5fuPKwEch/GqImViT3mgyfAsEHlg
	vBnU8AB0MWWpBl1NceBVIjuZf35kuNeycOy5aFg0/zJRBZZOUmiHja0bC2MMNnX/
	n/gNcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhagu78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 08:08:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362eb03240bso4362966a91.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777363715; x=1777968515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
        b=htbhCrvHbL+2CDUpKc6d8dLbI0OegLm7c8hZFRjLxq8zSD5vII9NPgB+Fi7kfr5bs5
         we/QRsXy1TJGsrGAz5duDfhAMOwIIwKcbub4kcAvx0KNJowiicPD8Moy4eiVyvnrkfWr
         j3ajL8sJnT6MloPg9Lwf3r2eIKkrmQprzcrqvuwlJFRQN3lN0zwVrcyf8QAkaGjm+8dJ
         XgJ9sC7ottPi6CtqyMJ1X+zcN0sW25wD7ZPxUNP/I1SHmS6ZCl68TQIZY3OOq+Gy8PNa
         /d6s2OyazuFox8BxlHLgxWTaWyndElL35PVbNwOIhy4d6k/0n2CuV0gZkCkMfSNR0fAD
         pd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363715; x=1777968515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTml0sJEvHCoPx2+7e2IBnyRODquxGMmZxKsUP9MvLY=;
        b=YfT+kfDQK49sH6qtevm2hwc8rcQ0+xSAnR/mF8mVReCvYwfKrDjwQ5Qeg3AiGqywOO
         k2C6YzU06EBM6R3ZoMqAOEqYre76yux19MKtiTsXgINSyuYpKNXVP5em7loYQy7cLe1a
         C6sr8gTwbydzOerPWWOtitww2OMgJ4ibP0hizMpxzzQzzjo3/ef+kqYzwNWYPNFVJRHm
         2lfoZd0baFHncdcLiEnsQV2yxK6R1JFirbElq0nbL7E9fEhfey2mtwUePfET99pgOy2D
         9vdra1OkHFIrXDpEsx7KweTtkldqoznHSH1NneWgQ3un6O6LB7Oa7bC7RZrKX4+B2ebA
         oKZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4PTjwSvtdvfbz/RKheMCxMPVKNZ3BKa57zanjPzcLXfKZ1Kms5BTpM+dTrs+r4pcGJSZyJTLvDd4DwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsvnLEXCdcRJq4RMdD7l2jZrnESGm49gMi8DdwKU3JIwEs/ob
	lZkDI2rM3QlPnga8Qv0r6lQoUnw493bF1EWGWtFPrtdNHTDKhAQbu6MNWi1rctMe7jqDOUnz3f+
	1L9vreraOaPeRbEdgNJy5F4mj7bu9OTqw/I31HD1A2JdCCuPo1HmfFKU9hdNCOOfJaA==
X-Gm-Gg: AeBDieusZ1igc0glsRSliR1ikuJG+YUt/wrXy3n5IZqF6Dge/7LrWtoi4paH0zGMhKP
	R4J4umwJdjnTNBU5RbdMRuAdeOBYTJNu7y49beHS+8cFcXKmc/wtJgyIvSdm0eiLn8YtrWP5pHq
	sEd0884T87NfjW6gHHQzEXbijyyh4mZPu4l7QZZHPrwewVDDZAui88hqvejd9c3TJ6O8qbHtGsH
	99MJzYF/UsVX+0vPOa53sbNIb/YBxfeLgidMWVklo7ZY/nyuaHts4VLzVGizq5/KknQF7JFUgTU
	/JtsCIttL5mE5ATpBO99ZLGSVkVKG0w1ijzDkCbGL7HCmbW1g1/ah6nXv0V72dhJyNTAaOlN4oW
	46LBMW3rvsVydOtPyXP2p5JiFFqySIXL55cYFfJFOYiZN1yO2jhYa6vvJS4CPMMnC
X-Received: by 2002:a17:90b:2e88:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36491fda867mr2410756a91.9.1777363715227;
        Tue, 28 Apr 2026 01:08:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2e88:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-36491fda867mr2410709a91.9.1777363714720;
        Tue, 28 Apr 2026 01:08:34 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490c4f3edsm976224a91.6.2026.04.28.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:08:33 -0700 (PDT)
Message-ID: <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
Content-Language: en-US
In-Reply-To: <20260428-nifty-quaint-hoatzin-6de65d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3NCBTYWx0ZWRfX8XnwTv5uNTzA
 0Hfz4/QdWkPZgfpu8UpVr3wRLbwOot0CLTzbaqXZecLWnBjdtr6InlPwiPiwPPYKImCnO1h/hzu
 awWhUIV8V6PsafcThcRns6mOU/k3A/WhsFD5kUoUw4qNcoHR8M4rOo/qNtcw7MolBmMmF0wdpMQ
 TZ2nrLfSDOlgyZH1KkxV72F7gE0gMBVDnmXhxWY1bd89m8GwUKT1wMLRjaG7OX9O41ZT1fomi32
 fZpIp9rZ5U1T3Id2CE99K1XKWoya2lbxncCwD9TvTbMeHzq8ByGsE23X9PP6EHRWGiOSkeatoiD
 FUxDRzfm+v4roMo16YN+XXvC2FdVuGvjSZxK7RuBugeJdpw/gauWBC022rgl+POOYXyOqXyJIlR
 Qz8TGjKjKsAJxHqpyHRAF0M4kbS3fi9uW1rJuvYrTV1d4+KDEkBx0tCj9vkipcRZU8OotH5sUFe
 W2oR15N4bVxaJjHtKkA==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f06b04 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HCVpI3b-1_oNncJzd4sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 1dlLcfXS-twrEHI2kvZdFjAT01evNp1P
X-Proofpoint-ORIG-GUID: 1dlLcfXS-twrEHI2kvZdFjAT01evNp1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280074
X-Rspamd-Queue-Id: B7E8F47FD40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59775-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>>
>> To accommodate glymur clock and power resources requirement, the maxItems
>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
> This is a very confusing part of commit msg. You cannot relax the
> constraints. Each device MUST have a specific, fixed constraint. It is
> your task to be sure they are not relaxed.
>
>
>> binding to inherit from the common venus schema without duplicating shared
>> properties.
> That's obvious. Why would new iris device schema not use common venus
> schema? What is different here then that such possibility exists?

Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
requiring 9 clocks and 5 power domains. The stricter maxItems from the
qcom,venus-common.yaml takes precedence, making it impossible to accommodate
glymur requirements without updating the common schema.

The same thing I mentioned in our earlier discussion here,
https://lore.kernel.org/all/6d5516ab-f693-e605-77ad-e3f7d0bf579e@oss.qualcomm.com/

Alternatively, I can drop the $ref and use additionalProperties: false.
Please let me know your preferred approach.

Thanks,
Vishnu Reddy.

> Best regards,
> Krzysztof
>

