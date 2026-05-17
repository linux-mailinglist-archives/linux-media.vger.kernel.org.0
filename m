Return-Path: <linux-media+bounces-61864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHNdGrYFCmqNwAQAu9opvQ
	(envelope-from <linux-media+bounces-61864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:15:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5774562F72
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C76B63045DDF
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 18:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C6C3CC334;
	Sun, 17 May 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6kEBRRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kjzji2zf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA13CBE96
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041427; cv=none; b=oudjtaiwy2ufVPstdQeCQVEKl4kMo5UdcyJfIElkrooLM7COcQ2RYEqFqN4JXExQQfuoT/JbdMLDRJfehBRW3cQuAKbb2Ef9lHEExOuosymzESO7VJgrMKZ3yuc4P9JUA/r1mwd64abaPCNU5yjmTWdxm3G7+u2sNUOxxtm1q6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041427; c=relaxed/simple;
	bh=Z7UubD0nbMVEh0Y171+jX7DCQQjHM40ZOHv5ApHrDbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDvK5nXV0Y8VfwMCaoW7fKVVyzMA92AQf6uWlwN+eIKi09iVHhR5llbllee516DHQtGUgvCsYK+8JWy356qAOXwYdUcH7GY7ibADpKPgD7vMtpIHY8EascbAWa9uhq/VQr5AbSraNv6Dq6i0bVMbgacRDjT6uwqeBbXpXTVF3JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6kEBRRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kjzji2zf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5ROq23911825
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YCjoQRyXXAzAPRC76KDlYSqx
	pQjcG8I9xbZRDJMHxR0=; b=S6kEBRRbbcyzoSMMdn2bw1Cb7mf0Q4oBhlHYi3z2
	deMxPkVYhG7ZnRLT5kklgXXiRpiYqxmPIScls4eTq31fpywiCZF4vqFR3Ad/29mC
	t6CwYJWAn78p7cGWzZXAIiaWgRoE1CFQwZ9lpx5crPegy/L42lOC4Ao6Mu8NqIJv
	FFTgLpvyRhGIiSWx7A3hU3xm0kVjDrGP+azwIWbRawqi7uqzEUQyI/Ci54hg7oRZ
	OcMRB/8KlXyw1pNv+wA5w1xw3wO8rjYwopQ8sjyKsKHIXLq2OF+0KWhrOo5bS9WN
	GJ+OWddnloxEvYzxNkk+MvnRxWGUjSYKIkXogHX+JiZnQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyubnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:10:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so50687891cf.2
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041423; x=1779646223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCjoQRyXXAzAPRC76KDlYSqxpQjcG8I9xbZRDJMHxR0=;
        b=Kjzji2zfa1kiPI9LGdsDhA2pumABLlNiCtL+Z66AfA4Xxm+nHh0lLB5ctAHlDReNtK
         /+P2n1dPK4qs5bUpMJ+nFRKvPK+mk/rUBcKtJ7WSjoGL9atx83ajOfiKYaKW7K1Q4j5u
         7KLeW8SPkRkHRfFUP7aMx97UwHPM62lh0VNYN1kKXNBi4TdBjqbwENg3hqoBIEv4AarA
         OXJh1aGU29w6ZRqXPT4CHgliDkYvyDU02XXGp1wHZ7N5jAlzpCTbjCCIVlw+TA2G0WKK
         2Hk3hGvcTMqZq06VGx14EHnQnLJShVk0OihKXKpHyK/28HKnccgu4xMfOGsgbkMD2O4B
         py8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041423; x=1779646223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCjoQRyXXAzAPRC76KDlYSqxpQjcG8I9xbZRDJMHxR0=;
        b=HKTcUD+4iuIQPiy7aW3fGAh4D8b7mhzG6+t6nos2/sJR4SBDG/cNvjGK4G9QHp3OXY
         saMXss4bbDeEEmOYPBaMKDqUxYT/vKT3bo7FUEEZZqEMotJR67q0UmM814r4gPKO1sZj
         VRHIYausMtB22NTEApLX1TxDRPTAv/XrFyRpu9Q9L05voWjJckE/cuwX+BdY+qJt312r
         b3xLSOX2zUHNENraorEMuJmp/hqHtD9z97dpSGICsdGS6wPjgKqnWVMeXoT6y5++cfPG
         h4YJuhvZtv6jhErpWi7sOJUeXky9OE/Je6mbqNtajo3DIGK3VTnVjWfMnriy/Yx4A44G
         GksA==
X-Forwarded-Encrypted: i=1; AFNElJ/1g7DRdh1pMTjuIEwC7GNajfJepbLFTlqZne5vME2yvSSey3ZfIEF5Bs2UJNhAwk3iiLk9JIX2uirnBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYMyClHMfSGK1O+JDWEZiYMMfWNABxJlJV0mEJcOdGEfEepLo0
	E8CISP0w72X7rVKGPGmvlrsAI9z+1TcF1zWfAPpPxmbwgAzv+203OJ+BxX87IR/llwLNrzrdvNF
	bmLBpDtOno5EjvTQskV5umO9L3m8G0MYHi83ndOcOPzYFSUFvu3IrUH8lZNeHu4AhCw==
X-Gm-Gg: Acq92OEit9ZDoV8lQg5scTs53O83c0V2I2oegj9uoU/O2iERdJaYpV0D4yYpVcKuu6I
	c7YyY6WdpWXnO2D+3T5w5PdKw/CFcRhkL/CPV2LhamcURonaAGlOxqjcYjptoFX5zm44tUKMQq8
	JFZgHAlTinAaHrT6oQPGLPR48ZS5NptN9scWDxl0KmZRSsfDwTv4WSSnxhETkTOI/plH7h+rAIa
	HvEhSXHZGsbg8RMAfAzKRDNLqOzIYA1e98bFOjzwOhyWioSpbCZRjc1NfnZxBwRa3Xm2ap3Oldv
	DGTu6gih7URlnkDez8nnoJVw0LJVh+xKZ26yI7vK52bcyaXSQepOswX5cDIl+NDcjx5oe91zOOy
	75sPx3CFMpBuf/rQjjjfZYvOUlDA7VsHLEvk5enSeetvFz9MMZczO8g2ghVnr8WrHNNU0mS+elj
	I0UsaJDt2MMiLA+4eXJBTqqbX31zhdNHDDq4w=
X-Received: by 2002:a05:622a:5910:b0:50d:819f:e7bd with SMTP id d75a77b69052e-51659ff9a0amr171584151cf.4.1779041423283;
        Sun, 17 May 2026 11:10:23 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:50d:819f:e7bd with SMTP id d75a77b69052e-51659ff9a0amr171583671cf.4.1779041422797;
        Sun, 17 May 2026 11:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2845867e87.70.2026.05.17.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:10:21 -0700 (PDT)
Date: Sun, 17 May 2026 21:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 11/14] media: iris: Add support to select core for
 dual core platforms
Message-ID: <4g6anygi3vmqomhbjjwlasw2arfvrr4bf425v4ohlatnudz7qk@btriuufbnlil>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-11-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-11-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NiBTYWx0ZWRfXy/DVu+d4we3f
 8rhl1tg0n5mEGaw5VfXL5WUXyMPJfyebJ8Xs/k4GY270EWHwZCQVrcw5C85Pr41hNgAuuuOIGPE
 WZdEovbGAdYJx8+57h0SkbEZq5veHvMj9yyONiPktUYczxD72VoJ/5n+C14tgocMYPVJlfdnL1u
 Cd5uOhmhDMQakKLa1aXu3P3suFe2vsg/cBOxG5NN/AUonNnI9HSx9/sF1aGiM24mUu4cSSNG0Gd
 1Lat3uT86uCdHHKVBU1eDiAWMZgrmfy6mhYYEI4tPUWSqgRtiaFX4czZoLqgQqpYZxbtyypaMMF
 4uUoXGHnHGiP5u1iNERHUNtqQV2f9Ur7IVLQZ0VzlIdIsPY2oIWDZFChE6q9RqYB0FMHibJePTq
 5nSdtKQs2UuG7f0HnRy6GyYXZijvltv7zr6gN7cKEDv/G3XcmpTO4DUz2RKapRI3HLy2K3oJZA2
 qI06wklJ8pwfh96loVg==
X-Proofpoint-ORIG-GUID: _RtSG0vfQa3NhHP09v4zvIgf9mZLiXtI
X-Proofpoint-GUID: _RtSG0vfQa3NhHP09v4zvIgf9mZLiXtI
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a0a0490 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dWoGYy8sgvYCzfpHzJwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170196
X-Rspamd-Queue-Id: C5774562F72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61864-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:26PM +0530, Vishnu Reddy wrote:
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> 
> Since both cores share the same clock source, the required clock
> frequency is the maximum of the aggregated frequencies across both
> cores.
> 
> The total session count limit is scaled by the number of cores, since
> each core independently supports sessions up to its own limit.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_power.c      | 20 +++++--
>  drivers/media/platform/qcom/iris/iris_utils.c      | 58 +++++++++++++-------
>  drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  7 ++-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 63 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
>  15 files changed, 173 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

