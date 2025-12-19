Return-Path: <linux-media+bounces-49196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C11A8CD08E4
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE90230928EA
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74993043CF;
	Fri, 19 Dec 2025 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUjzvPAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vk9QwIpW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE132142A
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158725; cv=none; b=IqnZeczxSiokVFNgut36jdwmVPSpEm14nHK6XqTh5dQmuhP/DMnVyNpjFRko1vGPT9U9ZM7rsTJL4gGOFucSA8HUeSVIwnrdNsO0oTnVPMziItXqlqcD43FPPfQcNBV4j5L9bZDB6wEOOuhluHWGN3JWEm4+UDiBlbc4yWZFzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158725; c=relaxed/simple;
	bh=yaYu6EUsZ2k+dyATPW3HziO1wVqig5bKGOvhvVQiq2w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OTFyx13dB1RMBG2SQFNjPxkBzRnhe7WtCl8IL8yEBx10G9S/UMDayoiKujp2wHdsPswDkqkWNaWPe6HMHkJ7z6jjynA2pt60lxmz+Gv80rF38oigsMlPBJ33Zy3okTRUI70rakjr0SMNRb0nFGRx/90sTbjmN2Y5vjz2srsgFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUjzvPAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vk9QwIpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBE2W33999351
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hlktxcMQ5o7f8INb/EnzFpPAWbvL6c59BChleMZu85E=; b=YUjzvPANYfvnEzKY
	7wWNL5drEYT1SgVSWU9hAVRfWUjp+4es6rFHIeyu70/YurMrzByQw/m34TndupD5
	vsjasYjbu/deqBrTbQ7Ta/Ga66nWoMi7U1VUOzXnZS5hiCrT32oC7HB19w+tinIU
	/5yDP4ZhjLbxiiD7dV6j8maPEFt8biA+d2Tz1NQvI7JbleGIr/CroNutRdV7adBF
	M1ca06Y9ABsrqPha9moVyCy2DJWjGvCcVPnFmHG4Wwuk0JAb8ixmiTIA4X0K6oRA
	OeMUJpDmyroSczh/tpkGzUBrmdAmWE2SQ0ImFIuxgwkt/kofkpWZRvZx+XEG2UB/
	Z6WnVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29k5wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 15:38:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so39283751cf.1
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766158721; x=1766763521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlktxcMQ5o7f8INb/EnzFpPAWbvL6c59BChleMZu85E=;
        b=Vk9QwIpWcd8AmqxlkJQS3/7A403XsFJWkvPJjtTcjdwM9c12R7KzGvcesHQZ3yMFM0
         U0FW+ocQGXXFyal+3NvjdHsTF330UqQTFShwPM1A8wfC/+703es+heNjp+rvMpsTlmK/
         re3vQwYpXoXE99HlKLNeEYBXG/O6mGfTFYu9CCXNqgbkXbhNsrUxcU3aglFk0o1DwdbV
         ZarnXz7/eK36ape0EBjcFBrIYpIXWiU1Zp1Txfak0WawNXsUAb3fVF2kyKiqa0XP7ZNl
         i3qccux4Yi+b0UcNBQ9lp8YoPdTcckyNi8lqoibuP44AmoKCAwwqBVBw8VpJvr40Sym1
         wwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766158721; x=1766763521;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlktxcMQ5o7f8INb/EnzFpPAWbvL6c59BChleMZu85E=;
        b=M3UZGrjN4oYfi0oJJWeDoB3O4gq4xPjdzIdaif0AAnSzz1rECjY4aO3f5MMazcuUc+
         vkowpjdENwZXxh2gUg8Cv55M+HZR7HRJCeEyH4uJyLkEWRSW06iyZXPWdjdRPfdbWo2o
         1Z8ylQHVmRLt5LPBg7MQwmeZ+z6Jo4TcG64qg2UOeHCpx4nq8+gNUJmZJKbuM62/DUqr
         Kfn5sFCF+29/eBM3JSd/82hJjuwuQPzhXPBmXvNF8r9l9abIm+hNCZ/i3+QJZ+EmhxPa
         IImIwSn1+MDS5VaXS9Km10MrxEiKjxdX/zdbq62GoktjJIQqx+WB2AsgFPkG7fG6Vxzh
         gg/A==
X-Forwarded-Encrypted: i=1; AJvYcCV5OcJsOzmcSrQHZxZIFkgH0Cfc5XXVfu3Wzwt9ILDWZg8yQ6DmPiKCRdGiZvsjDqAIdCJvxC0Yb2rL7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCaVszHjeCsddidgAPxyOph1Dy9I+6/V5vvJpTi+jAuelyfl2+
	NaIcri+OA83b/jCyK38QszL0GnBOAuKMvragW+CVgrVIZKAYiB18MA9pElLvjGkLqv0eQIdq8eK
	sEyKUZHDHE5kXTZK5cdzcR09wtTKldVNaeZP05B/lfXSexswbXTiIPY7dxLMd8qvonQ==
X-Gm-Gg: AY/fxX5EJIW8rri57EhNMC8r0ZhZlVrAxd07CXQuhr2Sa53v8d/3EZXVS2SeyyRV0Qd
	txi/Bzgs1UsRcxJSjY+KDcwfsILbkk07JEihQ+H7S0psvH9spzAyFeRP66VXOGAR9qTZOl8IQmh
	xg65lZNTGmFlKyy4mt5Ji3ncDy/QzhcQuCWM5l45HknjU6DqLN7fbu6e8RsdMbry+rUjQaSdik+
	A4r3RR2hVnF3u/9UjAXrmIib919isoYYevNgqFTJ0HIqhvgMT3Ju5IIpdbwNdTkhNsiIxz3QIdg
	8ppko3EKFcZwDrCksVF7NCYNK0n2DhRWHkGOpHjsyKhiy2v8vMG130l+CugtsPWXntjedEVQzIv
	4tMuewrPsNWOB+W2UodnRimtWkXg++WUjQg0jscVj0bvUCiaBGPs2HqLDyTcSOLF5XADo0157la
	j/HkHCokjZx2X5u8CbkFebUA2Jfc/3AsczBzTT8xYJetcwqZ0W+++6STXQ64Qs6IKyo06LHiAtr
	YcK
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr112791081cf.29.1766158721511;
        Fri, 19 Dec 2025 07:38:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFz7Cs9DiwziUglVOvGaHZDt5ibIn6DCmJEzWtyVQj6LLINXZH1VITR5kgdSGsQi0UzLtTAA==
X-Received: by 2002:ac8:7dc6:0:b0:4f1:8412:46e2 with SMTP id d75a77b69052e-4f35f45578bmr112790581cf.29.1766158720921;
        Fri, 19 Dec 2025 07:38:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm258564766b.24.2025.12.19.07.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:38:40 -0800 (PST)
Message-ID: <29830128-8b75-4c57-ac55-0158f3688f12@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:38:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 1/1] software node: Also support referencing non-constant
 software nodes
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        linux-acpi@vger.kernel.org, Kenneth Crudup <kenny@panix.com>,
        linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <af773b82-bef2-4209-baaf-526d4661b7fc@panix.com>
 <20251219083638.2454138-1-sakari.ailus@linux.intel.com>
 <erf3c6r46lscxeqj3iqc24rkzpuuwrdhob7isva523pxtxtoy4@45gxuhkdbubx>
 <7d04ba37-b505-4207-95c3-b0ffb0736ea4@oss.qualcomm.com>
 <DF2AFGGXTTFI.1AXC4N182UUYD@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <DF2AFGGXTTFI.1AXC4N182UUYD@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69457182 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=nefWIst9nuTk0MLHL2kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8-RvR1PEXyHDXuG7impX6TgoZrbbkkmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMCBTYWx0ZWRfXyysuXZkQ8NzZ
 dGUQ1SbXBqmWIfESVBbgDRJPygm7574QE2fZEwa3Y8uYEWxv8LbgthGosv+aBTZUiWz7M+zp9Bx
 ExuBSrAyiqrfsvknl9s49kP8tRmkXYdrB+RdRlwyC/jCxQtTpvGSR1OzQTd/wUJK8yo7lsc1+Xl
 6SiiZrMWcPIu5eNHcD50mz6ElIaE1x4t+uFFHp3bstDipOKbsIi1ZOghXpFAtQS37eDhEfCI5up
 DozCgVMAFPTOYNbw12jv/gLF9c5VMZ0q4rX/poU28huAvLQKxZESl52WDpuDjNDc1XroG62zVzm
 8z7MbiE6sNYC0l6sRPAETFbhbpS5yBIJr5m5Jbpxp0WGe5D/xBdOjr6qQK33Djn4uWyteUfvvM3
 6wo1j9lpP+7rShbBNAP0zAp3t/YOOgRqWaRRgM0dDDzhDBVBn+WHJUcGPUGiqdUzJrG5ZP3J8FQ
 Qzl2vSl7V9wu0J2P9Pw==
X-Proofpoint-GUID: 8-RvR1PEXyHDXuG7impX6TgoZrbbkkmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190130

Hi Danilo,

On 19-Dec-25 16:11, Danilo Krummrich wrote:
> On Fri Dec 19, 2025 at 4:05 PM CET, johannes.goede wrote:
>> Since this fixes a 6.19 regression: Can someone please submit
>> a pull-request with "[GIT FIXES for v6.19]" pull-request to
>> Hans + Mauro with this patch?
> 
> This code is maintained throught the driver-core tree and fixes for the current
> release cycle ending up in this tree will be sent to Linus directly for the next
> appropriate -rc.
> 
> Is there any specific reason for this request?

No reason other then me not paying attention and since this fixes
an issue related to IPU6 cameras I typed the above on auto-pilot,
my bad.

You're completely right this should go upstream through driver core
and my request makes no sense, sorry.

Regards,

Hans



