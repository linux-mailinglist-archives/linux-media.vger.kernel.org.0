Return-Path: <linux-media+bounces-51822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FXTINWgfGlkOAIAu9opvQ
	(envelope-from <linux-media+bounces-51822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:15:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368DBA5F7
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3570330095D4
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D12376BDC;
	Fri, 30 Jan 2026 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDohdtrj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYYFmmdi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCEF36C598
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775298; cv=none; b=I935bys7ad5RZS9FzgoMVgOTlxJpjQ/WgcmmJRswvMJEVIUSwQKySL6Sx8BS6uavjKEmTq5sXsHGgooaZjrK2y0/lEn4IiktYVfgCwXvCQJyVgy1qYjdSJN7pG8ESibL8cWnvWe2EQJUpIWbI79thvd8YcKlWw+y1fzutGjbJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775298; c=relaxed/simple;
	bh=7gPLLuo0R365g0WwMVl/6Z5EkvR9fQXTSs5UxHQKnH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/fgReyTe1SqtTQE6b4TymqGsQ0Hf5FLTcifyCpAKEdERYSR25wnh+0RWUdcbdssQvpA1tZOd0LDmjtXGL1XpyczOqXbGvMH/Adp+xapfeh2SHs53DaJMvK8QLg2ZVghFMCgYgYEGFm8YtCzO4KPcFcdrUNMnRGz7KiIL41RpnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDohdtrj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYYFmmdi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V5BU2675495
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMOfBtvkC4Tbp14kDL4VSSBI+wSkYFqvD/3VKpvDmeY=; b=FDohdtrjKZ3gpv8K
	6w3cgpMiyBnVsfO5Z6edJ6FfjaF/FVv8iXGvoyDYekssKwKNDMEblT7pHPrk2x6P
	gKdDWSvI85ICXlmoZiWMr3x+nzp2ZU/XJZRgujCHQQH/yKRcg5mvcprPTSn48YlQ
	lUl/8OzUeKmJgYJIp+PqNVzL12llk3kMg67Y2lXPEALEmIl3xkRnCJEcZhc2nzRy
	0/DuMi4/MprBRtq0QAu9E7fZL4fJs+BuvPnAGKsCRpAUqLGQv3vo4CW9nnJUzv9G
	LGYh/AvMQ4JqvYSySbRT9On68KbDIf2HLSAuKR0hMtFidFYEkvjiXSjaeMImH0Ry
	OEcDaw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t340f7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:14:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82371886e58so1112573b3a.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769775295; x=1770380095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMOfBtvkC4Tbp14kDL4VSSBI+wSkYFqvD/3VKpvDmeY=;
        b=dYYFmmdi3eZIMaBNQnzgNKTuf1RYPhjGmQvC+mrvLDrjR5UoQSBepZevrwEZB6NR5O
         VUxhSuA3GOjWfc3xQ8/Jy0QFY0plmhhoEjmKK2V1ZmZAjHvU5dEmQtFxItUcKa5Z2uCV
         NIXs8k1u9e8pCC9KX21iHWBi8Hnim5VPkY+v+nPM3v60oavgrg3tcXA0Xsp2vqKSTUwt
         jf/RhTuRud7Gja3JPq+eXSW852Y6u6LtBFVa9HRmp418xS91t4LcXFRwGLJPSs1RxOlw
         tow7vleR3OXD49uD45p2lmQ2hwoXxs3xednsFkE+TLU0Im2pe0pkIICVwAYyiYBjRdDE
         9DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769775295; x=1770380095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMOfBtvkC4Tbp14kDL4VSSBI+wSkYFqvD/3VKpvDmeY=;
        b=mBEQwRZmytjraOjQ5waNLfJa3WcyStfOIHYdljkyjtKR79qbkwPKChkh3wvbPjG2Tk
         NhIzENHOVCy7s3z5bnFWX4S0yFZPrXoDxDJwv+xVeIXzArL3fQGYB+9vCbBDVHkGIs5u
         49qmN3k6s47ZKDzvaPrMajycQTHXKuDpldevhsZ3i7ir/t/qL5svdMtdRpaAR12TrLds
         J/mtFj8SFDcGFkwfjyvUrgfAr0SZlxJednMdQLv2K/Db8m3Oc0snf7/CgrkRFYTyXN+L
         kuNiZ0MqGE9A92siJ9CUDsuUd4NBiEWdR+B5pM46Q+thucc4RBzy9kzpcgRviGu53xP4
         9PpQ==
X-Gm-Message-State: AOJu0YzaElvStZ5XyR+84xK/mh5CkY67OANpSv3/3h4Hy8FUsN0zqrji
	shnEI26Fe9HR+jdMYnPX7w2oGHOHMzBXXeRJToR4lRshs0tXxWEG2JsjLC3OmPqTwAAbwGpS9Ta
	a/GU4QmFN99oIixdat3jlxbZ7vKJA/BGJMCmT+tol6TB1RNwp20UF7aLK0fkMeMDOsg==
X-Gm-Gg: AZuq6aIDVeG+30wSbhxc+t0mX1ixpzziJsjgLrRNrjskzYgJzQtSf7HzFL4Mzw5BiG4
	MKbafopQI9EWNF4i9INp2Bog6w8vwCZh7OLWEo/cvcGB0/c5UR618yGQ9qPQ4+qCDcphDPuXPTJ
	fWL8cqXQCELpCP5N0NV20X7l+CD68dLdCSsJfTX1cwPiHfovZP2hMeO4EvhHyF7Wo329uMBdsFV
	1ASbgJdTYM5C4foaUL3mrARW7o9PGQzMguYOBtApmTxP3fniOOBf1nHTKK+SROAgKCpGvpCAFgN
	shz0TKOMOw/b5Kh8Oo0+ik2jU28lBLDa5vjJmXEFDKAd0VENsoQC8Mw0Pd5N9VRhwwJl2TMi5a4
	bF3PzV1xwKLYRufWrKa0O5J9jFbJH3NEtPD0CP2c=
X-Received: by 2002:a05:6a00:84e:b0:81f:535f:b48a with SMTP id d2e1a72fcca58-8239201ca27mr5837785b3a.7.1769775295167;
        Fri, 30 Jan 2026 04:14:55 -0800 (PST)
X-Received: by 2002:a05:6a00:84e:b0:81f:535f:b48a with SMTP id d2e1a72fcca58-8239201ca27mr5837743b3a.7.1769775294652;
        Fri, 30 Jan 2026 04:14:54 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcab8sm7603671b3a.36.2026.01.30.04.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:14:54 -0800 (PST)
Message-ID: <743e5bb1-d17a-729f-76bd-f097674452db@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:44:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/7] media: iris: enable SM8350 and SC8280XP support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMCBTYWx0ZWRfX2Wn8j9j+iCk6
 iUlfwI79ErWgJdp+zQHjUL8+lxhXzVVSjji5i8L70dqkozgBLsrcMZzyi0eNmIBUz5yVscUkPeB
 Rao96qnLBy96tAwRnW8DtTdalMruITTlsq7UxkEMoRiwLObK2zKV1jLFvS8XxLKVOfUWPt8asTr
 Jz29Eu1qPJWY9NZCbLamFisCjQ0vDIKaxixCaPzgVnlR6/odq9Gt+opNoS9BXI3bLmoiRjHJ1IX
 4etso4vH2r0oeL/C1CAn0/in18Sm7O4V1OKDK2YPwoUtDYS9andcY0608t/GQ+8G/Ua63KP2ea+
 mSqz/svRny/hVr+fbivYMyN4cSF1KieXdcEvx0Z37TagJmAE2mSIgaPqZg4V6JE/TzyzG7HDBER
 qqam/nka6ag5m8IQs2vI3h2es3nYymBEvtHXrh6cPefTP5UwCZp2xpmzbORIWjP0dFnpNhbchyj
 4jUlDWC/dNB2OfC+r8Q==
X-Proofpoint-ORIG-GUID: 7zKKbDisJFC-M1RYJu7pFfS0F3RPg9rP
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697ca0bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iwIoCGO5DFP6kGn-s28A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 7zKKbDisJFC-M1RYJu7pFfS0F3RPg9rP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51822-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8368DBA5F7
X-Rspamd-Action: no action



On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> In order to enable wider testing of the Iris driver on the HFI Gen1
> platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> 
> The driver was very lightly tested on SC8280XP and (due to the lack of
> the hw) not tested on SM8350.

Could you pls add v4l2-compliance and fluster results?

Thanks,
Dikshita

