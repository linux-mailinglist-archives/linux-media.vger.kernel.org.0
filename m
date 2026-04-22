Return-Path: <linux-media+bounces-59330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM9ELA7A6GmEPwIAu9opvQ
	(envelope-from <linux-media+bounces-59330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:33:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F88445FCC
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2544730C37DA
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3046D3D34B3;
	Wed, 22 Apr 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBwOabCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlmZX2w3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2FE3B27DB
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860814; cv=none; b=jHxDsc88GOT7QP/MNvL8jqM1Foa7QS87JRn5Idn0022lQLqobrJC6eX3YmpzCCMui/RArxLpijLXrGDNvHuQP7jv+E+30ZFhDVjjAozSeSZv4Rm4H1dEpeBNkmX9wXEEYppQy7lBcyF8c2vdA2hOKeykqByM3NBVQ8Tf5tlQP8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860814; c=relaxed/simple;
	bh=kIXM+3vdgbFxo+rAygXapgy4xxikL7RIYyN1mk7PXoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5ghQAhPn8BxL557unnWHmoRnMSjnHq/pnVHItkWjGxrQPh9/tc31cT0RT0aCQIt27tPzDjpgBKZqrwXdLARbYCExgc24fibu+Lq2RC0Wr4XKLE09CsCCKxTf9otFleNvWV6taKr8xlQ4xa5CtNYsd5M88AEW4kO7GOWq8Q9gHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBwOabCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlmZX2w3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAcwBT2123520
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Yeio62BaE9B9cPcrqHKv3p8AalT4/2O4ECgzsrY6dk=; b=GBwOabCO7Nqc0+iU
	sHeXPuCKi3x5eX4K3D3NZA7meIYlPzYiLxd5Z6RP/UD1CcLl26XqUT6iF7P1PfHQ
	HgJ2wGbp9W8cfGsXFN/ELqpHUTVUK64aRjNPRbI35OuRG8nxSg7uwbvrU81SmHLT
	OSuy8X8QQWiuTlxkjF7JYLQjbK5GR34dl7w9L966nAHjHSR5rYpKJtn+HFVWL1M3
	C5AZNTH1GkwGaWhvL06AGtkdzGLROcgWNwF2td6Qycf2KO/hoZD4fWER5j+UrB99
	Ck7TpKVs/CUkv7sbtwVZjd5iOKfJ7t5AsiCRvOZVO18/P4YWKGuJ15XXm7Et0BSK
	Tr2nSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfuaqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50de6db1eabso13193461cf.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860812; x=1777465612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Yeio62BaE9B9cPcrqHKv3p8AalT4/2O4ECgzsrY6dk=;
        b=KlmZX2w3x+U6AIZ+lCyMEpxTRHuvZIQJVNvq3xXFSseSHKZj5c9xeUusFiBCWmjRcb
         Al4Ntbyz4bU6H8CFEBx0uQl+zb3tsdCvVCRKhTKKhMM9e/OscfiadP1DoWxwxhsrZsrV
         vAcmHBFPM8ci2w44Hn7QjpqrYF5Tbc76nxUipBVWJL2reGw4ua3ee9jLLxdQXdyMclG3
         vXNpQ+3ePCv9UhbGHmxgOmRRBlTZmxhj0Txq9dBBggjiou5MhNr36d7cy1m3GGL4e8YX
         n6rWZlJ3uShKfekrY+OSG5NkumRRtpnDuHUujNE1G3qFLwgUj0vVV2XExuMEEhqVSvVx
         oEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860812; x=1777465612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Yeio62BaE9B9cPcrqHKv3p8AalT4/2O4ECgzsrY6dk=;
        b=UbzIXu+UV4VotbbI0P/I2RM0fwB15dxN/e0Qh53Y9cdhHtygE81X12SdkiYkTmUOgb
         j5RkXGq9v3uyxV1BJ745gJen6wnehLsh9GZ9dxt2VPCaM18Yjyt+5do8znoZlugereQB
         ve7j40XU1dWatPC1A72CItkB8dZdETtIEUCfUSNno9/HK9yT8/edZLOXYzpKCrlFKrRv
         by1dvfiwD8aFhVWvqvIWVn0CrRGyJbmJ8bPQ5llevm7cOpK5MwdiWgMcgm9emanuYbaR
         7K3aVh0ignpJwYZf6Ql/wnJBC//SDPDGKbGYMxVYHMfjWtmrenP+rtqTPYtAh5CO41Cu
         Mmyw==
X-Gm-Message-State: AOJu0YxRKlBgcOFPIguNdaTfdyCu3mEtcRusT95U77lFcopSTDotXCAU
	m1iBQaDzf/8x6KLN+pfcKTQhh68P4PSbqTyZUA6Y4fSdZrZU/t+QPMTEowCz4g2uKSpVIpOAEfh
	Bd0CwrvSCgTeHHtX2c1kkyRarwyOqi5I6JHVzkv3qhstzyyIce1ICEmIZGEymlX6Omg==
X-Gm-Gg: AeBDievb5VfP6sz2R3G3JiOXlGiNBejqSot4olKyXD8CErr30dJRPipnRs1cQLvgLFu
	8GKOE9e/bPXPtrxROPLfJOJodOGnrEqi2wx4dgRFsq9t+MR8a8dgdWvPkGuvNFv1IxScSXdsI8X
	yrcfCZwhFnvapP74rKIAVrXvdRuHk6LiVLmRazWt2R/qSojbnhmgqkFeiFFRj3w8ltYFFiC5Vbk
	KMdbv0fyU8cnVbefLij3nOkh6WF3CF/p3nTaYmTwdprE+vClZHPfAobnmP5txyzkpWoy3Q9Cs45
	fibEL0nPIQ6Lg4nE5PmfrVNpxvWib1zlCVsNHoOVMlylCSnzKM92DyUVvnR+8jWf5t3s476Dz2m
	HWKJVDLaC1CV/IjiFBfowTlw+r5XMh0LNhtxcCGgdgGMA+ug2dMWaOlvdk7903b1XdwoM5nhblX
	s86OsGxeeY7SVscw==
X-Received: by 2002:a05:622a:22a5:b0:50f:bea5:52a with SMTP id d75a77b69052e-50fbea51481mr36581041cf.0.1776860811965;
        Wed, 22 Apr 2026 05:26:51 -0700 (PDT)
X-Received: by 2002:a05:622a:22a5:b0:50f:bea5:52a with SMTP id d75a77b69052e-50fbea51481mr36580721cf.0.1776860811594;
        Wed, 22 Apr 2026 05:26:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bab1sm527245266b.35.2026.04.22.05.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:26:50 -0700 (PDT)
Message-ID: <f2f4f5b7-d204-43ee-80fd-aca101b9f86d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
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
 <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-7-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8be8c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C_VYEJWI21jkAhOvB2sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UXVbVha_I_drNZixRj2i-K4T7cYoDB0-
X-Proofpoint-GUID: UXVbVha_I_drNZixRj2i-K4T7cYoDB0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfXynK3aP8jn4Yp
 c6i4AYE23LtRmvQDcMkL8tWVIQkPb5v6llWSFyPM1H55oUZ6YKGFJBGnIcElV7vTEuX9Z1HebXx
 nzJ1CuRrTLOPamEK/rCsXNNBOLaZFfvi3i5xZmCucdQkiXubHNDUOaw5UDDXk6HEweIgTqIpPOE
 /DdyTZLxTJChkYhQSc6fTtPeSSK7P1RAgvvlS1WT6A9b/7lmPmaEzo54xA3c1FUVw3d5sgV0Ar1
 AqlAzlHQXdjEOOw5LYQ5YAteLdWg6vKbkugVBORZw0OSGB/XV1dGS74BurvPPWB1Vr6+vSPjnh5
 plhY6gJ8U3P41XWmw9WB2C1+L7ZBT+CBAqPXiWX2+lISZzZXXuluMkFEgPnGJ1RZfJu5TKVdzDw
 fkajie9a34G1e4L/8P433CJcJhrrHtJ2ubNYsjoLHuUjLGPVvwThLLDGcTIfILn9yqWMdx86Wzo
 sg5Pcn0klhNl0oO6RTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-59330-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8F88445FCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> iris_destroy_internal_buffer() is guaranteed to succeed and never
> reports an error. Returning an int is misleading and forces callers to
> handle a meaningless status value. Convert it to return void to match
> its behavior and simplify callers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

iris_destroy_internal_buffers() can be made void too, now

Konrad

