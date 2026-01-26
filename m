Return-Path: <linux-media+bounces-51532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KsFFHo6d2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:57:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81D864BD
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29BB4303A259
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A20A32E72B;
	Mon, 26 Jan 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXtvT2vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izw88gto"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522AD32D7FA
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421097; cv=none; b=FZ7xjH/FiPE3eKxrXKCkhMYaYlm8Wcj9Jzcasc9lWMbk4BnLHu/XMFnJ0ex7+O0Brb2xNIf+NRe4MwrbpFWbMiqSYSVeZaJA1P63uDWLTRgyXNkGP7ROfJ7Zkuy1mk8CZJ7ick5ikRwnPRgxJfbYWvy4DxcyO6VIPN/QzGJunxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421097; c=relaxed/simple;
	bh=0gdTK/CLY1oeBEXoPZ+GN6MfD7nqQ3nv8hqnX0FCRpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDwHpwL1YYzptqgfoaHGV141H2iOhHQZ1gUdQbuang45U4zZCyjBX9viTezWT1jEiGrx1k9SljWxGxXObfLcIQ+70RmjPqIeuWQ+soDkhez8fe94udr8rPlLshaiLRdYs5xBdmEHVKXnO7x2HjAsisfufQk7X58obKiDm3xUIMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXtvT2vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izw88gto; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5UJT51019092
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmLOBzfegjFayW73OL1Q4vyo/0Kk1DRfBPnIgbqNvIw=; b=hXtvT2vdcoloHg9h
	LHgY/SQKo8AXWY0L9HsrcPpnAYhnodAMfn/yKnREyIEo8E1TpsS+YbYntb6MMetU
	lA1G/r4iDLReitBQDWNfh9ptwfZD0ZWgVCR1EwfacaqxyNMo/RM6qo15C8EEm4Lc
	8tMjNo7NGrAH28wAV2zgS4otRlKCLmFa3grbELv9Mbx9WuoO7kfbgikMLjZDgY5Z
	+LuClp3i+x9HnmD7GxDuNjNZj6bCP5ig6tZbbM6pRtgNDe8PVcVdBhDGf1V2Q9l5
	ofzwPdzo8pskdvdBrDaS1dVUaJTXhQ+BIEvjIR8AddFXgcbfGQgGCKgGlo0UVgIL
	6FlcFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680m5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:51:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b137e066so128718985a.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421095; x=1770025895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmLOBzfegjFayW73OL1Q4vyo/0Kk1DRfBPnIgbqNvIw=;
        b=izw88gtoxR+rGpVVlyObGwNMCtnJeneGxVbjiMxfEJT1c3c/QD6o/w471nTMkwSqQV
         VdOFd4YHWgreSmpjJhQXjF6iqbTlBkfUz2pHOB68ZLnW/b2ecT+atf0ewJ1wBb6qVD+C
         EPT4peNJL8/LsiTJ1SnhP0NJ6apduU8/quRFWUc2SWNnWqE9G/+sKp9tB6eqzX79feJt
         4b/SXp9RruyW3mZ7jZCWpjJ6N/miQgmwMtWTD2bnNLTFvvtZfV6tlMZsyzmLz5IfqJWj
         vBEZ12RgZbo2H8Y3UPusyMmUr2KVcmonfasdnY/SgB7wh8+MEfYo9D8cUTZf6HayYh2A
         EkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421095; x=1770025895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmLOBzfegjFayW73OL1Q4vyo/0Kk1DRfBPnIgbqNvIw=;
        b=QTrjRIW9FttOavQu0hgd3CJnmflFqUMKD83PwQ/q/uXRV6UHf6nrR7r/DMNfu2Aepv
         UEuw+ddf+c6sZfCgg2YqiJNj2m/ZYXzP40eA2d4juwowgyRijsCBw+gJENg0j01Bub1d
         Otz9dhjIjcPwTOJZvBUn++Jh9DLSivbgCMZDumtB/c26ZT1UZbb0MpSKcbkaS4kzQa+f
         NvqYnU6/PA3lJNeIG1Utt0Wl0IOxjo6mr1vvVNcX3oYqsVgVDcWAA8SIX0Ic/iBJTEEd
         ls3FTXb/t51PdIkmIqEXObJGPm+NGRpMBNIPyzv31+74YYiUbREf8jzX/A8uKqCss8hM
         i75Q==
X-Gm-Message-State: AOJu0Yw4oXyKnPz36nSPfrfQWMq8IhksRHUFzKrexGLhajyWsQeTG/O8
	2J5ec3pZ7T6Bn1w/8lrncO/JZfyHNiXFzXwDx0tYsLyIRchlYIZyT8GnEm0eU/YdKuokAvH7jYW
	Q8/uylELc5/X1LXbSnvYC2V+rBOYHNs0qU8bFhw1ubb17vOpgTjYBMS8ckHcFgZjQLg==
X-Gm-Gg: AZuq6aJzq8qQaf3C82Xx4f0dq5h7My+z+r3Av843UOhGAisbL0Oas+0+SYOZEyczLsc
	jsKIOXFI0yLjHeY9QWMDL+DVUWLr5hefaea+locBTiluAT7HQHCF9+SJ8q/A+bK+6BA7eAFVn/p
	c/FpuVd49SqamTFh8bLMUwcn2SU+FGphG9ZNqAlLplnhA+xAhxv8ankq+xsVsWxdxCUf5VZXZgn
	WjGyouFXQwmUXtU8ArtB7S6ltGk8BHT2i4TdhjVHmWsRyG9H1yCy4WHTpidBU2RxRV8j9Uw0thi
	LYGKjq0LRiuNoB1Xy+1qbPmsUiNGLbBFxBPWmFGMIRux7LhsWKF+4UI09300GYsLOSAz0tVHyIa
	mly4G50SaR74l9mlo4BSkOOZcLKIjxFYFv1gC+04BVKu4reo6vLtsljusQMi8VVKn858=
X-Received: by 2002:a05:620a:4096:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8c6f9589bb4mr305225285a.4.1769421094810;
        Mon, 26 Jan 2026 01:51:34 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8b1:c1d3:8e7f with SMTP id af79cd13be357-8c6f9589bb4mr305222785a.4.1769421094360;
        Mon, 26 Jan 2026 01:51:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b417339sm613283866b.22.2026.01.26.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:51:33 -0800 (PST)
Message-ID: <012c5a0c-f33c-4fed-9c2b-073b27664c9e@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 10:51:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-3-d21861a9ea33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-3-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69773927 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qy7unxT4yfihSX53VuUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4MyBTYWx0ZWRfX/teRJvXj/5Ec
 slcd/yGt0n2OveZ6UXoi0u74YlqGxCBsUhJGn+xjf1YuKYSJi7Ywv2LoF6KMF+MpDJ77PY7GNsQ
 d+BQWM6d0Z02OXMeDQhEtaoe53YT7vuR7p/VcBBsS6r9pS1+xgqOmxFdM/OgVrBerOb2pWbn2E8
 yiJLjUb3tS7+j0HzigSGyPW38+RWgtwLGIX3hdLegQ4SHoCTk0AXCeTGk0Pc6HQrSCNysHjkLYU
 HfyPykcecKcj13EnGqvQq/ZmRMNptcUdSt0PLBgKb1b/uuQLTewk232VPyfMlN6cosIsjwDH/v+
 LcZs2R9TrhBRCB/DhYCiziyzHITeLqOXBJLUHWZyH0ybQONYno0ulEDcfr8f9J7JNjI8zpd9Oc+
 zpFgiNGHC5cDYzx4/gdodc3tFxfdP9E4gFodEm4Xvn4QbuaCKoVoFcqbwyFU1tYIHaTiMyz8zWs
 qQlJA/yX+aTY6EJdIvQ==
X-Proofpoint-ORIG-GUID: 3m0dGt59uOEnhavbeXFEEaqtri58ylVx
X-Proofpoint-GUID: 3m0dGt59uOEnhavbeXFEEaqtri58ylVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51532-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A81D864BD
X-Rspamd-Action: no action

On 1/25/26 4:33 PM, Dmitry Baryshkov wrote:
> Move memory region reserved for the GPU to its proper place in DT.
> 
> Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


