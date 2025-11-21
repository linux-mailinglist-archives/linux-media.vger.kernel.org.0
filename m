Return-Path: <linux-media+bounces-47600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B27C7B7E4
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 20:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E6C3A5746
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 19:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FDE2FFDC1;
	Fri, 21 Nov 2025 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bf7nxkAW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V090IMNm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368852E1F11
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752939; cv=none; b=SO/BvSdfejSB+SRbOS4EXkYgEN+wyDxBpZ6raTXRpuA1jU1mFkGXTreKO+nDzzpdbCFs+LJGVfLcd/tQrnAjPhf15NE0kSkWRQqSooMrbFAelihDsWJUvLgmUbb5ktGwsKuFswSxWJJ+Uv0App5eK+7BlWH7Tna4hujdNOIQNZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752939; c=relaxed/simple;
	bh=Iy4IGpI7H5qsGO3a+9olmM0/Um2Wnr3T2Tyl0OB5s3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liVIyy+KhyDeHyJ/Q5FgX9XDPafXxZfqVm+1U4gLdufnWb/FKYcevpQkFaDlogj//U7qvxQ4zRAYlE3/gbf5NUjJrkPBH0PnfxqKd+6OWk6B9uxP656PZIiu/H1DMj+utaw+on/7U0uyHZGsWvlBCRhhiSRaQGs4WEcYtsvATVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bf7nxkAW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V090IMNm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALHJTbU3541521
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 19:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XX7sXDsrbKhM+8ffL4RDry4+EToKrTxEKsopkzgBa8=; b=Bf7nxkAWwmtR2nZY
	29KW1qmadAv7ZSiW/rhxqWAKE4RToLHZCEPEVQ4TTpGdYrPEd6TNVCLGNDu2XZAn
	7PUbN72asvwj4ZyCLzTKT1ckfsJ9Je2jr7hmS4DmQO3KDHmq1IKfSiv2jtFktbGI
	gyvIZSu9B/OWCJymc+BpTShJhUdgwQUBPhV+WN09Krp3scqpfElDy9w8OPgT46B7
	lH4CQ39/mzYlFlvzcJDmAYgjUw1ba4/hRazPt7+BtJnt2rde2mfxAc/cXUk5Vi+/
	K8c3bPwZscxEXTcXI/jK8IQvKABD2pTVpWTOrPeMuZG9GXoThdgKjrZmM3XKXDnQ
	liIxBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng01tm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 19:22:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so7342081cf.1
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763752936; x=1764357736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8XX7sXDsrbKhM+8ffL4RDry4+EToKrTxEKsopkzgBa8=;
        b=V090IMNm6QWg7mKXIvmHwu/JfkkCdgBaCQuS8/FbgeASHRDsNGmmn7mMRwuwN4Heu4
         5Tm+h2PA2+xkpDTAk89ylDaxLXXjnIFeALiQZLMsoCKHXEv075xPCmBgeUXbAA1VcDwl
         xa34CRGy8OEMBOdq7V53dIS648RtVi7QDr/koKfMvYfLudi/U0gIr+p1Ux4twE1wGYjs
         1bg0RZ+OFZw/5QSTAUlm0W4D1sBoWmIzMWbD1d6dXIIDIjRd8VzQl/PJTt/P6FdNTgd0
         GC3tDiUr7uLuFeHeiSxZVmR+oiW5cdvbredaL/kLYXoNDjiXJJTKQziDIBhCFyD15RLB
         t6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752936; x=1764357736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XX7sXDsrbKhM+8ffL4RDry4+EToKrTxEKsopkzgBa8=;
        b=vdvLHElytjmQXhgPVS22t5AscE5N+J5RXyamzNknFEtIJeuH8lQhg07Wg3ZYBLSWVI
         HKsV0Yr9vwe4KZZwdcA7CQR+3gtqLlmJmAy9Ky6oliNjmV0u85Aiy7bfAmmy052b1tN8
         6sDhy+0McpnNsgN4j8YyqvVgZH1enZ0eFOjeGV/eJfkb5BgctlpEpRkqVjF5vhX3ydka
         170eW8hLGqv2i01jvcgjE/oP2yr+829Kfw3hQQUfi2BV2N1wCFKFXbPSQPOQAAX8XP92
         WxCSer9mfOkZuFdwu7NMDmZr0+pvHrOFMep0rWGyCGlcTRY6ujBNbT+5B/Nt7FdJmKoy
         3dIw==
X-Gm-Message-State: AOJu0Yx2OfWrU+dgWwtOVCYH1MPJ4Ity1TswCaPwmYuCuYQhs5Mva5QW
	NiWGKyw2N67RHnJrcZb1xNzcEmO4vXFoJWk4mVjKJmWFk9asqoy1JvZcxuBVHUMG8eH7XiCkIwS
	yC45Eb4DKgTzlHceO4OXo4w9rZ01fQI8oifXvDiDw2pKEp6vFLKiBHmNt83WjPFcM6g==
X-Gm-Gg: ASbGncurz49+iChiilNg60wYeOa1nryfbmTWeIx9gwadXOP1o1X9Omm5MxnvikPmdhy
	Lb/RhX36IVpPZZxPZoYAHbcRenrYrKRIl9JBCuILT0y99iTGw/ZVmTrVSgBPlGvdeBc/Ooj/LFQ
	GVJL54XyKkxIZNdGhFxjvpCz764cCnPwrXkC0B4Pv1WubFP4Iv0wHgF/9JIQwgG1ApRRuR5awLf
	bc4ejwIQLSxsOE9frMcJzxmn9skyLcASxMaP6FOoAco/djsQoyd2NjbO3XYMDFkDNH3/D28GPmR
	YRK3gyfLxThM7Ls4B/Mt/Xot92X6gmzduIv4QFqM3ZJyaWcTPCSEbrWGOpxKlCJjdm+S33vTRoM
	y8FFgd+vhtXo2kaXpjAvVcTm5aAdypxXScnnOGB+qguhJgeaxkfjdfjJW/xsIziqmJhg=
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr37429141cf.7.1763752936470;
        Fri, 21 Nov 2025 11:22:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfgdJkOmdykGWKgEItWkPqsIi3iNIZZiWw3FDbDb7CITKAn3UZkDUQ4HWd+o9GJZLvPlp+qQ==
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr37428891cf.7.1763752935960;
        Fri, 21 Nov 2025 11:22:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765f840a30sm376795766b.58.2025.11.21.11.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 11:22:15 -0800 (PST)
Message-ID: <249ccbbc-7990-43f0-b205-d5f33a1c9ad3@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:22:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OlziWLEX2lmD8TZ3VoYhi9p2Rik02uIS
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6920bbe9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SJJ4zdzgCMKjYh-QJOsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: OlziWLEX2lmD8TZ3VoYhi9p2Rik02uIS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0NiBTYWx0ZWRfX9B+1XfjmW8zJ
 Ow4faCJvVEjLLi5XVT53LpZBJjoKwtOQV6TNnZgO2wXeiYuzj0HX1BPdgYtBC9jPNBVACV0cc5i
 Bk6DUTwIUEafKz2L5bb8X/HFDZM5f30dBuV7Vf62h2Koh/Tr0Zi126Nj6YKYFXHCQANYB5CMsjD
 33tPixIYDQuBsDIucPDDFEH72fowkQmv9aduSZpvZdoXMxtTbERAOILqJjefLCLg0md03Whzhgy
 53fIP23Yu0xkz6aIOZ0HFKBi4kmIuCX0stHfuqQLeBXMmTIUhPxoXHHR+gRkYi4V79i4XFCQ5f5
 p7ivdiI/QvcTSsdjQzAoXX1EEpTBveCS9LUT1HpdOOTMwqBxXpQraxs8pbm0Vn39tPV4BuFYUzY
 5+Ta3F4N2Vd2v2WKfgAJtZckc0DGzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210146

On 11/21/25 7:43 PM, Jorge Ramirez-Ortiz wrote:
> The Venus encoder and decoder video devices currently report the same
> bus_info string ("platform:qcom-venus").
> 
> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> parent device name. With this change v4l2-ctl will display two separate
> logical devices
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---

Perhaps that's a stupid question, but is there a reason they're
separate at all?

Konrad


