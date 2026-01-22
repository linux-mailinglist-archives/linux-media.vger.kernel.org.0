Return-Path: <linux-media+bounces-51339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePnaK4gCcmmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:57:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E536165956
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E0046C3958
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A9B343203;
	Thu, 22 Jan 2026 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9GFPg6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fT4hqLsV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD33382E8
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078861; cv=none; b=MTQFPBn3B7Zxn5nRZJFJVr4JC356YNc/fD6rp0D48ITaNZkfB0ip1Llir9b+X04h1m7QN2FapIvV2f8bqdbikQ+h+UUBewaRTOg1RkDDuYhyIQ8kjF5BXVqqmobzCr90keEPfs4KQRqdxlFXakl54G/JaHVz4nvXi6wqwhBXprk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078861; c=relaxed/simple;
	bh=I8Vgu2r5M8y2he7cvzYIotPPGMHAHXOfqg87h9oOn/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtOCVkD8fbZ6aDof4F9I2XWpCejNJBD0ACGFITJT6EJsiCegmmfpRZvKiI4J7Tdz+cCkz3V52fJy9gS80UAQoPcRc7GXw2AinRg/gXKPnlX2MYXIwqPWKu8bhg8Z97LhWrghQIO5a9bw33XZat0BGVghzOC+0NONpS0nY8Rtkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9GFPg6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fT4hqLsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7iwTe4058081
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=; b=P9GFPg6K+o4NQaJT
	sz7Uh1WmDz6hOXq43d+1iZ/omCGeppt6pV+gsaCvkkJp//2T3LeabmA8/1cw5RVQ
	oNCaZjNLl0vOPxtgtVz4zv9DhuJ/DJkzbiAm9ciCsxe81oE+qgwxpC9F5fm9M2Lq
	axnDugCqa5CzJjcI3hsI2MzX+Du2R27fQKYuX9Jdxf7wXtYeXfIR0g4Efc7rMGB7
	wMa8AIP7a+G4OFK65Ff2ql+iFRhieN2+jVv7CQyY6k0CSPIsxMgy5+wC26pJ5KkT
	opmnBSfu+7FRkmK/XQydkK8mPHdzJfs33cJS9MGGGtoIuJOGk2Gqv7PvfT9mJqjc
	NpYiyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbsydw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:47:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823f4666abso20467246d6.0
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078858; x=1769683658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=;
        b=fT4hqLsVDofsfKmyjmnTW5qbrILPLU0rjvOJhIeyg6KmkgwKztS1g+gK2DbLbp4MDW
         Ugo6mKt5/GZYXMPF8HFf2HBSR5rBHs66U5m31KIUe1GZbw63Ap2j0H1nJr0eZQN2IG+1
         /Os9T1t6djScJoems+BoSv9eVLoIao4PBaJgwzVkrAGNm4BrssIrFrnuQlSgrsxGjACK
         LbRKvLiI2tG0MK+MRVfyzaMY57RRTnwSxN821oAGYnL8dwLFb6uXM00CI8G6A9BEtCMD
         qhpwXVp2zw9G4GMKP/syk9n886edHd636aGnE6tUgFBhsaeK8o8CcOxVtcijMY359Q2l
         autA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078858; x=1769683658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=;
        b=hiZzNyZyTPbwuaM/7viEWoPMSwr9gzxlS2Nabhqql+Jlb48wf94TR6WXCmeEyWCYNE
         Fo9ZvvJnlzofhSkPw+qUFTjjih+lLfCBev5beBF/40SargAcDt4WxQtZPbjPOL8iWwfF
         TSItBWa1unRNj9NroLnRJ9CysJHNGFUkWhBw5iyhq+Dcc3vAFrcNvmF1xxyupPF5IkBw
         4KuN5xncTFMk8R1uiyx+J/IEEAmLZULMQmZnoda08E1d/85GX43WKcXVH+wk2zSvOBIr
         s5yocFgE+lJLbLRGtgoz/GtF01i+tyxFSQDf2laWZ2VfTuFqta1sW/aaj20fyoC/dv/2
         Wt7w==
X-Forwarded-Encrypted: i=1; AJvYcCUu/p2LpRVHU6EVtjH9GlN5fcqCSkI6R4VffkaNHMr2zfldIIR4tevsu8N6XONoJA/VdVepTFdHwMlWMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcsPbKLZtoWd1aFaDrhRqgxAwehHeerZyeYiT73T4s6wV7D84l
	38c0wwgerpmO2lhN6TRktdm1Yk69KnzvLHAxAMAKuo+oezUhriz9SruONLcXVfd+oIakucQdTcz
	1FoIbTam0QysDI0qCZ2/YlTlzm0nxIMG5sF7nbK2I2lnybwRNWjOFk4ePtD6tsrPArg==
X-Gm-Gg: AZuq6aJEj0063JQk3EGkL2f/GVkxC0ndLRXWRD+LI4/mKEaDDe95USdbc3iQ+cavvbP
	7RP97HdXDWY8ds1h9i0glqgW9+1iW1YEuugQrHWtpWl6dToV4Yk5Pykbqz7TfOh6UvDVl7JJLct
	OvgxzIxzqDu5JsSk0QH/v1lFvLAk1RpztWajT8VpAHKX4mvxm3i3+yyzEEYgOxpmOmhKhnkK3kY
	qsKbIVX9a7d38hU3U37zCYYpt9eb5+EjoCT2BmIznd1tYSMZCoTspIr2+Hde3Gr5iiCDINgC6Q6
	V5iPYxYIvDDIzRISIYya5soGyYVuvypHO8tF0CTKGT9kwy6Y3TrZKkBVZ16IVp+01Wu3d1593vu
	d+zUE1SGzq8kyzR/PUr++ndYULwT9DAL2YjX8xO5iH6c1QDvDpXs9P7TrMghJhH9hJjjaFmXS+w
	==
X-Received: by 2002:a05:6214:495:b0:880:5883:4d23 with SMTP id 6a1803df08f44-8942e2c8ca5mr306938776d6.16.1769078858034;
        Thu, 22 Jan 2026 02:47:38 -0800 (PST)
X-Received: by 2002:a05:6214:495:b0:880:5883:4d23 with SMTP id 6a1803df08f44-8942e2c8ca5mr306938546d6.16.1769078857539;
        Thu, 22 Jan 2026 02:47:37 -0800 (PST)
Received: from [10.111.168.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89468d65eebsm47770826d6.30.2026.01.22.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:47:36 -0800 (PST)
Message-ID: <613d77cd-1ccc-4a5a-9090-ee4d65d3e4c5@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:47:27 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add CCI and imx577 sensor support for Talos evk
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZpfA-NeJIHQ2UxMtwFUSanVQBzWH-gGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfX/8zLKslFsd9Y
 R5x+ooKoZ6JgMKUcaF60ar+ExSHa1Qkh/colD/Rr5kcFcNUJczs7wk5JQS2FErvYbCiENy3Yhz+
 jcjcs+4tLNxf6F9evSmgEnWaA7TgWMbBCipT8p1dn1LZHULFJE6vwhabtyQNIq3gi6Dn71h/s5Q
 aPyICcGwh9oPD6N8LxJ4AHpD+gSkvmrgHK0K80IEg/JzjzYPuOIYUQwDMqhjeIybNJxGd/Vvlmf
 PrjEd0eBLZ/dOk+b3w7W9NngNDMK+5OXdwVomSFpPanafHfZIU4CVbjM9ijYZsbZLojej5f0wMu
 qMzP1XIRgXqrsa2A3IqEo27twIBlqfSFaD6/V//eNoKobHbd9eWQW2FIn8iRKyOO0wI1yIBhAFa
 +SDw6b9MpqGJF7SF3NyogQIVYc6qeMQeDCstrUl2yr0wWpqZPq52G7PjdeZmMW2E9iaVMqZjfr4
 n3uk4D+GvKM3bDhqtew==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=6972004a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BqitQj2KRPiQZ0QKAcwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ZpfA-NeJIHQ2UxMtwFUSanVQBzWH-gGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-51339-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E536165956
X-Rspamd-Action: no action



On 1/22/2026 6:40 PM, Wenmeng Liu wrote:
> Talos EVK is  based on the Qualcomm SM6150 SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CCI support and enables the IMX577 sensor via CSIPHY1
> through device tree overlay.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl -d /dev/media0 --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
> 
> This patch series depends on patch series:
> https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/
> 
> Changes in v4:
> - Add CCI properties to the existing portfolio. -- Loic, Krzysztof
> - Modify the incorrect dtb install configuration. -- Vladimir
> - Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com
> 
> Changes in v3:
> - Add generic names for the CCI clock. -- Loic, Krzysztof
> - Split cci node, removed double space. -- Dmitry
> - Rename camera dtso name, add detailed description. -- Dmitry,
>    Vladimir, Bryan
> - Add dtbo-y for dtso. -- Rob
> - Interrupts cell change adaptation.
> - Delete cci sleep pinctrl state.
> - Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com
> 
> Changes in v2:
> - Modify the CCI dts style and commit msg. - Konrad
> - Split mclk change as a separate patch. - Vladimir
> - Remove clock-lanes. - Vladimir
> - Add mclk3(GPIO31). - Vladimir
> - Link to v1:
>    https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/
> 
> ---
> Wenmeng Liu (5):
>        arm64: dts: qcom: talos: Add camss node
>        dt-bindings: i2c: qcom-cci: Document sm6150 compatible
>        arm64: dts: qcom: talos: Add CCI definitions
>        arm64: dts: qcom: talos: Add camera MCLK pinctrl
>        arm64: dts: qcom: talos-evk-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
>   arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
>   4 files changed, 347 insertions(+)
> ---
> base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
> change-id: 20251222-sm6150_evk-8ebed9e9f3bc
> prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
> prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
> prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
> prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841
> 
> Best regards,

Post the version5, abandon the version4.

Thanks,
Wenmeng

