Return-Path: <linux-media+bounces-54384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMz4FnQjp2mMegAAu9opvQ
	(envelope-from <linux-media+bounces-54384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:07:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C61F4FA6
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3A730FEE57
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 18:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8306137F001;
	Tue,  3 Mar 2026 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1g5XVOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoQf3nkc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500637EFFE
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561023; cv=none; b=o8ke7jEuHjtd7t1qoJcwciyDl3glOx3jmN9lb/1toBj7JsE9yzmdzMvxqQ0MyIwoPc1wqxYHGEDG60zYEjBYi/sQkR6skM6mqOOJZwhgQZx+1yOusps6yUpybItIUzLwyT9kRYT+fQgCyu68odjWSQAqkcNsQAGwPFggTwf4MpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561023; c=relaxed/simple;
	bh=AB8OA2Dl42/se4XWMP8WuLhYg0He20pFurNUqfcmIMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhOavpj8sduLO/CcapaflxfC1Hv8D0d1L8pPyL/++a5noBfN4b5uarqyKoTJEK7AI4oX6kyOmtokKtV7iKZ7GFVKoSPk4N1ooVkAUJXNXDonB1ufvR3QefCt2Jpqh7/smV+5WsRNyuJ4fciC5ztS/OptnlS6ApOm6lgqZZSNaaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1g5XVOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoQf3nkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0BW51256448
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 18:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySZ0KoZq2LhpQH8htZ/5AmkMgwyEGu6tXiMpty+Wwzs=; b=W1g5XVOoI2Id7AEs
	bvMPEf1azLRAFzGqJ/7QopNOwraQWnLkK+vHBxPGS1PTSuOKkgrEmrO9dPIVKH1b
	Jla+PBECtCvmLP9aK/bsijysOBqfWeYUcn37IqscPf03RVT7EEyyRlnCo9LGGWA3
	iOwjblwNOWi1ZgfMT0JdIW6KYGMUme/WkkdxfEsurPd6aLSZRLAqRV4ImqHDmOlP
	5okuRmVKF4Zgs8WzWloGnpEoE9OMSizl3n4zOmDs21PeFQSXOm6YBHt0kmBVXygK
	uF4HJXnOW3T9pynNuvAsrZQMRKvkRYhSFmU7fRHpGc1sPLfy1VXKNdU7KBy5zLtW
	K8spig==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9gha6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 18:03:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be07cafe1cso36499758eec.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 10:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772561019; x=1773165819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySZ0KoZq2LhpQH8htZ/5AmkMgwyEGu6tXiMpty+Wwzs=;
        b=YoQf3nkcjiNXbIX1fofrF20A5C36afPA3YvHKZOWefO+LecZ5NUijLJP3D72Yzewwl
         7YaqGrSVlpWnmj6Y5nlEf+07USoxGMWdABBHBlh0AC3/DUCUtcPj/lWEgJEn1jM5Bkms
         9FKvtq9HKcrC1m5ghIkVIzbPmUwHCcfnhMxgFxZ5oIcFFcXxRmQD//DFlUO6CEJvUnjV
         LaBL0sRaTaRF4pYhF5EMtrpkNA5oAx3HswAt43xasqQuZhVHbmrU1tvXw9/duPasgouv
         jpw+5HG3gJJGqRQ/FAqhADSaKxZYPu/3tL70r6R7V75FAFxc69noBhjhHnLA9kiUcvCr
         mhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772561019; x=1773165819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySZ0KoZq2LhpQH8htZ/5AmkMgwyEGu6tXiMpty+Wwzs=;
        b=JM+esqNk7Yma24wwprwSweHlfkMavHNW12sSRDp1yhD1vOfv+A/zHW4FCBvpkiOfRh
         UW1kaNW5Kuhe4xDX0jnxa7ThRTHePJ2fp67SMYm0xzdf9jIKMtINiWToZyLrI3UVHPXx
         fs/lniUSQg+g8rqapedR7y/egE+6IELn6KYswC1bCr+B4rNiflthTQmlnt+iaCJmqKgy
         HY5XRj3gOZntbNxbolr2pdSDgPTQSWFkl0ryJV5n7CAgD8M5ZqQ8pCXEobgL1uRwRbl7
         fIKALARZFD3LTmtuAe55nYc3PECF+vuPLgPTG5qPq8Ge8HdhC4K2mmNxZYqJRh+ld8Ml
         p2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUVN+oE/7GorZ+EXfOkEs4FslWfTQrHNBdiZDmttCgu1gAM48nN46OlC3rV07m6Cs49jkvf62vvWmKHLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJPzF9JoK3PYFUZu5+su0OZhuEWIA2Ut7plYJ4EqIZ4rzoS2p
	yHScqsu5F8w3EXMCxeQ/jzbbzse5A4y3P/h4k5rwsgjnWI9tuRw5BPFZrBOVX4FCVfrJdpLg1Lq
	ZiD7qz+eZuNJAlG+yIfCoMHhn590hBslhckQkcX81OnCV5erqIKAR0BfK925K8efmcg==
X-Gm-Gg: ATEYQzzUZd8qqwsyFF4uV+IFYGov7rcsenwFeUbyJBVewcWnB1hDdYxV3eexU7FHOTY
	Uq5YbsKTUlanfAuYjqpQ2JZSHVi6QDt+1sHFnxZoGKFdHldIFI80f1Ws2qwGEQInkqo9dL2jXpk
	ya6df2fXPY3BNw20I6OJ/dti4sFXVpeuvLPY4mJ97tDfAsPv+4ai2t9dqA07Im8wf6gFtoXrwiD
	p034MPjqXKQOyNm8kq+ZlAbSaj2CDdk7kj3HM/ORwVaPQvnUizwX/SWSgbq6QoCFm5KxZFrlZsb
	jiqgSs9DXBay/d0dFioqKbQrZ9IX1Bd7SDTVFniQKfEGHlLzQjYUocXGtEveW+clkIrYd1Vu0KG
	0PvdptIQZQvdnP+8jb0/HBYJ3X1W6eYt+GW3tOiZjqaxz7qMqVxCpLjm4
X-Received: by 2002:a05:693c:630c:b0:2bd:f95b:445c with SMTP id 5a478bee46e88-2bdf96a9f26mr3759771eec.33.1772561018692;
        Tue, 03 Mar 2026 10:03:38 -0800 (PST)
X-Received: by 2002:a05:693c:630c:b0:2bd:f95b:445c with SMTP id 5a478bee46e88-2bdf96a9f26mr3759741eec.33.1772561018027;
        Tue, 03 Mar 2026 10:03:38 -0800 (PST)
Received: from [172.20.10.12] ([172.56.179.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cefd7esm15182247eec.9.2026.03.03.10.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:03:37 -0800 (PST)
Message-ID: <d18ea7aa-67e8-4f8b-b2b3-0a7499ec836e@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:03:35 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@nxsw.ie>, Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NSBTYWx0ZWRfX6If676jgoAHz
 kA4JcWKuUxLa1oIOvDYfT0lTTCNqP7s82zwXtgOcDzMvPT6eEphwEuPDozGlVFfcIKbTqU71FXW
 SEe5EBMOSNbefwXUcAX7IlMXXCvt+Sgb6P9PnilqtJ74xLaPaTX6eB3UeYGpgr+iLWwLFpta2tU
 q4iUrfN2le2ZfFzd+6id5IU8etdT26C0iEMIjq0VeS6zk3x1EDKyS7LnJM0dhYXJZXcgjkfyiAj
 tHcI/CNrAhuNptdCIPot+xEAoElBmuZUybhO8QhJn8ZeHiKv4rpPbSXiX+n5WnTQhrAIcQZ7Oti
 5kg3YdEWN7FC/m7VE13Ec9RoiBehvGSFYtBTZU5PfRPhuO5UdQ91mGJOSAxD/unDQyiIIxHjss5
 kEoBjapR/KKGcdroLtcIpsGGRAaIOriZWECdq4M9mX9dqBxuGcd3mNPSZMaE/pVxCOkV/RZfk0h
 O6Oz2ZmbjaAlk8YlW+A==
X-Proofpoint-ORIG-GUID: L4lJ_ofu64maTI6VcefE_iDBxGM51b18
X-Proofpoint-GUID: L4lJ_ofu64maTI6VcefE_iDBxGM51b18
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7227b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=393jXSRlBufqMOIp+yiRFw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gQ32FRLzBq-2T08LLFUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030145
X-Rspamd-Queue-Id: F18C61F4FA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54384-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 1:30 AM, Bryan O'Donoghue wrote:
> On 03/03/2026 09:27, Bryan O'Donoghue wrote:
>> - MXA - first time I've heard of this rail, from memory I don't remember
>>           having seen this in ipcat when I could do so.
> 
> Yeah no MXA isn't a required vote.
> 
> https://lore.kernel.org/linux-arm-msm/9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com/
If I am not wrong, CAMCC only enables the power domains that source the 
CAMCC block and it's register access. And for that, it only needs those 
power domains to be just enabled without any performance vote. Based on 
her comment, if MXA is always enabled (at min level), probably CAMCC 
driver doesn't need to enable or scale it explicitly. However, the 
camera devices that actually depend on this power domain for their core 
functionality need to scale this per the core clock corner. I can double 
check though.
> 
> ---
> bod
> 
Thanks,
Vijay.


