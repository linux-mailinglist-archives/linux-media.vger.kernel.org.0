Return-Path: <linux-media+bounces-66755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YF/rLLK6S2pHZQEAu9opvQ
	(envelope-from <linux-media+bounces-66755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:24:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E1711EC2
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 16:24:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DRz+/f4d";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SAKQLwWp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66755-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66755-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A5235F8EB4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 12:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67304D90D1;
	Mon,  6 Jul 2026 12:45:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB2492532
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:45:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341923; cv=none; b=tq7AzpZr0L67cqPxAUa3nHZCr1DhgSKuarorZ/yQ0YbU/AFuAkPEOru7ZNJ6pVtHXR7mU6p0oHuTLIvAATxr4Erx1wgXhRPMIrkKEKJ95ZAIxjp7++FjQbT7Rtd28iEERNvrnVu9JGqDv8Pc7un6936Y9NGCumCfgu+RJhR8vB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341923; c=relaxed/simple;
	bh=0JPIOM3bKv+VlgOT5jfNWR3yS4XhT3HggZFHDmH/dys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhRLCnlQOZ8OM9FOD/sypnUTQCuJoiUTLQVAzQJnnl/H+KwdvdxoDzdY1L3gLlsFmLfBKwmDxWKZAG3kkdX/fNotnCJuVkWMTluxvU1YLtJmPDQk07AvGdbhdXA0DDzhERJvsQzO77WsF0tLtHLwJuA04NSWCZztAkYVnhzvMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRz+/f4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAKQLwWp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLJK367215
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 12:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=at2wG9fgDCzLJho8qAuNMi5f
	Pc/Fr7X6A05iUjg+Iuw=; b=DRz+/f4dZLxPlpoBorbK7Nb3wRrQ6wdJT7KcR9a1
	dkz9h+YfFn6qn3SxncWX1EG9PlHlDG4LP6cBk6Ofp8IarWrsPGvDlXFnwNFu+jc2
	HQrKHsH3coewPY0vc9ea7kiGhHhxouemHq3z0kgIVz6T+ZW2Tl9oIzDzILEyoJrl
	Uof8yqWrm6vla9q07m/xB6hywIXX8U3z07uwOVTUARrg9Fyw6GI25LQHK6EyaESy
	r/1d7UK6pU5LVGrksug1Yc8AeVvFm6HSuZKs9LDYnPi+mpoRtJ46lw62FTBW1hOV
	BFbpYNWtqZBXVrM1RSARWbYjwubcAtSwk3+Q7laHiAL1WA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urwfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 12:45:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd80b3e9d5so706387e0c.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341910; x=1783946710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=at2wG9fgDCzLJho8qAuNMi5fPc/Fr7X6A05iUjg+Iuw=;
        b=SAKQLwWp2DyhygaK3PygNvCaFsm7vFnIvlqhKPu4jxQ01Du+/khADiQ7HCWQqKbX46
         wq/VIVmrAbhLzBeWGN2Tva7rlW2t8Jxkq3Zg5b8FC5/IPrfCysx2Wgm/NxViMqYAjepx
         ir3pR/Ac1yQDcEPvOXWGqS/JqBFSs4oPSmZfnaKm0X/T8dSHJNr23krEZ+GQtUHUeXk+
         nC+3sfpEuHKT0KGyqSmerCJqJwwz5CXphN1iVwwqoAoVcLRo+LJ4GgkX+6pF7iIFIE8W
         xgiLUA5hvsyuTe0pXQtHMaJas27aR+qts6RTYkHiAgZUflsfh8dcc1IxBAdUHvogROJ5
         xbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341910; x=1783946710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=at2wG9fgDCzLJho8qAuNMi5fPc/Fr7X6A05iUjg+Iuw=;
        b=ZPK1QQPBKERNCBv7XHpof13w9rVkcFDPqZnuO9XMhZ7RS1y/wRUsxHUBK/EAosq025
         +RoV+j6N7ta3NQo7JOG+PO0yLf6rU+wzfpz1Xb/7m3WGNRYpOM6nQINGmh4wwI6GUqq9
         Nwnh961TEdvlgPLLIpT869F4WdtF4c9gYOl2WYn5EEcMITE0ecWhovtRb/NMYEOitdR8
         7ExvmxgmniDvUsF4IeqwMFXpJOiKz7dc8GzCRdB/eBR/1fF/QtL3C9bOpy3DHO03QeMW
         vN+HfqfgGLVH7p9gqvOLa7Hbul/vwka8Hmq0hTVjazF4E5/FhLJTo2j2isbAKgwWzNJH
         6Xpw==
X-Gm-Message-State: AOJu0YyfJYYTduJCKunLasVVOSVbrHCg+k3WqDdg2ktXPHi0opogLX88
	iqsJp7KYX/BXCgjEfGqBmtGKpjQdD9PTp7Zab3QIzli+nVhcZ3Idu759KeegpqT6kKDdySUqedI
	+LaV8J7oUlDbAPEFphmwHE2gCkDkw+w5IagRkBif7nY9shZl8tyb49L88WoCOUe4rnA==
X-Gm-Gg: AfdE7cnUL7CZvkswryWKCRdNHj3R3s4velNTNaCpm3MIOTaphv4C2Atn8MCVDv6vpNc
	DFD04Ce3H+mEDmayqGK7awAat52g7rqOjPtQC1z2G8oe/T7gy3mjRwyvYIyvbvnvm0OS85hUVHW
	G+vv2BxzAfW6jEoK2lyZVfyQqeLmTNLKGMeuSaylkE1BJU4nQjgpM7iDS0692kzeYhXZFHPCH9g
	SNfu9OYpa4m+H1Czk744a6/I0pnKODVyQPSt82juYZW3ggZ3e+9ewoDf9QkU3F2Ji4z+DKR3B7S
	y/CaiXoNqZfQcUnOrVZ9FoQ55q+ld8Bh/3mloWaUEjkEXQ3NB7QKA5evlR5X/wxqIodrGAaWYxx
	9LByWOz2CkczlXLe4EyOLmPH9k8XwbvFY7HmJIJDJVgQH1dpV7U36uPEYjW6n9dgMCkzbd2YXzh
	60GSlhb3DJT53iZmYXaYzpeSvb
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr170288e0c.1.1783341909873;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr170272e0c.1.1783341909306;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm2839229e87.43.2026.07.06.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:45:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: fDNjcdGIfaJpKKzysyJYRT-UoP5YhAfF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX8O6PcUsNVINB
 0VgHzr2azv9c6Uwb/oJw4SBoz/FkfczLN2B/989BPCO1DEEUGtbcs1HWUHsZez0ivEsNM3Heung
 bO+dB3fwazhNxkSX167FdZ4jTv/JYyQ=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba357 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kM9LC2GvXd1nFKSqAPcA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/uE1qBgOe/pj
 ZRbg9AOdomE1ci3V59+X9Tu2HhT1SpZH46zeFkgQt9hEdz4zFOEuIVB2l7JuHSoiPUR/yMVY/5f
 Hc1u7K38MFt7IpJH0MUZzI4pdHK8GPTOTW6DqS5VKAgcXbujeb10GjYFq1xQGhbKlRENBbCmAC1
 TYUZXwM2IOLWyKMmk5wB+kkQXLoM8MGU/w5nx9wlqbooFAUrUy3lFYBqTKEfwvMaOkayI/oCjEJ
 cRWhzDOdvVxkpfHI+fSeW8NdflOlR7lyMu5z7dv2zMfC6S8+nQ30T4VxLPj43J5EAMEVhPV1ZU9
 ef5/YE/PCzjEfy0Nn3OcYqHxTseUR52iiXmtY9pCXHyydKq08lzWtS2tdK9SP7b3Q+FTsfVt3D5
 TwYX83f7oGr44uFPD0jHY1/cLGlvdh6tCNCSqjuB4D2+FtbKk867Dd7ey879Ijm2QBxJpeIWGEp
 h6lP7YnMSeQuCwBPSig==
X-Proofpoint-ORIG-GUID: fDNjcdGIfaJpKKzysyJYRT-UoP5YhAfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66755-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 063E1711EC2

On Mon, Jul 06, 2026 at 10:11:12AM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..a089b706f60c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
>  
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
>  			status = "disabled";
>  
>  			reg = <0 0x0ac6a000 0 0x2000>,
> @@ -4649,6 +4654,82 @@ port@5 {
>  					reg = <5>;
>  				};
>  			};
> +
> +			jpeg-encoder@ac53000 {
> +				compatible = "qcom,sm8250-jenc";
> +
> +				reg = <0 0x0ac53000 0 0x1000>;

0x0 instead of just 0

> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +					 <&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names = "hf_axi",
> +					      "sf_axi",
> +					      "core_ahb",
> +					      "cpas_ahb",
> +					      "cnoc_axi",
> +					      "jpeg";

What are the clock _inputs_ on the JPEG core side?

> +
> +				interconnects = <&gem_noc MASTER_AMPSS_M0
> +						 QCOM_ICC_TAG_ACTIVE_ONLY

Put tags on the previous line (even if it is longer than 80 chars).

> +						 &config_noc SLAVE_CAMERA_CFG
> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +						<&mmss_noc MASTER_CAMNOC_HF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>,
> +						<&mmss_noc MASTER_CAMNOC_SF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "cpu-cfg",
> +						     "hf-mnoc",
> +						     "sf-mnoc";
> +
> +				iommus = <&apps_smmu 0x2040 0x400>;
> +
> +				operating-points-v2 = <&jpeg_opp_table>;
> +
> +				jpeg_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-100000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <100000000>;
> +						required-opps = <&rpmhpd_opp_min_svs>;

Inside the DT example i saw bandwidth votes. Why are they gone from the
DT?

> +					};
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-400000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <400000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-480000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <480000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <600000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

