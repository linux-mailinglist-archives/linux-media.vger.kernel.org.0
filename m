Return-Path: <linux-media+bounces-61667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIXACXYHB2qNqwIAu9opvQ
	(envelope-from <linux-media+bounces-61667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:45:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9217554EB3D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28BCB30E2945
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1D047CC8A;
	Fri, 15 May 2026 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBbZAao3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+LaRETU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E333F47B42F
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843937; cv=none; b=TLV8fRS5TqAjAbJt3GdBuc8jkqXyPYZavRpwiE9qEdNEYEcVpsKM96MKDzxjfuOoXpziybnbxMyvO/FIOOzTSXj1N/JnKzF0/MCA44t/SDpwHVYUWuo1Dl+0JLpWTYseAKHojStoCfPGwtvJbXvNOreIz3OEqLMtAZSbbkEwHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843937; c=relaxed/simple;
	bh=UJVYFLt+7s0EoA6/cGgIfQ4tKtgAjAXLxZYsq54yp+c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KyfpNB2+K8VrH9uXBi0IPnUGOvbC3lnraPYrj7bw/CbF5hBEdyGtUKZUN9qHDfVVzVOU0IfEA3FhGNkqwcLbY7OnieJiubGfyDLmpFxLbn1vhezZTvPm56akQtaV9ksTwdWDbEdt+CpTGldfNUN289LKeBLCghfhX97k5LmgE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBbZAao3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+LaRETU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBFvfM654865
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCGXkWeRm3I5kdOwASc8lBJELQDGMPw3e9LMXhleB4U=; b=XBbZAao30viDbXZj
	xpKBXDPxtl8gV4AlXbfxTZ6nVwKhUCVCKCKmrGDWJraArwh8WKLIzMERe9wzhytj
	gcU/noia15CYHRUTYz4KMOWBYffz3x2Dog6OrHMxNYw2qm0fVDRpgUgsnstl34ZG
	8TroHqRVjRhS617HCfJfwzLbsgCwgEER/36Tzq2rtyCAxBDw307b1+uAcRIPoTfz
	5hms5Bn5u0r27SBl83+EiG1KT9z06Fl20bTksqImeBdT4b84SLVmUs/bq1eyZjzO
	C+OVsxYZ/15p9OTiV5JNGUA0LVw/ZBPb1FnxGequrAGfl3yBDQxyyB7ES78zdc71
	w+A/ag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu2c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:18:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba838d3fa4so98770555ad.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843934; x=1779448734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCGXkWeRm3I5kdOwASc8lBJELQDGMPw3e9LMXhleB4U=;
        b=H+LaRETUyb33znpIqdd0jU7AivUmcvWeBtwTXb9vzLxCbPNTHzEkUOBxGZsLDKd+Fq
         loCpJ819ZkaKF6gnVDOZtBkP8ejJmSbXX4RGFjKT+uozm8YQhXziQEXwYZCIbsLU+fAp
         NDb1fLKmcpor9/9XFdMv6Pl6hLA9B+MLXy9Dq6j9Ggv+RS7mRI9JjnB1K7x62YlI32RI
         3lsddoxM2JdWVELfqm8r0SzRSH7eea8AU31J6vRmu87IuZJGXcw6toRh1XEkkBBWVnWF
         +Q1f22zG9EQNvePVizRQzFadpGCVIGscha9NCgDK4q5IerpDXbNpXXDLmUL236MxfCoI
         n5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843934; x=1779448734;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCGXkWeRm3I5kdOwASc8lBJELQDGMPw3e9LMXhleB4U=;
        b=bGgygXHwzUo8qKYelAb/NSFBK0FGmwoLMcLjHGwVvzgyEuk5Zrl8wz1h5gcPVxw3Qa
         K0vlNwTbS9jm56yHkCrRfNZHP/TY3InYkwcW2M80WHIdwrbRI1xxRsBZsyZJIjJW/K//
         CRwY3bJO6lRvjJ8XtmxX+EFe8W93VaISv64u6eOzbExRXIIuojAePD52qPwQZOKnRpRR
         CvjfBNg/fXQw+vHYNcWatbnp+AkBV02D6Wi6Re05jjcIdG+4QVcMA6miZ81tKMrudanK
         KxwsAlgB2TUqJGJZC/sFy62hm95AXfclzv8j/AAClVwKwaEj3QEut4G8v7OhdhkfE+PU
         O8bg==
X-Forwarded-Encrypted: i=1; AFNElJ8g3bp1W/iYgehMEVAjppe6YtUXcu8zpgtUGT2H5GXgSW8k8QQh46/3Ul2a1+DDzQeQ3XM7++vhMZPpzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PYsDMVVcDZZ+kn1Uh3ulTBMJLHM4SrEIn4XthJMwnPLOndp3
	8k/xfOtTdTRIznutnQH2b9JTOXgD+Ru/a9fNrnF00b9Lb8MO7tcckSaFzc52ZA1okClubjHH7a8
	r1NeB4phy7VdmMhQ//0TkqtSMfMrOadbuJDeWmmAFC0u2eTSd9WKxhsv0t4YhfEZDGA==
X-Gm-Gg: Acq92OHprdoT12v1AjbkPfGpxbMFByy/ZMFLbrBLsji7Zu0I8zbE+s8xG3BsQry8Jgq
	xXUMFz9cxn9cX/2Nz222/tDMVr6k2cX509fFRCEf/2OWobd4WbHfsSKg/x9jegBHrZujiEJWkez
	hc8kTIj81WQkUnjzgF+yKYJ0EG6Ebdhif0JenX0UIsNGP0nk1Y9l3RAp4Cbd0LJ5BPMXWKs3jyC
	zChtxJ6N/yZgcDjO6FXd30MibzOPB6YNWaioxcAGnl/RGlRp7FDvv4UQUvmIq488GJQ9BoqcUA5
	HnR5LW75PRoPVrpRsKpKdwV4iUM75jh3yvOvU8qxjcUhFhd44bGzD0DbCNt6YmehZY23dJ0Ai0W
	5J1klKPZcP8d6ApHOjYc0x/sPx5pW6gNP3mws9wkGkJ/XbZBvvRJFRw==
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr3273079a91.8.1778843934512;
        Fri, 15 May 2026 04:18:54 -0700 (PDT)
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr3273045a91.8.1778843934003;
        Fri, 15 May 2026 04:18:54 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126feabsm2470123a91.6.2026.05.15.04.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:18:53 -0700 (PDT)
Message-ID: <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:48:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
 <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
Content-Language: en-US
In-Reply-To: <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bPZ1HDzCW8ynBDfJYm8eruNjjlVhEgmQ
X-Proofpoint-ORIG-GUID: bPZ1HDzCW8ynBDfJYm8eruNjjlVhEgmQ
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a07011f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Xy_6AgtP5T3jK3p2aAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNCBTYWx0ZWRfX+54pzOaryGa0
 9qRoRfUeW/lTt8M9oubV2OHyc9BK4Lay05UpuMLiMfxZs13F1QPYxMu4MSg/jvTi51AnZ8Fy1I3
 tgIZ250Dix1993e2sMD3JSoxe3RKYsy+oxGSpuCZVF6uDU4ISdyo5rq17WJ7U3iLPDaAjE8yExu
 8kBT6HfT7+ufkWI49I4TH8B5EdAGWn3G0XeAg7roEW9hzNEGhwNfI79Odp9DLHsDfTwWnct9wNX
 NC/sXq8q7BHt2G3Iw+BFwDULFhkz3o3TSk3aSOVGjR1lroMVd7AEfWzDYfYB6mvYwCqJ1z1lzJr
 POYj2jN7pVjBMMuMOSV8CMXl7BC4LGOCoKDi1P5q8llrCX6geIqvv9y24Paz5MC9Uhwt/Eh6yeT
 dsUq+ZgUqKDG5paoDiyalWNRxaBZrvz6rLq3XobL0CHlbcIjg5bq737HlBEL2fypQR07Uderz6/
 h+oS6m5bEKEGqT1h+xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150114
X-Rspamd-Queue-Id: 9217554EB3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61667-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 12:50 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
> The explanation is pretty suspicious. I can see this write in venus
> sources too and it was added in the initial submission, dating 2017. The
> driver targeted two platforms, MSM8916 and MSM8996, so this write
> predates Glymur pretty much.

Thank you for the historical context! I checked with the firmware team and
confirmed that this register is not read by any of the platform firmwares
currently supported in the Iris driver. Regarding MSM8916 and MSM8996, those
are not supported in the Iris driver.

>> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>  1 file changed, 1 deletion(-)
>>

