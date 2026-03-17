Return-Path: <linux-media+bounces-56123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAbMFyG5uWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:27:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D92DC2B23FF
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C31D33070B18
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9791D387354;
	Tue, 17 Mar 2026 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EafpF6VG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5q/Q427"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FA337D131
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779113; cv=none; b=pZkH4PuP921+0uGahJUmgRbuYCh8pBGSMviO/zjaSnsZIEa7+LU53UjD+Va6ePmknLkEwXxZ3Kl6kL9DXDl39rUMb3ezHVIzmDYM1FmA8Cr1QebSKTxJLfn0CwuC/ZD2kdQls/tmVK7VyLXEOdHaPX55ZXKHjzlVVy5ETO6hQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779113; c=relaxed/simple;
	bh=FXPrAptZbKbJgYhpXOo04M5q5MKfzmnXxEIleDkGkJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZ2gDiOCJ4udfd5AkXY46YhZCyv5N6NvQHCpVGPkGhC5MHFuSyGKXsAWdugD0dKnPgn+z1Kl1RtJhNeveVoO9kfTTepmABmoh9w1cS2gkCNGVpWIHiut5+6082ioJ6p4rlConvHNh83pXc+VU5w6wqedSIDCH52OdZDyXtfSF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EafpF6VG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5q/Q427; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJDLW2730120
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GpbFY1gjKra/+bdktVPmJK8BdIX5dAmrnofgrI5SFpY=; b=EafpF6VGrZJ5QKDM
	DW+oQbHSm8fFBlteSX42GqhhCoLCuBxfvGH67lOfq0igWX9yuAJGl4bmqWGraW4a
	xE+dgCvOI0R0lehs8JTZ8pMzJMJWnNJR+7gRdmO4aW/TqGyR4ZOAdaXcsEujY5YO
	olNF5FdCM6mC9UxLcMdqUPM7hDUZ7mwY0qnFhTu6+8skxlti7ZQXrkz8wGFAVNeh
	UXWGFcJfdUE2q4hmoqHtmmbUyQdsUWt/zh+dbegDEml6aEUwe+mFnXscqt4xm5Ml
	iZH6RpEqI30PxIZIHxpvr8dUzVaNMOXX2gws8POb8Mbolju8E/SqKChEDmgIApst
	NXW5Eg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjsg10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:25:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so4906215eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773779110; x=1774383910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpbFY1gjKra/+bdktVPmJK8BdIX5dAmrnofgrI5SFpY=;
        b=i5q/Q427/u4Dj2NS17lbccUNoOpWayT92lIij9eDjKAG2lbflaT6k73CaxLPPsj2P0
         AUfHQObSzASxa3LBUhTkEbuNxFi1knFVOEfpkn5giJiUZdZdGmbXaSMani8/E3XFutGh
         PqmyFuSaO/3NZ2noJlPBQl0hMAAICCGWNNeAxeNiIssMr49E3yTVNrxP+HeMH39JkhFw
         NWuboanB5OVmDNgpvRTq3qJH/COtTAPxnY+80r+CUer4ceLOgpLmXMjCpvDPomXRx7Kf
         m/HpUyZ1cxShvVDAx8Qdn/KgsEnEL3/jAs4E7za4VlAgjhmIKNilOSiAdkyZL/LWv6cy
         vufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779110; x=1774383910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpbFY1gjKra/+bdktVPmJK8BdIX5dAmrnofgrI5SFpY=;
        b=ZNwb1fBieSWbPB5ZkM2cNWrArSrMkh9wOhxS0KRfPluMdOGwvhqcdnnXASiQXDwylj
         ZyWSUNDLoDtmFlyT5ZeRwFCihwP/XVURTfxkkSpHDIRIhEnpMApY4NajhklucimYuvbF
         wTJbtXkEC6Shl94WiWywgB/NAuVZYPN4G/24bQO150Pc6SQdjlL6ilA05K2UA5HsJwl+
         JhX/ECZA0HYC0Q+VOJp4m/HU6nrS3y7+1jWX2vTZS5cAp+PNxVCZgV6YzZYiLe3tRhBP
         Rax6X7V4Q+ZKDvyi4kJXq6tQJn2pWyZajEZyfdhZWwqlF1+FPl4+eXGFezEr/ddmpR/b
         fyiw==
X-Forwarded-Encrypted: i=1; AJvYcCWh9xieBiH2cAo70GcJW9d+DViLqQLmvqao3hkT4zyCk2oywbUGm0ZBS9Kq0EP11XZKRCDyQpSVtUQ3YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxask5ZcIzSiZhnXEDCT2zZ5zuZAga11kVKbMDwS1NTi9vyO3nN
	jLStThdVx5QVCW1U0D6vSPFhRTqAylYmmsgdombHYWJgym+2TerlLX+7/zZMywu5Tagn+O1fjuH
	Ls/sDv7zMzuCg2mXpn06u8vaCDz73+N0O46AX9rGCZri+5f7WCVPdgLDBkv1ZFStyKg==
X-Gm-Gg: ATEYQzzU/4NXVeGLkTf/Dqf8x1p+7ICAdwiUD7nrgaD9iq/rVxQfIeSD6YOF4bGVZTW
	i+NRiiWUaDor1IB7jMz3GFeenEDmw/jAasEdjM1u85Q12jjZimBsz/s9AM89DZwaHLgyW9sLdXO
	E5930zAbKT1PeuySbOJ/1RaFYe8d600HSU2TaU5m081hksZdpwupAJzGPqgsfz7T4lG3h+0hUjT
	G26iJpdHz2V4ZKWDvF7p6KbvEIVGHHPefMQfwwceuN5nT0aDHI/GaFuCQIM3hX3ElmQWVQD0sm1
	52R1UTLvfAq9L/nRzz7BgrHAPOJ+uw7jVMgjXqDgT5n6t8nK6UwnaxNdAwxHLygv9RncNyFCyws
	PfFDvACPruhc6VTZhbReZcQYUGrqenJiY1l8MPd47evsT56BcnBbnyNVQHqghFe28tFe5HpM01H
	Jb85YN
X-Received: by 2002:a05:7300:a54b:b0:2be:80c4:2c8c with SMTP id 5a478bee46e88-2c0e4ffa9d0mr398504eec.8.1773779109511;
        Tue, 17 Mar 2026 13:25:09 -0700 (PDT)
X-Received: by 2002:a05:7300:a54b:b0:2be:80c4:2c8c with SMTP id 5a478bee46e88-2c0e4ffa9d0mr398479eec.8.1773779108900;
        Tue, 17 Mar 2026 13:25:08 -0700 (PDT)
Received: from [10.62.37.228] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm1134929eec.24.2026.03.17.13.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:25:08 -0700 (PDT)
Message-ID: <4afceefe-8053-4c10-8595-39dab9379aab@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:25:07 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
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
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <3VqSGUgMUKaCja5WYOrOP8nJ_mw_eDPdItA8d1CvqUg4ASPS5IUc_aT2E-XIo0YmnYo8QltXVw8_6NDxtdqGGw==@protonmail.internalid>
 <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
 <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3OSBTYWx0ZWRfX8dVr8heMivJq
 F/Ts5/Pa7XA5L6I9kDwexMXhTIfbaIXZw57S2Uqq9Zgergp53puOAzgErm8gsEao0Bg8aWGjRem
 SS9IHMJ+Bll1M65LkjywRGja8psxPt1RpBDaYO6eveb83HtsRzu8btBOfRkwDztf5fedD1LKDWS
 wUJrdcISEZdfm5xq7dmmfHFIEyffGfyaI+bQgkHbKVxgXOD8/qn2CqFkyivWW8Fq4UrUX4qsiZk
 TPKkKp+QcvgSB9KTpGwXM+btTmSKtPE0brd0uXmjIgYOtNX7RhwVuUnLVWRI7T5KKf2tp5EVpHK
 /zZwibVbaBfle7A5ymh3itvZbuzjunDUeAD0RJvs70oaHnV5KIQc9SJLCwCNECH/UND91nRRxoy
 xKsaeXY7HusYSDEl5BPVsr6mzqTvCsBHOwU58YU6EDPZ2QWwt2eaM8BfrbrB7yPL65IR2dR2yND
 qWssG0Py7yoNIuZAZHA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b9b8a6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=CIW99FJ8g63gKaA5L-sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JDUcs3stvkXrWHo2exKXg2cl0ARB_Ivb
X-Proofpoint-GUID: JDUcs3stvkXrWHo2exKXg2cl0ARB_Ivb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170179
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
	TAGGED_FROM(0.00)[bounces-56123-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,devicetree.org:url,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ace4000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D92DC2B23FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 10:26 PM, Bryan O'Donoghue wrote:
> On 16/03/2026 21:31, Vijay Kumar Tumati wrote:
>> Hi Bryan,
>>
>> On 3/15/2026 4:52 PM, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI 
>>> CSI2
>>> PHY devices.
>>>
>>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>>> have their own pinouts on the SoC as well as their own individual 
>>> voltage
>>> rails.
>>>
>>> The need to model voltage rails on a per-PHY basis leads us to define
>>> CSIPHY devices as individual nodes.
>>>
>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>
>>> 1. The ability to define on a per-PHY basis voltage rails.
>>> 2. The ability to require those voltage.
>>>
>>> We have had a complete bodge upstream for this where a single set of
>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>
>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI 
>>> bus in
>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++ 
>>> ++++++++++++
>>>    1 file changed, 133 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>> csi2-phy.yaml
>>> new file mode 100644
>>> index 0000000000000..b83c2d65ebc6e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -0,0 +1,133 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm CSI2 PHY
>>> +
>>> +maintainers:
>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>> +
>>> +description:
>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 
>>> sensors
>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and 
>>> D-PHY
>>> +  modes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,x1e80100-csi2-phy
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 4
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: csiphy
>>> +      - const: csiphy_timer
>>> +      - const: camnoc_axi
>>> +      - const: cpas_ahb
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: TITAN TOP GDSC
>>> +      - description: MXC or MXA voltage rail
>> Would it be better to provision MXA or MXC as an additional optional
>> power domain? I see 'cam_cc_cphy_rx_clk_src', the parent of all CSIPHYx
>> clocks, need all three power domains on this chipset.
> 
> I don't think this should be optional. Have the dts point to an "mx" 
> power-domain and then select which one is right for a PHY MX/MXA or MXC.
> 
> Your worst case here is some future PHY which has more or fewer PDs 
> which is then either a special case in this file or a whole new file for 
> that compat.
> 
I think it is the case on x1e* as well, Bryan.
>>> +      - description: MMCX voltage rail
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: top
>>> +      - const: mx
>>> +      - const: mmcx
>>> +
>>> +  vdda-0p8-supply:
>>> +    description: Phandle to a 0.8V regulator supply to a PHY.
>>> +
>>> +  vdda-1p2-supply:
>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#phy-cells"
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - operating-points-v2
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - vdda-0p8-supply
>>> +  - vdda-1p2-supply
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>> +    #include <dt-bindings/phy/phy.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    csiphy@ace4000 {
>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>> +        reg = <0x0ace4000 0x2000>;
>>> +        #phy-cells = <1>;
>>> +
>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>>> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
>>> +        clock-names = "csiphy",
>>> +                      "csiphy_timer",
>>> +                      "camnoc_axi",
>>> +                      "cpas_ahb";
>> Although it's not a concern from my side, just want to be explicitly
>> sure that everyone is happy with the clock names, just to avoid any
>> changes later on when other modules are separated out.
> 
> These are the names we already use in CAMSS so ... they're good enough 
> to start from.
> 
Sure, FYI: Dmitry, Konrad.
>>> +
>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>> +
>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
>>> +                        <&rpmhpd RPMHPD_MX>,
>>> +                        <&rpmhpd RPMHPD_MMCX>;
>>> +        power-domain-names = "top",
>>> +                             "mx",
>>> +                             "mmcx";
>>> +
>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>> +    };
>>> +
>>> +    csiphy_opp_table: opp-table {
>>> +        compatible = "operating-points-v2";
>>> +
>>> +        opp-300000000 {
>>> +            opp-hz = /bits/ 64 <300000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>> +        };
>>> +
>>> +        opp-400000000 {
>>> +            opp-hz = /bits/ 64 <400000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>> +                            <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +
>>> +        opp-480000000 {
>>> +            opp-hz = /bits/ 64 <480000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>> +                            <&rpmhpd_opp_low_svs>;
>> 480mhz should be svs?
> 
> Yes you're right thanks for spotting.
> 
>>> +        };
>>> +    };
>>>
>> Thanks,
>> Vijay.
> 
Thanks,
Vijay.


