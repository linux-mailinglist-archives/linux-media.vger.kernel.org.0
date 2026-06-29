Return-Path: <linux-media+bounces-65932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K0IRCMFeQmp95gkAu9opvQ
	(envelope-from <linux-media+bounces-65932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:02:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF16D9BD7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:02:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YihHik7d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ffJJmpx5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65932-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65932-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A9F5304545D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75593FE367;
	Mon, 29 Jun 2026 11:56:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD93FBB44
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:56:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734187; cv=none; b=j+TxZc+/t0SdxZEQkUp2FLu2hBLYbnRUZfgO3tkLKgpz+QSemCN1TbxB8h7eon3JDEFrYdR8I8rZ7KUi6nianUo6A1URCSArQiMkhB0p2mR1ThiaJFwscIYqfPjZ/e1b7F1gQ+MK9iV8Y3Sn/dR7JwB1E7HyJWSjRBpi78P8EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734187; c=relaxed/simple;
	bh=ycCB6aBXbdoi7pq++CaVTDKq50tu2AeXYjXrW9M+eC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsqdc9KIG3BUjUTyfUcC9Hd7hupI55+QNqc/dldYtjXgDUu4S8k+jTuueVMsow0j8wdedOeZ0Ci/dHY+CzXFvTAgWixKHxRTaorSBuTUgYkmWsx/kVOVDDprazoEIQwldjb0saSBQQQzuRpsOsc+PiWvt0QulLw6ePtisusXVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YihHik7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffJJmpx5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATJaQ2656106
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=; b=YihHik7d/lDJFwGQ
	8bhB9INNJaNyh5/dUyh6S3l1xLFYAbrrYyeFPDO40AepD6bspAuughI1eBFbnpVT
	q0cvtWtiWDL3jAc7DHByaZlfKA2TjlusJ8OBdDxjkFPRdHesSzdesacTpMGTx+Zg
	Kc7QVeJb69zaea7DTM6zd7Z8bc87EJf7mWKvspT6TlIrk8Oz8kmBAa2vLcbPH6Mx
	BPm89mI9PG2gCPy9EIgfIzd+InRuNsTKtjOnkydhzRrBjfzG8DSWAqfetvTornGa
	hXt7DaKm1h3Rn/xKjfKxh4NTML5omMhDNCYGeWIYlx/UWCgwvioCqMq4BwRcwgm9
	o/yh3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gn2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1754591cf.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782734184; x=1783338984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=;
        b=ffJJmpx5b1xJcz/GtQ5aM7kbbiyW55YGYviBzylzeaMpnN3ZMMtWGYrF4hMs0z66l0
         ezk0bJmCcP3XuS+LqKjfFMwRncOWJryiIJqS+GoiAhbsqJU9psNEJYpbF4g+zUu6A6YT
         lPjzcOko9K6mt0iksrqhIY2PPqRnEIGzvXDBr3SWyTpBkKLj1AhU0q6NtH6aHukdX51N
         qZ8EApSQ0WV45Tyf/S0h50Web3O3hwc/4XY5wzOCx7HBTPqupaXVG/GKoZkZGhpaWaMi
         37OTSOburn4LgoKjeD5jgGj768dG9bxb0UGMvPNsw1U/FkUshxzGJxbDs4mmc2nQa2vi
         3Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734184; x=1783338984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=;
        b=XEM3U75Vk7W9LHIkkmmlBi9uEi1X6/tzRlA/mp/YKoSjdOlW1x7DmrtVhZaQ7CFpaE
         x2LUkL3BXkQn/BkXK+a2daeLeU7TgEZlEfpBKD1DH9713Ylqml+byoYQy9hCKh1U2+Py
         NpTsG5rLrWLGx6U1bSiZdHBEFSUJcTBqodZXNpUsYvP85UlC+tKtpTEqqReq2371Pnq8
         ivMnGrx2oWjwP4kkLVPNbdK0A0hsuHk8zwX4rQSUJd3QBtwl0dzYF+Mki3rK8iBSYU58
         1BaMP2LCbv4jb3X7OMeN5OZlUsvoZkeTScEuRimYbO//g0JcKRnXq9yHBLLaPWEQwGqV
         Lxyw==
X-Forwarded-Encrypted: i=1; AFNElJ8gEGoHyiyoSOJZq6MXBf0LK3KwuMKHeIf9qczeySMhvR+ufdfCNlTF2qq1J+jkyYAhyOrcStgkRteFQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFlm7gvtWbJ9rFpuEgoaPwBcBOTKFrb8WE7Hn+fX1WbPWgbTFF
	iuUQMPIaqTDZKMDZHQxRjM2uLKDj4feYKf2/WeBgvTrVxEnzR/5JXDq7sNFxqECUBqrouFjO/Js
	wQTZBRo208U15yGM1d++wcpJLE8US4sP4rrxuDtPA3JLHajYoWI6tgAPieVTcMdnaLw==
X-Gm-Gg: AfdE7cnWH5TFTuvmAYf14FL9WSniPJ0AMNRw8IB6ly6Xp1OP6go5y5DXg2326RX21SY
	S5y8g3mYZl/1LRRxJtDtfpsyIGtnQs9JJG9QVakyAqNH5OFJVn6/8Y/Oyj/1R5w3rzuW1ayjeyi
	RRs753tu57iFcdgSPfAs5ttPP52pBCMTBCH5fsnx/iO7W+HO0WKk4wenxR8+Sd9R9SZ23dV3eGM
	8QWGreGgUg6QHyDiXLpTIgEU91JUO/dGG9KfIsSg3qlZv65wSaIt4vU+aeBMmlWLy9BeWYXYZK+
	aaWApzNSmIBW08xt2bO0sghVlyzOcpdfrR0fMe1Zq/AqgiP9keRKchnBWesoUEE+61pRDv2QiAO
	HAENrT45Gj056N4/HCwvVNjy5y6IgQPhCwmI=
X-Received: by 2002:a05:622a:d2:b0:51c:478:329d with SMTP id d75a77b69052e-51c04783f52mr15819701cf.5.1782734184368;
        Mon, 29 Jun 2026 04:56:24 -0700 (PDT)
X-Received: by 2002:a05:622a:d2:b0:51c:478:329d with SMTP id d75a77b69052e-51c04783f52mr15819401cf.5.1782734183975;
        Mon, 29 Jun 2026 04:56:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05b6dsm776045266b.37.2026.06.29.04.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:56:23 -0700 (PDT)
Message-ID: <c0cc8b08-b468-4120-b79d-2ab9ef4d0aa5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        sakari.ailus@linux.intel.com, luca.weiss@fairphone.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Kate Hsuan
 <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX+ldEIFAu1S3T
 YmT/EWOAvxoSJ7Wa/OKf8334U/RbVI5hRenLWrJqYMtTcpWUVLEwvPJmnK5fPw9gxKtd2xYyh2y
 TvO3vK0UOgGVF7yDiXOuWQQT1PnTBggv7U2H6F1VDoV+3vPMeikyMpGILmJbs+NqBvRoGEoDYdn
 hvvfAoMYRHy4mkiwIyfJAcBHJAjuMCuwu0qUJJezoDy0G2ao89TULnEVjLGe9iIeG709EooWuLZ
 tHNWOs9VdKHUZ9NGS4RpPi6uIbxrgscRdpEqFW1OGjHK9gR/xVBFgITkFEvtsBiTOmjHq41HNz3
 uCdQvYGsyC3ejO7ONOPA4Zhmjh0pNunstI568V0ZxujH51kOZQ8HOHyiHtHTwbD+POFHsePVZF3
 +BaROQyjmGawZCpGXYIJMiXQDhGV3dLRGS6y3M0y+/ZkzHkG2JMq3riB0NYzGnf4Y9jVctdKNfZ
 tisA9SdcpKrJVVju2wQ==
X-Proofpoint-GUID: XGZ-XgKjWu77WYmdS-uC6RgiwwrDZ-BM
X-Proofpoint-ORIG-GUID: XGZ-XgKjWu77WYmdS-uC6RgiwwrDZ-BM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX4oc+0yUnFwg+
 qGlT8+EEZCY09dbxYxhJJ1lhYTI5XRDrNfl2VeM/uiaUo85nDgodOdvqIEDIc3CmUQw9oRl2C+p
 P37RY4YUM/4qNUQGFS2g8Uy7RBFfsGg=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a425d68 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=mUnpA-1eZJh-92FP3oMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-65932-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:himanshu.bhavani@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1DF16D9BD7

On 6/19/26 2:54 PM, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

[...]

>  &cci1_i2c0 {
> -	/* Front cam (Sony IMX576) @ 0x10 */
> +	camera@10 {
> +		compatible = "sony,imx576";
> +		reg = <0x10>;
> +
> +		vana-supply = <&vreg_l3p>;
> +		vif-supply = <&vreg_l6p>;
> +		vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
> +
> +		clocks = <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default>;
> +		pinctrl-names = "default";
> +
> +		orientation = <0>; /* Front facing */

Please include the new define from:

https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
> +		rotation = <90>;
> +
> +		port {
> +			camera_imx576_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> 
>  	eeprom@50 {
>  		compatible = "giantec,gt24p64a", "atmel,24c64";
> --
> 2.34.1
> 
> 

