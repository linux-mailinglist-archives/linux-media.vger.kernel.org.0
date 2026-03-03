Return-Path: <linux-media+bounces-54389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLl9DN0lp2k3fAAAu9opvQ
	(envelope-from <linux-media+bounces-54389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:18:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F841F525F
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 564AD3072456
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 18:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6BA31716A;
	Tue,  3 Mar 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5u9kOV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fl3yD3G9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316BF28314E
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561738; cv=none; b=Lt11Kr2VW8V98sR25dFMB43OrvmYUbngnqZ7wVnVc3BIYRizlV+ZIU6pFM2VcP0Eq5jnZL8ZWo+iDFbv36wuaBC7G7MNUVoO95eIyuOCn0uNtbOcoY8SzieutfTm+M3Ecdt67/pguAOi0oPnkQzcC2XWScEOUfINi+5+FgRvQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561738; c=relaxed/simple;
	bh=nIplDHq0GeoyYW/IrfDMgxh6AOLa4S2pZUoiV75xPdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWtApY1PWm8PdEPWU1PLTPWdsRVc0tw+/tdI+pbgPhjoxBOKeuWWS5tz0ZupyWYTesEZWWAj9CXdtSItUvBwpq/Y1He5oUdvAxynx1jiSCtfX3xk9Uu+S+kq5wLv8kO7412yqVGzFc87MJuWUHD6G0ZGAGEZHR7TSxNYspPFTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5u9kOV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fl3yD3G9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0Xsq687021
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 18:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdhCqMOgDEEGAqfnqFlnXNDGRXW1vEoUmxQcDAextXs=; b=H5u9kOV5qtItcQI8
	JOXDmLkJoV7agyXL3KycA1Y3nfxv/IKIDCI8lSjiuDhxtfUN3oi60hkqerJA4GRt
	Ql+ZZ3JF3neYi22DMZWsf58MrenD6wc5ZaewPmwiaWoW9d/O6VFNQiDw3ZyBr6/Y
	sakDYym4reEuEOEG8NaD3grPivy/v6cXd3OgC9rvj13uIQfIp6clqtZD3jiXZXan
	kGs0UvxNBYGeH2APHDb1c/rVynp9MjN0crQpD1KiVP8UCk8QniBBrhBMZseEcuS7
	iSnmRVRVCqyz4l6ghWskudnnlQfLtXTqDLEV4R4tqQQgFEzMOQG94chF8PIVyynW
	Fc4fcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3na3y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 18:15:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae66ee7354so3160505ad.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772561735; x=1773166535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdhCqMOgDEEGAqfnqFlnXNDGRXW1vEoUmxQcDAextXs=;
        b=Fl3yD3G9g4rpavpfpFwS6EfgsyENCazeXFYPrSRtA3naYJH5afPrIV7his1RE1D0wM
         9fJ4ZHN6Mzhl5MURWWxiLMjYNhqBej4OWTuaZZzKnPla6LPIspY42yEcD+U7/6CGTSIU
         nJwJqFA5W2hWDVdQ1EVbBOaHCtbKZRYtuPcglWOdhCdnZA7pOT3POCu9F1i7uYOC0xGx
         R3nNsO64UMzn7XjnhBEUH1lyEAqyaL8RXX/sQ03c/buyy5tJnzpURz1cCatF1ZlphP4M
         DBznPW3h6ZQJ6ezgU+WXWRymB8oRnmcp5IIFXnJmhzl7WlNZ15SWyTgSf0c3nF68kWua
         QvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772561735; x=1773166535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdhCqMOgDEEGAqfnqFlnXNDGRXW1vEoUmxQcDAextXs=;
        b=YqsV/AAKIVT+kBZotKz9LT57/SbE1OyEVX78jtJ0xL7m4EWnQ727RwOHpKiGbVOPNE
         z+zBHceDn/lfnTdT15/1mE0Ck9QlItbAq7T0kxTyuMXr6EPkqfdl7aoFxRTupjHv/KOC
         wve85BwwbHpunMtaCTn8cM2ZvmAg/dpTznRDRqxoyzlxl4VX3Y0esOYFP8+ttX3dLMQy
         bGJuZ40UT5FBU5G8IXjIz5TP6qdn1gyb3UkYiHvwJY9QdABqX/YxamrB/AH0nxNT3ixm
         oP9u7JCz2RqVs9cjt70valo2+QNO8IKhXvqI3cPpak+ijYXnqu+u5H8/BXybySMGz89B
         pxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr4LRw34apJmGI/paCTD9tTadmcw/+sBosxJJD0euGVFQfhRVL0kqfcZk3OOhVYHlYE9tewn3fGemJYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxvh71QGYU15uZZrqh7ZbmQCQ1vz5aUZef2DkmSr/J1MomwkA
	Qv3L/47//S5KZUXCTIvDLxdt7xnLmZt9HaFVbXwbIQ8LRJvlAipCJsfRDS1v7O0JuVUHooOjsXy
	+3AkJnPYRt1Wvhd1BQLOq9cHH6+saAjGC9Q4Z1rcXOIgn6vdjJq3Vo+b/QDaVNfrNxw==
X-Gm-Gg: ATEYQzxrbQWslfd1B0Ti4+58P+AhB/mb3j0VsGZchFHHOiC7bCtbnF6ol4acNmeFAHc
	9xTNJ/LCLGA6HtKrOFNkUcaypCA6CeIKhEbpaREESc0R50xyyh1Rwqg+i5djp/8RmjWpIdlVDVp
	2VQu4O0i5tujGe5lvaCNNqqgX6liT49aiBdU78h/LlOsntqxYCYY9VCtuXEYwsEQESrQ5sEfzcY
	y+5nAsqC1gUP8Dgt8Hymj+xSZ8NPsDPVlqoKqWJoezpkfRkZaR1OlYazVPDFUJkX6UTgeSyPEPg
	Nq+YUAMtie2690xn+wZ0jLFBtzh0yxuBp9WUYlT85u/iv08J7KSlayXq5nFF6CQQkJO7phnZeAT
	/E+Y2D8Y21KqUC/Ad+m/uHWRkN3jtm5lEonwSng7Jmuu2brG3yJnyVdw=
X-Received: by 2002:a17:90b:3dd0:b0:359:9224:6c16 with SMTP id 98e67ed59e1d1-35992246da0mr6103161a91.14.1772561735111;
        Tue, 03 Mar 2026 10:15:35 -0800 (PST)
X-Received: by 2002:a17:90b:3dd0:b0:359:9224:6c16 with SMTP id 98e67ed59e1d1-35992246da0mr6103119a91.14.1772561734500;
        Tue, 03 Mar 2026 10:15:34 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c39def7sm2866240a91.12.2026.03.03.10.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:15:34 -0800 (PST)
Message-ID: <164928f6-cd29-49e4-8b5e-365f5b0a70e5@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 23:45:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] media: iris: switch to hardware mode after
 firmware boot
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <6fe3a1a8-46c7-427c-abb5-2e7366a43392@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a72548 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UfkxKPkKiOspLhQzxRwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FJqQBy3aKv5HAw_rTVBp3COYSeSkv3pi
X-Proofpoint-GUID: FJqQBy3aKv5HAw_rTVBp3COYSeSkv3pi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NyBTYWx0ZWRfXyc4xIGsyGewY
 LklSFOzXyDTDJUks+Q2ywj+pvkRdfRCzS+CpVQg+SzawdcfkPJVt4m5KhtoZIsrR6nLh1d5hM2x
 FklcX6HhzdS04KPI7+W5ZAf20d21jjVY7TJ2oaN35cwu8d23W7qg897GKQWKryizpeerWwDnWL1
 SFBzBfykTDKlBNGRhsPWNN5ObwZSY8WP61rmORc1LEhZsNGANB7dhGY+iUTigwOEdJV5ymjBJTG
 skxPCL2BDoQ4VdTS4Wi+Io505dWwjApZ/wPmGkKvZYNb251ngnVeiTD+LDFryMee5omTVu44sS2
 ppyP+vQG4+EzZ4Mi2S+Kk8v9bNqGWElclNUAt4MUuTCiOYS4dYd3Mqam49zIXsW7WKcReEH8bvm
 mgJnQuFJU85jRR+Gd9yboSmFDd/t/6LgKbRQSLQnok5pSgOup1N7liq3MA0cmm+xoFLmY5EkMKR
 V54jVteb308OVKih7OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030147
X-Rspamd-Queue-Id: A1F841F525F
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54389-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/27/2026 10:19 PM, Konrad Dybcio wrote:
> On 2/27/26 3:11 PM, Vikash Garodia wrote:
>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>> before firmware load and boot sequence. GDSC can be powered off, keeping
>> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
>> carry default (reset) values.
>> Move the transition to HW mode after firmware load and boot sequence.
>>
>> The bug was exposed with driver configuring different stream ids to
>> different devices via iommu-map. With registers carrying reset values,
>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>
>> For vpu4, when GDSC is switched to HW mode, there is a need to perform
>> the reset operation. Without reset, there are occassional issues of
>> register corruption observed. Hence the vpu GDSC switch also involves
>> the reset.
> 
> Is that a characteristic of the hardware (e.g. also seen downstream), or
> is that required with upstream iris only?

it was found lately with one of vpu4 variant SOC and applicable for all 
vpu4s.

> 
> Konrad

Regards,
Vikash

