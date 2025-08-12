Return-Path: <linux-media+bounces-39563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE920B22345
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41479189FCC7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38772E92DA;
	Tue, 12 Aug 2025 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nvMhGNTV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA48264A65;
	Tue, 12 Aug 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991099; cv=none; b=WXQTaGH6VnTg239gVtA4wlvp+nbJGqAqnLi4oeZn5yuhvwJA6X1zvP0GbJruAEQAdy+pi843HryJqNTv1IQKqPELQXzsByhbrd7aNJqFc/zCgcl6FW3ZYv/fyAJQvD1qPO7fW5Gc883RZLDrCI68+LIJLDL2VgMG/tETPjHNFzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991099; c=relaxed/simple;
	bh=sJ5MOYsbVvXcfUru1v+6akiaiwJFwmwFW+apI8kMoYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EFiX2UsN9zCuSQz4wDlZx19m5M2PZ39KUiuyWDgb+jfEpPG2KV3SOklfAP/H/elrj42hpaXOHRftD1SkZqquvIn94WKm5xY1ybS7WyRnME16knT2cjnVxaCeVDaOBSE8vsemFfjzeGx/xLeOhmfjk+Z+jzMOP/Am8bjRD2TaV3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nvMhGNTV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4sV4F029557;
	Tue, 12 Aug 2025 09:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVjLTPr0l8lbc3fyzXOY5rzsnz4K1n6HtBap6hEctFw=; b=nvMhGNTVUzPFL3UE
	gQ76/qEUnwyE117QOoTENsPhgBB/eXLTVODcAbB7/jKrwnsJ5bs35+Yfea5xIdvs
	ALffUnKmoSd8lcRBwiB4DHLzyP7suAzbVwojq2WwTs42Qy6bkjC3mJZo+qEDki6F
	CKxk3DI+1MpqkWpBzAPU8KtOjSb2TGN76vaqN4JHmNR11U462I8hSgiyltn3uQ4t
	rLcoLWX7rBkChQErT7yKwRCoK1pBWSyI0Il7jwFu7VqddCbHJ2X8q7ObY987d/lU
	cmnNlo9hHt1lj7KYToJPvxb4rlbrmK8NsTwgj9qjoOJENjxCR+pcE0QU0RaRRx8C
	QYHJag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqruv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:31:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C9VQso005466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:31:26 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 02:31:22 -0700
Message-ID: <0ed803d1-ad7f-8a1b-b704-a3a38bdf4878@quicinc.com>
Date: Tue, 12 Aug 2025 15:01:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
 <af4cd1f0-9f3a-4eb9-8cd4-ad20506c7a9b@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <af4cd1f0-9f3a-4eb9-8cd4-ad20506c7a9b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b09ee cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=j1xqlkoCr8ei4rV8Vy8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: k1ptaVE41BMKs2979_SlT8tmzLOByinq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8MPVfV0qGk0/
 qFG9Zm9D+Nzfvmjwy0ZZ7Gfv2Sq6T/6AHwBxMt1mDeBF/2vu+MajxV9AeH0K6qQo24culgrbGUF
 o7OC+t8oEooWeXO4cMwEVsqsT64gCtLTdY5Yw9EGRJ1YMdQ5D2GDoFnFuhj0Tjtu2EsJ2oeEvsi
 3z6v91nQ/s2nGS7M6ZcYAXN5IXX+bqh81bDO8nJLRaj+W+vb+lBsDbyty6E7bLPZ9TK9nxi1Cp5
 UJHbg5cG7EXPWtdWMvegHThD59MTzPEmGFM/o/vDaYOoeh/Inxxj5TkP2mwjFMBLusUHC3FmuZX
 opScTGJBD2L3jQnWxnmK2129xocpGRVGQsyHBjASrZPMHTBlb4i85tbrtETklH7Dp7obpj+T4kr
 BUIk7XyG
X-Proofpoint-GUID: k1ptaVE41BMKs2979_SlT8tmzLOByinq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 8/12/2025 2:30 PM, Bryan O'Donoghue wrote:
> On 12/08/2025 08:48, Dikshita Agarwal wrote:
>> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
>> reading the LPI status register. Introduce a handshake loop to ensure
>> MNoC enters low power mode reliably during VPU3 hardware power-off with
>> timeout handling.
> 
> Can you confirm this is the sequence you want for sm8750 also ?

Yes, I have already mentioned in the SM8750 patches.

Thanks,
Dikshita
> 
> ---
> bod

