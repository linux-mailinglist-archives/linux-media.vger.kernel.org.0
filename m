Return-Path: <linux-media+bounces-54353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDF5J4XVpmnHWgAAu9opvQ
	(envelope-from <linux-media+bounces-54353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:35:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4279A1EF880
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 192413035489
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486C8346AD3;
	Tue,  3 Mar 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiugB3IG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRrb2MFs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A81340D9A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541277; cv=none; b=Msj8B5o1SRa4p8hQrYSQ9McoiDgHcFRZr8rInApYTNCvTpLMrtQwFcfP5WfYeA3t+muxof+dVHsgeWCIwHJHyMED4GW5nN4k0wc1bwLXyFRsMsyG5lwxDzTiGa6tPj0cKeoxYyBnnJ311MjMa8le+LWYKEF/wMD27l3+u2Rvn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541277; c=relaxed/simple;
	bh=qdkdUtDMzolrYlP3Ymi01iR5cMVWit373aEftT+uf6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cedy0VtuJAvvNCCpgSqnFZ8RULWPdnHbelza1/3BxkI3yZGQmBmxA1uaVfLhKndNBMt56/hXTMD0VRovS9vjadnYAK+/HcNK2TF3yqAg/KoXqrjBIZVFeyN3KG4yLzh/bDZNFKG3K2V8im+ZVziq4mc/S87IBqZm2VKduVttBkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiugB3IG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRrb2MFs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mgXx2307433
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 12:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIuYmbxJe3YpzBkc93wu4DVwPzKyxn0+SKVVjH/VvoA=; b=FiugB3IGvpfN4QHB
	ZiFqk94l/CHM0FQwKzwh9gG+buTduhvSdU6oW/SM57UhBvHWUEQerMGK3gBvtM4T
	hY+urZ8TboLdsYmIuvNMSnh5MWnewMhC1/6SHq4ZQRAvolZycl4gqnhbGAuo40f6
	Q2DlFsfsplxud2EcriLXZZ2rXjN1C9/acFDLXXTMhTVhReTVc/EmKZBcYLuaVUET
	yCocOyvrz7Flp5B+aF+TIup46dX3xsug8+v2PjzB+aJZa1NU1BoxZLeT9drEY9vz
	sAkTM1bBADoIH/9pzB9aIFUwxacUPtoORFQzVcMOwVOGBED3PN/L0ZVY+omLs7Tc
	Wv/ayw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8kk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 12:34:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a086578c5so5655516d6.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 04:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772541274; x=1773146074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIuYmbxJe3YpzBkc93wu4DVwPzKyxn0+SKVVjH/VvoA=;
        b=CRrb2MFsWxAHAKBc+sMaKgPE4jlZFS3JQYHJBz3ZnJtIyyWPcaf5V4jaQWe/DoP2YH
         GBN9bu6eRZ/SFnluHrcyuqCzuCwRHIoeogLaDLHLQwtOq+L6etj7igX3TR8KacJJ8FE7
         5PbDlahnBhcuCKBIbtk/IIZXv2ZAjliZn96S4c/c3TWn0pNRzkylLz5iuKe+562iZOkP
         HuYHiMKD9M+AsiqYqND8DGD8SeuUwrW8Scu6EQPJwbPcXqzvi3v/Xn3xTjnYmQ8qrSOl
         68joWeCp2pMwjBv/Vdxgo1YFAMty8Vhrm0F+fTKhBbMpC9wmyrVowlQy/82UMfutrwWj
         tJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772541274; x=1773146074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIuYmbxJe3YpzBkc93wu4DVwPzKyxn0+SKVVjH/VvoA=;
        b=wwv1S/D4Tj54oSS9KD5FmWjl/PL5q3H4794ICiSXyna6n2/Monw9u60p8FVNok6SIQ
         gyKWzOHDvuSkWG70izq7eJaaPLaHc+QJyd2LcQh6A2UOluwlHM1QHsZ3EVM+hsJEoiMC
         7OhG9S5JbCGV5y81xmZ8mu6gFVgdSxmhjxzrWmuXMS7omT56YivrRNzZWQ7fg74JJAuu
         ged5NaLhMxP3Xwt0Xj7Ny5T4aEcJDPV7dfxBQwKKlPc6wYJRthDaWNadmVgD8UqBUGl2
         a+5rQqFAN6vpI+foaAEdTELQDTUBzLzPOP1+iw9IDDIKzPwNMbvrtK4CUOA2JVW8phRl
         i+bw==
X-Forwarded-Encrypted: i=1; AJvYcCUhZjJgq4pYyE4yi4AfuzqS37FiiqxZ7rdoZ3WhHfFwyNKURfNEflWv75oJfKVn+Ebrl1qME54aQ9x7Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjii5OknA8qbf2WkbxK2XofajBX2CiNW1DqImreTR5mFI+lqNV
	IPt3myu+qrhpyTjTE2bWDYfKtDSLKHGHIwjXgANSpV1ajP/Z61r2WBAOaLo1IPH55eUHVTnD+Jt
	iAfiipFtyXMmK8ahzwh9Chv1m2l2uEp4f/Os5PjKrfib1hprEh2rbZAY82KlyiNfbhg==
X-Gm-Gg: ATEYQzx9Ijmb4zWT7TwvIKIV69/WQiEaU0B27a+eEL3w/5TDyNidOXdaSsqyzsaojwN
	nzynIYVRlCMsW1J5ZzT+xnXY1iOkbN8jd5TqOKhHyzqsOy/DgQvQ29txBQJE4jPjda5XNZI/Gkn
	GkUxeINUH7ZxVuR53dTl0kgeBtrwGzG/G8+L5oRUlQICBLcVjWtnrcWZ2T1k7oCT4t/yhrfQ0Vz
	n5nxu20fCREGXB5UOVTzDAOhUFF+g3P12d7kU3+MfPq7BJ9bO0z5Zq2SohllxTaN4IPpPuwNO/o
	Uhnu/RMyMcorE0D7UqN9eVHlquFC5NLSqdQ4rhrT+SB5p3sxiNR5fgqsTtnON2Eyn4ahqquHNdI
	lj7vpt/yDFrhDLXYmJQf0e1OKTdh9pXkmtBWEYQFt9zlLMQVaP+XMVPgkoFDB4lFglpoAt0OpX6
	Bh6JY=
X-Received: by 2002:a0c:f10a:0:b0:89a:911:cd97 with SMTP id 6a1803df08f44-89a0911d399mr20611896d6.0.1772541274261;
        Tue, 03 Mar 2026 04:34:34 -0800 (PST)
X-Received: by 2002:a0c:f10a:0:b0:89a:911:cd97 with SMTP id 6a1803df08f44-89a0911d399mr20611586d6.0.1772541273777;
        Tue, 03 Mar 2026 04:34:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab146bdsm584236466b.6.2026.03.03.04.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 04:34:32 -0800 (PST)
Message-ID: <04f22394-2dbb-4b7b-bce3-9b41ebfb7709@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 13:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@nxsw.ie>, Bryan O'Donoghue <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PVZlwwFlCVIWtFXZCa6Tl02GpOJhJc1A
X-Proofpoint-ORIG-GUID: PVZlwwFlCVIWtFXZCa6Tl02GpOJhJc1A
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6d55b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3czUjEcpsIvkoZBIbdgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5OCBTYWx0ZWRfXz2NM/ElCiDcc
 Or8ozruSAFzOvaEhy/DeX2aQRh+KWr1s+vpgD/Afxc0D8AxYz+qLAn6HJZVto8oyBzWZjbS8y3/
 7T2D6S6LtcDbT+NvZF59xarNx22gfT+zaOqxxlWM+N3U8+w/olNpb4lhJoYvZp+OQbOKvTrwwtQ
 QV2YKNbCOF1skkpakH2VE9OS+Bbx0udSvATp80SB5y++Z7uIuXONFMv5xXkBEUavO2EjwZlhzp4
 Wdxw+7WlFUbqHFJIvmAkuN/DqnBMJ53KtS4Zh5/dpG/pV/HFEx0wONc0bb0BFm6XIoF54Y1C0Hj
 87vDEEYlRKhIeenNrSqm+jBE7hCRenWl5pLWsqr0Xa6iGn4iA4EygB31t0xLVQO06xCsgPJWRpF
 BREh7KWl/jJyghAq4Q0HJz5PlbGG9gCDabSXu1yImLLLjNjDnRh4cS9lZENFMhKb3LFs8x7o0mF
 igf6XB9UTGENByHK85A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030098
X-Rspamd-Queue-Id: 4279A1EF880
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54353-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 10:30 AM, Bryan O'Donoghue wrote:
> On 03/03/2026 09:27, Bryan O'Donoghue wrote:
>> - MXA - first time I've heard of this rail, from memory I don't remember
>>          having seen this in ipcat when I could do so.
> 
> Yeah no MXA isn't a required vote.

That depends on the use case.

MXA is always-on (that's the 'A' in the name, as opposed to 'C'
for 'Collapsible'), but it's not always at the required performance
state (svs, nom, etc.). For some clock controllers specifically, there
is no need to put them into the picture, as the rail may be unconnected
altogether, or only used for some retention mechanisms (which only
require the rail to be enabled and nothing more)

Konrad

> 
> https://lore.kernel.org/linux-arm-msm/9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com/
> 
> ---
> bod
> 
> 

