Return-Path: <linux-media+bounces-51531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF7uMA85d2nhdAEAu9opvQ
	(envelope-from <linux-media+bounces-51531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:51:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869B86351
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FA133004DCF
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0A532E121;
	Mon, 26 Jan 2026 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOOd5YW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bx6vw5rm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C032D0E8
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421063; cv=none; b=nVyzNHU59yd/MprnPkAFozSk6MxkxhEUgb8ngghKlDiPlxOsRJr3G8bfSaq7dVJv52QtorA1X49APmx6LVrYSyM5ijHqSbMKyxIjYduauU29ZQo0bwusiQdSol7P+AEd80e53U1oDu7heL2hi2Ux7lQJhzs4qY3wsrHKRsxy4vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421063; c=relaxed/simple;
	bh=sSozEWyPD9E8tRmAxWkBSVSKT+7zVIdFfdbbV+uIE8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+GfHijYpAGjUmy76wayKpt9rCc+pMJXsi5FpD4jE6jMVp5lBUOKHbfVaR9nJiBIIIGGT/ihF6lQqlIhaG2D4WxCOW0FFf7BgfqscIcaz0PIXbzyBREURnwHxo9m1w2t4d/MKyT2lNGjUblVN0bH1cvQuoX0QqvydeXgL3zjt9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOOd5YW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bx6vw5rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q96G2q480840
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0Z4ecieM++BnFcQ9BBCwF1hAvC96nTLpNXFYvDDz2M=; b=QOOd5YW9qAS1lfir
	JeNu4Tcw3fdSJICNH863peGS2F9av1PWwMW4H0cIngxAEPflfwQqtXFIOxc0NWxo
	OEV5p5Ya+oKPD0LG7NcSo6F43rNDERTZS2DhmXI1lJxAjUbNU8u/Gr3PCUuAKVft
	huGPdv/bEmprwyjO9rICxNKKMKubShr3cKVx3m02ryf1ULUxFFfh3JrCrFy9lZQ5
	3feDKm3jbTZ+GaypCGSLixqXRuyUHUlg5K2CpwN/iRsW7/e8UvIYHBRyteQ9qHTY
	vIruQ/RY6yyMqR8yWauapbrhTQNPGvKfn1dDlUC9dzRfxK6CDwUD/t1xE+zXyimu
	5Ca6tA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uv3r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:51:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2fdf3a190so77761985a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 01:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421061; x=1770025861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0Z4ecieM++BnFcQ9BBCwF1hAvC96nTLpNXFYvDDz2M=;
        b=bx6vw5rmfE8jkPyftZTwUjzGELMjQuKi169YpCYyt2ftelPBBTjtxPPubVGdMFBbmj
         QwACb9LMpI2S9Ex7/uPvD26mxgUUD08gYWXtmFP58uQsb9UgxO0PjDaQz2TX66NDvxS2
         Oy6sTcovf9TyVq86Sl7W/5je39FsHTS61UFQsyoTEd/36McRzQCni6trj10OA+eg+anI
         DTFblIGUVQBl/RLMschKJaiIut/L4BrT8N8QzdJrMwDuKZ5pfkBCR0NEHZYy0/zeL5/R
         DhZIBL7iUUYmjVY98WRttsTjyfEmjkoN6N36AZ6WzBfcTkzKS7TbTipnZMIL0DaeOZ2C
         NHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421061; x=1770025861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0Z4ecieM++BnFcQ9BBCwF1hAvC96nTLpNXFYvDDz2M=;
        b=pcUquRJgpn9W/CCANJYoAQ4y27FUBFequ/yyhOSfLkYu6oxppnVTlz3Rq5SMIDlC6O
         MyOMKoewv678HfXiBWYtXWK07B/M3A2cncnwk2jt524UsRs6v+CB1A3KsRA+4UfVQ7hL
         43A9uXpxgdkN72PkKRb+7UWymIchYHNSuj0S/XmuLlcjkqIXXJt3PWifIgKydkvjsbKN
         iAmZnj5Gef5p7xymb5L8EGuIhm3p35dVfXKZrDxtCub/gUHWyslNfLMTmKDQYMqnAE4W
         mYavWJTW96wd31VlI6ouaFlkyMgyTreR4naQKWOJkPhMMy548Ecu9KDnPflE55YPONg3
         F5+A==
X-Gm-Message-State: AOJu0Yzw33yLUbWlaVXErde8dUKM3wCOStGZvwxAzH4NaKdhhfgjMTHj
	DeheWFVU1o0iCXltdi5mgLAaj2oBRzJbFF9/MLo09zlRJajSXc5ivW2PGndQyhOyi1ra5b32n0Y
	j9gJ8NhtDP2RQiniqDcAT8E7YvJN7DUNRms0Mg/yjx5Mcqz2vXRqjMiUih9uJUYWflw==
X-Gm-Gg: AZuq6aLWm9e+1owrCkeVsW7ZiYErq1NwE1Vxuimg8uQeMTCFn+6jV9WxdlaEKit6fxY
	biCg2OMN8VTXnPXoA4Lfy1cVTxHusstUIusXRJ+iFyF/llzHNx2RktXdIAbq7LZk+qMmIZAAKbY
	3M92uleXnTgxtEFmWsUPc5A79PCYrRh8vbtCJzW9yP31v316HH18P3YUfBKziNFC/18fSD78TXX
	iffxSJszwEWuKhWVnGHm56hPvnDioGFK9XhaGtfGCl+ZFVLcQFdUvIVA21cKCyONCAv8OCkuabL
	T9KonVIJpna8FJngbFEIBcBQ7FDY3FgvECy4tJEXCfZbYvcxzoyTt3XJuqajTDW6cwC8m3iab3H
	nyFKnlmPuOoruvtEE4Fywb4x+8QPgqTTOCxcs0JXM8NrTUPX+ZHTbODr3sHLzyff8NUA=
X-Received: by 2002:a05:620a:2546:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6f9621f2cmr351184285a.6.1769421060724;
        Mon, 26 Jan 2026 01:51:00 -0800 (PST)
X-Received: by 2002:a05:620a:2546:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c6f9621f2cmr351181585a.6.1769421060179;
        Mon, 26 Jan 2026 01:51:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8877581a03sm465896966b.43.2026.01.26.01.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:50:59 -0800 (PST)
Message-ID: <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 10:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4MyBTYWx0ZWRfX/3xK1FfSbrz4
 gmANHUbFX/jbecxZw4BjvbmwMAJKFovTK/xm2uVeUU7G3Cg714yAtdBmVuQWYXKCbi7CoK2jo9Y
 4+YCaovnURiBoSqr9jG71p2GHZ4jcMDOcwEJ2dVLRrbmibRsgN9nT5T/J06DAzX3zxMx9qbbZIZ
 Tj+lG4uApFK8Ln3L1SMhMidU926rxMndyhBuGjnNkX3Q4M6bGL0xjzblmuEZy4D7xFgtaArBlIP
 0e7ZaZXfmTN3Ltfs7tbVCf6GZyCfypfz7uXfDSIF71rwWpBg2lYsMnHqKYcWsf26UubNsjsyflh
 8Xhod6aG4ZEQfa2srE72tXRVNHPGo9I3KxAXG3X3k2PiksPha1c7apmPAy1+uEZ+Q/SjqJGDVE4
 AUj0aR22tBDqHMsV3DBzhTHIIogAYI+CXId3GjZ2pqQ72t6oHQo6VLvXJM0lb60oid1RMFGfCs2
 FpegB4kM9w+4j7qU0Xg==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69773905 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_HA5okAFcYk4mzHm3zUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: K6HwdhkbF8q8XdZL5qhHpgHyx_j8pud6
X-Proofpoint-GUID: K6HwdhkbF8q8XdZL5qhHpgHyx_j8pud6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51531-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6869B86351
X-Rspamd-Action: no action

On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
> SM8350 and SC8280XP have an updated version of the Iris2 core also
> present on the SM8250 and SC7280 platforms. Add necessary platform data
> to utilize the core on those two platforms.
> 
> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> driver is enabled, but SM8250 and SC7280 are still disabled in
> iris_dt_match.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> +{
> +	u32 val;
> +
> +	val = readl(core->reg_base + 0xb0088);
> +	val &= ~0x11;
> +	writel(val, core->reg_base + 0xb0088);

Can we "open-source" what this write does?

Konrad

