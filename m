Return-Path: <linux-media+bounces-66777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pD/hMrG5S2oBZQEAu9opvQ
	(envelope-from <linux-media+bounces-66777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:20:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883A711DFD
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:20:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kqUAEoMQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f+EPHElM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66777-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66777-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E10B30248A0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37E6258EE9;
	Mon,  6 Jul 2026 14:02:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF434887E
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 14:01:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346521; cv=none; b=Yr9cmxR4I4xPkQ5QxHMkfXsVSyODyLpu6+B+K2jKVRBjQkrYO86x2/FCCEsmXoEznFljRJ5cdwN4cmFoYmlmIcI6aDdoi5V2bvvjCz/5BAH6Gq6p0j5iPRslWySQf5mtzN0ddyeKp7p/EiFjsfsXPRkOqGjFII/5cd74VAtRahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346521; c=relaxed/simple;
	bh=Q4NF35YjcGaZ1qiI2gAwTlaeT8DyWjM7S9YOGEGRCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAwz00S+6KERDLcMvN6As9lZLNRILS3I6q/CFHux9ZTshBbXT7d/HjLCNufJ0Yfbbl/BKK5p+47BWiJuT62y9b4PtwY98hrQqikhfe62qFt5SH0ibKGlU7+Ohf0YQs+1JtK/zcUZVrpb8GPDYBzZf69XeN8c2jhkdeMC3bi6r5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqUAEoMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+EPHElM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTr0387522
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 14:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=; b=kqUAEoMQJxRM2hhX
	iBs7jjS2FheG8635qyX0M44bmv23d5h0JNNPwu7757h+FnZR5SoB/rCykQ2Xnfzs
	eIGQaTZF4JZdMcIgR8mF18ZPbgpXWXDYRPpUcu0fvWabrlBbMY14LRX+6m7b7Wnn
	o+E7KRpGsPxjcWycwkKMFo60h4YyI965NJS7TvigXNl88PORoQOCs5WA4RTf0wDy
	KtoePdXtwBjdvq/gtn+sQod4LkTOtlzAmlzdHl55OHQCRUgD1/eP4uHG+75ARhDg
	s3Xum65aIv3vPXIWHdPm1DcRjbXeUiulrRkla1sPddo+yrbkDUnVkEzbF17wvLrh
	g/zkIg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0yc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 14:01:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd6e81f792so3324742e0c.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346518; x=1783951318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=;
        b=f+EPHElMQWh/NrtVrNTyWy8TxNJwKoL9B6p5c5MO84smIrJfcHwHp8buhpH/v2Hm+L
         yVM69wzDB9bG4VdhmwXziUwAwkmGeifEJ5erYkGR6Wgsy5KfjCbjrsmIXVb/WBFERE8S
         NMM/Oie7/wGIVn5QTaXj50AXc38nsGV5KYWqdwv7yZlWMDyEoqlVnHtjuKV2oo6jxijo
         oCRilTr7za5fFXd2yQWTPfUOHku/tRvZ8+ES+x7oOxgL0xgeeBsDXSqLaikbNt4f/QHj
         lXPJqxp50G+r4oNaxd52ZCDq3vPJGe5hU/IF6zRaW4RohYDE7DfDR8UtPF7caohSgXCm
         tgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346518; x=1783951318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBqCbBRgcsL1MB8uxQkpdIk+cpXeJ+5dOiAooqaaFlI=;
        b=HbDOu8FBcJfaHetoMK/7tavD+IyZFzueVLS/stCYYMiSAtA4tKX2giXjl8rRzgICG0
         BwITKIueHEZ2Tb4DOayEPCB5IFaIs1IK4Cut9uhT1rSuCngBfGQ0c9ExnrDtfta8BfV3
         1epUBl/PXziquYE0xhDtQd+Y40e56+saz55hPdOQi+50jZlHZnu6M2nPClxXrYavPN58
         kvbeYuafHmthZKjVsM9WExn2u9WCMzOFF3R2PE1vKesParO80AfV9byImXslxDRs8I3c
         wXbxm8235pOcIsWF/qpTETbPqdxr2S+UIqBdP37JTePSwCuMwOLPXspwfT7NIWInl/a+
         JofQ==
X-Forwarded-Encrypted: i=1; AHgh+RomBWGWNj6ZQy06fPDfTAZ46a+aV5ST+5CGqQ6K8LVwXryannRl22R//XLi91UwI0ozRa32v4wMj+it3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2DCk2SNfSkh/OoGI/rrxZjB8eyKM21qo3hoGvysnEa7NAgfm
	tWdsxzfspILFq9TJ8TeJjijqBVIb1jfHVLMzAdgaTVO30jutdLsFMu6SLvNGByP5nJP+ahdy0u9
	+UMGoMAEsj540UBNw9q265hAXJgHXWwCbWOQ8/Ohv9LR8ZL/IReS0+c+ntSKji2NVTg==
X-Gm-Gg: AfdE7cm50OOwS/03p3pBuvOyWEjG1M14hGcXnEzISSSngJGFO+oEhZzdNA+exQn1xLq
	l8IgEIt0QQwcht9IuKqNCQU3SOznz+dl21Fkw9RzCPBL2L+XU0UCFikt2v9cqHfqRdpOaoKIX9d
	yE5XoRbsmAkjEYc7RwQwJWtVvfNp19CuewsQTfsLws8PsA1bp7NA/QRh3qEZeHXYDQ514licg+J
	lQstsnwTzPjAQlL35qBZ/6BQr/bnmHMyLZXkcHIY0zH0FwbeHmk+xw3YOmRcbz22yg7ffS1lGRR
	uTp+OHAAsBV8wo0UN5PVF0jjKZ0nh/vcf5OhqfmfpieDCBQG5n6Yu6WACRXoju3AfEvGQ3Apba3
	bIR+ERGB/dPDAgliPj5Qle4ULKtjZnsAnxZcsTapxY6GcpTI/iqRHoQw8Fu+xNh3ZXwaErwGEob
	BhuuclSNnYMCMUH0rSejxgcvjS
X-Received: by 2002:a05:6122:791:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5be98955cdbmr332904e0c.14.1783346515713;
        Mon, 06 Jul 2026 07:01:55 -0700 (PDT)
X-Received: by 2002:a05:6122:791:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5be98955cdbmr332384e0c.14.1783346511346;
        Mon, 06 Jul 2026 07:01:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1383a29sm2898513e87.36.2026.07.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:01:50 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:01:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Add support for the Iris codec on Milos
Message-ID: <2eguh5xk7ykfbpwnjly7e5gkupxgteqimdnpbxdddvs5zfhu6s@orfjibovsg3x>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX4vVYAvnpzsBE
 uzY5pUYc9Ub6BOEwyZNEAMo76OIrj9Oo/ulpO5CTzpIuwBnvvwV71InSdtue5+DouWqLXPn+mP9
 C0TnUPRfyPM1WRoSdmlLxaPyzQseCdudFT5a3ywwl8n6/+jDOpwWwah9bXVDMDR8pMzmapx9b76
 ZETSHPWVopkUY3onQBjKY/aQuBATp0pLwhi0S6P04EGTx+mAd48q7JVcqMIeZ63G6ntCyqmeXpt
 4UKOUB7MTP+ZP4GzX1+kGWqMXLLnYnXyGUDKu4JBxFTp3s6O6zFO3EnG+5iQx/zozHF6YFIrWsY
 mMKMwQ9+RXH0yrsmLuO4CcwvQNB9mz+31jh15TfKuFps06jNV0jd8s0yQiMcFIMZdmiiEJ1DGrq
 tYulmsJI9L/y/E0/ns2Ph6MKGRM9dPn08h9KMfP5SU953LPLbc4EPFFgg9ZmVTXB5P8+HKLuFwj
 Z4sSAJ2LlGVLq3Nv+ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX3iKbvJbk4gPm
 4KGDpkvqS1wxSWVHDDI5CIg2IdIVo36AIgu7aGptcipQvNgKmp7O3Y9d58DO22BZ9j1ZwlxS+86
 3CbjnWuhdHTbge/PQlTswhI2Lf2m7eY=
X-Proofpoint-GUID: HEg-V9iYFhrohGLSmXDEPboAnew4Avvq
X-Proofpoint-ORIG-GUID: HEg-V9iYFhrohGLSmXDEPboAnew4Avvq
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb556 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=s7MOqckuTC5V7MsndsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66777-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6883A711DFD

On Sun, Jul 05, 2026 at 10:10:18AM +0000, Alexander Koskovich wrote:
> This series adds the bindings, nodes and platform data for the Milos platform
> for the Iris video codec, allowing Milos to use hardware‑accelerated video
> encoding and decoding.
> 
> Ran v4l2-compliance and some fluster tests, though a concerning amount of them
> failed. Attaching v4l2-compliance output and the full fluster results below.
> 
> nothing-asteroids:~$ v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> 
> 
> nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2

Could you please run the tests against the full test suite and submit
the results to https://github.com/linux-msm/fluster-tests ? There is a
script to run the tests.

> ****************************************************************************************************
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
> Using 8 parallel job(s)

-j1 might also be nicer.

> ****************************************************************************************************
> 

-- 
With best wishes
Dmitry

