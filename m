Return-Path: <linux-media+bounces-54247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAsNDkQ/pmkZNAAAu9opvQ
	(envelope-from <linux-media+bounces-54247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 02:54:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1471E7D94
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 02:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA92330F43B8
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 01:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F3F374E46;
	Tue,  3 Mar 2026 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IcH7eM4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brnvyqn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB7373C0A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 01:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502696; cv=none; b=qXtkUhc3ESA/ko4nTLii4VWseMuJLBKKsKWfbOeAPGMR8U3cDgrgRWNaDIbJHoyGXeCd/J7andlsDVwelql6qhsda3j0iBzFR18OLOE/YV2WFkgdhOnQxvi+dx0VB/Vgm1g9vvAG5p2A2GaeKmixNpMJR5TZWk07kG3K7lVY13s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502696; c=relaxed/simple;
	bh=X+JpqrDb7YPTN3ijWsZpIVbwXj6lVqWIUDQR6XcxyO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5RvexIGAl9E1+mvwkjC53P+suHQ3GttUFiDK3gaRF/JF/iuV8h3Npu50njcviTjIT7LD+JWUS5UE9vjmKB8IabTTezwYlX0Wtf0gnA1TWAZ3PkfjsBDCeXRME/0Z9Ow4njG2JnVti/OPeDf8uWEn7LNKijLoPgv9b2GtGsBv2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IcH7eM4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brnvyqn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6230ZI6v3753104
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 01:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pw3TuhYPeUpbqxCk25aiSvVfe7dHHnXwYTLUytizRcI=; b=IcH7eM4X5rHy90TW
	yE4dWPRzQCb+I1V4pP0eMQy1iZSdagLEHDzznU96ZPe5CHGVpsTRScYiI2cmRRJM
	DGxnMb3QmpAuEl9Bm1x0awCvAyWJTzh9MnLgNObyfQaatIoXvltbB+N1iu9dc+1I
	CUpd0NlGmBRbJaoZqP9NUH77N1N+IbVHlO2DgoET/CYIpzZQeIGTWpfX/nhKUoHi
	KNarwrrvQdfcc1cF79pYqKBGEfupHDJzp/HUn3OPwMPnf1B87EYX/InptpqP43xA
	L5C85UO7JaggWAjmDmTS0B20/2ZI1LW4Pouwx8GVf59bltWiPn42Oj2HO7uDwCic
	fWSLIA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kqb5h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:51:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127337c8e52so11030928c88.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 17:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772502692; x=1773107492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw3TuhYPeUpbqxCk25aiSvVfe7dHHnXwYTLUytizRcI=;
        b=brnvyqn2mamgdMwCbZ3maqi6eehhoXdptbe2PLCXtdnLgL30neAeVq0JFYdkRiI+sx
         lAHprFl8A6HwSrMYID6QPDttePcShRDUcePlN+gttLfbB9niytqDvNqZJmjXpmVZquau
         2jrszf+qTfESpvRRmP328noxApiltWMtr4rpWWuRVNvZtjf/sXHqAoSny8D++bmyRf2i
         JosMoEF4lgU/UfkKudzFLIQLVHnqXElrEsViYy02WdhhkaLsK/BbuHKb7nlpd38MGRQb
         3GeyfY2zuVK8XnbvSu6Yw8wKngn14xDSD/YLNG+MPA33MD0qLRENUMo7KHiXdVi3HhlD
         fLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772502692; x=1773107492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pw3TuhYPeUpbqxCk25aiSvVfe7dHHnXwYTLUytizRcI=;
        b=FGvVs/hWBaukV9iTWmTZ1Q8rrffQrXuJyITia6+G4DGH//DxHPBb1oU9JqpJrIYEx0
         rxwewkDyy5UVC5FUDn+p3FhjUHyamjDXBW6warDBEEPZGIdrbP7c+smw02QRmGoEIGtN
         tR7f1ftUGLzpSUZfSmhmDUp7nXuMfa6+WTK+YET7nBaJiHhjbAJKKVKje3WwWfsNGq3N
         cfcdPACd2JhhbcXnM3NMBCVrq/B3e6Xyq/DobdjhigbERrM9r2qzybtxHB3Hedxvv0bl
         f9SSjNN2QGBqIw7huxvo+I7GVmhv9Vot7cNSYp2auqcAyNLGv6H50sLcWuBtxOyLSvQe
         w6hg==
X-Forwarded-Encrypted: i=1; AJvYcCVx4xZPGTvDN3gp9IUFbAmBRnWvmNKoxnaMUDg3vX517C4GuogWI/+hG6hCQvyPkwVuMp0hInvhbJo5mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaC8FEcj1MRh6N423mfAAb84rpv4AvVf3d2E0538k9BdE9kn6Y
	e3cyMkyOzyCC+fBqYAFJgQXM4UH80rCqFRdHmA+fCV/qKIH0dI56L0Y2vfk4/Bb7IpcJwS4kkKz
	CEL2gbEF6pghBd0Vb6nwp29dYXFVOol+Nh3WFpzlbATpeAMvuWdM03GLLIFFdcNKbEw==
X-Gm-Gg: ATEYQzwNEuw9C5zcEEKgZKmHOlFkGPlXjhKtaL2Zdj4lTrEuq+t0XqbwyZNKrJihmd5
	1s8H+ojD+32Xumteb1XIXjeO/WF4ljDQnf+PrkTXvFrMK6EOMkAJ79GrInWYaf6RX8wtcBSVMAV
	U6mCG3YcLs0/fxV6A5bTv1JmuWlgQt7lheQ5f6PW4kLPHeTj5hLf19WfaXR1MU4arda/Gxq/fon
	fADab6GYqv++megmuXC/oIaEUvDOZ9BPl1vCCWjneDX1ou3u0kEenySkSdVdvExnuK/AXmPJr/8
	D0mGIn/vDyqiTeGskS5lP2l4h8f19binQIir0GEsOnFxYtEHkaS6voGZznDd0h8WF84/ydpjjGu
	iap1adU3Uu5ldHeo6qe20eWvhyLbmqwHfpyph03HGit4uxFRiiE0H
X-Received: by 2002:a05:7022:4584:b0:119:e56b:9590 with SMTP id a92af1059eb24-1278fcf8749mr7790461c88.21.1772502692023;
        Mon, 02 Mar 2026 17:51:32 -0800 (PST)
X-Received: by 2002:a05:7022:4584:b0:119:e56b:9590 with SMTP id a92af1059eb24-1278fcf8749mr7790446c88.21.1772502691373;
        Mon, 02 Mar 2026 17:51:31 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1279cbd1993sm6629621c88.2.2026.03.02.17.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 17:51:30 -0800 (PST)
Message-ID: <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 17:51:24 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 22snpOuc88CnnQ9Nfx8rjtzEnFOp_d-I
X-Proofpoint-GUID: 22snpOuc88CnnQ9Nfx8rjtzEnFOp_d-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwNiBTYWx0ZWRfX/9rK3WLadGqO
 CmFOvoL9mu3z1sieIv1Y50/wkJ4Iemv5iEoVbF3uWmHKNeMPciy6Zi9YIkfIItirDo79uf29MFa
 HSNdg15y5x4k6Zpb990rezFvjlDpz9eUnvIutLjFbYPO5IWSpfl2iMqzDlQra8Wdt6RR2MmHpGU
 Rq++cCDHx1TdYPjYYDKnympQNu15O+80kPX8w12p7wVka5eE82nJQCKvoNfy6aOsQRjTP5QAA28
 eaGGe2ab+4jCEUz06tYCiX9q52tau4IcyMCCdfp0CmGUoXLdxg3MD8GFMWMZs82+2M08aHP3aSS
 OroUeFs6x+ZWIkKsRTXsl+zlj8KVsSZnDvSp2ApmeSvAvjKpvnhBrJQb6FRcUQyCJICbhgV1Lg1
 M3NaKAY+UHPwGLAX1y8PPTkx2MUO3OZ0epituR/B8DlmPSO7xKYiaMwXD8ocdt4mKkSGS/Q3F0G
 PYYQ/MoXzMU7Cu4TukQ==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a63ea6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=ZuF4YGRwA1bEcIVO1K4A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030006
X-Rspamd-Queue-Id: AE1471E7D94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54247-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ace4000:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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

Hi Bryan,

On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
> have their own pinouts on the SoC as well as their own individual voltage
> rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 +++++++++++++++++++++
>   1 file changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..c937d26ccbda9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: csiphy
> +      - const: csiphy_timer
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  vdda-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - vdda-0p8-supply
> +  - vdda-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    csiphy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +        clock-names = "csiphy",
> +                      "csiphy_timer",
> +                      "camnoc_axi",
> +                      "cpas_ahb";
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
As we are cleaning up the PHY device nodes, we should consider fixing 
the power domains as well. Although TOP GDSC is defined as a power 
domain, it is not the power source for the PHY devices. Rather, it is 
the MMCX, MXC and optionally MXA based on the architecture (Refer to 
'Voltage rail' column for PHY clocks in IPCAT). There is no
parent-child relationship between the TOP GDSC and these in the clock 
driver and it was just working as the required power rails are getting 
enabled by/for other MM devices.
> +
> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +    };
> +
> +    csiphy_opp_table: opp-table-csiphy {
> +        compatible = "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>;
> +        };
> +    };
> 
Thanks,
Vijay.

