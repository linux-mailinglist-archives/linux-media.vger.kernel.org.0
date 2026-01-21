Return-Path: <linux-media+bounces-51213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIOMGfarcGkgZAAAu9opvQ
	(envelope-from <linux-media+bounces-51213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:35:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCBD554B3
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 11:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0EAC364193E
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA2D3D411C;
	Wed, 21 Jan 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo97j8qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4mydxHz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6799F47DD59
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990125; cv=none; b=e59170iwpGWpl0LjZiiaUB3ppZKbsjefMe831/1J9CAwmQMlWCwJ6xWgJYt20/581tvFwDC/UK1sj7Su27UYLNpOOVqYuIl3EOHmA2St5z18J9wwF58jaeTxemWxqbt/NK/5iwPAYU3xg4m6kfWKS4/9ceXnKtQojD3/4rk/qqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990125; c=relaxed/simple;
	bh=xHdnBIT5cVVjKBvOsaBlmEr3UWvl+I+sv5DFQkfJS4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KE3X30dATqlf6uBWq8qT8tdIvG8bUWx1RNTwxhxUTNGK8nxkqZfjEhj/frJUsViNVa1TIaI+Iy8y685pT0ULf/mZ6OQ9NE4m6ieHtYEnMk8EWafan6BbztBa5qSMCETT7atuPpCLLt5A8gcFpVuTROob25DcatNojKpvdLsdvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo97j8qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4mydxHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6X4tl2353903
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=; b=bo97j8qoV8Eu4WJp
	LZfvBa2BNjPKS+Pi6Q6EzAAQs4uwvkIGPiaoKgyHQS6DRl2i/twapzEl0GULjGmr
	rmJaBFzgO/39uR502NWyiuN2kbuhxwQzdDqxKe1pKD9aNrtTjESXse9rgTuJkjV9
	qJZvEin5jY7rjKEVBi7H3FGe+cqyO3M6Ig5O7h9WpTxs/1BNNDm7Bm5Ss9r27JFB
	8RPUlqHPwCkPnuDJ5b5V4P7HyOPF3kldAvCrB4H6+iC1k3lTEEba93os2152WqPV
	OgiDenfeZznRRfeUFqrNazdn3160OPez5NggiSEG6EO8Y8IUN8quUW1RasM/uTcQ
	il9OWw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmprwtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 10:08:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890587d4e87so185042656d6.0
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990122; x=1769594922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=;
        b=E4mydxHzdBPWKi3xvIHZ2T/kBrjmWImpUnE/4XAGyBouCMbJRDPWF9SJC3G98zUtMs
         9x4ATWQWHc5P+Eu5mxwPEVUhdutLuJyCNyafA+NR5AkpIRtRfu1E+xrvTwdlwbcdt5q1
         6tKCEqTe9T6pmmL5m0hSDahlwiOHSbfpm8pFz7Zyq3zsW6VYYRvuP1YONI8MGYGg9lyT
         x2zT8fDVWbb7jMrMllFVLODDzpCcxjgdN0kqOIbJCQtUWckSmxanVP8AZkd46+XSoD3O
         Yb/Iccg56qrn37llyVeBgQ6H/2Ji4IxG/eUOxnbOWAJT/ZBEO9087GT5de1Nx5qsP5av
         YbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990122; x=1769594922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=;
        b=MZxQJaPIIrv8Bj1p1Fa68l+a/s9dNiJkh/68WXbqio+robGLJLAN4Ql5GsBH1e2ApD
         oeONmB7UZ4GUqpL3s1EUtkAtRlqC2it/VJs1DnDuAKsD9JMZUXhKMeoF1BTISHbZsBSq
         4BiuccRf4jnVtdIVrOS9kMcyN9vvDrzN5SDeV4fr7+upI/kquhbSXeGWCfs0MvE+KhDK
         ey+ayRxYVNKMaJZM7hwMAyxfqIa2CM7hLvyRfbcEh9MKyYo9J0DBkTiF0CVDjI6+Cfyz
         UVdxlNvN19VfNZdq2W4eUjGxi7cHZRYjXBVfK2ymd6BHRWt1QP049m70qEnMpg0AIXbX
         6s6w==
X-Forwarded-Encrypted: i=1; AJvYcCW70VPv1oFxmesp3Z0/rcsiQ2QOldSBo76On6wBdpe+D4TURxpdfskR41aOrthxqd3LE+hO6ljBHZak2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmE6fgbCGB9ioTwJk2xLtSm8WsNI6z0iIMY/obhRBo9DjWxj0
	Wgde0DJiyxz4hzZ7YqoxNCEUgC0mOAlx962CK/x9Rbrg1cnwo8JXtmCf0rIurEsSu4ZYgY2zhJx
	VTjeUUDTUvN8uefADVoEeDiNxO6T4T2xIrl9r0vmqCWY0Soh1CywAqwWzirHugvaBQw==
X-Gm-Gg: AZuq6aJ2EU5PC9I2k/3YEgIyVKth5UKcS/v9iq86DOPRDdR95NufF3OKfn4k2oa0JSD
	U/DafKOPNG1rI19HDig23nPiiyuPeTSAM+4/5ebjLT3RwRBLJhFYRxxh5FkK3XfLcSLPjpBumlZ
	7ihnqZQI4FHzTAZWSSjKdMAAP691HF6cDceQ6+UePBn8FdA1vN8eOBMkcKTOt+LyJHoEjHKHpz3
	tCDPpXBZyRfuyg9i4MIA3jVvmh2tGaQ9qNGuTf5BqMu3jJ9aYMgpqNiyBAVw1JAuUDSpqei+y6+
	D+ixd6nrEcuHzxqqDv4aHkwWF4za4tMUEVFA2/IUYyO1ldvmuEtrgIAzOxlY/KQUCG7Ux2w3rdb
	LBRNQXWNLzKeumRUkLQbMeeIBHVUHT0OpoHEyUzHpqvysa2TIF4PSvujK5uFh7Uy37vWQL1ie
X-Received: by 2002:a05:6214:230d:b0:87c:1d9a:d0c8 with SMTP id 6a1803df08f44-8946388844bmr62930166d6.27.1768990121781;
        Wed, 21 Jan 2026 02:08:41 -0800 (PST)
X-Received: by 2002:a05:6214:230d:b0:87c:1d9a:d0c8 with SMTP id 6a1803df08f44-8946388844bmr62929796d6.27.1768990121368;
        Wed, 21 Jan 2026 02:08:41 -0800 (PST)
Received: from [10.111.169.82] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm103910141cf.14.2026.01.21.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:08:40 -0800 (PST)
Message-ID: <d15ec6f6-7978-4e6c-a752-ffa8a44a9e13@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:08:31 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIcLElZC c=1 sm=1 tr=0 ts=6970a5aa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_YHlsWu5nELmUMumn10A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: pNKF1j-IIHETfY_D8iNJnLCqOpUaoIjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NCBTYWx0ZWRfX424KC7tlTqLj
 jxgLjs1iaYh8OI+cfcmfXxQYKuaAVeXUahXbpx6J98hbzF4l3mIiS1tbm9LtsHfTDUp0vqkcC24
 U/z+MS1Z3inwOIKjb2JY24LMnoQ0xfZR3A3ZmR0vbZerEpeZVKMhr+DrABDBTiqeYYJ6vzwAMk5
 w/3J7skB4qdQw5w5aeQt/iFcohjsS7UXw1U2MR0rHXI7PBu9laD0df95W62bYmsGpLrHuD4tER5
 AnLZKbeQEUb9RY3hgKXWEm3omqUZ3rmcEYdBeYEaMXmdVl0lnT6JjgBpSL8ksq4wvkJgXW2xs8h
 h6RKMt8qPSQdRjy7+z6ovUjJCmkRf0Ec3Uh+FoVtwWzqd4MJRo6BVvdtNxY6FOA3NN/eN30HH1e
 B02sBtAAcj5F56oXEG73iT4PU3U5hmwILDWvz5PuMDqeIhOGTr62P7vPAcpQDfpiqakswHMetgU
 Mi/RQOhaY8mthCXH2qA==
X-Proofpoint-GUID: pNKF1j-IIHETfY_D8iNJnLCqOpUaoIjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210084
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51213-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 0DCBD554B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andi,

On 1/21/2026 5:54 PM, Andi Shyti wrote:
> Hi Wenmeng,
> 
>> Wenmeng Liu (5):
>>        arm64: dts: qcom: talos: Add camss node
>>        dt-bindings: i2c: qcom-cci: Document sm6150 compatible
> 
> I assume you are still going to address Krzysztof's concerns here
> before merging the whole thing, right?

yes,I will push next version to solve this problem.

Thanks.
Wenmeng

