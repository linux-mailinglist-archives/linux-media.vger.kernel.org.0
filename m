Return-Path: <linux-media+bounces-53514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE+UK1RRoGnriAQAu9opvQ
	(envelope-from <linux-media+bounces-53514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:57:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBD1A71A4
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C2E93163BCB
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9B039A7EB;
	Thu, 26 Feb 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7Uchech";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIlCC71p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDDD36C0A3
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113816; cv=none; b=mtCw5LGiVb28C/tBQUp2GLHVtE9PjB9wbsi1VtV1d5mNVGgvwbaaVlrpC53ltrsCAGRBuHor90Ti3/l9DE1WNS2uCZOL8eNvqMMjvF+aUpTZ0hq7nao7FbatOH9u33SNUzoxsBk2pA0rbi4GeJf8c3T9LBp7nC/eDSXX60VUmTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113816; c=relaxed/simple;
	bh=z5NZor0z0YEDs/FkKKI4jhB+YbXqvgaa9KMB5wnnxf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klMd6dizOUdTnZLFAL4RhFDnihJde3u3ZSAWIQM1IPzc5Wd83lYmWJfgRh+09pG5KUuLLUw2AwGez8bVtsdO6a+ZUY9VwZnu4+WDt5UtcnN9gs6nP+dIhG6kjQZwi+4+U/7rEV3ox3Vhn3yQSU0pHwFDYyD7AnGr9dzLaR2d3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7Uchech; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIlCC71p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKpMt339786
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXHcCUAahDk7OE7ASgZB/CF3kj1ncUhrWTqj6TsjORc=; b=c7UchechqG6CD1NM
	wjEMwQlmON5wotQhMhxrT2jKGHwqAWeWazIRbMY4Nz2Hkwjwj4YhxDGWLDWxjLbD
	T28WrWdnAlpZP8V4RvcgbhkZCnYp0klDXmhbllZ8C2q/nrj9sZkEZUFYf0Cl+Nk0
	s9NXVTs4ctvye0E/YiF9cWFxtrHtfgAsMbgbLmtqtcS6EatypXMYnwuf/g4k87F8
	vDc7ps6PMw2qFBajYZFsHl9l4+2KlxgUrkXdHpB2WbBzDRv6THo7O5+awkGSTHJU
	bWmu0/ErKc09mEt62PVCB+IDHL8wlUxJqtqmfeDGyKExlG8BeM6tNACay2ZINkpp
	OXDCVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0tbt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:50:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso68480985a.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772113813; x=1772718613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXHcCUAahDk7OE7ASgZB/CF3kj1ncUhrWTqj6TsjORc=;
        b=OIlCC71peGsFFoob71pWTwKCBg1AdMAsyCgargnui4mvbEkyYsc3AcaSmmeA52cirf
         NcLK3lIc/8goQ/ggVJumr+m0ds3jHucTbcyX/qUlgsJUmFp+z24M1yb6FcqSiYnRK+hP
         bSXgoTbzHPRS0cfMLehTItURRuYQPYrF1dt1sLPA/Ua1kiPXdqesxSNk8x+L0CUBswEx
         A6HBTAobCeq3PoxhKG858hPtBPO2dqpaW6eNiY2WuHTK+CbRh2IhT4lHsTj0Pb+GrBvV
         jPe5S7aKCYpySJWA8vJ4zmQ/jCGsToVpn0DpZKwNCOtanJ4fZyHRmRLu5eiCNvYmmTms
         wTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113813; x=1772718613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXHcCUAahDk7OE7ASgZB/CF3kj1ncUhrWTqj6TsjORc=;
        b=ZkjYUYbR2zHO16pvA7+A3m4ebprBKLVzFQMCMi1kgDzGFBXGzld/WDNIYhEgSEahWo
         Km5lD3pIaMvrNCklZVeczzlh8gSGIPgcCLzNLWFEOrSMEl27FwqaMP6dtJkIYDeqZBLv
         zWj/+zk6sUUsgEHnrFmx8QrdZ72DHM9CanETyBqllmT62tLiShNUGvgSmURHsHZDqeSr
         sDG/QCK1+E9z7RcIy/f0dHtgclM/hv4QXC2X1rUr5s3f0E4uOIBeHad6rxn3uQTOoI8l
         lcBPleCnGl/yKkZFxEsOqi1Kd+zZSpozj8Z/jXA9a/w2KtfiUc2swxjrlFrk/sqWLpNm
         p+wg==
X-Forwarded-Encrypted: i=1; AJvYcCWnPR6lCrD83hCnqlC+XtKg4xT0/aLh4Mc9nzJhxDRAt2WNwOq4y9Qc0aSflWm0yT5VTMN3U8EC2FNdvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxF6FA1kuDap9/MEqkQkS+s+njnNqBWSF1p51OZeiDew3nb+Xq
	z9Aevb0VJxFl14qAs0OY7zTCnH7kXSYgPyNHZ06y/eUClqxLlQogjdLiFvxYbEDJu/oP8q+YeTd
	u7FpNFYGFSkrs42JD6cO/N/o+DKg7+mDQOPqIiMULfidTopuoIJqDiYXuEWbfxj2P3Q==
X-Gm-Gg: ATEYQzxjSPldPPfHz8D5QwaSO6zZb6Z2uztdgmR/cTYCI/WxGKRJAgjEnpc27oS5MDB
	slQornD8StzdWhT5H/MiTnPxCusUHXvcPvbwbXVtfRiEjtbVHaO/AuMT9jpJIm8SCT3jdZoQ4PH
	uS0h7pcYpteJ9PRHIxdrYJfc0EKlzo/Y0QF1TtOzRdV0NFQtoYZ13bjZP6STaeoWMfK2A2e62X4
	6JqXssUV6YO9/wJ9p7KqTJK03rsC2WLDZK9+YkNwriO8aEAoNQXKy7ERoyw5rAbGvn1B4r898m1
	wrbjzFPdlHoDyNa/9MlTYN6GxHu6iI7t1sZwc4WXDPCB8Eg4BL99Tkd6p+zWjKmrB58xHoFR3wI
	Sh6/XbQCvpKlyhTMCcVCpLYnfksNrPciPkuMVOPslAQmGEPUfvi1HE+HtIZHxOdisS5rkwABlDG
	zfkak=
X-Received: by 2002:a05:620a:4544:b0:8cb:3df5:4b70 with SMTP id af79cd13be357-8cb8ca1a960mr1997991285a.2.1772113813495;
        Thu, 26 Feb 2026 05:50:13 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8cb:3df5:4b70 with SMTP id af79cd13be357-8cb8ca1a960mr1997988185a.2.1772113812984;
        Thu, 26 Feb 2026 05:50:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec4426sm58256666b.56.2026.02.26.05.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:50:12 -0800 (PST)
Message-ID: <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS
 resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyNCBTYWx0ZWRfX7cRuLLo20EL/
 wUmsbFepI6cmQfPaGmOBAqxvDuKrSPptX+E5+KCHHmc42ClUVss2mN9gfkV3uuQQ3dh1qK3JkdB
 AgshEg9Cb4m9IDRgWvMfyphAq/GgXYpFW9JRi/lf+M3tajPilx+CNf1ToFgOXn9JfYvmrgl5ZUl
 GGvEu43F1uCuJtHtV9S6BPw0fz7wCeU4Ju9GFYToHLzsV723tIsIC4ssF8gu6J5ynpDnrKwZ5uA
 kgel+YpZZYdOC2LCEyY+xnqFQsI9NMbuVOb0IDuYwuIKIzeADxex6x8wb/fxHOLMWR38CFc/Zgg
 eOyaV2E94V394kferqrObReiDHmx0v+uFFYVi+SZZ8Chgn+8UJytHofCqfoacFAJQC90vFGNbZT
 UqwdkA+YUw31MNsOj7tvriGRzSBUFgEzgjGl3hvAlULQiQxFQ9oRxL2E+i0W0dlsOWQ2gDKni0B
 z+k0mUb0kc8dCgtNIWQ==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=69a04f96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NFWZTZiHARg0oMLVeFAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KYqu5R2E26NUFfjfyO3gOcve9Ur2SntZ
X-Proofpoint-GUID: KYqu5R2E26NUFfjfyO3gOcve9Ur2SntZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53514-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12FBD1A71A4
X-Rspamd-Action: no action

On 2/26/26 11:04 AM, Loic Poulain wrote:
> Set media_dev.hw_revision using the CAMSS resource version so that
> user space can query the hardware revision through the media
> controller. This can help identify the exact platform variant and
> adapt behavior accordingly, for example, allowing libcamera to apply
> quirks or enable features that cannot be discovered through standard
> V4L2 or media-controller APIs.
> 
> Reported media info on Agatti/CM2290:
> Media Driver Info:
>         Driver name      : qcom-camss
>         Model            : Qualcomm Camera Subsystem
>         Serial           :
>         Bus info         : platform:5c11000.camss
>         Media version    : 6.19.0
>         Hardware revision: 0x00000001 (1)
>         Driver version   : 6.19.0
> 
> Note that this may imply that the camss_version enum should become part
> of UAPI.

Wouldn't it make more sense to populate this field with the revision
of the hardware?

I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
while pre-Titan platforms have a version register at CAMSS_BASE+0x0

Konrad

