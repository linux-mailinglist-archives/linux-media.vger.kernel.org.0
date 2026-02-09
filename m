Return-Path: <linux-media+bounces-52391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKRpESOwiWndAgUAu9opvQ
	(envelope-from <linux-media+bounces-52391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 11:00:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B210DE67
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 11:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 122C63030EA0
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 09:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF91366077;
	Mon,  9 Feb 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knuPHvmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OApkki3y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D7366054
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631002; cv=none; b=NKSSSd3svfTH2HSPjipUFUjpOcAhboBAsziph6GDHw/n+njEqrijpAYAEJuHT7obX6Si2uYp0gAi2fev3/DyDJ8BlgbAvVC/DL8Fc8JM5ASxoAFm75C/Atzceu69n/Qq6JnvWbSbVGXGbiybFRBmhNFgWd9ZoroqH3Mgmmeq57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631002; c=relaxed/simple;
	bh=7mapK2X55WbIYf2UtRc2j6u64tXfI6q7JJP+8o/0gZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csIjAQKIn53s9ZVmV0UvepQ8sqM6TizI0rpEENEWJG7EQ25J7hDrV4evfGKj51hwTiDtNsoEAjtar9bmZ02u9q/m/9JRNBGV2G3h42GEzT3Qqe+F3tIW0Fn8opvlDKadNkmzop8fUCZD4FW9tDMOlyToMD5Hz4L02J7kZw1M32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knuPHvmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OApkki3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6197gFxG1928237
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 09:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+dT33J0qsy4bIwiR8JxdCIwandYipwLy0Sqp15mE0M=; b=knuPHvmxJvqOtLrV
	tEo2ugSXanQl/crUS9e6zIuKxuU3NwU/O+9BD9SNArqJo8sVuMhUG1DtG/1uZo1p
	+gesCRJpk0fo0gjc0ZY/tDe0rb93rEB6FI71Z4BwLt0SfuV4Cp/eqgo/QOkaDjCs
	nS0XV017yolo5Ho+9lWPKHMyZ+yuzy3G2Z5EnTGBEXBEr5UVnL4NRs/ORN6bQyUI
	XYndVVotaGvLdaerjxiG2+E/HkrnRtKoO+37FeDN33ayHz/frJb/C3M3bnWiP23s
	cB7Ku6o9FipWssxmOYKRGfvY66nKbAN0hIYmVe7B5DjHgYeXk5vShkKuqDfEJ1Je
	xY9m4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdevp2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 09:56:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3562692068aso1007827a91.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 01:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770631000; x=1771235800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c+dT33J0qsy4bIwiR8JxdCIwandYipwLy0Sqp15mE0M=;
        b=OApkki3yvnBLta+UPbMuCM0UC3yOU+0FubUaO8YaWmNgCLY1BIrI4WhSSZa5GMWeei
         ofSU/ddUiiP2cOJNuTi6lH4UDcRsQGv0kNhcJOAMoJh7nJd/YGlbZ3k/KGHyyutw/n/9
         LeEXPaI9RhpJIT8pooiG5vbdp3RMSHeaNi84zSb9nQeErE4XyX0fJa8QiflkGej6vhvt
         bP67x9LOakrdlwLRLP2fhK4zmmTGrEfdop9lJLsh7+bUCwMfuOpHvuxGMLXa71jQy5q9
         Fe6blPCPO89VqkFhpPg9sw2Nf++lqbjDUewme+PkAA0EEz0eH9Rz9NiLdDON/43MlgyX
         hn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631000; x=1771235800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+dT33J0qsy4bIwiR8JxdCIwandYipwLy0Sqp15mE0M=;
        b=srsp2DvQKz3RIud3umMEEErgbdhoHqolWRw+fOiBTOfzN2B3Puf98oHs0TQKZLj+wu
         NwL/zzl4kMGaSMKZSu9nqscywJ9WbRgWkutzKq4AxsDxxMiGl7Ghj+3Nnnu/dxQTma2v
         SJNfHREoJj7pqC312gepiQwSqNe8luChUzxG4s/7OjtaAMc7+Bolcxrha8ym+3KH+EvZ
         wwBS6Ukd67bTjSEYrlAcuggYbgOB1tW4tCSjk2WLb8kT4Hemv0sGT9IIMIIcFzzkrJ3s
         w09n52sRzna43T42NkouMrVOVQ2beixSTXKaHQ/wQJlu0pK51lx0/PxouXrWusuFgaGW
         O6lg==
X-Gm-Message-State: AOJu0YwEe9dapzTJQbriH4NgWHQNdwl3cWA67rey4bW1C9DeTKjkc5rW
	zMZtAzatmu3UkmB10mSqhU7ZgnE/vwvO/gEXrmNsYavS72crGuTZU5Hw2cM4XMcSI/POVAM+hkn
	zL1esBk5EKKiHoFfiaaAjNOc5bDHgCwNmitwUJ/5o8LNVhBMbw2n8avV3rhRKoX3XoA==
X-Gm-Gg: AZuq6aJ53Ws0CuW95LvGGYTg4CAIef0swEr3KUBWhoYJOyB4vucHleF+4Kr8fMsBlda
	Rz96l+1wogSNHxuia/8ImYh/WlcsrY3IA6bZFozEvXMk1ylX3gNzJ8FICE4APGkPlesdcD65VR8
	rfoJxXEBjWPFsgUxFawEdAHXilF3ZSx9O5FIIFufspuIHcCZseOFNdsZqK1yPRVreE0W56dWv6J
	gT1yatP3ri6WjjwLyJwSeJWoTTG8HJRfAvm+jKRKHla4C4UIF+bibhuJ/CWdfzVlFmqGVjr6Oil
	b8xCZ2/2XF9avM9cySi+Ks8gf7qMTH5c4Pt+vpi9mLEMjYVABBSluUt+RDI2VIjX8UMr6pickXu
	2XKr/FRks8G8o55nvhzOzeW10QcIfHDsYToScr4a2rxc=
X-Received: by 2002:a17:903:2405:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2a95ac3b04emr91548175ad.3.1770631000032;
        Mon, 09 Feb 2026 01:56:40 -0800 (PST)
X-Received: by 2002:a17:903:2405:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2a95ac3b04emr91548085ad.3.1770630999508;
        Mon, 09 Feb 2026 01:56:39 -0800 (PST)
Received: from [10.204.100.187] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c4d8dcsm105331445ad.9.2026.02.09.01.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:56:39 -0800 (PST)
Message-ID: <33a7ecc1-9268-4178-9ce2-25cc69fa5bbe@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 15:26:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ddcaa/tW c=1 sm=1 tr=0 ts=6989af59 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UW35HsMoKDRfkflbz0EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5QPvGzLyN6t6Ido3nC4-e6kX-QIPkQtW
X-Proofpoint-GUID: 5QPvGzLyN6t6Ido3nC4-e6kX-QIPkQtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MyBTYWx0ZWRfX2lHsrV33e9b+
 q786MhV+kQHJusYUdv0eJlEOZe4T+NFI1RoXRzDlPqV8uHFQSLSuwPTAG8k+9Gi/O4mhPxmcmmV
 jF4rfO1YxqQsxpPNsFxb17jdINT0zUt1YlZ5DzaLhY8zQk3KTdupNpAQrJ9FlwDrOBRLcxeIJbG
 juOEgjSSFdfhKm1W2h57NPVjihG199EHbDumAmDYi1swuotQn/HARLpLaLZiiBvYnDzQMb/vU5o
 tUMaynx86z2VSDcay4PbVKB/wCYLUfVLpStxuQtQ7hdatqfXOzvvoDxQs2KjWBmFCVC+vQ1XE1t
 7ync9CIK4dqHwIuFdSNmZ16G3a6g7KpujS1RUwSWj+9DfefVrfSlS+gLh2X1r+uZEMlTviXdDoe
 5joGdLtLVOt5sSRQl6o1mQLUzOefD0iEkcHOELuk+jyF4YkKTM/P3BW/b4CdXkOG4nE1FgAPDnx
 eXV3Qg3TmnrlIp2cnVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-52391-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E3B210DE67
X-Rspamd-Action: no action



On 2/9/2026 1:09 PM, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> Dependencies:
> https://lore.kernel.org/all/20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com/
> https://lore.kernel.org/all/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com/
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 
> The result of v4l2-compliance on purwa:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video0:
<snip>

> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> fluster result:
> H.264:
> Ran 77/135 tests successfully               in 31.521 secs
> 
> H.265:
> Ran 131/147 tests successfully               in 23.490 secs
> 
> VP9:
> Ran 235/305 tests successfully               in 78.181 secs
> 

list the failing tests here

> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Wangao Wang (5):
>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>        media: iris: Add IRIS_BSE_HW_CLK handling in power on/off sequence
>        media: iris: Add platform data for X1P42100
>        arm64: dts: qcom: purwa-iot-som: enable video
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++-
>   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 +
>   arch/arm64/boot/dts/qcom/purwa.dtsi                | 53 +++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 ++-
>   8 files changed, 200 insertions(+), 2 deletions(-)
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260209-enable_iris_on_purwa-a000527a098d
> prerequisite-change-id: 20251113-purwa-907ec75b4959:v5
> prerequisite-patch-id: 2ea4d3d7fbac51bbe48d22b5c58935b3ac96cde1
> prerequisite-patch-id: 66cdb67c1bcc2519610764ccd90b551fb8713493
> prerequisite-patch-id: ca9086bbde147db45705752a7ae259c76659d988
> prerequisite-patch-id: 472b96f74b6d14eab239a551f005f601af9633e8
> prerequisite-change-id: 20260126-purwa-videocc-camcc-00e709474bef:v1
> prerequisite-patch-id: 9884a11a7a39ea49ea4c6ac72adb95240c6788e8
> prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
> prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
> prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
> prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
> prerequisite-patch-id: 8732f9b7fdce567cdca57e6b8520d0279469edf1
> prerequisite-patch-id: 1162da1ca0a8467c41141a5a0bf58b85b7777c38
> prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c
> 
> Best regards,


