Return-Path: <linux-media+bounces-37722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B81B04B9B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 01:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BEEB3A344C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF10288C38;
	Mon, 14 Jul 2025 23:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jURD0LZm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326128853C
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534144; cv=none; b=pLt2M1LHH797KsMwj+yMni/KG7z9MiLxpKPeoT45rxk5g7CD1IH9uL1lB2QwE0L+sj8E4rLGp/vzVwQYNsn/wWs4kmFdIyUAMYYzanziXdTJjT3ooMgSgFm2bZfjydnKGVjKuKuIbWsDaWO9BVsvP5LKrDyQJtVNx8JCxzH3/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534144; c=relaxed/simple;
	bh=E34GzRFYdfrySXlFcB0d8ojEarEs4qpWI5cY2qlxFag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFXgWe60CZC6e/t/HVxZQkkZXbJ1T+YLp7m6ld1uhBwfEB1u+tjbkx0UbEGEhkVx5aOn1mv+3ifd/to7g5EmgvPM8mnO9cq2VBYyaqTKgnnBGVb77zuNw5aLlRGjLV2ifj5rij5RSpsx6H6aHEhZrkwHY2yEQ+QpeQvUr4YakM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jURD0LZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGSZFh012484
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G8XaE9jpkoyoM7NQruVh04oW
	JMDICv2TJP6E53Rgkkc=; b=jURD0LZmOZmkPi8PD/Vr0Z/omyQW06nyZbZ7xAuT
	bcMOLxBKkUg0rHbr1fw0jUjJ55ASZqUFf/rTLSxWXO46krDM5H6jJhkWA+/Bf+9Q
	z/5NJH7vYXrbHY9oLZQ7QnSbOMBvjfhK3yFkuOy4NPn6TZY+UhoO4CxjMMQFvhBK
	Jj4UP3CRs5yXoyepZwqaMLtOoq6c9hlvv4yMmPZYNr4ehEM20VX11awC6EB0hJV+
	i/mcBTMK9SkHi0K4NfNL1aEv3DVoNjWQkLeZP0O7CfySnlp93nW8BrFRspd7Nb+J
	a5OI52kKZV+GPVluNkxB6HJoaqRAZ6ZuEL0KvDlNXIYDvA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dygvat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:02:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e2e8a90a90so225163285a.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 16:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752534140; x=1753138940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8XaE9jpkoyoM7NQruVh04oWJMDICv2TJP6E53Rgkkc=;
        b=ZdtEEyYIWo6Air5NFgpQACt8QXmm5pa1+8K64orBH0DXFMkpMOomg12g8AY9YJtIVz
         yiZXCtzo5C2PjGplmKEOcSzpawKRzCYIuxp0ngQt8k475f8+uNrvy28fDVvaUSJKbp0b
         y2Y74xFcY0cGGxeUvN8FPjdpsHblLGvDBzd96V4QtwYO0L0gblOu9+05+NaSHjCnNFka
         +iyeHpoPpillcO5WDzIdiILEkEgvqgJOS3BKoSrpwWRPy49c8u98VKFI6NztUS1ryJu7
         lBBeAGAL5irLyHIJniCMi2upsLn5TEWCqH6yQqCPNVMGQuFc99oo5kckHZqEKUs32m4p
         ZWCg==
X-Forwarded-Encrypted: i=1; AJvYcCXeJ8WLuHf/VsK3tzw8oLy819WsGi5A2jxxvqFvM6I9ncPbBMGC6TWV8eLzDUtN7k0ifrM1JLZF14g/xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYdX32Aqrj5ICWYphrPkMBCyvsTsdgzNiGA3I53qPqJhBMuW1l
	z8Sjde3Ef90gtJ6w4fMjwAN4NjbvlPCfJ6NnHvIFYxnY86vXy6Zsz4dVf8m/J5UNM7bowL8+/NW
	DB2vwgbNOz3nTp9vkOKtnsmQq5wzNaQ7nAfOiLIfZhwxH4rz8pDjwB9uPKbrY/OpBGQ==
X-Gm-Gg: ASbGncuCCRZXMaPXcWt8HLGcw0PPNuauRinIQ0KYZ9clxQRKz5Oxcnooh4pcjrsPxyq
	938E5wncec6H32dB7sZRG1HPhl14tsxANzItUXSTetT4Ht/Y2Qh5gVkDGHVO6bTOFLYa9bgrjsK
	aT2MPRsbCgygTXnzuOgrMbjmBWKf1I+OPYql3RL0sA1Pf5D1x+afRMUmFz74FTwMCQw13o/LodP
	V5rdyVI4W1IzIYHTiEdrUSHS4UK7t0mrZxjqfA+okg5B0sUbD2pFsG6b1/vgvJ5GVV7nmgwE9aE
	dOwLdkkCZ/kGH+h/CP1AjSfzTAGHN7k7MnfgKQWvT2Bkran0O5O8oRkWA0AYBkYIXEtHFo3aDXe
	K5j/AgWDblyzRxRhPyzBq4EAjMKinBSW888cqRdj2vfzvQGg+s6+d
X-Received: by 2002:a05:620a:2596:b0:7e3:2b48:7a7c with SMTP id af79cd13be357-7e32b487bd8mr670144085a.52.1752534140426;
        Mon, 14 Jul 2025 16:02:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ziKVVI+W7Cfl6FloUK6LI/quaVkueJIXuqq0hcOx+aVeCIPgw/S2bBDlnuQBJfSyxua3Yg==
X-Received: by 2002:a05:620a:2596:b0:7e3:2b48:7a7c with SMTP id af79cd13be357-7e32b487bd8mr670138985a.52.1752534139909;
        Mon, 14 Jul 2025 16:02:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b63403sm2094597e87.164.2025.07.14.16.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:02:17 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:02:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, amit.kucheria@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <zk5cmielm4urfm22yszmjmwvi4mqvdsfthlonq6mij7rkijcsp@7evb3ejxuaj7>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-2-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708180530.1384330-2-jorge.ramirez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TWa6yQn4SgNMay8Evg62BQOIB4b448vt
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68758c7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=mvPirLwls0hmURuAnzUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2MiBTYWx0ZWRfX5melS2beQdVw
 yZMMxXMkDBmWIffqrclrsbSCtLPg8EgkEP3hEO3N6RtwN2bLbR3j+49IveOc2BPmD2z/4AIp6xB
 nbw7vKzNwSuFOfHQqy938T7i1yMf12JlfkUr297JuyuGJzkMDQhjcKcXrw0CZbjDqTdl8Enm0Gg
 kNJtAAagwWQabNN42R+H4NCBFlpOnIPfJTUa9zTNjvJ1ZH+aBmywBJSRMTDPO7V597XFmEYGIjH
 Zx0LK6BScpG4d6HvTsRsp3oHufz5L1rgQS8XAZHHCFgjs3mMChz/Tp5LbmEmCv4L+u8MenluVA3
 7wY8tl80NWPxfq60Atcmj9jeaT6RrIA29WMdfEuOK5+o01ui8eMxKLmiu7WD+i0D0iNW+nRBnvq
 UC1DXY1xuZ2+DWhtUSC0sEpa27jblXViqy6dhOzPrRCpboDf+vpW3GSGTaC5M192dpcK5lu5
X-Proofpoint-GUID: TWa6yQn4SgNMay8Evg62BQOIB4b448vt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140162

On Tue, Jul 08, 2025 at 08:05:24PM +0200, Jorge Ramirez-Ortiz wrote:
> Add a schema for the venus video encoder/decoder on the qcm2290.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> new file mode 100644
> index 000000000000..0371f8dd91a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description:
> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-venus
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: throttle
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 5

The hardware can't have between 1 and 5 IOMMUs. Please describe what we
have.

> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +
> +unevaluatedProperties: false
> +

-- 
With best wishes
Dmitry

