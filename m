Return-Path: <linux-media+bounces-54428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LJ2F1/0p2mtmwAAu9opvQ
	(envelope-from <linux-media+bounces-54428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:59:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EA1FD097
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72A5E304AC19
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 08:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50A43932CC;
	Wed,  4 Mar 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uk0rvhxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="et74PUuK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65F386C2A
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614684; cv=none; b=l+o0NwLucn0hmZ3hnsqcgFrcUMiRoGAsELKhxxf1lLwkEr8BmONLUI1d4vWb8eE7WCETh6gsHJI5Lr0HA6UQcaM2y1kJ4GolPDULCgyd+XrczatpT6KqFqZWYRMFCClz6B08BhRAWlrbXT0RiiKMLlgYkoR+1+HJ7HXGITtTK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614684; c=relaxed/simple;
	bh=YNyzheyMXouN8Lf/ico2jv5x4+uFyMuodyQ++FAMW8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIBoEHTaVKCPs0PPV82/N4j0AHFJjJCz2pd3Mth+/U+PezhKXpqf4JLoLvIotjV8rtF5czEAcDVYNFyKU4Ldr9keGQKL5ZTYdAkPD+MAyZDb6QBe793dByHOrKjq0D16GZ+ynaYMKsDUIRV0PnpNRnfgrYKNl8pZUIOafAZXAm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uk0rvhxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=et74PUuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245ScJq3110575
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 08:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niOuDWaqN4TxIlYkrKh6EztHOaj9yjtzNsL8ODj5nqM=; b=Uk0rvhxuuWKguEN2
	F5lDCz0rki4FrqwhkyE5Z7ESRTqyzzZl3naodJuBH98RNZtitzWyTC5JucEXC2Ul
	/GpGkxS7fPJU7Z5oI2g5g0rSbffff6oSI8rP+CwtoEoXRaGkAWc5+g1auXJKBjyy
	kWdh71oLAFD0AWTal03j2F/f+kIt/efFRqmAzBkvqoG6BTCdmvdD81QNlWMzeWHG
	vCWJXRuCyEC5U3p+NBsecVWLT6BzuAjmcEruLQ9poFn05lGcNBcCxPRCeJGdLDRU
	tpzU61KR7idevCJZFiICZIVo8J3bERB4SBu5USMWvwnLjz7+/nHC19atHZgqVSD4
	+jA8Mg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2ag3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 08:58:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c710279d57so501034485a.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 00:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614681; x=1773219481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niOuDWaqN4TxIlYkrKh6EztHOaj9yjtzNsL8ODj5nqM=;
        b=et74PUuKEdok873nusA8oqEtvoHcjv477hgBNF/w7SpD5WIQs9nYRCxtEB25FzDi+s
         Y5JHit0poFtnbz3kBsLDDVNlE0ovaka7uEQNnaDk4uBfDpZoknI5CoNtZGHuzwsMBFXA
         zZ84ML27hDmY7L/meXjA82YQsTP/xnF4LuzPsNpjXGGgIF+0+ZibbcrM84WUXS6gaxd5
         DboxXQA2RTtNLnKuzTyrro4FyYUzHTWKUpAJiQb40pXfo0sjgJcox5odKgTk74VXq3bK
         tTK2aXQw5O6mWmr4ziXSJWVFBoTGXXQ1Lk70F+UR5Vktyu4I1raVXBSAi/MJbG0BrLud
         eAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614681; x=1773219481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niOuDWaqN4TxIlYkrKh6EztHOaj9yjtzNsL8ODj5nqM=;
        b=EXuHIpFppGMo6n1sQv97hJVcApL0+97t9TpyphgXlrFbOU4FScoDY8QQ2yFnomtUcU
         IuvjiNnunUtllPNQoI+QuWWsGO8z4dwFqRiBpr/J01bz80YPtS5z9y4SKwKNvfSSkm5y
         +9GsX8Pl9r8rOddMZDlD45/G5vdlrOF2XCV3Rv24v1TH06lkt5l4eta4Ah33VrNJIQ8g
         z+irMa5S/jLhrsH9Ooi/QlT3p7948mPYZaIUyOpJL42biS//iyLUq36w8vouxPbnv6qb
         RqMRN4XlsdkVl0CcBVjJOkd8IEwwswTxgfXee5XdFGuGpTxYZwPcHtMrn9mtSd7cM+De
         hm/w==
X-Forwarded-Encrypted: i=1; AJvYcCUFKMlQ229nWlYruZ80spA7QatpxTbSc93mojsbOXawshDUmJA5krcWhlg/g8h9LL0FqsF90aAXw3RO4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ds61N1gA30guKmoW9cN2Q0fB292R7VBhWbrs/Aajs+LWjpKQ
	18lLerS8U5QeUpokoVSVUVwvqCnOeepzoaGi/ZrnBVRsbsUli6QVDL3LMv9TEQ06xU7K2Oq0ic5
	W7AFi2ol9KEzecC46KFUnaPobHiimDgTyJdqYpLlDUmvw6ii8HznwkP7tB8c9wy1VfQ==
X-Gm-Gg: ATEYQzy9d7oJgOAcnEsTGmE1T0vXI5g4xn92OUiOYJ5A+54DDOsLuCCMXenLKs0D0hm
	Gl07jKUvxEgwu1emhKZDA83JJwg+xfN04Cf9Ih5Ia9AU0lIxpxx6xtRvv8jOZPf7BNqKd46c+q+
	0KiPiJglS5qOWOYUu3Vk7kWWMmk18LZirQJ+pyM4i1O+iLnULz36rDwFyDffF0juKt0iFqmicOL
	xVLWecvnpWeAZeAZ4qo04crDdMvlYBLNZ1AN8/Dj/ZyqfyUMnSohLWc2HduA9QPU/nzhvQ9fxWG
	ulEXFM4aB/o1ylnWLbxZvEgjJxfuvvAaGxT7h0H8raO3lauynAyb5UGXkGg1uyehcIYztPWUT8c
	czSRH1Aj5SJm/gJpFOVm3ktmyKlvw82vPFse6T0FGl1cHq3/hqEgJwa3HrNMZV6sqJhZML8hBgU
	PW4Yg=
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cd5ad9dd70mr122028285a.0.1772614681658;
        Wed, 04 Mar 2026 00:58:01 -0800 (PST)
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cd5ad9dd70mr122026685a.0.1772614681264;
        Wed, 04 Mar 2026 00:58:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd46753sm5249417a12.8.2026.03.04.00.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:57:59 -0800 (PST)
Message-ID: <4a5be869-1b98-4b76-b483-4fa374bb36bb@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 09:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-2-850043ac3933@oss.qualcomm.com>
 <6fe3a1a8-46c7-427c-abb5-2e7366a43392@oss.qualcomm.com>
 <164928f6-cd29-49e4-8b5e-365f5b0a70e5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <164928f6-cd29-49e4-8b5e-365f5b0a70e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7f41a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=b2WnVuVpUTZYNMXETCkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: dOZJiIvD5ETm76VYSR5dNs95AzURcxl-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX9d480uM+komW
 rZJwFuF+xv3AWskjCqVLXXUUb8Ob5q31ZKSdQi1sL1xWK7X7jK6JOgOVEtOTbDq9MRgpbeBbMoA
 ufXWA4zQ0U1yVWMm2ulykFyVOjXgkfg8d1rATuYTe6eBa/poGP3PmqXCil+zr/2uq/S/C1+WML9
 CbvFomB2ARdJmoaG8O7T5TtwlK1gmeWFprmsXst1nnKDpnAVy69VX2pib5fLiCldO0eGwMFdX9B
 pzGjtzn+w8J0lZcAZ6emZw0+FCuD43hgCMj0iYHD8+VoBP+X9hzMBxIC1dp+YHg1cmfwCEjnmmI
 dWVd2cLdOeolKZqNPL7SysGdQk7mPPOOjPNjXmYr93kdQiLpa6L3OZ3OAYUn70IUb0476tZzTx4
 5B3FVRFMxOzEzzQcTxmUV5YUCOpUxbLpfbCquGXtvwNzV+imrIe11nGpuL6/atWxi2KvTJf7Eki
 Yh5tKVRtbebaID5y5Mw==
X-Proofpoint-GUID: dOZJiIvD5ETm76VYSR5dNs95AzURcxl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040067
X-Rspamd-Queue-Id: F06EA1FD097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54428-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 7:15 PM, Vikash Garodia wrote:
> 
> 
> On 2/27/2026 10:19 PM, Konrad Dybcio wrote:
>> On 2/27/26 3:11 PM, Vikash Garodia wrote:
>>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>>> before firmware load and boot sequence. GDSC can be powered off, keeping
>>> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
>>> carry default (reset) values.
>>> Move the transition to HW mode after firmware load and boot sequence.
>>>
>>> The bug was exposed with driver configuring different stream ids to
>>> different devices via iommu-map. With registers carrying reset values,
>>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>>
>>> For vpu4, when GDSC is switched to HW mode, there is a need to perform
>>> the reset operation. Without reset, there are occassional issues of
>>> register corruption observed. Hence the vpu GDSC switch also involves
>>> the reset.
>>
>> Is that a characteristic of the hardware (e.g. also seen downstream), or
>> is that required with upstream iris only?
> 
> it was found lately with one of vpu4 variant SOC and applicable for all vpu4s.

Thanks

Konrad

