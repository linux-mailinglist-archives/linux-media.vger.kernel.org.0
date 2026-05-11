Return-Path: <linux-media+bounces-61080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF9jMbSwAWoeigEAu9opvQ
	(envelope-from <linux-media+bounces-61080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:34:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BD50BF44
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C3F73020FDA
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06F43D88E3;
	Mon, 11 May 2026 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/+Syyko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGLWMtsW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAED3D811E
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495651; cv=none; b=uqNVZSw2tZQePwQ23sXhHpxEqlNKL1FovTlMbFRPRG5f3BwlOxyUjxxYIVntv1XkG/tbkaHkCckMh7b9+NJQk24f9TpP6lkD4nCbSjmwzRMbdi2OxgEqkWXJvTCKZq4BTXy5JBMufryEEbNDj5oxi00aBIdwKztPZk7bDiUTSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495651; c=relaxed/simple;
	bh=Zzc/LyNUJmfRTRvy7NnUzglQq+z8kfXz7t/DNL1P4QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+sifHZM1C8D5SccF7Q6WgGMjt+V+Ptwo89E7O2vUZgV7nP7qQDrxmEEF8t5MgXr2Bs+N8JkPuypfYJbK1Pku8jYRiHx0KmVOAkCLwFmNRlIrrT2LkK+Ww0XzrB8IWksMYz1aFYuTqJoiX8A480MvDE4mTrF1FEdcG3xA2QzWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/+Syyko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGLWMtsW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8HvjO1850358
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=; b=a/+Syykoy6NyxKKe
	tRHW/qjzYLVM7MUxvRiEUlyquwszHORcQ12vZta7kuZDi8y4jF91gzpYIfWBmGIL
	7N1vqgtThulkLSvFzjqCQj0cgNcOvTTBd+Epm7laV3yIlDPLa3dHOUuIMpjzXdxX
	rhnmQvcfFiy6tmqMPTJstAkPuIRQgbsROPJhRqPm/LUL/YETyfrxfC/0WFNJXeOv
	BKKX06EvobnhoeIEE/ZwVEmgtktwdz3viTPN0EgHgP0n4i+R3UvoCfHRVgqECts/
	raG94Nsgo96CnAb2sMOtFJURjYOITaYOP1ObEMWSMEiMVykZESD0Pe0PmF5giD5+
	DfHbCA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3bfvggsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:34:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5753c3390b3so368390e0c.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778495648; x=1779100448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=;
        b=gGLWMtsW+I3O+M0F4vqTVhpX7reBDf3u3VyJXmaOtQxBj79nvOjUAty1uQfI3ZuV2f
         2cbwwqh+Vrv1Mz80wVxkIIvg5Li+yRsQR1/gjuq5fuPp5MQxA+xmL2cuDZnkPYMJteGa
         IW/ySRsfST2GX7tNLNFI6UGx/zvUtswfXiO6x6VDSQRYVwlFzg39jRPT8DvYys7z8c05
         hHOaMlQCHjFTxMHiBMuLvnODfcBFG2rt1WYCAozG6pn/nJgEF5eCCrWxjqKIst5v8TME
         Qr53MxsDkUz6NzKxPJiM4GUmZLpw10ezSh0f7bma7tkxDskXUKkOV4DkRRFHgDaE3Dam
         aFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495648; x=1779100448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=;
        b=Zhfv9ESzGxNEpa2qfkgvhoxlh3QvJV0aops2ceGsN1b927fFympxWwgq4fRStIFSe9
         eCXGfT6xlc9JcHf6Gflrilen7/H7f8XxQt3Hz07bW/TFFWag8G4lvXPmV/n8rk2zIRK/
         SBi9iqWSZ3Rukb7JcfngB+/AAl3s+bkGftm9IVNjD11KV6EtbVODltHPXy8H0me40wL3
         d/U7pgnhkRBvGC2lh0myH4KaqDOrRWFWQOTwPZMyo4iEWUJyL/eqREFczYn+gDcB19Gw
         bmV6C7YXfK8t8VU5CVkz4yv4XDcovtv8+eAYgn9NcTCOHfX+R/Tw8ks4CYtRMF3843Er
         +3uA==
X-Gm-Message-State: AOJu0YwNyQ9QR3nFullzLiuaj10xXoCX62a3bjn5vphU/MUZlPgLvS4Z
	jc/YVOqLlbjTP4614yumw/56JCuIJAjGxGmixWaYBO59/bW5TRuIILcnr7+vu+jTJYB+FoSZ0dX
	DsWJqDKjx5DhELVg1q53Iazhk3RY+M2YU+R9X7+T/vr5ljpZ4d0y4t1Hh7747+pcDXQ==
X-Gm-Gg: Acq92OEL62ilQYcOCgzrVgQLk0QooGaWyVG0FjyPGo5+DuhD6OH3bezuomKHtaUBMEG
	oU8TFMfQs6jleQHivKI/wQcxyKvVxF4Ge8ZrafA2CC2IQiprqeicPqBlYhCxasleZaW6qCAGUwg
	vaRzKjehA7RyNtgnOOT1jEXmYmneYz4OtnheWD2uX9vh/+C9mkyeqPoGeJDWagt/uARQQufboJE
	pWyID3lEqnOIV8GcZMZNXKRNKslAK5I63TSCDOg3VjsKaZX9EF9TRU2a8Yz63ZQ0XE2D5lH+omK
	Glo7kxitnJ8Gvb41Ml9w6rSaDya5dS4k2+CB6EMGL3SrLvdmoaC8Q4O7T8zejyEy/Sin/rfiw7Z
	yQlJ96dxaj17cXfIhvjCIKiR7v0FJDwnEEn64s8IAVjFqpf1mDFk+yIE21UUGC/lIwAnj3uDsgF
	3BxC0=
X-Received: by 2002:a05:6122:3291:b0:575:b506:43cd with SMTP id 71dfb90a1353d-575b50646edmr791747e0c.1.1778495648244;
        Mon, 11 May 2026 03:34:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3291:b0:575:b506:43cd with SMTP id 71dfb90a1353d-575b50646edmr791732e0c.1.1778495647819;
        Mon, 11 May 2026 03:34:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce803148e0sm208248466b.10.2026.05.11.03.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:34:07 -0700 (PDT)
Message-ID: <52bcb432-9431-4a1c-a2d8-95bd92f1f484@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:34:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] arm64: dts: qcom: agatti: add higher OPP levels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fa4HAp+6 c=1 sm=1 tr=0 ts=6a01b0a1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JvtetXaiP3e31RRikywA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 04sP2YHoRnWeI_W2O2Qu2UvfZi1Vl7RS
X-Proofpoint-ORIG-GUID: 04sP2YHoRnWeI_W2O2Qu2UvfZi1Vl7RS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExNiBTYWx0ZWRfX34dT5ZRp6MwU
 q0s20jwLvN/Ae1afC51CNMDbEGdSn5nLVDq0cqM5kFAORJhlpnb5XJtXUq7c3FcdJh2rDwz9lLM
 jyj/suceTWmJ9qU5PkYffjiGHPMXfMOPs9jGSfXE50+z83W9XlpULJR7ID1GRZJMjQEUZEH7qOL
 pwovXmAV4xDhIRXfSoIPweErHM8xyhYBkxHljr7fdsMkD3FOAvH2TyNECVns8b+xu8+I1Ee62Ua
 4qcxAvZ/uotEL2RrOw109J3K8QVLNQphWjhyzwJSDdU0eQAEGoGkuM57Kwz/d/7p9La8NlJySI0
 M5vNsGGseAbpdIrSJIu9Erd2T5awK4TNgA0AV5Q+d6CXhb/SBgmOEDYskbMWWjOxeDpxh4lQjEQ
 bveXTJUAxAQXHVUvL6SV9/9N591QnhB2vPnnEpAQnakbcxzzXlYJkUigMeicNugX1KOzeo/knBx
 2zmA+EiItZnNP0LvD3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110116
X-Rspamd-Queue-Id: 494BD50BF44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61080-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 8:42 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Add additional OPP entries for the Agatti platform to support higher
> operating frequencies as specified in the hardware documentation.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Please add the word venus somewhere in the commit message and
title

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

