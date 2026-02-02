Return-Path: <linux-media+bounces-52002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCs+GjyCgGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-52002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:53:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D777CB465
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F992300A596
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF25235CB92;
	Mon,  2 Feb 2026 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6bZyZQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEb8lv5T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98035B64B
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029551; cv=none; b=TGd9VO6uX8X0wuaT2KCEZpLMVOhu7emrtOUnWKB2qSxD+rrMwkem0dNJTGgIYKGOhXUxRY4zmn21TcpTmzDlTELYAUCfLK4OBgLAr7Kr82B2pPUnP/SLAWdAarzm0BUZWBRUHQM7nCVru2c2O/EMkSax7+oW09QWr2kbbdKgwJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029551; c=relaxed/simple;
	bh=fCziRhWKBZuvP9alCWifj7IzAQ/mTF7ymEZmrRCQEcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llu/xb378PXTuJHaKE2vS2ao8XpZVkRWQRBBxnDYK64ZI5lk1eHqquK3KZ3ln3e6rBy6AmojqkFk/bzoxFXfljI85Z0BpNC34IOLQvQvx9DddGqF4lOzA3Gan3+xsrzZE5C/mfifomSF5s5i/L7vGXW1s6avG5tc9j2IQgtlkjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6bZyZQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEb8lv5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61286SUb580756
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYoS3ICtaO5tPHkLCxC/P5GpAbef4vBNI3cEG9qbghg=; b=R6bZyZQFl+kk+kCE
	DXu3SWi6AzUOe+ioLyyiqYYOQ8m9Sa3nuVE0MTLBw1dj1ASrM9+3h77AzbLnklLA
	4ZUY23N0Xz8ptDDPt/MHuA2VQzlKFl7VyoF8zy5vAafB6xyr8tyLkJQOOZW+7OL/
	bKHOFx33Q9wluuLiUoxzEDeuBHP3Ps8em2vpcb9GOxoGfaKkWE49Db4FORmiDps+
	pIJA5h1hp3lgC0i0xaWJdGlwEpAT+01YaJdNbbmkrHYpzxJHNS+A5n1Yo6BEJNI7
	c5fNPwWjCVGFyumGHDpON94sagASyeJeKqlsq17Ee/4wVN+ZsPm+rFnN8C76Y8bd
	NYL7Lw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ared2uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:52:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89481f822aeso11190616d6.3
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029548; x=1770634348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYoS3ICtaO5tPHkLCxC/P5GpAbef4vBNI3cEG9qbghg=;
        b=LEb8lv5TkR8iwDi4frZacA5OISdAWHUqAjCyC5uFvQsHIlBRHsxo7zU5QN1KJ2KP6g
         iXoIZYGMLicGhrmfNbYoHZXl0X/+A7QQJg/+5fnCAB98G50kl2+2393pVYyujZhxOx+I
         e427WAKr4hXe5SPFzOztCjLN92lfocJZB6yXSpQLrqmnnTnP8Vt0y5GhTmFAZnmX+Wf0
         h50X9OKjKyp46nObSQS52IbZcObhrnyLaRaC2k1bDS6KCSpYfcjDo7K/UBHxfYwtg0FA
         RvlFbAvz54Iqk3I2bci5Tpjgbljja5A6Bty7wMKLpOyfw6/U3dCsH6g4HT0h8wygCgao
         WjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029548; x=1770634348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYoS3ICtaO5tPHkLCxC/P5GpAbef4vBNI3cEG9qbghg=;
        b=xM7bsEhMVhATUKt9ZcDpvtLy8x61OSmRArcIfX/WhI85V3YytkCX533s1cP82rmo1S
         ibhKOZqSpmcF2pO0cBz8zHnGyx2uGQF3kfecyMD7PMcuF7J9fHKCrskHUCGyT6ABaTsv
         DxFCuSBmp5f/RSyAa/ntXDa+348TE6X60jWOzCsPCqXCux8Xbbfx9yUiz1+hYnMyzPAY
         NaH+1Y3WHa4KVN3SXqclnZQ9PB8DQpwwqoimLKWOwkeBX6akK//OwJXDGpBH19VVA//s
         /c8RHBw4e8DRdQ8TLEh2LEAqXA61iqvj9OgWznaH0sA1LUYffN7Fpaaz9yQUM78+Pnie
         skjw==
X-Gm-Message-State: AOJu0YxMEyQOFxVn4wWolP7vjoeuM+IrsIJhVb6xlTi7n1sG+KlxgVXo
	Q4BIH/vFqo2QDq6k6AIIYeycg1q2atLmWN4fBncMjwLsKuRR4qxDsxHdMvklrnEK/hDiW5ZhP1c
	Igxf/iHRgkUJO8GeEfqTE9Id219huR+jTrhGKh+yhsJYV2Xfqhwci33XC4l8uk/e37g==
X-Gm-Gg: AZuq6aKI7gqeOcEVid2TL5+Rl1iqGjkvwrjgDidSP1hrWvnjx0baywzbFXJ8YDCmjja
	w8HeOCQS1FMLBWvCyEIexH+SM5RnwIHiyCe2orvi56sTcsYVm38oVnliFudZrLhvz5vSGxv/oJ1
	zESAo8fleS4BFQfG/VrODV0yYHNW6dV6VnvT9zCciU96bJnbUtYUY+gyeHa2s89wCvhZOoXcOQA
	oFA6BeFNIsTBA29bLyPa2W+qxLJUQSO3ZX0iv5D3wtyHgYqwJedjdBwLC4cCL8w1NTJrelWu6At
	pVfa0SMAmRnXBEdgMMEt76ze4IJXHbMz1vts1BsbAGi28Da96tZkJ4U+48ZeqiWZdvkj7rvAIUD
	bD6ght5KKufvQPp3Zid5bmiZOH9lGe/dK5aBfdG0A4BxaHRtPTFv6qzDw9szrrwHj22M=
X-Received: by 2002:a05:6214:4f01:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894ea0fbddamr104961746d6.6.1770029548190;
        Mon, 02 Feb 2026 02:52:28 -0800 (PST)
X-Received: by 2002:a05:6214:4f01:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894ea0fbddamr104961486d6.6.1770029547618;
        Mon, 02 Feb 2026 02:52:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e53sm7513201a12.21.2026.02.02.02.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:52:26 -0800 (PST)
Message-ID: <5bd363cd-366e-45e7-b6a0-281e4c6bef97@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:52:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
 <70517c7f-92c2-4b2d-ada9-9cf0fe9371a4@oss.qualcomm.com>
 <9c334393-211b-4b3e-b9b3-57700641933d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9c334393-211b-4b3e-b9b3-57700641933d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=698081ec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XeJViENlyl3U9Cg1nawA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 5T4HdV7wIDQZnv34Uz7g4T8Ux4YNCiNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfX47GFGZMego12
 0S3gcAb9h8A2yuknAs55j97NQElLyhI+D/jFzXULrgjpxrmsnePjg8ToQPb921Ia2zYWXAD5YzA
 ciH3Pv5ZDb2UgjONT7hI9ZBi8rmi7dYlQtw/Cbyl72VgrrVTNTPz1zPkazAdrAT19y2bY44zKJa
 SRCTbVenDCvhp/NyxbNsBxNsXQPpwKs1FBeZnqenKDwxSRW6ULUHWIo933I3XFnfDwVZwQKaD0N
 pptXxQu1FQktQ5aqjIBxO9lA+O+4F+8SOYcFNW/iQL206acInES/rfAcFekUcFpSop4lPYgtg86
 Rz32u+P+m+S37XgsZt98L88Mj8fqtE2yTUp2gnSzjoFKMD+O4HC9C2kGOOxTPwV/D1N574xrA9U
 bsh7vp74f8QDJ9CXoYTnCA1KrScOUv1//VRNw1irE08YU+JSj9cEkxvhcFTSOKFsbgLHrQZ2ELF
 6NCM9Zb07zc/YUZutoQ==
X-Proofpoint-ORIG-GUID: 5T4HdV7wIDQZnv34Uz7g4T8Ux4YNCiNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52002-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D777CB465
X-Rspamd-Action: no action

On 2/2/26 11:36 AM, Vikash Garodia wrote:
> 
> On 2/2/2026 3:53 PM, Konrad Dybcio wrote:
>> On 1/31/26 2:58 PM, Dmitry Baryshkov wrote:
>>> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
>>> and increase H265D_MAX_SLICE following firmware requirements on that
>>> platform. Otherwise decoding of the H.265 streams fails withthe
>>> "insufficient scratch_1 buffer size" from the firmware.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> Since it's matching venus:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> As a side question, is there anything wrong if we allocate a buffer that's
>> bigger (or say, vastly bigger) than what the fw expects?
>>
>> Like, if we allocated 10 GiB for $reasons, would the fw just happily
>> take it?
> 
> Yes they would, as long as its bigger, they are happy. We are already struggling to get the usecase (concurrent ones) within 4 GiB, and with vastly bigger internal buffers, we would even worsen the available iova.

I see, thanks

Konrad

