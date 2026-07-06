Return-Path: <linux-media+bounces-66760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FnEnO/2pS2qvYAEAu9opvQ
	(envelope-from <linux-media+bounces-66760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:13:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E03711193
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:13:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iDmiKLZK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LnLIJDIW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66760-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66760-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CCC6302330C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448023ECBE8;
	Mon,  6 Jul 2026 13:11:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EAC3DDB0E
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:11:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343480; cv=none; b=Zm6PHB/6b1IwVUiwRNjdIBUwfTf90T+pHNhKjt9YNEqWLv/32Mx2hWJ/ZeS9lyT3MUL4+f22slpYwrkLLFr8lELav368PWX31t7y6P/5QpoAqLgpb7gIbWXjIncO4MHdrJVKFHvLF30urgwidwn9+LHjzgVUYwhGAbnwS94kjnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343480; c=relaxed/simple;
	bh=Jzjlbu26cJSPnFR74xBMg4xl5I0VMwG/k88kE50vD1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rt0Pn8AQCdCzYRvYovVudi5QMudwCCbXV9awY6C0QtMtwLtnBGwod402H9bZNCG7kQkphR6okpRrzv+ednwjHI89gxKzqBFL4ahHK3u3BlWLbr+nEphSjLZSrufDpt4S0BQ+6B7Gx6DBK2amSy/9+DSaPdPcHxCi03G8/6noGYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDmiKLZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnLIJDIW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDGL238186
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 13:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j21uOnLF7TkiT/E4hqJKxP79
	sEoMoJywprTScPsnTTM=; b=iDmiKLZKJ3WCO5eLwx/Q11x+qyFvqr1HbiP+fki7
	zWiAHM7nYPw33XHMqY7B2hPVwzpKV6CDfbIl6L26+A52lUiK0WHsGYiqmBn0CJwo
	kwzL+S+/plPUI0hwPrxQobuayxikF7CvuYswiziQI09m/UH9s7++atAqdOa58ZfL
	u+9RSGhkC35A2N2yhPJRXl49mhhl1Co5i6a56RoIpk01F4LrD8yn0eC+2E10PZim
	6FIXtAVrBgXLFUX6Yi+SSxEVanWbjGg/z+h02ezq3sbBULGdT0kYpKsNQZlu8TSf
	ZjyHrO0Lip1X5+FrKiDBa93JkuIDEGaD6J6ldmvaHrRfaQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t893ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:11:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be0d09f5fbso2892424e0c.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343477; x=1783948277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j21uOnLF7TkiT/E4hqJKxP79sEoMoJywprTScPsnTTM=;
        b=LnLIJDIWtzdNlVGE5XcugliPIBSPgM5KQnjlq3oC5e9x4sTDoEXosBrc7QfNkquIKK
         Kwc1M6r7VxtdivMvobEO4oQEQn7ZY+Wu2sKCH4Jc3My1FGLYOpuxGIOELmMMdzYjjAtT
         waU4MDpX6lTfZgoGrx201jw4qMvTw2UcIagvIwJm6iTttUqMSq8T6W2f3YdGmlRA0OZr
         IQRMuohKPXMKRkJpLq8i3K/hAr2aUwUVtWBr0jZ0RudjSNkQl0NURyMNY0aqF93A3R44
         42/ZwaPtQZXiLTPVNsRmxtJ18fxcOiGE5LVMidmpTUdoP+n0ft1pcpEsVaUokisVedKh
         fNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343477; x=1783948277;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j21uOnLF7TkiT/E4hqJKxP79sEoMoJywprTScPsnTTM=;
        b=pMZab+xpRbFkkSCr2ThDtf2rZVTJT01J1YzT2JVG3wg0Ni7z/sLJFVkkjvpexKx33+
         LbY6NBcwwNRLPajhyBaqV8RXz/W878pRxxoM9MW4vkp/mRMmcItB7yNIaPiwGoJUK+bf
         R79VrkBa0otYUp1BZgxd5AbvFxwLXDe0xHCg0xHfmhlw4FON4pWfgBe48CMHodDGPB1y
         S8jUfxI5WuvFGYRXnCIHWusxBAYA8ph7Dth6EIjjKPocXrcBXHHTi5yXApUnWDvxp2HB
         9Pt4OUsAa5Q0naMwQXAKrwP2N4HWlqdmIpwYG4Kuyk8xoP4LUR2f2bq0K7MTYiCynqkL
         +P+A==
X-Gm-Message-State: AOJu0YzzUzl9A1uIu/3u8D4YWY3b0nmxqefn4l3c+OYc1/ASgflJ79zW
	40Gbfvq/c6va+dKMW7Z10ODiF4EituX79v3z6gCBRuldbQ3UZeg81VIWDGuWtEhGlv5d7TgnxEt
	4J4ZjHBO8Uans3DNEzUNAC5wGEm9wwq+SAtJdD8S3mBPSIB46Mi7ZoE6tmRRQWMcB8g==
X-Gm-Gg: AfdE7ckhlTFWD+ewmm2wDcEoT4w+Vuwuj89xRc3CEMNaTwxVDHlJKxFwVpTO8K9WFYO
	pogtnYK3RnIwldCPpxUflsJ75rlR1opSIyML3XlXXJPNLtakgV41zV0PN3qCyKq+OHLVicOJlPm
	7ih5F8B1bsWTaChC/iu6j+CG0+VQ/cErLfY3pi28zrHUHnntQraGL6bPUixzOdjNHQVFNZZlmgR
	mMR7SnfzAmSctqyBCLGwEQZcwJkpJy5/2KwxBAYA3KDFnb4Y4TlPhopD0mwFmeJDJVQoFt96DdW
	jF5M5+AXeq9NlVE8ViRavucZftXwV107fITg2zOe9d7WHHQYQZkPY8Sqes6z3j/BtuYW2575/hm
	JVW1oyRsgMeqJ9zdGGzr/zXpp1NPgTSn15RyFEBAkG09EvF4K/ZnMmjUmO+2iBb/zb28FGLNIMa
	W+Du/4bOF8o+kGAmD1Nkosm8YN
X-Received: by 2002:a05:6122:1d8d:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5be8974bfb7mr242324e0c.3.1783343477001;
        Mon, 06 Jul 2026 06:11:17 -0700 (PDT)
X-Received: by 2002:a05:6122:1d8d:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5be8974bfb7mr242272e0c.3.1783343476408;
        Mon, 06 Jul 2026 06:11:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm2864610e87.21.2026.07.06.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:11:15 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:11:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <gri2pdgawm2ymbmebzzxfel5kx5nmyqzrdg6oikfhv5bgt7xem@uld56b6csqhi>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX10DqlTep+oz0
 BWyHS+7qQKeyVRa5QHmjpx9AYhND6mPzZEzBSAgQRSSDhn/cZiRcklITwMGx2tj/yxwNIORXQ1e
 4gJaeGKtvreg9ZX/kH9bY8LqmWKxDeA=
X-Proofpoint-GUID: 8tWFi8OEeP6zQfMPf6Aww95fBFfb3_7C
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba976 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=SSmOFEACAAAA:8
 a=nmMTCcMeLSeVR9BiHlsA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 8tWFi8OEeP6zQfMPf6Aww95fBFfb3_7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNCBTYWx0ZWRfX8aGSfLswTKPx
 D0QfimxWSnaouo6KE5GoiK6y8BLalvS4TZimFAAql/l7V1jP4ZFaplHOsmdkVsZViBKsrVtJehT
 k8/dzhenriG3Kyw09I/RWtp/nuX0mx4gu71ljP+OcRFadctsUBIo1pZLzhJYCvbx0o7WEa5fIs1
 ILIYkkUERue2EGG7aydlkxv658p70XBJcx+I0OcceW/L3Pprv86GEHknyqEqVGKqr/259wzdpRt
 IrHMgeUHH5cnfYVgGSDKvFLXPvw77f/xhitF1di22jsFRj6ON/z76KhykKfqp2emwOgwU4vrT2W
 OSJoZlJarkjzRJhiqFkKX3IpRvXCTxR/lUohp0012zlIWpgzvz4K8IaZriEE+sdKOMYAPZlZoJH
 LBWFPOTbzV6fDXVs1IPZeEpTulYwhoTigzYMjonEWBO9GCcGTyFdVLS2vGNENAAcrBNTPFofzt5
 qbrvUHdL3iTsjfC3qqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66760-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82E03711193

On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Usage examples:
> 
> - Check of related video node: v4l2-ctl --list-devices
>   The expected result:
>    qcom-jpeg-enc (platform:qcom-jpeg-enc):
>         /dev/videoX
> 
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> index e4c16388ef07..53e83ebe4699 100644
> --- a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -72,80 +72,75 @@ examples:
>      #include <dt-bindings/interconnect/qcom,sm8250.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -    jpeg-encoder@ac53000 {
> -        compatible = "qcom,sm8250-jenc";
> -        reg = <0xac53000 0x1000>;

What is going on here? And why?

> -
> -        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> -
> -        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> -                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> -                 <&camcc CAM_CC_CORE_AHB_CLK>,
> -                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> -                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> -                 <&camcc CAM_CC_JPEG_CLK>;
> -        clock-names = "hf_axi",
> -                      "sf_axi",
> -                      "core_ahb",
> -                      "cpas_ahb",
> -                      "cnoc_axi",
> -                      "jpeg";
> -
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> new file mode 100644
> index 000000000000..2ab29bfb9b88
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_DEFS_H
> +#define QCOM_JENC_DEFS_H
> +
> +#include <linux/types.h>
> +#include <uapi/linux/v4l2-controls.h>

There includes are not necessary for this header.

> +
> +/* Offline JPEG encoder constraints */
> +#define QCOM_JPEG_HW_MAX_WIDTH	8192
> +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
> +#define QCOM_JPEG_HW_MIN_WIDTH	256
> +#define QCOM_JPEG_HW_MIN_HEIGHT	256
> +
> +#define QCOM_JPEG_HW_DEF_HSTEP	16
> +#define QCOM_JPEG_HW_DEF_VSTEP	16
> +
> +#define QCOM_JPEG_HW_DEF_WIDTH	1920
> +#define QCOM_JPEG_HW_DEF_HEIGHT	1088
> +
> +#define QCOM_JPEG_MAX_PLANES	3
> +
> +#define QCOM_JPEG_QUALITY_MIN	1
> +#define QCOM_JPEG_QUALITY_DEF	98
> +#define QCOM_JPEG_QUALITY_MAX	100
> +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
> +#define QCOM_JPEG_QUALITY_UNT	1
> +
> +#define QCOM_JPEG_FPS_MIN	1
> +#define QCOM_JPEG_FPS_MAX	240
> +#define QCOM_JPEG_FPS_DEF	30
> +#define QCOM_JPEG_FPS_UNT	1

This is a collection of random defines, which are mostly used once.
Please move them to the corresponding source file.

> +
> +#endif /* QCOM_JENC_DEFS_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> new file mode 100644
> index 000000000000..ddfa84838b6b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_ops.h"
> +#include "qcom_jenc_res.h"
> +#include "qcom_jenc_v4l2.h"
> +
> +enum jpeg_opp_clks_id {
> +	JPEG_OPP_CNOC_IDX = 0,
> +	JPEG_OPP_CORE_IDX
> +};
> +
> +static const char * const opp_clk_names[] = {
> +	[JPEG_OPP_CNOC_IDX] = "cnoc_axi",

This way your driver will force its own frequency on the CNOC_AXI clock.
There are other clients of the clock, so there should be some kind of
voting on it. Either use icc-clk or add CAMSS API to sum the votes on
the CNOC_AXI.

> +	[JPEG_OPP_CORE_IDX] = "jpeg",
> +	NULL,
> +};
> +
> +static struct dev_pm_opp_config opp_config = {
> +	.clk_names = opp_clk_names,
> +	.config_clks = dev_pm_opp_config_clks_simple,
> +};
> +
> +static int qcom_jpeg_opp_init(struct qcom_jenc_dev *jenc)
> +{
> +	struct dev_pm_opp *opp;
> +	int rc;
> +
> +	rc = devm_pm_opp_set_config(jenc->dev, &opp_config);
> +	if (rc)
> +		return rc;
> +
> +	rc = devm_pm_opp_of_add_table(jenc->dev);
> +	if (rc && rc != -ENODEV)
> +		return rc;
> +
> +	/* initialize the maximum available frequency for the JPEG core */
> +	jenc->max_freq = ULONG_MAX;
> +	opp = dev_pm_opp_find_freq_floor_indexed(jenc->dev, &jenc->max_freq, JPEG_OPP_CORE_IDX);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	dev_pm_opp_put(opp);
> +
> +	/* initialize the default optimized frequency for the JPEG core */
> +	jenc->opt_freq = jenc->max_freq;
> +
> +	dev_dbg(jenc->dev, "JPEG max clocks is: %lu\n", jenc->max_freq);
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
> +{
> +	jenc->num_clks = devm_clk_bulk_get_all(jenc->dev, &jenc->clks);
> +	if (jenc->num_clks < 0)
> +		return jenc->num_clks;
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
> +{
> +	struct dev_pm_opp *opp;
> +	int rc;
> +
> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
> +	if (rc)
> +		return rc;
> +
> +	/* setup the OPP according to the calculated optimal frequency */
> +	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, JPEG_OPP_CORE_IDX);
> +	if (IS_ERR(opp)) {
> +		rc = PTR_ERR(opp);
> +		goto err_clk_disable;
> +	}
> +
> +	rc = dev_pm_opp_set_opp(jenc->dev, opp);
> +	if (rc)
> +		goto err_dev_pm_opp;
> +
> +	dev_dbg(jenc->dev, "selected OPP clocks cnoc=%lu, core=%lu\n",
> +		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CNOC_IDX),
> +		dev_pm_opp_get_freq_indexed(opp, JPEG_OPP_CORE_IDX));

Drop extra debugging, you can enable debugging for OPP via
CONFIG_DEBUG_DRIVER.

> +
> +	dev_pm_opp_put(opp);
> +
> +	return 0;
> +
> +err_dev_pm_opp:
> +	dev_pm_opp_put(opp);

Once you drop excessive debugging code, the dev_pm_opp_put() will find
its natural place right after dev_pm_opp_set_opp(), before checking the
rc.

> +err_clk_disable:
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +
> +	return rc;
> +}
> +
> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
> +{
> +	dev_pm_opp_set_opp(jenc->dev, NULL);
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +	jenc->opt_freq = jenc->max_freq;
> +}
> +
> +/* qcom_jpeg_camss_get - resume the parent CAMSS device */
> +static int qcom_jpeg_camss_get(struct qcom_jenc_dev *jenc)
> +{
> +	return pm_runtime_resume_and_get(jenc->camss_dev);

Use devlinks instead.

> +}
> +
> +/* qcom_jpeg_camss_put - release the parent CAMSS device */
> +static void qcom_jpeg_camss_put(struct qcom_jenc_dev *jenc)
> +{
> +	pm_runtime_put_sync(jenc->camss_dev);
> +}
> +
> +static int qcom_jpeg_pm_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +
> +	qcom_jpeg_clk_off(jenc);
> +	qcom_jpeg_camss_put(jenc);
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = qcom_jpeg_camss_get(jenc);
> +	if (rc)
> +		return rc;
> +
> +	rc = qcom_jpeg_clk_on(jenc);
> +	if (rc) {
> +		qcom_jpeg_camss_put(jenc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_jpeg_pm_system_suspend(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	v4l2_m2m_suspend(jenc->m2m_dev);
> +
> +	rc = pm_runtime_force_suspend(dev);
> +	if (rc)
> +		v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return rc;
> +}
> +
> +static int qcom_jpeg_pm_system_resume(struct device *dev)
> +{
> +	struct qcom_jenc_dev *jenc = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = pm_runtime_force_resume(dev);
> +	if (rc)
> +		return rc;
> +
> +	v4l2_m2m_resume(jenc->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static _DEFINE_DEV_PM_OPS(qcom_jpeg_pm_ops,
> +			  qcom_jpeg_pm_system_suspend, qcom_jpeg_pm_system_resume,
> +			  qcom_jpeg_pm_suspend, qcom_jpeg_pm_resume, NULL);
> +
> +static int qcom_jpeg_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_dev_resources *res;
> +	struct qcom_jenc_dev *jenc;
> +	int rc;
> +
> +	jenc = devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
> +	if (!jenc)
> +		return -ENOMEM;
> +
> +	jenc->dev = &pdev->dev;
> +	jenc->camss_dev = pdev->dev.parent;
> +	platform_set_drvdata(pdev, jenc);
> +	rc = devm_mutex_init(&pdev->dev, &jenc->dev_mutex);
> +	if (rc)
> +		goto err_free_jenc;
> +	spin_lock_init(&jenc->hw_lock);
> +	init_completion(&jenc->reset_complete);
> +	init_completion(&jenc->stop_complete);
> +
> +	res = device_get_match_data(jenc->dev);
> +	if (!res) {
> +		rc = dev_err_probe(jenc->dev, -ENODEV, "unsupported SoC\n");
> +		goto err_free_jenc;

drop the gotos, it's an empty label now.

> +	}
> +	jenc->res = res;
> +
> +	if (!jenc->res->hw_ops) {
> +		rc = dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->jpeg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(jenc->jpeg_base)) {
> +		rc = dev_err_probe(jenc->dev, PTR_ERR(jenc->jpeg_base),
> +				   "failed to map JPEG resource\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = qcom_jpeg_opp_init(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to init OPP\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = qcom_jpeg_clk_init(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to init clocks\n");
> +		goto err_free_jenc;
> +	}
> +
> +	jenc->irq = platform_get_irq(pdev, 0);
> +	if (jenc->irq < 0) {
> +		rc = dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = devm_request_threaded_irq(jenc->dev, jenc->irq,
> +				       jenc->res->hw_ops->hw_irq_top,
> +				       jenc->res->hw_ops->hw_irq_bot,
> +				       IRQF_ONESHOT | IRQF_NO_AUTOEN, dev_name(jenc->dev), jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to register V4L2 device\n");
> +		goto err_free_jenc;
> +	}
> +
> +	rc = devm_add_action_or_reset(jenc->dev,
> +				      (void (*)(void *))v4l2_device_unregister,
> +				      &jenc->v4l2_dev);
> +	if (rc)
> +		goto err_free_jenc;
> +
> +	rc = devm_pm_runtime_enable(jenc->dev);
> +	if (rc)
> +		goto err_free_jenc;
> +
> +	rc = qcom_jpeg_v4l2_register(jenc);
> +	if (rc) {
> +		dev_err_probe(jenc->dev, rc, "failed to register video device\n");
> +		goto err_free_jenc;
> +	}
> +
> +	dev_dbg(jenc->dev, "Qualcomm JPEG encoder registered\n");
> +
> +	return 0;
> +
> +err_free_jenc:
> +	return rc;
> +}
> +

[...]

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> new file mode 100644
> index 000000000000..c9959518c64d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +
> +#include <media/jpeg.h>
> +#include <media/v4l2-jpeg.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_hdr.h"
> +
> +/*
> + * The elements defined in this header are specified
> + * in the ITU-T T.81 / JPEG specification.
> + *
> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +
> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> +#define JFIF_HEADER_HEIGHT_OFFS		0x05

This is offset_of(), no need to define those.

I think, you already got a review from me. Move all standard-related
defines and code to the generic v4l2 code, unless you get an explicit
blessing from one of V4L2 maintainers not to do so.

> +#define JFIF_APP0_LENGTH_HI		0x00
> +#define JFIF_APP0_LENGTH_LO		0x10
> +#define JFIF_IDENT_TERM		0x00
> +#define JFIF_VERSION_MAJOR		0x01
> +#define JFIF_VERSION_MINOR		0x01
> +#define JFIF_DENSITY_HI			0x00
> +#define JFIF_DENSITY_LO			0x01
> +#define JFIF_THUMBNAIL_SIZE		0x00
> +
> +#define JPEG_SEG_LEN_HI			0x00
> +#define JPEG_LEN_DQT_LUMA_LO		0x43
> +#define JPEG_LEN_DQT_CHROMA_LO		0x43
> +#define JPEG_LEN_SOF0_MONO_LO		0x0b
> +#define JPEG_LEN_SOF0_COLOR_LO		0x11
> +#define JPEG_LEN_DHT_MONO_LO		0xd2
> +#define JPEG_LEN_DHT_COLOR_HI		0x01
> +#define JPEG_LEN_DHT_COLOR_LO		0xa2
> +#define JPEG_LEN_SOS_MONO_LO		0x08
> +#define JPEG_LEN_SOS_COLOR_LO		0x0c
> +
> +struct jpeg_header_buf {
> +	u8  *ptr;
> +	u32 size;
> +	u32 pos;
> +};
> +

-- 
With best wishes
Dmitry

