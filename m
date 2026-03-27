Return-Path: <linux-media+bounces-57209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJsGOJtXxmmMIwUAu9opvQ
	(envelope-from <linux-media+bounces-57209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:10:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B1342394
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7B4C30C34EA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BE43A7855;
	Fri, 27 Mar 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVEWCBrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9rcMW+u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE33AA510
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606029; cv=none; b=HFhNFp7mIuHN8+NrX56EXwoYUCnTlRwtdqVuA1F94lFAnK4fVSn13GZMXKC4ECGto0Ize1sTXQBaLyLI+h0WuyJZ30b8GKoDuWpgUkyx0PhnCFYfVZE8vuArtzdkR1IUpoFXuuHVtKCq1Umx4/V2kwbR91HySbYxDOrp/sKHpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606029; c=relaxed/simple;
	bh=EHduvhWTuKBhol6WDPp3oQwkuOYIEkKQ4fotbabd/Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCLKYkCXPVc0CUgKm30onOOgaK7UCoqFt36keV7spb5Bpp+FzkhpvkTq3RYtGNqU0AtXFsXQRzHOJR0PVDbE3LOELdp8LtuVUH3oxfYY8joXz22U52Jo1tR3r5yNvE2g5Er/CTJ9sVqJvrqlVexpw0GxNx116sa608iPe98NWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVEWCBrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9rcMW+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqYf298531
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uu2XKU12Z+3mLskatlylPJqr9wXv74KUtgVjsU7B3Cw=; b=HVEWCBrA9neD1kAo
	pmsX4g0W0tPjBp74Z1oMN/b9owhufzKvFw15dgkNNXQ6GDo4NeKoO+Nk4ZhbqiR1
	Lq2R4SyX5BV+Q2SRWCouUQj3zFy8L8qjQ2bOjVavL9F3wTDh0kTGck7rsfy2Mj8p
	BMtbeIT+awTBxjqAv3YArkrVq5Nu9uBlzoBw0Q15nTGZ20nWYEF8YcSg4Kbtn5+s
	yH/I47362A+pedSZux2OEsDz5jrWzgffyalQgF2bJY8O47W0Ramsjd8SfMvWh6Uh
	oczZBCP7R0YGu1cEdTO0Kp3HKKA8DdGd/Q6dYqVkAtb3PQmo58Mg6iCawThLfQgv
	lxSqnw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tkrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:07:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccbfe176eso5509746d6.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 03:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606027; x=1775210827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uu2XKU12Z+3mLskatlylPJqr9wXv74KUtgVjsU7B3Cw=;
        b=N9rcMW+uQwG7+ks0XuV5Fe6yXgXv19+vuCYc699PAmYCLC5N7v7F8w1vNw0eFgpNdX
         b6RunbfLN4PIa2Y/B03N3h/Ixd/oT9leNVhxvaiPTEcXmPI0/8qivGnk+uyHtVqWr58z
         4ageqxCFcogWICq9NOiH14JEten1fFQhScoZJ/+A96LRgGffLlXXJFi9AkG9pXKiOtET
         YqROAvlmBfkLEGh/ZPrj5U225e/ZhDE19KXbZ+Yoms2CmxnRxyi+Ej3LZ82hIyb1ouRg
         Ite4uJot2tApoMw7eVqAIbkkv/bk+A0Gj35OSqY3Tu5CLeO5AN5Ybe5We4Ke2ovsxrcs
         ssag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606027; x=1775210827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uu2XKU12Z+3mLskatlylPJqr9wXv74KUtgVjsU7B3Cw=;
        b=qnvb3/CXJXtMRtBJAhGUz4nYJBbZYANaR/BT608gNw8M27lChwZt6+IpeWqcecm6qX
         VANVVGOtT1v/y5ShRmZgnVaaItR0qEQsgBgxG4K9leCt3QZSLz/SJuHweCfXHUlnYC/K
         TEa1meWdXiv2VzXvGipFHv57xrlyPMadw5htgAHrAz/kufl9miPlhHIVFLivq64TWml0
         GUjfftPOt1f368lIk+GBByhifeaapFrnpNGa3quocAVj4ztZXtJWHhZgyZMUcAXtUEB6
         HSw8Osh8gBKk+rpe8anSVxLJhLR2J8zbR34Gz2sbVTsHmDlkOe49cPeaB07uBHYVYZh9
         65pw==
X-Forwarded-Encrypted: i=1; AJvYcCUBjRo58OwQU+nw7D90svF7DMruj4RBxj5czhufZvVmwSWLiMcLr2jCxQEA89B4YqejVnXvigDSYUdfnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJF83mG9HAT9lqzwAaYv4c3r/OA+VRQ5638rMuxdhcRYZjbpW5
	Tb2taKqL6L2WcsPjnkInZ+wHEWbwPye4MpBLAdv+IALrbV5uJi28OLMJwvsSqvh1TAbKr/JmGW+
	dOiy3va0Rm/xH+o5ubgYySHWvVELZwJovR2ZGLg4XcQy6SXDPoZYV2E8edOFRh0B6Rg==
X-Gm-Gg: ATEYQzwiKBca82Oz2IDZCO50WHcZKl5t5nefS2w9cWOM0z0qprGGrKsotaHBp5eyccd
	zZ2Sk1xY+DDNaLzhGpyaC7WWUzIc5K/pgW9aWjrS2Sxd5GIBioU+Z9Q1ikuowvipOd7Jddj+6jt
	z/fe9uOly7NRpxD9R6dhEPMMsOqE2hJUQg7xyGCaOpdUzBI9/InHl0VYxUcY3PHqFpE+g36B+s9
	jYr10fZfh+DdSO3dQ+ljWgcFe+MzfjGHvv4viAK3XHpLjhY5gNPPwf9CeBt07qtYj3JF6425Rbk
	XtMuOBr2pSl/2awhl9Jo8MkGoXSz1hmnXPT+sEqJ8TrIhcDSFXZhwrQ9xyLkQvHH8XAfuGEz5Jy
	94Q6A1b7Ahv8vELMBq/hTNAsv9o6+PVOqGg/qbzGUqa/CuKFuFC0UjT9KizmSyP8tm4SmLMhnB2
	aRQMc=
X-Received: by 2002:a05:6214:21ed:b0:89c:5285:200e with SMTP id 6a1803df08f44-89ce8dd5ad5mr17277916d6.4.1774606026695;
        Fri, 27 Mar 2026 03:07:06 -0700 (PDT)
X-Received: by 2002:a05:6214:21ed:b0:89c:5285:200e with SMTP id 6a1803df08f44-89ce8dd5ad5mr17277516d6.4.1774606026260;
        Fri, 27 Mar 2026 03:07:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2288sm225074866b.40.2026.03.27.03.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:07:05 -0700 (PDT)
Message-ID: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:07:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
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
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX0oJerCXsNBL1
 o/v8dcrEvmFxSXUs1I0r/yNrBxbwBvmRUelAqAvv0qIEEAQRbmyb0ESRygnvvGKuUsCSGmq2fyJ
 qN+ORwqN68PfX+sLPEMD54Bz8UtADDU/8oogz5Mv2qp9+WRpLsKALvnoIIGTKC7cYqvBsm1I8mP
 Xlws208MVefDM8fHlmMJGkF+9CFWdDeU9ScPQoi92kR/twRdwGEKQbk5b01qy74jnRKH78REhFz
 ImeoaKgEzuTPLx0G3/luRXXCER4098YcpnTDDfc2aExiJhP14TFkE+adjdw17pBjywb1HxIj2cn
 mZp/jEyzS6lzwaLTq6lR165mv90yJnMcEyHH5wzX8Ribdlb4duvCd2t2leqOUVHfBlErvutRov1
 WLZIRRQWMqZyoPdPdHrw+4iy9eJU8sFkDZYSJN0KuU2AqmZb45l5Z7BfC9i6035hs+X+0t/4F3q
 wrdRD60pDOgK3UrINdQ==
X-Proofpoint-ORIG-GUID: j6SsGxd2p3aS9spapM13JZSYYT4LTgQ_
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c656cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0SmWYRu_8F9rFwqJbSoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: j6SsGxd2p3aS9spapM13JZSYYT4LTgQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-57209-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E9B1342394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
> capture those modes as:
> 
> - PHY_QCOM_CSI2_MODE_DPHY
> - PHY_QCOM_CSI2_MODE_CPHY
> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY

Does the _PHY_ DT node need to be aware about this upfront?

If we have some sideband signal (e.g. the sensor driver specifically
requesting C-PHY mode), we can simply throw all this complexity into
phy_mode + phy_configure_opts, all at runtime

Further, the combo/split mode may possibly be selected through
aggregation of requests.

The question remains whether the sensor should have a direct connection to
the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
or whether it's going to be translated by the camss node (which would be
the one holding a PHY reference) - there's probably surface for adding such
negotiation logic in both places


Note this is a question and I'm not aware of all the possible combinations

Konrad

