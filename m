Return-Path: <linux-media+bounces-64752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cSdmDEDYLGoFXAQAu9opvQ
	(envelope-from <linux-media+bounces-64752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 06:10:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED5767DA6A
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 06:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EjX4XkRZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXBEytuf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64752-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64752-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6B131C3DCB
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 04:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E2138C401;
	Sat, 13 Jun 2026 04:10:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B6380FF7
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781323813; cv=none; b=MPasGls8W3pTsWxQgYE/cfqY2k0v0Ud63DYnOo7IoYQ/S2iSvGMx7OYRMiC/ykgJ51TTpMdqoDljii/W6rJSlT9Lfo6mtRapTM0bJ51updQwf/SC2aB1KtGamOxocgQJvIkx+GWL+drNEji6UN4casZV3eXiW4yLT1jaeV43YB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781323813; c=relaxed/simple;
	bh=d+CuOuf3ybPVo31Duy+EpOGsQqxm8eNmSXH5RxEr1bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2Lv5+A+4ode9A5DrnW9HQcIeeKr77Ur5cDZYWrugrqcBRqQjccDLc0KLxTnuweyIsjRGD9w0pAbm91ryVBFQRw2vLzpYD5Doc56u8oljTH4d07kkgSXNVeoK8Kpfx6UPqlN8kfe7uDrLv5UtXY5ulGgv6rcCGIEnfScIsgcr1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjX4XkRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXBEytuf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3UcER1407741
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=; b=EjX4XkRZpygOmsXy
	GVaiA5BwdOv/Yb3hrVzwo6/qftVVOstDIcAxtEZgO+E6ImFeQ+bzCsFcfTccR6AV
	kHimL7q90XgU6hSIS5504E9F96Z8mGjWkvrsDI+3BgZdXNC38eNugMbNzH+BSRSw
	e/Xt5yLFD16MFYPFBWIBifvMhxWx6VuMBVe1jvY8SIV3WI33lCE8RwF2ER0/lFhX
	2s4krj6Sno4qlFdEvF+nUNz0wpzBdaY0KrhVSCAT7m5J3YoyYU5sgQkU30lACJWS
	tjLeDzFbaV3WB9e/tV8PvwndhzNmm1ARSDRGQfsBFBPa1kONhe2RwHWAK+UZoqi+
	e90dQA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6r283-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:10:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1242641b3a.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781323810; x=1781928610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=QXBEytufWuzTfB4cD/RXyRcDF+MBHUjsNNMLzEBnLHKsB80nwDFufN/J4V0YXrEOpB
         KSTQ1hYnz1vAtAfzCQWnni8e9Uj5bbfeLZDcBONCVos2Q1+Td++AvoOC8UUW/mjAmf2L
         CWSFbTBQ0pUTDAWNSow+NLbw7s2dvi56WzGZgZpQ9WG7hfMdtV99DSOR2HP569kk4MoE
         1DVOPFUZD3LLOXJPZGCrS7DZxJF8ra3QF196B/Fi3F8okY3gp6fW/dG1TW//U9Q27ngz
         shkTR1RHYs2Dw2il6o5W3OSc3Gv6MnvjeE8F29N62I+i0V6T+jy+l47rW77Q+X8akJpI
         9d4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781323810; x=1781928610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=UjD78SZsJJmQ4wA/6yZrsg20Y5ZcKJ3RS+7lgrdN3d0lw/Z4rHCWsp0XROCmm6sdBR
         t9GbDSTZaZ1Pl3D6EsPrsyjukaRi6aKjQwG4lldR6c4MClVPEJR1EiOCvO/XR+t3xMBc
         /d6HPpVtsbEfcRAX3d1ffLl2vHs+QFuDqXZwO54tUFawJniPbqkEKdpOmBRk4BVUeTap
         A2h7zRi7XZ/BjbMkTaAd+WMYcsPT/1W6WrPbUn49UTypA4qkfyhhcr9tMDWX9RAzqgVZ
         0HbPCt61wbS/cS2BV7vSMKp0acRyu4juUhMFL2XwMJ/lkHnxAT7gumlqH0NUWBv50x3F
         sVmA==
X-Forwarded-Encrypted: i=1; AFNElJ8LTW//TR9thojhW+o9vNmnls86+tAfuZlzoXJFmJB85NzpJrfotCimeJAfpRNmUK2r1rJ4ta9PB9FDJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPV1yDrzEfauTnQ2lve8svtYLbBH3loqNTzMg21Kjc8yiI+sAY
	qN1wWGMPABidio9JPRyaxFVOJFEaoy9TIxfEaWArnlA6gFxlbn1jCuIfI5nmoAnlTanQ/it3fWq
	6A3mHMliRwzarQ5HBDDLkxeV+RDTX1hYiLi/+IdotX5YzgtzQ/LkCYj02FPXJo9quZA==
X-Gm-Gg: Acq92OEmLjl8oL34EYicoDgsN0DmklfuW8ltypjcMdIiFrL+mKA0Lm2mNS2H+rkKjCJ
	+KRMzhRWKPeNXGh2P45VnYCqYkGKlEVBsdzGw9aIKzRZh5U94hvdIZLssid5NDqFrIPQ5POB9+s
	AkEH3k9IOHQGHxp3IphU55x6Ii89yrLIGnzWHANr9tvv3SEx21cnkIYdzKqUPH0ineElMCHm8Vc
	4VSaRwTq3S8MS8mvrBUURROXV3Xdb1oTedB/6vmkKtGoXhhfQ+Kj9+PRhIQ8339LTvndcDfk/hT
	6nL9RHy67CGV6dhypvYwA+f3zvWlQ32LNYtv6n+CBXaTOLnX5pU+Cb0v2PiTQYYlcIKMluJ7+zJ
	p2BAXkE9S9NkbJ1yIsFqonxo7FpP9KHc7oRmuJm+VI2ZwOg9+djs=
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902241b3a.10.1781323809811;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902220b3a.10.1781323809366;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm4480992b3a.34.2026.06.12.21.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Message-ID: <fbb00150-e3bd-45b8-a87a-100ecd235a46@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 09:40:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
 <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX+sPWMQ9dt5w9
 pzqcTt+ZV4/OfqYlKktbD6kG57iOyeCh9qqyVFRoGH0pV7JORoW8qrir0HHQp2mPH2tn76FqOG+
 x+iBg12mRFEhozOoTvdyrkSFBPbDZms=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2cd822 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HRvYZQSnNB20PN4mEw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: HVEWp5r_12CbTlOER4QQ1FNJ38qn6wda
X-Proofpoint-ORIG-GUID: HVEWp5r_12CbTlOER4QQ1FNJ38qn6wda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX2SyhNGDggfK0
 Ngd6WvCp224clL1vP2Ft6Mud1eDp1XnIP13bjL5RzubiKqPLhNQiPSidm33QBxTYVPz4C/PdiTP
 7k0iEhEoqmotOYT7gsoKAoc/shjMZNSaWpK2MS2jLgXF5PbDLU8KgFuhvXf1WWGh4M+lqYmfNhj
 fDCCQNAWC7M2IN+IUmTm44MnbZYqMld1hrUdSjUA0JgVwvlH2D8xdQ7lR/bv7qusWU7Bc4/3mmY
 SIbkVSFgkf7zWy0nvSrT6OiNMmUWyW9PBO6T/BWi4Rc2airMW3lnL/PxhVmomxfSd72ijOYpm/f
 2w/cKaDAqc+rZz8c0Dn83kCY6cG40Rxt/kygjOh6cIyPqBcUdZE9tnnJqi1poNbE3PgOmxE9IQ6
 FbheEUglXddVorKWlHZtnTu6qM58bVM3Q7JyTGT8IC8NcWp7ZKIFLqWxw3T0939zpxy4z/ilzEc
 ktzoTr7e77WFnNWcSBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64752-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ED5767DA6A



On 12-06-2026 13:26, Vladimir Zapolskiy wrote:
>> +            iommus = <&apps_smmu 0x400 0x0>;
>> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> 
> Please add an empty line between the properties above.
> 
>> + 
ACK

--
Regards,
Nihal Kumar Gupta

