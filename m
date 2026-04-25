Return-Path: <linux-media+bounces-59583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPxVGwuQ7GnHZwAAu9opvQ
	(envelope-from <linux-media+bounces-59583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 11:57:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7B465D13
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 11:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4709E3009834
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 09:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0541E393DEB;
	Sat, 25 Apr 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzUj1w8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgWLsN9I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC663932F1
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777111033; cv=none; b=LLGs10ua/hvmbqzqZHYamHVOCuRstnjOnmcsrPVCJgJBMbVO0foka4MINTq7hSZA1jFckG5RlE+2Gs7uhYrNseO2OoDaDq43w0kWuVkmvD+dWkJjzguk070pLbXugt+Gt+zpaaAkHF5Mu5KEGeERn2LyLBIQlppGYC8cz6ywbmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777111033; c=relaxed/simple;
	bh=GZbR2ACVh9+gp+nilqqxNsrf904ahFQUCCu4bpKzwYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NH+rHNRZvU6EdmptLD3LQ8Htd6OBf96ZLWPJ0dvqgFcU2THQrgpr8RiBplg3PCdzhAt2FdpTXHTO+/sL3LSNO0Y/Pho0bDgbyHNx9KzoxNEDqIo/MfjunfsSA7mier3TY84vCKlPq1OwJebkLBYOOkJGYiaY4PxuqcLvN4uNIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzUj1w8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgWLsN9I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4CZK32658153
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=; b=OzUj1w8Q2ssnZpj3
	HLB3WZSeCEilZsnigNWyXXkh2qTKpaa2IkdQCRhjOIUUAWvrBAqoSEUC/rQ9/4qj
	doNf0Ue666/ghX/bdSgXlNM0VGqXwWpU/D2bCrbQN9qXTw5SOzJmzjEm5wJidG22
	o/DuhbsmWOY2hqgjSysxpSkQg9ZvcjYFB1V615nULS1UvlujcZWe6HHD4xEZqG/o
	1cBWGGkWjxRTxn35TktvymcPnVMi1y5QtfzKmovJ8cgtjdAHoBjrp30TfspJIuGd
	B0KR7OJcUmVFQNklk3+zaIkkHMrtCo6kA0GE+k9zRO1L6nYxacv2F6QzfFmhJMA2
	Zd6KxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdgk4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:57:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso9392433b3a.1
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777111031; x=1777715831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=VgWLsN9IO7bM5bq2XILhAov00IC5nSBVR7eAr+RbOmfLKbHq3AXd22vjb5S72TM0NS
         jkR4ddOPmeq0/GUrXvvw9cWWrGg7pntWjnmou4DezN753U5oZ63sTtS6Lu1HEd6GZT1S
         1PtSJgq8/sC/whhaE2CBxAxfJCqZL06IC0zQ0hwwdbCtxKJDzek9zYxU380U0vW1DgID
         MydCmUrvL6jRC1shGfsHIvz29PMBmescPqoHb/7oar+mhg4w25kbyc4IStH2awAgjcxA
         LroljSO//JzhN48DE/Jbk9sqf4ihRvTRTohJ91xZ9vax48oHOBt/G2kro9Xcljq2rFms
         7XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777111031; x=1777715831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=T+zIWnKUIfINxjLSUnO2jjstga8h2uwKpTqwL/87PpevokrnU5flTEHT9mxPhEz7dB
         gI5tQubylt4CIAQif5fLZGOZgJasiOUXDNNbSVv/yIcmF1iwHyZzojk9fXWo6QyXjgK9
         VjTkHw47VI4sPTLFUCL+SCw+CxDtDHIEgHJzIwpKCTrjbeqJbas05vL+JkDqYlww2DL5
         zWy2kHqfQNVptFirlpuADPXFJNOwdUtP+hpNWSA201RAjvp0UQpGFMXByV9o2xXy//yy
         VP5olixhmJ5iyWcrNr2goPnWeiqm2qpK8XqwJSpua49+8DWV9y8HnKvRTYFbKZjnyhrI
         H7wg==
X-Gm-Message-State: AOJu0YwKiPWUSaQFHe5p+bJM3aBfxc4iY2HfhTa3sBafOtKwBF37SL0d
	869riFi9tGblxetnIgpotBDltdsOMjcI/yZfmghnun+/qoQKOpfRJ3YL+6UiWxfmAVDshT4ArYY
	pERb4b9FQWAwAAuUhFRZICvC5ps+K1ITgl2ALs1w3dEhbaYy3/0T9n3gX2GX+3zmdkA==
X-Gm-Gg: AeBDiesw4dZ/CIqsD7TY7s+bFWpAjCAn2RE5GLQPDmC/ODQF0ZVs6dYv+DUamlnIMhf
	Wf+JXqfFRSOh2qyEtCNBVxODoHJT/f8y9XKcAODY+yGuc9IiZMcBPNFPE45oRvg24fNXMgj/Ntr
	kDjABE9ETnDzBlo8FkHTZ+bjbuxdptqj0dNrOqvNtTNRV8D2UaFRJZW/OL1tHpBwWmPz53WUSsN
	ZauPUCvlfVs4dToMd6CFC4JURURuUaYLnThsE3TbQImk2FNQIdsCF0ekuytKFdivhX/+X3JXapO
	RoV6STVrJv0MegGReCBF9CmDR4gUbzb26T/MzebfsrGkcWuGm9iqVo0ZUQoWwc/4b5kZU9mb5nd
	7ASiE9lGy21lusKFYmnyJOHtwE1LbLvC+NmlXXHWOvFgr1bRwFQBSlRDt9dE4dvHXUA==
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36380028b3a.17.1777111031160;
        Sat, 25 Apr 2026 02:57:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379925b3a.17.1777111029289;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
Received: from [192.168.202.18] ([106.192.38.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm31035140b3a.54.2026.04.25.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 02:57:08 -0700 (PDT)
Message-ID: <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 15:26:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
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
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-4-0296bccb9f4e@oss.qualcomm.com>
 <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA5OCBTYWx0ZWRfX6vYHiBQpvKU6
 yYS+f29G4vguk3sCOCq004vNVBUX+iHl6tPP9h5CBcrwMLfStAFA4/Xksv/MjH6PhA1f9FUejSf
 TV27NTPhUNkwN094T/07z6520jWSitDyi89GBrJFnHi4S58a0RwD9SWzPhC96/2VsDao1v6PWI8
 qH1uYOKQhMazgY2gPiMIC2V1Tz0ecNue8YE80RUVGMndmKK1VJt46wmOOqmKDrdt2IfkHRWHQ5S
 WtgMF62ACc6DiEM3JTi/Xz/sn4KDg3YxUkSojepl9URzXdLIsWTWUi+pLTd8pl4Rkc4bHX2Wqwb
 ULeAHsvAvqT++Bhf813DbhiN4DlM+mToWyMBYeoQnE17fE41+E3esb+btcPLC0x74Jn6oP90Naf
 UFANiMwCbthzmuO4OyoWh9XyiArUKhDqUm+acG5uk10DWFEXGF5k57nz/EeZYQuYg5nx+k0adT5
 5R0bj2R0tA7EmLpXZ+g==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69ec8ff7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=zt2h8jT1BUEQU1rgsTrZfQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=yXM0pRxr-LgjvrZoWBMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: LBR86Ow07O6LZLsqLTbHdKG57hl40GBs
X-Proofpoint-GUID: LBR86Ow07O6LZLsqLTbHdKG57hl40GBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250098
X-Rspamd-Queue-Id: 6FC7B465D13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59583-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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


On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 15:29, Vishnu Reddy wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - iommus
>> +  - memory-region
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
> I think I commented around here but probably not specific enough. You
> miss here either reference to venus or usage of additionalProperties
> instead of unevaluatedProperties.
>
> If you intend not to use qcom,venus-common.yaml, then explain WHY in
> commit msg and switch to additionalProperties: false.
>
> Otherwise, you miss $ref.
>
> Rest looked good.

Iris glymur platform have more clocks and power domains, which exceed
the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
it would cause dt-schema validation failures, so I have chosen not to
reference it.

I will add this information in the commit message explaining this, and
switch from unevaluatedProperties: false to additionalProperties: false
as you suggested. Will address in the next version.

Thanks,
Vishnu Reddy.

>
> Best regards,
> Krzysztof

