Return-Path: <linux-media+bounces-63018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGEYBshTGWqYvAgAu9opvQ
	(envelope-from <linux-media+bounces-63018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:52:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2415FF857
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 10:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0639130265A2
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787333B8BA1;
	Fri, 29 May 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXZkhA+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFZfnm/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0EC3B52E3
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044393; cv=none; b=od0Ykh5zc0+YL1DHfmHozzBhMKZKQiiLriJZxgrJEcDM5n8Jm3UFxKiqJg3V/RFtzfIFPckoU7oqovqu310wyHwRTcWpAbMwnNsvRbwmsnDLAPTwOUM5k574ZPpl1z3DhyqZroPw3YYHD+MoEhqM4177v0hqKf9fPrw2YzWfJEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044393; c=relaxed/simple;
	bh=CCEPMT76MoPGvf/sIAnkLPJFHhNkONd2EaUusCCae90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqTQndurcUPlXpiHhlVSS2vlLWM1ntoaVaN3uvP2M1vamjO5BsFPlMCn/zGMOGg2GcTrk5l2jjm/BaAKRrTMyW3xHgsEucFbpGl+vb+CgX2/8K+InDPsKc97aDPNG+CSrmXTQgf93vBd7BhTQmMODZj9u/H1OiVdCfqutretcKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXZkhA+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFZfnm/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4TBdo4193315
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7NH6UjzSKVNAbiLJfKT3/yl0ZxL71qfzEv/PCnEx/qI=; b=lXZkhA+8sR6pRPcU
	UOA5Amh8j+XRqchX5GiJn/JvGzgG01MUmz/fQmvAbsjGLt8yrJBO6vDWxiZ9eFwV
	dyYfK0fnjuHSnJ1rXxmqVvy4pFnxMSLZ7ceHHoIrwzKt6MQwDWieX44sxrYt/ojU
	g5uyFXMnGdCQgpiTnMBTQYO9Ws8ZLoNpPK7B1I8YLarPxLjWAyMDJU2eEd7K37Nn
	D66caZkULM+sKHclEbB9Z+NJu/fo0LyTlaI9RR+OYkOI0IgHIGhnOre7I9zNlVfb
	qc4Kn7TaPcjvGHfz8gVRnLsmOBnN5yeaTfGM+DzeALhGe8Cqodfk4LrO5pa7tr9A
	9Kx1IA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te10a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:46:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so13051307a91.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780044391; x=1780649191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NH6UjzSKVNAbiLJfKT3/yl0ZxL71qfzEv/PCnEx/qI=;
        b=bFZfnm/E+O5B8RDv6pezw4uuvpjuUqidRDd4jVXH4vt42pjTc9XJL5ywBIgOJcu/sd
         LZHY1GsSveXUR8GwULxfXiJpY+xZZT9Lfjf6umtWYBVBLmG2ymDm9gwyjS9FN5QXQLCD
         KblYEllrBQo2GySBr2Hg9CE0A4Z7sq+wCG6fIJ5n4ffuawr24kdjfIwcif7B+xX/BlqN
         wNe5L466uzaJyNAWw0+4K2xyA74MSy3WUs01elPBCVVMr3dCItPwIAau1qVoX5jx+dAA
         1K7DTEt4DQU/EgO/Vo6OpVkx65hGxp4Zp1O2KsOVlyyYK4lAd+UrKoEox/c47JoJ2kjQ
         CCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044391; x=1780649191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NH6UjzSKVNAbiLJfKT3/yl0ZxL71qfzEv/PCnEx/qI=;
        b=CVc0coqtebLlZVSqoKi40Q7kERfSrQCZkQ6w9VVGxaNgi4lcKuHS7dJlsUC1rz9Ac3
         I8n0/Xhq9/8C5PdmvI/OTE3r2Kx982zcC6VIgsDx0NTxDcwqkBBnHTZxzgLTa+SMNYca
         klPkzxj/5EuswfC6OMLwGDGgD2AGq9A3ZHcz5/W/fAuiLycL11E8ielpjQGNRJbQCQXR
         eAm2sdhI0ZKdS3NDCmLI3yY4WWmLuxw6rvynM+pSx7SyB12P4A6qKy1rFHJyFrq8LZdL
         VmE6qApuvn32Q/PDMUkxTgcoIrILOStk2rzf4l9oj9ffeNCHo3+l3sfavnufqTLoeYRq
         XSVQ==
X-Gm-Message-State: AOJu0YwCjqEywSpsJJ1FkFOLa8EQU0wrWZSF1ydF4zzkF+eGOZGuGSQR
	DZxx867Ix0acmmQuYPrdupBES4nG/FeOupOSIeCmtdihknwEK/9WWuxpb8osv8GzoPAA0yVQGC3
	qTFDXX5vleby67xTC4A5e/GrExK1lYFXUY2QHvf9B9ByGzrYl+nRdZaoH6lR0eOD7kg==
X-Gm-Gg: Acq92OFkba73ibAlUNK1XWr6auGkrOudMbUyOGpgECpdJlFzlBYj4ura/ZGii1joYeb
	e4HG59uqIX8rwh3UsBAhW9oP0V84jrPf2zeQ84I53lig+pla+RuyvOzEm6e39PPdk/c7TuPDUIQ
	PQmNsvdYVPygSZUyqsudHcus1qz8qu9HPtHTisKZIri8rzsoy039oofSXiBwudvNTqkoJPsBiFO
	DlqpaQ005PdSZVvwfgn99uuMGcL1F6mFYbJhD1K1+HfkHEwsmeIR96MIHYMoxwX3gikInOITzCK
	TzPK0j1Q4kF5eRwNaPLUxmfRR8BRlYPmcKBMh2gUeS0kh+Kc0ZdNpIxLTbTFZWzfOs6Vt/K+wNu
	2lnGtDRDFSu9P2lZ3GjaE0ifhCQHYGLQCQU9eCl08PfufK4ti9XPoro7COan6QZYODG9IoIJaVl
	BXUfe71LxlmteOzaE/YikJTg==
X-Received: by 2002:a17:90b:586b:b0:369:7433:2fe with SMTP id 98e67ed59e1d1-36bbcc16085mr2484350a91.6.1780044390620;
        Fri, 29 May 2026 01:46:30 -0700 (PDT)
X-Received: by 2002:a17:90b:586b:b0:369:7433:2fe with SMTP id 98e67ed59e1d1-36bbcc16085mr2484302a91.6.1780044389913;
        Fri, 29 May 2026 01:46:29 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbfec391bsm1378521a91.2.2026.05.29.01.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:46:29 -0700 (PDT)
Message-ID: <77b29e18-5abf-4254-b027-ba443f4eccbf@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:46:22 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dKxR5Cm4Sv0M8kzsKIDMwmCmBpEv7guL
X-Proofpoint-GUID: dKxR5Cm4Sv0M8kzsKIDMwmCmBpEv7guL
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a195267 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V7KIQyhf-OIcSKm5H5kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA4NCBTYWx0ZWRfXx+AgQfoeoawT
 gBMm4wxR77EmSQI/xPFcHyOcWDeC1qQMnHoFRz/4ZbCBTZsIc4Ph3sAJ8qEvAQX5HPWoWzW4zUn
 fNyDLDdXB/bPTDSuAr9AGUix/FTuqhhiCtTq7Wb0xmOi/9g5QEn8OsYRdb2rWrGX38QMEA90Nes
 4X7YlHR8pI+Hcq8vWuS4g01Ip8M0AFT3UcMhP0w2mvak5faUaAibUyMVx8Ht7L2I9T12uswUVr0
 RkcGchxaHoCZQJQsSPecD+a5d3zFDXrnya8+loRm0gnClZaTF58LbXYjvrbcb1QyINKzI9J+iPF
 T3hZvE8IleXYQ0UyriOZxGo58Z1C8plP1SWvWDLoyV7leIFNxz05GCRcfKI0OK1oOgxR197fvdJ
 7Oe8obct4GbIy8aEKkeTQFpK4Hgdct8LC7YvtSiCmPcoTl4A92jox3NDLo878N+v67LqVgVjMqh
 gr3hujqbjotvh0cg71g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290084
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63018-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,localhost:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B2415FF857
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/29/2026 3:34 PM, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 

Please rebase on the latest linux-next tag, saw conflict with the commit:
95a337f92f0a  media: iris: switch to hardware mode after firmware boot

Thanks,
Jie

> Dependencies:
> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
> 
> The result of v4l2-compliance on purwa:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Decoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 10 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 65 buffers
>          test MMAP (select, REQBUFS): OK
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 65 buffers
>          test MMAP (epoll, REQBUFS): OK
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 65 buffers
>          test MMAP (select, CREATE_BUFS): OK
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 65 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> root@localhost:/lib/video_test# ./v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 38 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> fluster result:
> H.264:
> Ran 77/135 tests successfully
> 
> H.265:
> Ran 131/147 tests successfully
> 
> VP9:
> Ran 235/305 tests successfully
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Changes in v8:
> - Rebase onto the media-committers venus-iris-next branch.
> - Link to v7: https://lore.kernel.org/r/20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com
> 
> Changes in v7:
> - Rebase onto the media-committers next+fixes branch.
> - Correct the firmware name.
> - Link to v6: https://lore.kernel.org/r/20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com
> 
> Changes in v6:
> - Correct the firmware being used.(Dikshita)
> - Add comments to platform data.(Dikshita)
> - Link to v5: https://lore.kernel.org/r/20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com
> 
> Changes in v5:
> - Modify the dt-binding description.(Krzysztof)
> - Move the BSE clock on/off handling into the vpu3 code.(Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com
> 
> Changes in v4:
> - Correct the dt-binding description.(Krzysztof)
> - Fix incorrect required-opps.(Dmitry)
> - Reuse the vpu3 power off hardware api.
> - Link to v3: https://lore.kernel.org/r/20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com
> 
> Changes in v3:
> - Correct the dt-binding description.(Krzysztof)
> - Fix warnings reported in the patch.(Krzysztof)
> - Add separate power on/off hooks for Purwa.(Dmitry)
> - Link to v2: https://lore.kernel.org/r/20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com
> 
> Changes in v2:
> - Improve the dt-binding description.(Krzysztof)
> - Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
> - Add the required members to the platform data for Purwa.(Dikshita)
> - Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com
> 
> ---
> Wangao Wang (5):
>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>        media: iris: Add hardware power on/off ops for X1P42100
>        media: iris: Add platform data for X1P42100
>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>        arm64: dts: qcom: purwa-iot-som: enable video
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++-
>   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 ++
>   arch/arm64/boot/dts/qcom/purwa.dtsi                | 50 ++++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 42 ++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++-
>   8 files changed, 153 insertions(+), 2 deletions(-)
> ---
> base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
> change-id: 20260209-enable_iris_on_purwa-a000527a098d
> prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
> prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
> prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
> prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
> prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
> prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
> prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
> prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c
> 
> Best regards,


