Return-Path: <linux-media+bounces-59327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DyPO6W+6GkHPgIAu9opvQ
	(envelope-from <linux-media+bounces-59327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:27:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E789445E3E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 703033012234
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F33F28643A;
	Wed, 22 Apr 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKj2GcBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crs4+Zvz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41E3CAE61
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860716; cv=none; b=UkDr13tDOcS9fAzlYyan1pe6DVGjU4ENAewg3VIbF3h7rWq7r5CHMoMvmdKjJraqwre+4++O40kuSSJbknCgFOFKtqY2V+43eYhRSsPQOI4ckHk5v+FLBD8Am+1o6qAc4xzV25nmsazLawDrX09vtnNZxbZQaSoVKq+Qqu/jqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860716; c=relaxed/simple;
	bh=dXMvBNPMNkVwN7WS379utjk6WNhTqMCoQBD3r1t9gWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lV0vJ/9jPiDZ4r9gkcxXUatYhDovGxsUMcZ1kwvYTuCVeRLkAuWlVmxqAil13bfX784Pbv4/HICybGbCzVzwM3UevPIh/ANMicUd3K+cGh2lXPcECduYh8C6mpqDfBStoYZYPo5Z3Da0A802F5k+h7mHI+g4ypSilxNc4JiY2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKj2GcBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crs4+Zvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MB7N8q163850
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1L2jpvcynv1ARQQedBopx01D86Nlmh2mos8lhgHfYc=; b=GKj2GcBXooSc8VjZ
	e8xjOzcUczZQzgmYHX+vSXEfAHuNoNFgkNs+kFehBfDO/W3XqHLc7nepKrkbRR6T
	Ni/D/xA/3nmBTQihqJSNNZ+fpEL10opd58QHWuVhQbFbHbbvUAjc20vTWW2YyFxY
	iQc4M19erKctUOj6yGBCHRtt8jbV3YQnO0SiKdGF1ln5Ekp51cLMOoRYTniUJONI
	oKpOt6WpE9bLIAf2wlVHGa6UChZpC2U+lyEhHWorojV3DRwt8pY7VXLPKaOvC6u/
	H/5wsSxxYmWNd2Ejt9r1JI0XdNQaqlwJhD2rfaTyULmbHhgcDlmR4ObDJOvuhUos
	usTAHg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhkbv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:25:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d840206c3so11427521cf.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860714; x=1777465514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1L2jpvcynv1ARQQedBopx01D86Nlmh2mos8lhgHfYc=;
        b=Crs4+ZvznAbI/d6s2wrmfU/+4q0pVDECCUKG8qhVVsc3y7Z/pA6GRpXZ4xn7c4O/Sg
         lqgbr+ty7VwdpnQFQio/6/ix6ICsaDzeD2ZGGKb3S0+2RHVZn/hUHD7TJBDgJlNrq2g3
         z5m1Ir42RhBgqkmx5x51Y5dUizglQ3MKWeXJtO9R3+VO10u8OeZn3PlP3HBUD//j8wQR
         g4w41ll0+szc6ly3xPhqbyfOScjQSUXOwRpnTkMHEAiNi2rFSfePbi4oJKaCVYoE2Yof
         FBdmWrM2XG6OeqsABxNvP4nABXvi8MhGM2ZPjtAcVnlAfQ1czXofUfamD6K3SyBvPo3X
         nSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860714; x=1777465514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1L2jpvcynv1ARQQedBopx01D86Nlmh2mos8lhgHfYc=;
        b=YtCX6W3W8LQN9osZaceOB7kCAV7SjqcFCpQVDvcA39MotL1UgXF/cz+yKRQ+wl6OBU
         pM4/WNFZU1kNUNk788cJD5R/zfgylbv/ZTVGMrJXqLwwPKs5jFhoMblPeQeI0DqvAtuY
         O5KD55XuvwHLGYp3sIn/PlSZioW3A9JPvUlVxcZ8ifO2UaHtSbk+QZl+FEP4ImG/ahdY
         CV9KJjHAMrPq666d51cXgd2mSz44ip1FK9sKwTCYXMduxWdcIVXYIuwY5alLZFjCHJhT
         0wWFkBGJ+agg1B91rsD7TaXRT27f7xFT/6B0V/cUB6X47TLfLQfWuZ2OoN1UaDXkCezE
         Ycnw==
X-Gm-Message-State: AOJu0Yw0mYCXbNa1LgXQZR5bdFdok3Fbjc8KwPDbnQHFH328qp/j/AM4
	9RvVJSX6epiEHY228cG9r2L3T2cBV8ypQqcRAhNaa4NfNGce1fo41BHjlgXIbuwknDmIRD1uLBZ
	LUOxGheZnB9kqsfruo5NxIf/BlEOd0BT2G3Hn8eEHD7oxARkykJ1DBRg8iY+2JTl0QrDakp/fdg
	==
X-Gm-Gg: AeBDies86iKK6lAtaQfeIXaXAmjSd1XERxi6odHS37Bok9LLLTqHmRxMVM9fSrz725h
	58Ctc7s7xY2wFXW3gmfCq6L71H0QVDLI5QiNA45xRitIALPD+6TSe3mjQbnN7vbMS2scqc5vls6
	p/y/0xd2bSm0S6Qwiub+Q6JiflXYYnS+RHKV4nuypVjX0m8HlCPQXHoEqxkYXTfh6X7DV77Tff0
	cy+WtMQrgRlWs5DEjlAkZ3+f29evbPlHXicfIInQL1+wHpTGUxIcWkMVNzgf+qlvm4zY8OyISeQ
	/T3VsFRS1ivWaLsxLe5CfiFOLMOcDC9M9RgVHIzJ0bi76aR90soHib/+9pgWSBRBWBs2thEDs3B
	fM2CKsqG7YFHvveLmAVXUWmYQM87ZKSntGNF9pkhFM7W3kTeIpI6RKcX3s8pRfjrJSQAl+lMm0s
	OH0Vx43VAdbVvHmQ==
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr57408891cf.2.1776860713810;
        Wed, 22 Apr 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr57408621cf.2.1776860713403;
        Wed, 22 Apr 2026 05:25:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045898sm537949866b.48.2026.04.22.05.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:25:12 -0700 (PDT)
Message-ID: <faa3a6ef-da55-4747-949e-64bbfb54ac0f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:25:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-5-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-5-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2ueMt7axZPGhInS8dAODuKm1jWK94d6A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExOSBTYWx0ZWRfXyROKPCMEwkxY
 wA40dlSOdmpWuNzOxQNjSDdLb1eDCDPuhyqa2Ffeuh8Z7RZ9SPQqX3KxZp72KZKz3bDPcBb/lXw
 tYFjpht/pVGa2d42IcGq62wFenMyxK7B5IXlCqHYNW48TB4kgCOfLrJA1+f8P49ArICX6Yaaa4j
 PEOIDFujN1W73ULy4Au3yyGXZDLa8OeYQ2sASPkkxocKkTqdEcQAxUhlwTTbghghbc2ZcOVH9r6
 Xn3yAmi3XRLNmXItoHTMubQ81tEiZDt6xxdHkvToHfKct/HqCX89UBmaY/REVV0AFtEIX7OxdUF
 VAMxZcMlxqvgwneieJ/ANU+tA8+IzJivZ03T52+oLSmgUqLSWHSeXnEJRJRYNPul+GeUvDyuxIj
 Ob2x8YYyWJtaJFW3KA06E5D5L2kQ+j5yYrlutm9+rOBcgzpcVERwDxz1NWZejv6ECuiIu8Od4wv
 ZPkzsVcPVQeKMBQN9GA==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e8be2a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ha2Z24GXLA6jdmDSZ1MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2ueMt7axZPGhInS8dAODuKm1jWK94d6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59327-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E789445E3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
> dispatch table, causing the property to be sent to firmware twice on every
> config-params call.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

