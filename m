Return-Path: <linux-media+bounces-59023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MOvHMpG4mlh4AAAu9opvQ
	(envelope-from <linux-media+bounces-59023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:42:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235741C2DB
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C58823146217
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D0E3B5307;
	Fri, 17 Apr 2026 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h20xq2ZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3Q8Pvje"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F539F166
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436543; cv=none; b=Nk0orcqCl22ReWslMV5Ky4uKNwuOUl6+7jXR82kph9hGDynimHSJW6t08IVgjxhQ+e5RwIbnLTXpHWmJw9+uq9orFYLjG73lszM8AQwDa6bc2hBR5JpGewVWSiQ7drR1rQziKDKoaMSmqePUtGLY3838uvioTmxSrRD5WVzi+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436543; c=relaxed/simple;
	bh=SF113oFF1sMZms+X7nrIwBSd1ktumh6AlyZkr3mVNC0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YOnxeQHNdVUISyoprOy2m4/vkqBfwiZcq5uUJCmW6iXKZvstXamYNH4Xs3mQJgvFDpgi+46hOc8k15ZWIseM1PFyvaknIeG8yZCIa5cnpdhH7x1EP0xOo14D202/jCIIPhbrFXD/3L+OOivouYV3My/taDF8M6Oy2PYUu+H2RIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h20xq2ZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3Q8Pvje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCG68R727586
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 14:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=; b=h20xq2ZFJH7N7PSw
	QLzUhL7N+mcQaqrb2YuOHWZZRdCbAo/e3PkZHs2ijcVhfHFzhO/swObIVQMuIVR6
	gTZI9NkP6twpH4WAxrQLw+0w/jeXKDJL5ZCTQMPmO+ky/PHWpBXAYcvMAUyvocSK
	vgoA4glWUyJLS6jIdP4ZarszTZfCL+MrKl+z5uyv6onRxyiMxHhfhZ4QxNRBbda/
	b2xbnsPiURXxSlkvgK/CaBJwSSLCSugjOfvwdrAG9h0yprlvcNQHiNMglhBC5pEL
	aFR/oZOi3IuI2YrB2gbkFvGb0MS3aitBes9mHywxzs2wUNVQXRn+NcN7/4zeo57y
	FI1n+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqsnvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 14:35:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso889392a91.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776436540; x=1777041340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=;
        b=B3Q8PvjeSFUw33mR0+w193jMk7YP2p6VYbHclgMArO354s6g7kDu9NSPfmFeDhXfoE
         glSdEGlNGP0vlvQlTLhRsnNYfavw7ifiHpbAi4HuYpfvoWvPCFBPJXCyoDOuoupWLJ41
         yr+dqfTU19bIqsm7yqTbfUlFKi6GowAUtq7Hnb5etZ7P9AKG+eNSdgGN/q/hl64RtJVD
         ftV+XpsyFKGkx9uW5Y0mI5ccXx/Ijo1ZODV0FG0DatRhP8RSgS1NB1INKDwD+rXVrTMA
         3fZHKNeJkYvU/dPVa9Sr/bwqOXg/2tOfn2wsl+62UDSpQZKgKowogkNirHyzA40Ykdm1
         xJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436540; x=1777041340;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7akWR2KTYpymsLXO6H6kGzO/anuY1eZUeK21VlmDe+c=;
        b=rcD1y4ZWag8LlDA+etbqwhKQspmm0l3AI8vB9+q/dJRLJTkUi+ExRtADM0jTgBX5Zc
         ftQ1j7yD8K/BH+ZU/3GFpb+PtS8/lUi2MwCe8b+Avd+kMDOqd9CNEuAzP/wppHPiOGAk
         MrouOx7YOQWUGJdabPfbfKmsiWBodgTvfJbpiCYiZRInhUfqJ8CxwEmjSveC2pFHhFko
         MABP5CmmTciazn5DLokHorCxoWLfvVGVb247B4oeZ8/lt2P9hjoFGAeGC7OX3CcGJhWO
         IsIYRZTF22eJVdHJTohh5GJQfTsOa2JtxRZvvkvVIB3ddxYY5bpcJPXJAoMjHmNNvXT4
         i84g==
X-Gm-Message-State: AOJu0Yzs9AEn+jXbUSRgPreEyoTMAb0GJzStTgCLZCFXClmJw2wBVBQv
	KvSFSNefhG3kIuxOrlgGvjEnpoHgspsZOJmMmQx1D+tlb3Zl0A+W8RDmdqgtXvoM/hDTy5XWFlb
	lJZ6sTAgULh+JQhpPKH10zFr3IhyJ5Xw9aKP4Y5csHR20lkEbFsAXhldM69CSNpHOIA==
X-Gm-Gg: AeBDiesP85FHu5HLl3neptE86hbc7bwbcGEfPuDGtHEKizYcopmeryoIJRjNbsPpkE8
	cdPwIaiEJvmQDh6RKxtGpjB+cmfQ8LqdEwt8OOoN8/xpuR2wgbNO1sakwRUPtYwwfbPCtbibhZO
	oaES8WS9fz2luTa7jeSuNGs8jyFz1IjncSA55pC+VHPhJeIUQ3ei/cAas+2bB8Irb5CXeH8Rvra
	qjn2H5w4sGkMveaGCjc5ARkmIjO0u0c5QA/XhYgZwwTpe80B4QuPOGNElxnN6MBZghQIp1QjKVB
	nIZKGDWjy8mhme1Cnd/EkkC0l0HFFcfBJIf1G3f08VOpMHR/Y8W75+MfhGUopz64JhwfuaqnisT
	Fr/zTsZX+7WtWyjk7PYnjfJcu29D7unE0GJqL19faJIesgwKy+YkImp1s9RVLF3/l
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr3379907a91.6.1776436540222;
        Fri, 17 Apr 2026 07:35:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr3379859a91.6.1776436539609;
        Fri, 17 Apr 2026 07:35:39 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361419739dfsm2325369a91.13.2026.04.17.07.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 07:35:38 -0700 (PDT)
Message-ID: <5c04e57a-efc0-f5f9-f53c-04b9bcaa1c8d@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:05:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
 <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0NyBTYWx0ZWRfX0OvwLTgZ6OXL
 Msbrp33GIaXuOz+zYMyWS9gikomzSYJvjYGINsw2YewkkVI0z2CdkyvkhVIs3ZQGRlwapreiC/H
 KvQzdO30UM+32blTrHUia8tjtuONCMOUvMFXjgHpGuHjDPUVhIsRsqtEDFulM0sM+P2FszgHS1a
 ilhu/8mwWMLx5LE1oAgMwl+KsVJM57SA0IMdAvr9YuA+fYFF8L992q0mHntn0JVsxv09ukwPOzd
 O5kSe+HnZoYpYXC7y5kS7VJ5OFHUshz344s152KQU2tldaaY1xZcLhzfb28Oq18RnqVKM0mfYvZ
 F4s05qJTSAx/NaU0Ibd+SMITBZG3FZi+ai94pvZl3kBiST2dhZvCTQy8Xh1RklAYOuQ9t77/Zg1
 i5pgO9Ur3RGBqt4C0jJWZLHLYmLFiJfyA0NicVL0gGsmFbfkhc5LATZBCqL/Z3PPsoygiWrdL2k
 1UFceAgeYjDpnFkPpDg==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e2453d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=y21pM0OG2rRs8fqayMkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jMQgV-aUo-L9PJzsrx-OeJ8Pd1e3ajqS
X-Proofpoint-GUID: jMQgV-aUo-L9PJzsrx-OeJ8Pd1e3ajqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170147
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59023-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0235741C2DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 2:59 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
> Should we write a zero there, then?

zero being the reset value for that register, I would prefer avoiding to 
write unless needed.

Thanks,
Vishnu Reddy.

> Konrad

