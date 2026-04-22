Return-Path: <linux-media+bounces-59282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HTiCdNv6GmbKQIAu9opvQ
	(envelope-from <linux-media+bounces-59282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:50:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D05714429A4
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96335306558E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FDD33CE86;
	Wed, 22 Apr 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjw9/eJd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdaP0mpN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB731E84F
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840453; cv=none; b=OvObFEjoNpTBOjtZZkYuwJNxu3TexpmeODjEj+YCCYSAOfrwa/z4CtyyLFTny78dYXn0CwWKAcziFEn0Aho0RjfMjeuIkO3KqVluZG0y8HImOTsKwdGGqd0W4P6iP3260BdtxPk2rJ2QcYX7s1sWENgCbzZB1UGnaZIlZH+FaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840453; c=relaxed/simple;
	bh=YKJmHjK+ldBh7JmeC+unJPFblATysoLO7RwLV2i6e48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrGSYIm2WlTnDYp4BwjuGIy62S3VEaGbS0JHg17Ptpd8aHkEAIJ8UV8y59VUUOY+sRUh9OKCoTPtvRUxYgkqE2fxyXJ83eva/8sgOGriifZarJSugxPPTEkbhH03gwIsPAZufGRZjxYBT1Ks1onJ3SYvRYxLVyEADQ7GzDR+rkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjw9/eJd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdaP0mpN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4o26Z2000986
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7eQ5wgAXSU0yK1f/hAK7Gco/6iwihhu9zvdHIkh/L4=; b=bjw9/eJd3ElTeGl7
	oJQ4UicaoPL2WTMziiSo7Ek75m3Ks8aaOJAyyAVqd7bXZqcWXSNswkdy/81yBJ3a
	8akxPKCnn6g+ieQ5R3iVrMRVRfdKhi89Ebph43CMXnTkEJ3sQaKQFAYELQXhHPPF
	VA7e5o8IUKxEXYpHSehF5Ztotq94or39smBhD0jkn1+FGSYhxESnuaFvSut4Vtb6
	xtMzTH1Qrh5+cTT9C4hsJVGwfQCD5Fp1I5i3Ry4wk8ycKTpyH59eF9Okx5yNr35p
	N6klC2cJnM2H0Lw1jDBB+tX0LWFwNK1w8giKlXpi+DlS2Z9GufCfipZokInR+qmz
	gyNt4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfa343-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:47:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so5910125a91.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776840451; x=1777445251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7eQ5wgAXSU0yK1f/hAK7Gco/6iwihhu9zvdHIkh/L4=;
        b=AdaP0mpNt+a92dDngNUBmvblKW/6sExSA6hPN6Kdt9v5okk0r8DQgC77blRbfVAuIw
         Xcl9x91lFZWzlbKe9rkGlUfBQwVn2ApO/IeWeNdGoVL4XGKicTwyXJ/KFdkF4LP1PSS2
         SGOTHSoVAFYCD1U+i+jpBvsWwC2dtHXVFhEomX9DVjTyt/DF+xVkOSLsP9Ro9NJtJfx9
         sxwCL16WtXmOBeA+LYl2ZAxWvrL2+1Ove1+3OP3RTPmtOqGS5EI9sL//5yfx2vDRrDP5
         ffcqZrgQwidAqpoCZuJL5vTbR5GOSWjRxLr27+BN2bWJHHqnmOpYenQNk/IjBtl5PHEF
         OmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840451; x=1777445251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7eQ5wgAXSU0yK1f/hAK7Gco/6iwihhu9zvdHIkh/L4=;
        b=qn2Buae9mUpDHPz2zI6FhuKtetUFIkGIt/mkx03kGpOVQoLykWtuMLQBeU2xDr4lpj
         NAEEjmAzSh+76tY5MExSnRN7jBO+zu2oxox68vCdgGWKax3BlPIgzDj/jSrmT7VgQUCY
         wM0urf02YeDJMXaXTah+6G3IxmXAIuZ4WO/6NQCepz1TqrgwOOiMq1576QpTk0vV9wAQ
         VSBgVU8oOXlqt2X/65/K4VPW6a6U2N52AIta/FVDu4ibeFcCq9ow2xNgyBaL2pf8HIdG
         3j1TgWYaHuMxpAhGBlaP86JyfnkYeqluIk6D/rEDFDfa1E3FhN7//jl35V2weZFCNlZu
         yDlg==
X-Gm-Message-State: AOJu0Yx+jI2PBm5cipo/93IVqNH23zEfBeLKp1Fz6ptixY98WrEHVV1c
	aSXFsekT000UOD7ouQRCvP1fDBGEAPSjpYK7PktXW4o/N9esUHMU4Wy8Bs7Do2giOz71veTcx1g
	l3k7sR281QBPXonQ0TZq7Xbkd2XJG/Q4dg5NHkQJkx/RvmnU323dJGByDT70Ekzv8BQ==
X-Gm-Gg: AeBDiessbxSvrRm9w1xGqolyXFZqsf/nu4c0YqOTlbOX58jCDWZDI2VgdNrNd4Efyi9
	c4efbPN03EvBLphK+3mYvCZYm84FweYv52HyLf3uks7QxPUZbc4YuFgjaBuW/xJNEHCrY7yJ5VZ
	FHJl4/IWg/P01fEB8Mwjsx0mTCFv3h1hWECPs4akZR+t85BMozcAuEX7X1QgqTox+jeMKXSm1NI
	mdHPqpZiw1t7H0WdTl6ujPcydUwotkxro2Yno6nqELIJ3AXn2eHDyy+PN59irxZctXgdwmzwDxz
	U4+gfiS6H3Wjo6OGRpWNspdXilDPzazFXSa5wmBCBzwpBy+mZUGT7TbLH0TEGt8b5NuKElbjsQ+
	ECGbX3ycI9FF8TVZuII6ebFMninqkOWCgjf8za2cuAS27ll7Im1e56fs7BK5YUKnN
X-Received: by 2002:a17:90b:1e10:b0:35f:c156:a82e with SMTP id 98e67ed59e1d1-36140290696mr17743501a91.9.1776840450903;
        Tue, 21 Apr 2026 23:47:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e10:b0:35f:c156:a82e with SMTP id 98e67ed59e1d1-36140290696mr17743481a91.9.1776840450385;
        Tue, 21 Apr 2026 23:47:30 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.228.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc593bsm19904138a91.1.2026.04.21.23.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:47:29 -0700 (PDT)
Message-ID: <9641eaec-db0a-7c07-b421-eb6e178195ac@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:17:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: use IRQF_NO_AUTOEN when requesting the IRQ
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260408-iris-no-autoen-v1-1-378d290a019e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IOO5Y29rQ4tzXO311R_2jOcZH3_OPiDj
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e86f03 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=rP2ZPG2H70Gfrv7XvIldxw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UcOOtBqsNXsv2hi3nloA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA2MiBTYWx0ZWRfX6yvQ/yK/1oXf
 t4c2rRlkbGkHatRS/MGRpkDwmsSkmBKyDCM4tt4i4T+6eabWbhjgwEnzV4ioxYgb9kKnHVxgGZi
 lvqsozmUj+UCGrSLyddLPmYiaju4vCh8i0AwWuu2SDHMEuYA0wHxwYGdHODREB7ubobbBjib4ko
 wNppNVHowQbD9tBhB2wOi1LTSpsbvYyh+IDbqSL/Ow/vGk5I98hsG3+zbX0g1ncHtyn/NdJGCUz
 DM4b9BBdo+bI+F6WgmU48szbbebmFnRCPf/naal1B7z6BDcW6P28WfNQDwXrYqIShNM+paCS+3w
 im6YltIQAvQNf+zyFGAOqia6rGpovLR8JJ0Riaus5FxwQ5fmW1CQxzFqMVMxcQLbxK2aV4yCPZq
 WIN7POzw3uN2TQzlPAwak7n5BpoPo3iLjXcxwl1lD7b7Gct5qcK+FRK8yQ3yFDYEwcCSjGXKWg0
 Szw5CYVgfyibhO+UtFA==
X-Proofpoint-GUID: IOO5Y29rQ4tzXO311R_2jOcZH3_OPiDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59282-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D05714429A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/8/2026 6:43 PM, Dmitry Baryshkov wrote:
> Requesting the IRQ and then immediately disabling it is fragile as it
> leaves a window when the IRQ is still enabled although the underlying
> device might be not completely setup for IRQ handling. Pass
> IRQF_NO_AUTOEN instead of calling disable_irq_nosync().
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 


Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

