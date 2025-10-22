Return-Path: <linux-media+bounces-45298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19BBFD912
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70A074E067B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EDB28CF4A;
	Wed, 22 Oct 2025 17:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtNdCy5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154D28CF5D
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153970; cv=none; b=eXmjjRC7PW5Lp6EQ4jf7vJ0zpY63xWx3P28dZedbsJZ+PfW5z0LcPT38RuOBcWbsddx3QSqMZ2ou8oNvxvCsO76l2QIw13CYxluI8KOm5AVPzj+T50roOcQ5mKw/wBgaw+dRSUh2hVhvtm5ZymGi55dTwDc+/J2sybwIdrbQrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153970; c=relaxed/simple;
	bh=USW+PUWWPpnrRXcF74DhE4ODa37KlmuAIX8ScNeYsds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mD/OtQHYqOqhau3iPTyt2fihrp848sAuZ3SnEbP1sBeqAToGJGvJ7yaAdnXcoAr3X8viH5S75EmKhwbA9cz+bffidjmTflAtlmrUXmwoobcveVuUXdt0jWowKCzhmZw7Zs+4d8e8TVmXc5kiuH1H4yBcqyNoP51C2SoqMQBxltE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtNdCy5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MG2FXx004617
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NesJS3g8+KTZBTXGgRuCmgbeZX+rTJmB87NGF5qGsA0=; b=PtNdCy5YyxueVtiU
	g19o95P5Ze7mU5ASc30ap85Mn3fYxQ6VY3TJYb//4GcxAHI3g2PaRjfHCCAV2wnp
	qJJdz1XHO9jk31zl7+LQdy1QlCdzDV2kN2I3MUIFIyMIqfTo29QzgmYyjGwbdB+P
	vJHc7XU/9Ramnc4gsJDGuvaBi2+tE4XznWPo0p5QoG9KqItm1+s3TzdjVudcBSyj
	61/uS+DwPV3TOK5KWc8AYujvORdYaV5A9xWkWvFqbvCc5Bd8+DzJNjmtfgbNSc/t
	bV/RaLXMTSRyfuMWUZLMEuxQjqSLpUu7Jd0cpb9E0ALS9BTvcHPokepcU9g4IXN8
	cLrCRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsb45n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:26:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-826b30ed087so21647166d6.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 10:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153967; x=1761758767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NesJS3g8+KTZBTXGgRuCmgbeZX+rTJmB87NGF5qGsA0=;
        b=LXv0+Y+21ufIRWG/VqUuY0389lWLS32TgPFq8GbRDJFGK47Ruu9P+bwgT/52iEsnvj
         A2Qv6YjhaughOM6Y3HvuyUKZ2R5xAPbteCB0fJ1iYZXMMBTNd2sHZ+5K/iZMHi12D8jg
         njtA1l/pB5tqWrRCZ9tzAPsGMhCmkCGX+5wfZLUSJt7myPNjmBgJrGTbghYQ0wpAXYCZ
         1ydx2q9Y46Dhj+npSzmsrGyxaLJ6a8pDEpoIJ+9C8PZDhez1VFf5fEz474QklwZdnBhI
         LudgVsYV9XJegpGVD1tlz3wbLFZarATT24jc676eUTPIGwBUNQkjl9C9JL3FvJmRVao9
         TsnA==
X-Forwarded-Encrypted: i=1; AJvYcCVyGzFJLjDLa0ePbjICKVTmwbmbkeKEN6Qd1c1Qx2OR09Y87PjybEZwfvhZnhMB6xv2tzuUnJpTzCnI5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz610GYz3sfY6zfIURadiolcc2hNMyzF/WPNcmt82y272qHsviZ
	LUA1pvUd2rHZ6Vn9ZJH/SS29xe7pC4sQDcPD3o9hd2IDkRYI+0bOagJTh23IkT5OhOgWOGQqqoZ
	7khGMHLreGy5id9D/jttW4dfjtC2ytstdtfTny11JS5/+5sTB51MdmS7BS19UjPlfow==
X-Gm-Gg: ASbGncvu8E2/bBrfqDIlwzN9iu/gWBJr42ACqCI/2Uc47WOgnSM0gfciti3mUQxg8ea
	7CdrxOJZoeTBWPhWwFRNNRFCFwMyFmgzUX1CzWGunwF/trveH4kQzr/ds28Txra5YW7GMWsvax3
	jGl7TPnCa9aQm48cX6GmoQ6pNJu4R3imJ0NAm5DS6HVTJDAvi9ixuLtAgBY59ac7IWKhthNmhjl
	9ZtGPWNrLsFg0ZT9XawnZqsCJWiO/+9DgtW+2xFlkmJGc/HXRP99tc0mUuczCvDWr3oqWKNxn8O
	8Zctlquokts1wWOqRYQ66teH0d4pgiULv2ffRtXBqQUunN9tJQjkAWztAJ59GSzhp7Dm/EJbQc3
	wklUX9ciXLHJtkHQ/8q18j7NurZucB2rvpZtJciX5HwO8p7UKgQ78KSd/
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr66574351cf.4.1761153966903;
        Wed, 22 Oct 2025 10:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWoCkyY3maLQwitXsvWuOEnhkY5EIFfN6+Mfenw5bYCU9mWOjKc4pp1kd5IZv8Mh44tk6mWw==
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr66574071cf.4.1761153966339;
        Wed, 22 Oct 2025 10:26:06 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da1a55sm1415503866b.8.2025.10.22.10.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:26:05 -0700 (PDT)
Message-ID: <9145c0f7-c82c-4b33-b421-a0af24accb39@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:26:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] media: iris: add support for video codecs on Qcom
 kaanapali platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX5wqIChQIOgaw
 sLlSnZ7OTxppObowWWuTnwStbDzqqJqIAvTk/KaiRlytilXDFCJ8h4ITK9CoxlklvG6fU8dUEf7
 OJ+SuxQid75+wcznJ3QervdxYjDJLHEdpIakE6YlxHTK+IRJSteNolTxBHHeNu2qTyuyKmL434i
 h9bzMKd4lLxyoFfUQ07MaWWUv8FKn23RLG+KRUr6K/I/HJhGAp4buG9oIMHEdhFZFtu1xOJuV/d
 bdL19BS+LOHKAIkpWTrI4ro4LN6jCz9KvlKwKd8U4hOg0E1Brw5Hgf5Eg89bZdZdgD+PZuRZciE
 zXdDdTBRZ01WUcSj/K7WrAF6tVFN8/rTQdQeGc7F6QEdGCY2SYWovL4VWDFHFi8wbzVkJgUb8m1
 M21USNsng6bQzTTDaH8RSuubBdiRIw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f913b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CPx4A68E0eaEKLl928sA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Gamle-0W34xiS1RBM7hy7DMCtOjbkpP3
X-Proofpoint-ORIG-GUID: Gamle-0W34xiS1RBM7hy7DMCtOjbkpP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/17/25 4:16 PM, Vikash Garodia wrote:
> Qualcomm kaanapali platform have a newer generation of video IP, iris4 
> or vpu4. The hardware have evolved mostly w.r.t higher number of power 
> domains as well as multiple clock sources. It has support for new 
> codec(apv), when compared to prior generation.
> 
> The series describes the binding interfaces of the hardware, buffer 
> calculation and power sequence for vpu4, and add the platform data at 
> the end.
> 
> Please review and share your comments.
> 
> Following are the compliance and functional validation reports
> 
> v4l2-compliance report, for decoder followed by encoder, including 
> streaming tests:

[...]

> Changes in v2:
> - Dropped dependencies from binding (Dmitry).
> - Dropped optional items from binding (Dmitry, Krzysztof, Konrad).
> - Updated binding in sorted order and proper alignment (Krzysztof).
> - Fixed order of newly introduced kaanapali struct (Dmitry, Bryan)
> - Improved readability of buffer size calculation (Bryan)
> - Optimized fuse register read (Konrad).

You're still reading it at every power_on/off, which I generally
believe is superflouous.. Unless the hardware has some unusual
properties, a *fuse* value does not change at runtime and doing it
once should be perfectly sufficient
 
That said, this is not a hill to die on..

Konrad

