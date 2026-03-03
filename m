Return-Path: <linux-media+bounces-54386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLNqCqYjp2mMegAAu9opvQ
	(envelope-from <linux-media+bounces-54386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:08:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1E1F4FD9
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 19:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6090330419BE
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 18:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A91381B16;
	Tue,  3 Mar 2026 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GK7k/Foy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy2lvuhh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E35381AF8
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 18:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561310; cv=none; b=VhFKSdMgNdngdGqOqnlqtjyZxhBjgLqmZNWi31jkx1lBWmKhtTTIeADO9Jm23xcP4WtWFCfp1BXL0OH7cX82aViPe7KoyaOUYUQzpeni+OqacKizxZSlDKoowQOOieFCVDe52H8QZKbXC0Vm0+2JyO2Eyrx6f/AbulFykpAMihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561310; c=relaxed/simple;
	bh=tzmmk66jm9OcvLxjaMM98eQY6gmE4fUkAHYZhWSXAF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcmTxlFvYSwR2kE5ni09MfBjxHgOQ81Vy6E9+WZoxGUmlpnoDhZrOYQv1gMaFc5v5shwv9m/Bu22bqaKUCpXQuoyHJW6w62hxkpOrQBOVI2qQIEnYekmxnlMMgzcd6b1p3CoxWAo0ajX+ztl/UgsSU3dMuiUaIFuL97jBzHXozc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GK7k/Foy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy2lvuhh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0XWs3238644
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 18:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwy8L2ZRuW57YLR9RZEkBm6klL1WB8BD8yUqyTZrSMQ=; b=GK7k/Foy3nm6mpH2
	yCfZVX5nzCy67Fhii3BeZDlHnoS58JQjSxopk9MNaUyZxOEOT1N7yHjPxM2BhCME
	+LxJm5CP82yCkO93Lsr/6aHyDo5hE1l+hooxnqf3hYc8VSDfim3UotBqAQIybsv4
	c3G/pHw5f6zabMY4LQDU5RLRVMLhh8WKoOYrCziWbWVFm001TZz6V+wd8BW89HR7
	Z4Xdb01MpT5siJtJBGC9xtN9RtdRJ6VJhrZ1k9t/swCw+pWpthziJWd/jhMVPap9
	i+qAvaD7ySIyDZeiUu1n5khdlRsPrQhl2C0nO4Oi2xt7YubRFYilNqoL7S6v1J5S
	2h2laA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu9ph5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 18:08:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so2722927eec.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772561307; x=1773166107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jwy8L2ZRuW57YLR9RZEkBm6klL1WB8BD8yUqyTZrSMQ=;
        b=Uy2lvuhhkUdeG3E2FzHlinLE1zD8TFuV/rWmSBFGLmtTR3uVxuuQSEzuGG5/lfJIPd
         WHP7Xmpm/BHJcLt65Jch4a0XJUaCoRblrnt7Dohsx1sela+KFnk/22WItdzRviXqXIkT
         wyqem7OG6cWPC8TjSOjNJ/VsXbPDw6DKRp+pp2MFx74FWoXtEZbdinomkNeKKwobznmV
         97I88jkPZXq9lNxALIN9hTn0DKd1zp/VIUQgIfftliLg6AC2zBQ2cfsT2PGHs7TEIXLn
         0zw740iGm/MD9S7khLoMGzndbvhcgRd//fIF2fDLTBfQw0kjenVtYLNUbGIQJ9h4n9Mr
         Lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772561307; x=1773166107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jwy8L2ZRuW57YLR9RZEkBm6klL1WB8BD8yUqyTZrSMQ=;
        b=WhQEqpTswlY39RoL0dG62ZnTli2a5n3fHZ1y5yEqpsjIT099P2L+qioOu72rY6mt+z
         SywrdpBmrpMKlbN27Yf3FNoXsCQuL5ALGIHqtMvDUgPX33elCMXZF++pGkTHXTV7T7iU
         QebqpVdOIaNZxuQKtsSfapoSlMZUG8yZ5+RgQCE0W0/vMBzbMTZF7NAtKIV6k0j5XQeF
         mYbfBNo0s7kyX33HKu9DM7nb9sHvkOgkuJ3FoOXbrh5cQWwLoFnfeCZR5F2ifwYyBEFt
         8D3uUHQ+9lxfmsx5XC88BwPB4IpwAQj8nZrZ/dSK7pEPZCKh8aNmBdcXOIhXRhB3RQod
         aQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkfHtcAtUkGcQ+MHahNBRqjI6RoutW+KIVbs+SLnuJmqsckzAw0w6+MIpKOgdfyNI0kQai34tjd4LTrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN8mh2Abdl1Jh2145c1/AIuEv/Zxb1if4EJ0OcxUY6U2or/aZo
	VNhW87zP9Zsk/bDJ5C9HT8mfckaoWaJ2fQ2juYrge9Cp2O7KlSvxQky97gn3+Q6W+N5lt/9TKJD
	DZQtrqTRUsSQ42yqanSVURMWtZ+8AkYTHxeQyDNKDa7g+f/ODukXdfybVQcJKBd3WYw==
X-Gm-Gg: ATEYQzzerN4zdBQAcbfw1hYCPVYJHN6oZ7NNkfjOe4WbZoyK55sbiwVDy7DG+SjL0af
	S3S/Hz8Ya1hGuTrEW049WfV1A8FAGVaBJ5D6TFRqjqJJm6XrARXxdVxkLHCWx8gCNE+7G7FWbxF
	6e5GhMeI+McfPBCOUnB0l+gd1xi2n5GICb8sxVunOpHlUReWjZkGOcNhZjeTeomTsckHTYZuRh9
	Kl8ntixqx5t+/A/VuKEoM6toFYBetQUl1Rk3tWa9s0frwbLrxBdtMG4+dY+IS3y3DtpZ2cNpd5/
	hOfKY7mXiYyK1nZhmigsFxW70muLbMcDAa7OFyV6tgkqZt6k0v/7E2r7zBZftQLgmnNDSDvQPuN
	mc3xxOZwaYfv6l4HCUs1wC3jz3Z0Ge5gG6D9Pjv8QdCm8LFagfktn6QMK
X-Received: by 2002:a05:7301:fa10:b0:2b8:6896:d0e6 with SMTP id 5a478bee46e88-2be2342a21cmr1055011eec.7.1772561306663;
        Tue, 03 Mar 2026 10:08:26 -0800 (PST)
X-Received: by 2002:a05:7301:fa10:b0:2b8:6896:d0e6 with SMTP id 5a478bee46e88-2be2342a21cmr1054995eec.7.1772561306037;
        Tue, 03 Mar 2026 10:08:26 -0800 (PST)
Received: from [172.20.10.12] ([172.56.179.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2afa297asm515339eec.23.2026.03.03.10.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:08:25 -0800 (PST)
Message-ID: <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:08:23 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
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
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XK7_yCMwV7qKX2qUM-huvaj6rfIBKy4W
X-Proofpoint-ORIG-GUID: XK7_yCMwV7qKX2qUM-huvaj6rfIBKy4W
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7239c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=393jXSRlBufqMOIp+yiRFw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=63XN3Wpy_Vpkm10PPgsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NSBTYWx0ZWRfX/kwbFGO3lzgu
 BXb7Y7vZKf3OKOzJLeRaRF3usRIl1EQTfICC3d7vBPmyrNu9qKuYyQ5/TWEKsznfMnm4r8aYRKA
 tIqmFymv9GgCjMujEtAyjfX/I0XSBSxNWaTSE0deISY1+JFom6Ybt01lg93z2YIFfNmA9U86jMp
 MoSh5DUB8u4uBO6hbIb28BpRmTk/v7HSACCVbl36KfCmsIIc++NAvd6fRcJWNcr5e5rIP2ktN83
 nzIBRa51Yq1NDhVTy49scY9valfMbMEPbiZFi8cD0kJWcsW4OPD2MAhRHCU+ax/L1hWRYu62xty
 dvGj58tDsVWLsNnOe4/o7925+3WS0o1AUzwOWX65gaGzHy0r7jG2oz1H1FFztjtsz+xobLxI+nz
 7w4AH3Ruj4mKJhp4WtnxCiyhGqCabPduDsi3ZgKy/9P4PeDA3RpgFLwg+TivtFxDNHtgG9G5o3L
 50Q+Za9U3zpwigGaKkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030145
X-Rspamd-Queue-Id: B8E1E1F4FD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54386-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,devicetree.org:url,ace4000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 1:27 AM, Bryan O'Donoghue wrote:
> On 03/03/2026 01:51, Vijay Kumar Tumati wrote:
>> Hi Bryan,
>>
>> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
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
>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 +++++++++ 
>>> ++++++++++++
>>>    1 file changed, 114 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>> csi2-phy.yaml
>>> new file mode 100644
>>> index 0000000000000..c937d26ccbda9
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -0,0 +1,114 @@
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
>>> +    maxItems: 1
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
>>> +
>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>> +
>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> As we are cleaning up the PHY device nodes, we should consider fixing
>> the power domains as well. Although TOP GDSC is defined as a power
>> domain, it is not the power source for the PHY devices. Rather, it is
>> the MMCX, MXC and optionally MXA based on the architecture (Refer to
>> 'Voltage rail' column for PHY clocks in IPCAT). 
> 
> Feel free to send me a qcom laptop and I will :)
:)
> 
>  From memory though I _thought_ only the TOP was required for the PHY. 
> I'd be grateful if you could confirm yourself in ipcat.
> 
> - TITAN_TOP_GDSC
> - MXC
> - MMCX
> - MXA - first time I've heard of this rail, from memory I don't remember
>          having seen this in ipcat when I could do so.
MCX and MMCX are comminly required power domains across the PHYs but a 
subset of PHYs have the dependency on MXA.
> 
> There is no
>> parent-child relationship between the TOP GDSC and these in the clock
>> driver and it was just working as the required power rails are getting
>> enabled by/for other MM devices.
> 
> Well only the GDSC is supplied by the clock controller.
Right, GDSC is controlled by the CAMCC to suspend the subsystems. But 
the actual power supply and the voltage rails are under the control of 
the RPMH. So the clients need to enable and vote for the required perf 
corner as the core clocks scale up/down to be independent of the other 
subsystems sharing those voltage rails.
> 
>>> +
>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>> +    };
>>> +
>>> +    csiphy_opp_table: opp-table-csiphy {
>>> +        compatible = "operating-points-v2";
>>> +
>>> +        opp-300000000 {
>>> +            opp-hz = /bits/ 64 <300000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
>>> +        };
>>> +
>>> +        opp-400000000 {
>>> +            opp-hz = /bits/ 64 <400000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +
>>> +        opp-480000000 {
>>> +            opp-hz = /bits/ 64 <480000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +    };
>>>
>> Thanks,
>> Vijay.
> 
Thanks,
Vijay.

