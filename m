Return-Path: <linux-media+bounces-61139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJgsC1f3AWoFmwEAu9opvQ
	(envelope-from <linux-media+bounces-61139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:35:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF45114AC
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A885E3054503
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073412DF13F;
	Mon, 11 May 2026 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfXrCErG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLpa/5+U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E324014A3
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513464; cv=none; b=QOMQNj1vH5eUmvs4ASwjP8wrLLjDd72s8fof1Rw75KK2P7B7mFpHMo1MYp5H40vOKuqceScRPW+QeGfrc6BSXr1069ZcowMQ4TfjXTsm7CQ87XxhRnb7U4d4RIzLDIzFY97aXRwGSxIMuh1UGs7hlYV/xptG5osVXMdvYtog8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513464; c=relaxed/simple;
	bh=IcriBhzpWA3SR8qgqH+7CIWQcR4UMdh2OOgT3BvPLJE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=n4NdEIeP1S0K0TgvcloFJQnYxxoot44+sBC+UK+myqFMD8x6RXZ0u0k95mvaN/Nvi0VoCCG4+NUUiCdFvOP6BGqwVmibIKY/o34T6mek9nqbCAec5/XJHCdOseSg/Ldb2TSM4doo/+gWqedKYv5oYLtfblEx7HyiRryQh8j14zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfXrCErG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLpa/5+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BEmrr1653339
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 15:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFPEoQzk7Q94PzmOS/Hiuz2AhyOaarPkwToXrnmukNg=; b=lfXrCErG5YWe3KeI
	sGQNh3tneIrnf1hM1mwxF1+RdHv6+QLvlqqG8n3hqNLW1sp7S8NeidrfjWMce9SY
	BQHgRAw/P4ydhPWTnJGwWtXzG/T+3iBB00IlhTRgcC8yUNSABUvBRaws3IZBlUH7
	MQ0OMUgHtgnILv8Kkrdx4S8bCIzVZ3rA6OBIfe9VGOfBOxW34ILVB5duQRxcTMU4
	qPPXny7N2nKZ+2iimNhYZIVjtq3DuHzBDFNdKOQdCvkeOTJr3m7ZKkeoEAzQKKPg
	pQZBYlG9pKtAecX/HoHa5YVuCYykKneBJA/bEtrkGmJMNl28J5KU3Yk1GLZ34DUE
	jL5CcQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xuahjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 15:31:01 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dcd9061254so8616042a34.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778513461; x=1779118261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFPEoQzk7Q94PzmOS/Hiuz2AhyOaarPkwToXrnmukNg=;
        b=XLpa/5+U9s7LlhyFGxnn68BNYeZKfQkbUTQWbGpkHS9yGWQnbWtSLxp+fzzH63Tq2l
         xVNqky1cMRQkFpj6qd5G23TIn3gm8U94AWBOpvFFP567YMQH1Slhfrmce5mkfJsIz3m3
         jGMveFe05uYPd8VyeYJW9dauDSNYQxCeqh0FGLpTeKFNmG3jCaluaJ1NHaT8t1lIA7ZV
         QvAMH0j+5OQ6DPaQ/wDORqixbFVyFkvn/oxs0waJFeNsEi4HNrBlf5Dbl+atColovHnG
         BJEx/9e2OZylqys874kmKJpBtL+R1Bs/ERiaXh4ebWdjlI44ZZVO0kkMExpoBDq4TmA5
         QzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778513461; x=1779118261;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFPEoQzk7Q94PzmOS/Hiuz2AhyOaarPkwToXrnmukNg=;
        b=CKtZL0Dybg5Sk/BiLPjDEkSU4mg6N97KZQSwsFVifDoNufuuLwmYycrNVMG2K4VwP8
         qECfktSFGUWgAvtf2HmqByl7bg94BnpsbXOlwnlvKi8mThPaeX/aZNY0TjdNvcRThQCw
         my1DDwWQx7YjfzHvEBMab/GV+EXfozVB4H/iQIX8eUQj8uMmD4ujp+N+cmNuw5n315GE
         k+tlJt9AAtx1B+zMTUedDZmDlYsKSkRLApGNK2WFFhFq5xVSWYbdzYzvlJ9TdxLXn/mG
         9p9BEpJ/J87jX9zR14jqeE0UX/fOpA5v5VQ4PipT+TMSldpPSh2XBd6FnQ78+GcpIYik
         EbLQ==
X-Forwarded-Encrypted: i=1; AFNElJ86nLiZmGThzUb5LKztUluyoxVLf6N4jEBTKiMYHASJBGzqN94mzJE6bOO4OPucrKt1qeaCzyLBrBSsJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg12cpoDAFTtIktNM0sIzFC59pHs03xQO4DXU5MPXjdNym1GuN
	EWWqfz4MJO+lCF/8/IdOkD7UIONUgwrj0VRnMErEtQSK8Z7RJFrJdGg33xdY+P220BrLY+7UWQ5
	5xUhMiErjh6pGJa//CD5hQL/6wYGBewXWOTRkBd3yaazMERUDZQgB0HcucLeGLhiqGyIaRtMkjg
	==
X-Gm-Gg: Acq92OGH6xRNo+AWHwNM09Q2EkMf00+DWjrGEh4xp2/h2b0z7f/8ozG2dG7eFwExs9c
	DtTZ8Bri5imh0g6axLPInx3v3qfXeL1+XOo0y0Dg2Y68p3wniGMt66jfM2yUG+dHrcp/mkMPISw
	FFiyaQ1IhstS+F7kLLBBK5ziiu9g+D34zEiNsADvFoDvqwys+rC0I5/lhfZe6AklChSJw25db3y
	pDPbAZC/SnRWSXxStYKvfE1u138euYykI7yTB/XyKpm/tIHM2kezC4Vv1gEa4e1rA838aN063Rk
	26mfCRg2JvZLONbmzllZHJ4VmGREz+l7Rwjni8bN6AxH5PHMjpufrH4meAaD/M61tP66+CiTI62
	6kEWJvkuBjWcRnNOeAo0dEIbL4Z2KwY1l0zlkW771Buxtn9K+tJsjUXtSgCYYrDLJqB4qQfbMwb
	hHEOguDqLmNB85YZ5H6Ers+TXEbQJ4xg0l2NTgkDraErMMI+d9FWEthB5apYixg36nP/c8rcUrB
	oNvqU05zu5v/V5H
X-Received: by 2002:a05:6830:6f86:b0:7dc:c338:d23d with SMTP id 46e09a7af769-7e1df072b3bmr15743470a34.14.1778513460700;
        Mon, 11 May 2026 08:31:00 -0700 (PDT)
X-Received: by 2002:a05:6830:6f86:b0:7dc:c338:d23d with SMTP id 46e09a7af769-7e1df072b3bmr15743331a34.14.1778513459819;
        Mon, 11 May 2026 08:30:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcdd1914e0esm273126666b.52.2026.05.11.08.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:30:58 -0700 (PDT)
Message-ID: <6744cbbd-41ac-4675-9eb3-14d64a0deb76@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:30:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL for 7.2] uvcvideo changes
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <f39677f7-6d51-42eb-b96c-4111c5e12a59@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <f39677f7-6d51-42eb-b96c-4111c5e12a59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01f635 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=rE18BSWuIRvPTgIaJfIA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2OSBTYWx0ZWRfXw13PsDHuEKlt
 32t8btxj81Dx34REf7GJnNafvujYkZWQB9OmOKO96dyuzH6PJmer2G+3TF1ZeOAwYQCTXNvpxHE
 N7ODfWempiD4f9j36AWCK4CMsDPfIRvj5Wn4Yok+78GSLFN3MEwnv+/+cDa+ogeAY8+mhtczJfG
 b7BTNav7gWYR3ORROZifRQzaSHKbiQALB5GdXipNt8No2++HBlUMbEdgqVqa5cLW3nYDZ7kJMCI
 /IHvSVMbUJOax8FTUccaM6vmDWzh30l7le8d1uODNGKlXLRLQAi/U3ADYLC2QC81+XCpA6O6ElI
 n3jG7q1dWna6g036UuC0q14Mm+qWVmMXcRhQdpN9SL0+nymstRg66OMUau4QCCA1TPhouQJaIpC
 9ETkMYV2y/Izdsz87ICaekbAzBpvLmWhD2jxi7XAId+R8ILzGVydQkyPVZ6WK40KAvTeYFLX/pn
 XLrmTNetdgJdG85Qcmg==
X-Proofpoint-ORIG-GUID: yHnT4mINRGFFB8aAdz-8Jv5kqMEJm1nO
X-Proofpoint-GUID: yHnT4mINRGFFB8aAdz-8Jv5kqMEJm1nO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110169
X-Rspamd-Queue-Id: C2CF45114AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61139-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi,

On 11-May-26 14:21, Hans de Goede wrote:
> Hi Hans, Mauro,
> 
> The following changes since commit bc1ba628e37c93cf2abeb2c79716f49087f8a024:
> 
>   media: v4l2-subdev: Allow accessing routes with STREAMS client capability (2026-05-07 13:23:50 +0300)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20260511
> 
> for you to fetch changes up to 0f20f81dfe4f0358eccd584ad21f967a4f9a5083:
> 
>   media: uvcvideo: Introduce allow_privacy_override module parameter (2026-05-11 10:58:24 +0200)
> 
> ----------------------------------------------------------------
> Improvements to the uvcvideo driver:
> 
> - Fix frame-sequence-numbers / SOF detection in some corner cases
> - Add support for Logitech custom focus, tilt and pan controls without
>   needing to use userspace control mapping (without uvcdynctrl)
> - Disallow userspace to override the privacy LED on Logitech cameras

Note I got a CI failure messages for this due to a single checkpatch
warning about a single commit message line with some example python
code in the commit message being too long.

From my pov this is still ready for merging.

Regards,

Hans




> 
> ----------------------------------------------------------------
> Ricardo Ribalda (5):
>       media: uvcvideo: Fix sequence number when no EOF
>       media: uvcvideo: Fix buffer sequence in frame gaps
>       media: uvcvideo: Import standard controls from uvcdynctrl
>       media: uvcvideo: Announce deprecation intentions for UVCIOC_CTRL_MAP
>       media: uvcvideo: Introduce allow_privacy_override module parameter
> 
>  .../userspace-api/media/drivers/uvcvideo.rst       |   2 +
>  drivers/media/usb/uvc/uvc_ctrl.c                   | 212 +++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c                 |   4 +
>  drivers/media/usb/uvc/uvc_v4l2.c                   |  11 ++
>  drivers/media/usb/uvc/uvc_video.c                  | 109 ++++++-----
>  drivers/media/usb/uvc/uvcvideo.h                   |   2 +
>  include/linux/usb/uvc.h                            |  10 +
>  7 files changed, 301 insertions(+), 49 deletions(-)
> 
> Regards,
> 
> Hans
> 


