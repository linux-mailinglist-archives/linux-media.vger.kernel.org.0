Return-Path: <linux-media+bounces-51539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE3UA5A/d2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:18:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2086AA4
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27DB53039ED5
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBC332E72B;
	Mon, 26 Jan 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOMSLR4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I060g2w2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DE730171A
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422409; cv=none; b=ZCxK0xERQpZ0aoXMUcRdA2UiMXSnxiB0pyexAOZmKFbMQJsiMtPcwo47fzCR59OBeN5EXGQQ0KRnHOryX7ZzoTzvWJt0OJiou25nVMo8XoMsFgMI66FKNdxQKT1ZxOXVPqebXZyE8ULSD7og+St7vZX+6Ti6xvNRjlJzcANVqQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422409; c=relaxed/simple;
	bh=MsllnT26vUFcTh88tsfwo5WoQ+qYBAZq9yFuM5TJ3PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9ZpORWbpEfcrvP6l9xZDNpNlHSGVlU5DAwBXd1ECohfMYPhr3MIm8bhvzb23d/y6gzDBOtBW/VNTiCslT/PsBQGlMZ2D1n4RTP3xFiWyvukDXW20Eo1hYBqko+blSSOFHLmrktjPLo5N9/RsFh15KB644WBcaoheIObZTLZjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOMSLR4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I060g2w2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9094C1133292
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrldpJgRnlaWRGzvci4KJ0bX5HDaKnyn6k9LRwR7uIY=; b=dOMSLR4/PQ6AX0if
	16fWysQSQnLimsL0myBfpxJu6HAUVEYNbLWV/W0DBBp8cfigszxD5Ls20hB0WETH
	rlcEKkLph0oOtuspsO9IW8HnCbHhISgJtHxK3PECURNI3S8xOJMkWsiOo6YmIVn7
	DnS1xZhUqzkK3l2qeSCbrQTa4v64kWdtU9OmE9oZ4yu/d6uExD5Ho28tgcaHo+Xs
	ILBfxuP7iODADCP4V7BiQ8W+kienJ+iWlP+qM3On6E17i74RRksPTA7ZtGO9a99j
	dg/Ng8GLtMFTvPs4BZ8ii2InwcoU6oN5HbF8ExF3IAf6uFsTh+InB2RWuQqXyvx2
	sybJPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hc5wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:13:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so115853485a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422407; x=1770027207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rrldpJgRnlaWRGzvci4KJ0bX5HDaKnyn6k9LRwR7uIY=;
        b=I060g2w2OuiqZe2MIZos6wo5DH4WYCVI8IbnLeuyUltAVOK7GPltdvv+q3uz4TthO3
         MrqZ3mfzn81hmtGsLlQkQ9XKqgQWyZ3kVaxlirY5IDFn11MHMKrPYFZzLKNN/NK+gHH8
         tv+ftFCEyrgTiE2MRTa2X5S02r0TA+k4I+yEsxTdzvm6YPkial32mNLjTUjR2R71tkaM
         99EAum+0WOhsGOHT2/Lg1uLHCiBun0QRsnMY97pzbtGD0Ld+ZMXr9Ii0NKg8RVeg4ufD
         ETF0zcdzcTjGRqoIrN/amnDoEpb/IbRic+hujl6kPW3GaCHk9BD1vx1RlWXYtPfLpkbn
         CGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422407; x=1770027207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrldpJgRnlaWRGzvci4KJ0bX5HDaKnyn6k9LRwR7uIY=;
        b=Dvx+bUCP2MQwzR6dQK+WB2uvWxxzeoKFNBrr27Ar01Z7H7HGlgT3PdYXlVvREr8NHJ
         G6hzv1yG8xmPAuJzaQLbhCfJOU3s4I8LRlRz6CRRbQUa9El67eFMZNaCnLRQ+rtLSTF1
         g3iIwNtrbZIJS2BejfiePIbqrSON7YCK5C1EpTBMrYFNEDnfUodeqL4O9OGz9hPwU/OD
         gslZ+UXB6LO3H9gz2fkciL055pLNTUHcPcxcgC1WYskSmZHlQ4Pwa/gUxgHdblOrZ4UI
         vG4MjhwubhQIs9MyPl1luhVD00y3JbIB+choHtw1Lp7q/qRvFVMg4GQqN2Gn/0pr/UrK
         lXGA==
X-Forwarded-Encrypted: i=1; AJvYcCXqm3PJ+hRvFLlkM12WYos6UwKJ3aliM2AYvZsPRA/Do4jCGfwR0/8waSFG7X+W7iU4tJn8QHjGqUkErg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzinfby42OCBPNm+/Jws8NtOVvHSY1qz5pAJzmbf+B1Kn72pya+
	n4MgKccxxSBZrF9oFqMehrvxNIVFFnGnay9QArQWMy7GBp5M9rj2Aq4h0UtgPEXPk9Zw9WQYBPY
	jJSMGY1ycRBD6ByMOVyVuczaXmoiS3gZfKTOQaWWc0UQOV2hrCllDZPqCYAH+h8sw2g==
X-Gm-Gg: AZuq6aL2S0iJ9qhm+nZ45bNPvrH0Be7IFoIcC7zima8w4YdvSlQ6I4V/BhT/33g46/7
	0XSBBiGfEw1qOO/q9hbpF7ZemVBThe5eO5nKitzaO4L2ZkmJn1KwkVcYt1+WNE5NaiPRdveLqMi
	JT2c+SIrkZkU54UrHSRU0LyOaE/ukwAS6PiLCrWWwhhEmI6RxVNK42jVRbDHBdAc+V+StI2mjs1
	3RoDAh4iPOmcN8eLvoyBDiCPT9GXhOAFsenhdzbHxbt5eG/VafZig62I2Z9xjN14iG38drgjvkG
	YsgBKUhrrlmC/wd69AE/n4oKoHHS1fOO79lr63Gxa4w8fJeTdoWwig81U/3ohvj49+ktsG431a3
	7/YGhWIXm8TkI3pBcrRaXeSHHU1CtsMRaYRJ634jgfmcN6eNWMzOIjFFnBGL/VtfxBkI=
X-Received: by 2002:a05:620a:4688:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6f9677c99mr335181785a.11.1769422406772;
        Mon, 26 Jan 2026 02:13:26 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6f9677c99mr335180685a.11.1769422406393;
        Mon, 26 Jan 2026 02:13:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8877581a03sm468968066b.43.2026.01.26.02.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:13:25 -0800 (PST)
Message-ID: <95b29cb9-540c-42ac-bcf9-21327322d7ec@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov02c10: Check for errors in
 disable_streams
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
        bryan.odonoghue@linaro.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, hansg@kernel.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260125171745.484806-3-bjsaikiran@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125171745.484806-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfXyurbQ0rvmMc6
 gApLOQURgF/XnP29dhdu/2y026M7SKbwkTvypwKs8gi0nSAUqE4xG+QN3DlP28tStsC3vRkU7tT
 RFFcAoM6wP6TmL1LKpTkIAElcsxELFFuY9IVq9ByF88jgdz0kb+YHZEHjnOR8zf1e3ycs1p3fgS
 1OyHzyzev+uDMVPKtY0mtB92y/cEVsLdt+H0Ferhh5RA5bPtO+BOrO+ugPp28q+h7XjhGhVdzD3
 nfDAunen37iQdJx+2PF3qYhX9xhdnPc5H3goXZB2zN+fjPE8Rq60m7vqE9/92X8mRSZqsognq/s
 JNP2kTrIrdu9eVf36xCQ/D7XILCUyfSLupi2huhrwnMYsAkzWrcE5y3H2+G6alm4STxIkQlNoJG
 8DeWXia760ot2WoxaeNMxA/z+GtrhhlWgkM1Wpug2pnb4q9Fb96J8DiTKXlTkN9wD6yFKPYNZ8/
 yw7yA22VnOgeTItcw9g==
X-Proofpoint-ORIG-GUID: lp4kSLqOq_16Z_-xoMZLkgBUhksG77Fg
X-Proofpoint-GUID: lp4kSLqOq_16Z_-xoMZLkgBUhksG77Fg
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69773e47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hPybIRVE1oSYHX-ikN0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51539-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAB2086AA4
X-Rspamd-Action: no action

On 1/25/26 6:17 PM, Saikiran wrote:
> The ov02c10_disable_streams() function ignores the return value from
> cci_write() when stopping the sensor. If the I2C write fails (e.g.,
> due to CCI timeout, power management race, or device removal), the
         ^ CCI -> I2C

CCI is a name for a small camera-subsystem-adjacent I2C host on
Qualcomm hardware specifically

Konrad

