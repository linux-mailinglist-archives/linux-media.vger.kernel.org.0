Return-Path: <linux-media+bounces-62779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBbOEleDFWoSWQcAu9opvQ
	(envelope-from <linux-media+bounces-62779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:26:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0C5D4D86
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE81F303981A
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946403E0252;
	Tue, 26 May 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McMcpSj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shh9r3tp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008893DD521
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794507; cv=none; b=kMQhTOulPtNhWojLvWqGHkbAzeiwOtoSAXH0wETGctME9ZSYF6VTFkq2DeSDmcC98uNNHRQIf/zde2Frgu232RQ4CFHFrfOQZfG2kxW4WuH0gue7nO+jil/r66TRHchI8NBX0vMrSFQXDJzSGBsM8k1WgS42tylu/nwEpgx8pq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794507; c=relaxed/simple;
	bh=i/pTzMVi9XbOmZoluvn42b58PFWtzW94v/MUSd3ggjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lE2vCEdVazcZ7KUS7o7TIEW6ua0Walf17sAO/ygbEjnSpZL8ZIbn/69q5xurSlpiRAry1EB/+97oPdsTgJ1svN1ze8hrR9AL0z2Nh10WS8++7vhyX8NrgQZZf99W0CWnx//LQw5Cr8/pfBQ3fJodXZxmvPkfvxTR11+IOSMbSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McMcpSj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shh9r3tp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xsgQ1604663
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	657l6qX2PWzLBimaQHEMg2HJ1WHmLAQaXwJId8moVA8=; b=McMcpSj354sThUE1
	mYD59EORxNrXnhcSVzzJVxU/mtgBOTkATHS3zgzpFAJgFzOCrZ6Tko9QcRFX4fdG
	pjO/cSrfmFsIXqG1Fw7Ao+Ras3SPAAQV63vtpdpB+azxJWxOrGkxzP+cwyxpmql1
	mRRhTVOo6NwaBvRWNf0+jzf3jb3IsstT0cj7NGw+SyGajOJL2J5Fd/8gFPX2OMiO
	+gtHnIgX1IVHJnvyEIDB0PSekbn3xyg1BAdfZoOFcdvA4Z5K/j+K1CcxJtgrUD2/
	z3z4W3alIsFRXRbx2o8KKfCwZu8NS6qvdcKgUni8T3BjfMJcYOw3WsWE1Vy2pWuw
	H6qBFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3s8e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:21:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8397b14a689so6443040b3a.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794503; x=1780399303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=657l6qX2PWzLBimaQHEMg2HJ1WHmLAQaXwJId8moVA8=;
        b=Shh9r3tpPtbl2WDGhZhQrhFYS/4uUtYjEoZdpKg9BWu3oGjphyP+Xft/9Y339MMGjG
         XsDnu5X9yghE5ZB3v4qTUp/hX/smR6iG5PEJVE8XsdBXvYGfdlat/JnoxFnzKIWOWByp
         WAGwxAwonBDkiSj3PTwohPaA+uu4HqADBlM3D4Wd0gKCmCFR8CaRpXtzYpsMCSsFCa44
         dvTDlwrDd81oURTjnmQNy6GjeXVh9yUGyPkb0Ohr3g4E5yrMmLfmZ5GJkl22p5uq6xNe
         yY7enGpejh0hb7dcMfQ0vzMSKhBYXsL3Nvxt0pEpT19qkABNGFAZ9BT+61/kFg8gbsHS
         c3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794503; x=1780399303;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=657l6qX2PWzLBimaQHEMg2HJ1WHmLAQaXwJId8moVA8=;
        b=EuO9w0ovabUYNs9xhseVoEW1TmquKLwM9xh0L6V4bA+MZ/ZU4jZsixuoBSr4ia27wu
         XwqYINxqxjK4o7B2Esh3bLVDiHxdkuB8xZ3PVu3GUaN80azUMBTZ8aksfcbJvZ8gHrFX
         nm6uE8MGE+EnYdo1/me45BhkYg0mV4F8zfGZgGVt3oX/pPrkKVlEELvWoOqRCZBkkbws
         8EO9xKJWYFiK/xqi/GjdG4KFn0nY4M1Js6HFzrf1s9jHSo9HHD63+0D658+G1eFVugOR
         TbhM4HAlGgwz9eTq/dmjdg38j2GMZPn3jbiQbfXqYQkDDHOrYSgx2IXHp3BqDovEgnlZ
         jtNg==
X-Forwarded-Encrypted: i=1; AFNElJ9iRcLVlcMIuk0LIwm57+8fkFICey4GDl0B8OiQ/Q42j0665vwWM26GyTX85jIJA8/dIzHcoqIF9ifPPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0Nx7rxhqqfAQ9QoqN8v1MYPt5Ej6ruIr4hD4McOggWL/QEhZ
	GFbakMDX6yEcUlf7tu2pfiGfbxEcOoqfOoEXqVskP4ouP3abLpr6m4XRqnAbJvyXm+JsqkYj7qx
	cGkymNIO6zKRMxp9i6Dj18WhyhopFKzgn+k0cCwNGWrzYaczTX+gSWaNvQNR+L3bP3Q==
X-Gm-Gg: Acq92OFgSIeqcdl8pqI4w0rlMuc0tgSm3Z9f6AQG4DG/eBD6WOYSWiiEUHxf7cG7ULy
	2D2V3r4YmtXPSlEWxpwBLUvvj0jFDMMAdDRbUZRTlObUU3+wJgDWbNTRZWGHQKa3Dp7PZWNQeKc
	C+4dT3zInijBll3hjsdu8BiYUCNsDlE6oeXGSlDgp6hUCfbR9JFdP81Z/ui4ph7ZJupj9d+gniW
	Byvv/iDkXeny+8p8LdL2Wsxzejl/kDv6uZ38o1XQkqw9dy8pG9CA2mVVNW8cohDw8u37BQoD+dm
	WUOYGGQb7hICz0R1MbDmj5EiVnzDf7ip/3axwgi1jQzKg1ecVYioRXTqd+msdSpJzGKS+FAnxiA
	dTqMD7NF2DtmvJdsalBYv/fcXq5F3Bej4xZBvw9YpOleozNRNU1EdBw==
X-Received: by 2002:a05:6a00:1988:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8415f33166bmr15334891b3a.17.1779794502942;
        Tue, 26 May 2026 04:21:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1988:b0:838:127d:a16e with SMTP id d2e1a72fcca58-8415f33166bmr15334846b3a.17.1779794502360;
        Tue, 26 May 2026 04:21:42 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm11949564b3a.3.2026.05.26.04.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:21:41 -0700 (PDT)
Message-ID: <2757cc51-f755-905e-3dae-4f4cf12db15b@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:51:32 +0530
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
 <11c63862-5e8b-9f3a-5479-706e672879a5@oss.qualcomm.com>
 <izj6zy7c4ec2cjbsznkaxa4q3hupwteqprjzpajjquwchwa227@mplk7d7uccz7>
Content-Language: en-US
In-Reply-To: <izj6zy7c4ec2cjbsznkaxa4q3hupwteqprjzpajjquwchwa227@mplk7d7uccz7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OCBTYWx0ZWRfXwW812E6vo0YJ
 MLhVOfw8/ju6Q8AJRIO28a07CrgcaxqkQuZL6vGbXOUktLHV+VFWJDbrRU5kKCSw5of9fBBTncE
 ybFymMtu1W6kK3PG3+gR7rr3a/jUX9CoGZkcpVEgBMSP1uUvYwXPgZRWEg2JXg94l4DYsz6SluR
 NN0RoLC5UrqfcaVUfur1bfAccJUhY3muxiiFkVXdLVsQDEjeXwXcwTy8l6GsTXkgJyS7/RYtwHi
 yNuYQk/p4xYNbsOMTf5/VSj3LL5AuoyeLGDxWZxC6l5WxKxIvV1QPI4FArDvp7TM9C9toPbC3Vt
 +gUxDaIU5kaK8pCJ19tjk5FfhNu9rhNBR2yvB46hcpAzGufG+dMQ0LLQmTeyrfee5TFWQm22JI+
 G6R/RG3KwfMuMnUm2Lc2Efhhpu6z2BY2UvuQLTODDFY/weNGPKIZvFOBZs3P6YXmwkyRsOCmv/i
 jmAj35n7hvUTwQb3fBA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a158247 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FhdRzFEOr7cjOW0uG60A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: DpMZbbNL0M_m-Qnxj_Srivt2tR5GAwmm
X-Proofpoint-GUID: DpMZbbNL0M_m-Qnxj_Srivt2tR5GAwmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62779-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CB0C5D4D86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/17/2026 10:59 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:48:44PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 12:50 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
>>>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>>>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>>>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>>>> remove this write to leave the register at its reset value of 0. This does
>>>> not affect other platforms as only Glymur firmware uses this register,
>>>> earlier platform firmwares ignore it.
>>> The explanation is pretty suspicious. I can see this write in venus
>>> sources too and it was added in the initial submission, dating 2017. The
>>> driver targeted two platforms, MSM8916 and MSM8996, so this write
>>> predates Glymur pretty much.
>> Thank you for the historical context! I checked with the firmware team and
>> confirmed that this register is not read by any of the platform firmwares
>> currently supported in the Iris driver. Regarding MSM8916 and MSM8996, those
>> are not supported in the Iris driver.
> So, which platforms actually needed that register? The "currently
> supported" is not strong enough. We are bringing in Agatti support and
> support for SM8150 and SDM845 is in discussion. I would not be surprised
> if we end up porting other older platforms too. So, you are changing the
> historical behaviour. You need to document the applicability of the
> change.

Apologies for the late reply, I was on vacation last week.

I'll move this to a glymur-specific vpu_ops hook and keep the existing behavior
for the remaining platforms.

>>>> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
>>>> Cc: stable@vger.kernel.org
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>

