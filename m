Return-Path: <linux-media+bounces-56120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO+JInmzuWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:03:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5682B1F45
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BA32303C020
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 19:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C2A344D8B;
	Tue, 17 Mar 2026 19:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuqUmtpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXRMtEAt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9733F5BE
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777413; cv=none; b=CB9eO9ZWkAfmrLxjPYX94NZnpUe0fEc02DiYPautOoaYC+XDfhCDGTLncF29hhN9KMpsETwqzo01nAm+baxDit3a9WHTAT+w46bfakUFmKeTtWH8wPaBrbksBmh5c6IFROIlopPqbN9lRYlZJFbKK9kSIIG4LjK2ODcwztP0T7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777413; c=relaxed/simple;
	bh=RZFowPYUESiibPxWRP4NMC4TEnD6R7vXnlpLW8RE78c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cpbWw9cXd1bD45tuhAKWnwKz2OrY25rTJmtyTlBrkCFV9egmnkV/NpFWY6BRF76K2k69MPKnMlVvA75HziFodXp+BvuKux0sap4IjAI5Zm5n9Dh3xSiDbx4VP8va8Psl0acm/BmDMTtQvFCxZsW9MCHGAUpxaCa6Xs7e9d5MSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuqUmtpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXRMtEAt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJROg402852
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 19:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeS4hxC8319lSQFxxoFaZtPyHqXWAr9xldzigTn77kI=; b=TuqUmtpT3LJ0teaQ
	Z39Okd6PgIrK4fL58yh5eCtwG8Kc7hFymr00Gl6p0RVnTC0+2e/wbm8xLchhYqcd
	kqEa3apWooVDtcBOT2NiHHYCk28hRhd7w1BSzEeoFjBWJ67XYI6ynI5hEYNBIvAC
	xGF3FJ9agy4YxeD9D5WSx9nAhFR11L1Pdmet85eYnqN44ieJlGT4u2BaomwQKDHK
	WO9/gAxYhQRVSNYDKv37v4WqCrciJ7menEYmZg4AZ6dCO/OcUb2uldqAAJ70GOA5
	35WwHdRYnL0F+6b7HiH+1o49w54cOCRe7cJothSWNXBTIvsFv08xwiIBSR/9YG8H
	ifxAog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4drbc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 19:56:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8b37d4b2so1045931885a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773777411; x=1774382211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IeS4hxC8319lSQFxxoFaZtPyHqXWAr9xldzigTn77kI=;
        b=VXRMtEAtzlO7vDRvpOwZ/O7X/jd4pjwDNWIXaEdjbZTAtsxq/p+/+PZL5RlCyEuD9/
         o4o1JR2UaO6juJ2hFGh8KXZU4U1lX6FVgbhjgt8qX3KPoIDgrlnvqK8j8Lk2Bv0Qu3sZ
         Oa5BUgrvcQ8iCuzjGKKCNBLaaZjETKTUrOrCE0ODW3JR2XJ5tUWwS1ZtDOwLyvwdFAYz
         Cspkm5xE7VT4qr6n2xZb/R4XilIFBNDPaO1jzu5DOJIRnwZ9fkDDB/E57/3zRulyzreW
         D/4YdS4eYDnxh4LnhFd4Qpk7MkXsGE97AEc6bqR8Kb9dzXf4jpDCh8827viHQkF52yAb
         KpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777411; x=1774382211;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeS4hxC8319lSQFxxoFaZtPyHqXWAr9xldzigTn77kI=;
        b=RW0cm0AY3+Fn7mr5VfsgIOV1QIhEMrP042YoMP418OBz1bOaWLW6CRWMnKoB50Kj/d
         eeiXaRFtYOlIfip0Xf3W/kJhuROK0nkJkxylStr2m7+oFCFWWYrS7qYdsb6hV+zTckVk
         HjgnnnfRQH5VdlHq3752p9hw1ixIgF5R2f9CJXS6ZzYLFM/fmtsZ4r9zZtsiTSiuy0qH
         tfCfCk18n5TflqASi1fI26p6oBMkv2vNJDUmyEQKjWjh7yyt2L+/fjBi81LGzcqm0QkF
         HO+mPM/eWHOMNB2GI9cLBbnb2/eXnO1DMslCvA1Qndqaa9SxHUz7o4eO8eg5/C93lfUU
         ZBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0wD8vzhaQCGTZ9nWpUOy6iSyCSThya0bEHFlNIaNvUyh+EbU5mk6qpRcGJ3qpmZL7sOXc9B7NuCBxyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylzGIBGbvJXJelnqgWxhNNAyqbrBH12c/2U/FrEgeYaGGdTEyu
	mdUswf0Ii/vYLNm1oMO8UQA58hMuBS5F7QjdJWIUV3VoK9mfrb1xGEdLZr/SSa/9huIOL47gy1+
	XAsBJb7QYkJmBozLWc+aM7w0PYlgFzpls6VavwLiWse9ZhQR4V2DNYqYdOIUYMTB6KLgAr3bXag
	==
X-Gm-Gg: ATEYQzxJlnVEujU19QvNey/lOmwqRxmVOPInZvA8zbGGt24KFVZJoqqsPghv56QwNBK
	1bJ8tLGCjuxRARk4auqzbUHdjtyou+2K5ZDciD6QQA03FfX9QvylAjMLqxX/9tahkKKub9YrRTY
	KkuoZ/0BiyB1ZA1607WOHVIk5qoBTUOxY6VwkVo2GrtLEHQQnFQN55Bc5NB9+Zjexi/75l/zHgg
	CADvd/9MxsrB6gil7g92OMXUEjojca2+zvBEvZabMlPqGHlhNoskjZ4Vm9gOw63LKpv9E8rS3/5
	pw/SM3xqt+PnAAHyKlDPEY4EBI9YaA1T0vvCLi7EDh6Tdbo4favaJiJdMVSxJMdA6DVygkIbL3/
	W+I0Je3IWoEEV1teSXSGw5qujumTjvFy1/avf+4pTFtOmFOxPc/zS+Q0wDTMmferNW43QWFCsIJ
	vJZ63arTr4xQMVPkExB4XbW5Cm6D13/i6PArsqMYejyB59dXswTsbT+ZaJQLFyeWjeR5qP8O4o9
	pC7kp+D7F8v0oZt
X-Received: by 2002:a05:620a:288d:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cfad25fb39mr134035085a.17.1773777410803;
        Tue, 17 Mar 2026 12:56:50 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cfad25fb39mr134032185a.17.1773777410308;
        Tue, 17 Mar 2026 12:56:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173c126sm43585966b.60.2026.03.17.12.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 12:56:48 -0700 (PDT)
Message-ID: <590df779-96a2-4dc2-97b0-0f8753bd7eda@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 20:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hansg@kernel.org>
References: <20260316085704.352669-1-hpa@redhat.com>
 <abh9evUPzozh40k-@kekkonen.localdomain>
 <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
 <abmWUIIxCq1xcZ5m@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <abmWUIIxCq1xcZ5m@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3NiBTYWx0ZWRfX5N2YQBuBHT5V
 EpEyrQgLCCQp3EghEnRCbwEqh/sFBajcoiE3GSE5x9nL+xqi/8WGANit+vVVpjpvhodjghFXkfW
 yre5B6wRkDEu3C4hZmu+XGwEw4Nj93GarhnammdWTjr/2xKO8Ouu1VxnTvZ9chdIzUhBQOB8ELx
 kEBARFobzBnIdwS3OV1tYHdqmL7qeRcGqCnI0qHrWvHJP2Dv4CUAd6axjI0QclpqZo2Xv6091tX
 y7wAvV1NG5KVOp25ymOQTFWi3ofB2rpUEJkoAJyHbMC9AprcQ/cn7gAAviEG401NmOFfRAVz6jJ
 38zHju76A2seCpJx51fUe/U4qqVsXujRapLIWg6jJ31r3AUhxg42/2ZcY7N0pJJK14rigDgX4Ie
 iG0LdzL+DpXEx3qXujK+8skzNsHvD03vKqDq9tSV0XffQuVCbSL8cx9pX+Am/VlT2w6tEGW8m2F
 YNMJ8OHE87KFy6WBDzA==
X-Proofpoint-GUID: en5yTFbtUpEi28gdiLwyImdpEhehUZbq
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69b9b203 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=H8hvct5z2yXf_VyKGFsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: en5yTFbtUpEi28gdiLwyImdpEhehUZbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170176
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
	TAGGED_FROM(0.00)[bounces-56120-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE5682B1F45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 17-Mar-26 18:58, Sakari Ailus wrote:

...

>>>> +
>>>> +	/* Only apply changes to the controls if the device is powered up */
>>>> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
>>>> +		t4ka3_set_bayer_order(sensor, fmt);
>>>
>>> Does this call belong here?
>>
>> Yes, if the hflip/vflip controls change then fmt->code needs to be
>> updated to the now changed bayer-order. t4ka3_set_bayer_order()
>> uses the cached ctrl->val values so it is cheap enough to
>> always do this instead of checking if the changed ctrl is
>> vflip or hflip.
>>
>> In case the sensor is actually streaming and we don't hit this path,
>> the t4ka3_t_vflip()helper will return -EBUSY since changing
>> the active fmt while streaming is not a good idea.
> 
> This should also apply to non-active state (albeit implementation requires
> implementing get_fmt locally). This will get "fixed" with the metadata
> series eventually with generic raw formats.

Ok, so what you are saying is that given the special need to
set fmt->code based on the flip ctrl values, this driver should
not use v4l2_subdev_get_fmt directly, but instead it should
provide its own subdev_get_fmt() which wraps v4l2_subdev_get_fmt()
overriding fmt->code based on the flip settings before returning it ?

Do I have that right ?

Regards,

Hans



