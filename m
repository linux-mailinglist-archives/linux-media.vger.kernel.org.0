Return-Path: <linux-media+bounces-55982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLybH6p3uGn5dgEAu9opvQ
	(envelope-from <linux-media+bounces-55982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 22:35:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F902A1045
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 22:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E724D302FABF
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 21:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D69E365A1E;
	Mon, 16 Mar 2026 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lj6Vi201";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUsZ5/nh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABB34B434
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696704; cv=none; b=OLpcM8FKnbF6I4IJ/i5WxuAE7mAe8/4QRcGXomviosboipNX9eja9MZRpf6rjwvRqT70zi69E86sLky1d1mmvYxVRU9KxxdpfQFctteI5UyGUpFEGMBnzX+DO7Hs1P5oCI02CJyrYDQ5dpmZlKJ0+t7D8Y32LHSnnjv4pHlBrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696704; c=relaxed/simple;
	bh=IjdfbpR/GItXgOAV5vD1YoDI1bdHdY8JCyUTHWozK0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dP3iKvIH27QQsDH0ggeiAxDNBD+Pv1xLjmxyi8h/bywC+MyrVF0+JnhNuOnsOvSf7QTKKmJf0gLMehXvEf9w21Iip+DnPAI7DSZoNw2rU8l03UjIXHjMApve5PSuRj3W/3Cv7JGkwCDlCOkTORMNZpSnKk4NbqwDxkBPZablNHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lj6Vi201; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUsZ5/nh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GIKamN1428760
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 21:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84M66G2PwCIzVdx//9IgiXr4vtMOe8kaOEGL8EAmpMs=; b=Lj6Vi201pnCKOst3
	zmxGLVXvQypnr/F0TuAuo2fO/PHOzPv94HYyUBgFkbAoyvG9mObHExmVpD0TgMkT
	t2Yi7yasZLj3x5as70v3MYRWX5QqyCN8FrcSK3h6BEzpLiac4VDTWSivAwOiVFWV
	FlukTOkhJqFNpwsvNzBUDV0IPshHY6RjFrMkz0iEFN5bUic6kxU7Vc5K5gXEm6dW
	sQ7X7cMshIZBGwSr13eTBTdc/ibV6y0CeYrvWDkNwR28ot4HWsX0UN5Vfi+JvVvh
	3MmJfOshQl9tvb+muQ3R1Gal9dQN7f7fm/1TYlzS9X7o+EtDJ3tY4WIhLs3GgTf5
	tAXJPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99a1vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 21:31:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bea1ffd05bso4790241eec.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773696701; x=1774301501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84M66G2PwCIzVdx//9IgiXr4vtMOe8kaOEGL8EAmpMs=;
        b=dUsZ5/nhllC4ZKVYqqheWSMJQ6xO5jx2vsaj7CNelaUU5lJvrwuk2dUBEiRHPu2rtP
         +QrnkmZNkV11Gaj1F02XX9qyTpcLk12AatDwL8dIuXRWLtD+1a19Jo8Ft2YclzpLDmZA
         +qFWf4sLyVcIDrwT4DR40z7hVo16u9vw/V6inQaHF2x5OJbFXnjAZsoDO/EIIiLgsPdf
         aUJXX/+XzBcaJP7b63vB6B2quQh/Nb7pVlH0yI0eljPWpn8txF3/X9w+594hpQRoGkMz
         EV5BRGlLEXbwrVmy0DijmS5XpM0/a1UOWIz9Td5SxQtujVRzsRsAXyL70ERpte2JFPDZ
         wddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696701; x=1774301501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84M66G2PwCIzVdx//9IgiXr4vtMOe8kaOEGL8EAmpMs=;
        b=ZHt2dUUQpBGzy4vHiy5zxptug/7Tth1FJviNHkpBx/XH0YEGisBHrw/wGCJNwtzQro
         qatdb0a08qMGoEknBCvlCWYUinUc7by9RrN0DUTztug3E30jncrVe0+HFSlrZXxYzjJE
         0mjP6TuYWFXSiAdo62KZiSYz3V4fxTU9FtneicffTzB0oXx8QsqpFTLZtNgf24VW1Oty
         YRow40iIvN2O/DJQ3j+9Z+jrAdSJLwWIjs5b9k+p7/EGB5jjJVXLlVZThHL9jas82gf4
         qfs9F8lZ70Pz0zlDkm03JNoV73y34p3cKTLx+xODqX3uBnoan3tk/hTWDM23etoOyZ77
         z8dw==
X-Forwarded-Encrypted: i=1; AJvYcCXuzrRsqMj6vI/bbTeG4s7ooptEBBWxZD3APOUHPwXYFPdr2GAnDv7wAnAmPACGWTtuNgif5mMQ/7V8Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFSOv88EQuVZZ+eySf0sIjWR+MQTUlxlmJJ98Ix1Qm9OoXqNtl
	r6G6agQsv/OFWDKdtfUy/H4NQZ07gSWXt6IvoduiMwjuiEljHX2OoQcTCeX/tsM7CTHrEI8YrGK
	VAH77qj5fr8ALHMqsnt2vVlGGBkJGLpK9aJXqVW1lFFzFjm1euyq2YiHCdg8Zk/+08w==
X-Gm-Gg: ATEYQzwvcllhQ+xMnydsK+6mp+abPN55Z1Yu6FEmlbA7Ezg4y647Wl8TY65KK/eSOs6
	SuaQ2NTYQcg398q3sGVFtBnAOiDNEvHPwzaNIFx+6o6JrEQm3xY13a8+KRerhnPc64xPSO9eLJ/
	immqSO490kqC0ZwKYbNhRU9B2blniuxmVAy7c5p5Z8o0BVcQpIvkfDjnouzhhsPRe5OMbhcbA/P
	+n7z0S5Gii5c9QazEGQJe+7FBYRvbUeutbjbBjP9l0uGlCSPrJOmtOA/YlWfgdFScVwscvcopO0
	K2ZbonIxKKki6na+REGE1gVPFZl+nfEYQKTe1PQGthKTNoqeRuV5elZMmuDMLuF7/+8qH5C5YxH
	CNepcX1M+2WvKYo2T6mndoZcwUdPDBkH+l4Cq/7HMQ7Sc2aIIlxdY4yAHi8otwi8xYfo8jXg9yf
	OYLg==
X-Received: by 2002:a05:7022:6299:b0:119:e569:f615 with SMTP id a92af1059eb24-128f3d35f47mr7010884c88.14.1773696700804;
        Mon, 16 Mar 2026 14:31:40 -0700 (PDT)
X-Received: by 2002:a05:7022:6299:b0:119:e569:f615 with SMTP id a92af1059eb24-128f3d35f47mr7010861c88.14.1773696699781;
        Mon, 16 Mar 2026 14:31:39 -0700 (PDT)
Received: from [10.62.37.228] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62991c7sm13756734c88.5.2026.03.16.14.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 14:31:39 -0700 (PDT)
Message-ID: <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:31:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
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
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b876bd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=FiKLMzvizoLJB3YtxsEA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE3MyBTYWx0ZWRfX9+rv+HcaM6rH
 6YdCnN5g4yUleco2d8VP4xdCgkk7cFfT0V/0ox0ItJMvQRd4DxWEuU1hYJZkfcg6qagw41Pz99b
 XdkLaEfV6r1R59Yi0mGQJuw44+lsKVb+X/TVDpI9HILi8o/GKRxATW1v0W0hbD+vWSGw3hV3ThV
 SpgvUyFjNN0WtAFoUu9o2AHhfXBJwes9IaZ75ESjcIZa+K5rKsHhCP+VPlvPqtlCwWCAu4HunLn
 XTBDj5dcKFJmlsynYTxvWMarrCC+FVla14l4DBwMgGXOa41G8lZ+V5BgcALZp3l8xI+0jvXWKjR
 hoykT8bPWEc9JdlJRckegbMgmhb2MHbuBnlruCSRsi/GDmE/f2Z6Obki1n8A2ZGrmdvgc9zbRfx
 HzXINK+S9eRz/ytB+iyaxfnjzDTnOHO1MnqZ/rPB2ak+540mMY2D8qGmu2VBCxcoCnEBO3iLCdn
 taZkxJZ4EV/e4BjbZPg==
X-Proofpoint-ORIG-GUID: 8qlue9HCQ-ZGMgRrXMFV2SoSIV89p6HS
X-Proofpoint-GUID: 8qlue9HCQ-ZGMgRrXMFV2SoSIV89p6HS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160173
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55982-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0F902A1045
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On 3/15/2026 4:52 PM, Bryan O'Donoghue wrote:
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
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
>   1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..b83c2d65ebc6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,133 @@
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
> +    items:
> +      - description: TITAN TOP GDSC
> +      - description: MXC or MXA voltage rail
Would it be better to provision MXA or MXC as an additional optional 
power domain? I see 'cam_cc_cphy_rx_clk_src', the parent of all CSIPHYx 
clocks, need all three power domains on this chipset.
> +      - description: MMCX voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mx
> +      - const: mmcx
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
> +  - power-domain-names
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
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
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
Although it's not a concern from my side, just want to be explicitly 
sure that everyone is happy with the clock names, just to avoid any 
changes later on when other modules are separated out.
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "top",
> +                             "mx",
> +                             "mmcx";
> +
> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +    };
> +
> +    csiphy_opp_table: opp-table {
> +        compatible = "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
480mhz should be svs?
> +        };
> +    };
> 
Thanks,
Vijay.

