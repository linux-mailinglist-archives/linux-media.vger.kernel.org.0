Return-Path: <linux-media+bounces-62336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LRg+O2/bDWpN4QUAu9opvQ
	(envelope-from <linux-media+bounces-62336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:03:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 933205916A5
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1440300646D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6430636607F;
	Wed, 20 May 2026 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx/XWSQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9Re0ODJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF98334C05
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292564; cv=none; b=Q86Y1AiFHi8acB+JB+JntV7e7qj1jDcBMYWpStdb3K1+TT/gdHCSMafxyn5sl8BI7AyMmwS/xU+Yz/f+eH3C1siz/I0rCI81R02JHXIDump0E+5DFIYEuX410VRkVIv+1B866LzEfdueFSt4YxYHHB5QjMJ3m3DHtFrAJxcAHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292564; c=relaxed/simple;
	bh=9jJ/2cyZOf0QdFtaYu1gq20BFlY5mc2u8vQMeL7Ell0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qwdr3iYBH2QtS8zQMnHi8g0v2nO5g0f08rRvs/+ACMHK5JxGgain+GdGAHfNLzlki2RWNbtQZ8W2KIoJWE/xdfBpeNIXfRz7XnJacVwbrrHNXvk6hzdJ5Uz9wxNBtWU9KfsYki1f1+1KrYaZE70q/0XmgVmf7Zmb9yFsImxgf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dx/XWSQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9Re0ODJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2OZH826612
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tcl+WzjjF0BVucHXtbsU//ErzfB4Mp5ZWOa4ul6dHBs=; b=dx/XWSQ82pqivzhP
	iQ2bkVNV4My91+UqsjGwcCGFWPZU3Bha6i90SkfRaFFd3GFTFCg82l1EkTpM1CfJ
	xZOF9Ucbhh4bM+brvjTOT7AP6npDk9DzNBaLO6KGdhLhFQvV/SWk+lrU7zLc0Fet
	C0dE2mlcXw90yK9lMJeA3ivJzCbcapZqbGzQru4YCf4gO9uATAjIWomQNvvCHWyY
	ODIZB//+JSFrFGuJaqzpo8ZuWraQWoYcZhfl7/ip66d7eNv4Qu1zis6ntzAUsUPn
	g7VZjQzirHFAxXp5jsWzAoN5hIaQ85YYPUdOISGfTD/iKMdbU3e4OCBJI/rhcg3c
	ihs5qg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecagfva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:56:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso52502335ad.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292559; x=1779897359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tcl+WzjjF0BVucHXtbsU//ErzfB4Mp5ZWOa4ul6dHBs=;
        b=L9Re0ODJqm4uAmRX77reL+7VWO7O8fK1ygUehJhYwDg15ZwCzaO3NfWFKzz9Jpdpxt
         YF0gDHbu9aF+VT+cOe/ULll5L5zggLSEOglz/wGZsa8t7R3iUqBfWtuW9WIb22KcMyee
         lOQq8MzsV6ZtZ46ALX/eYefLtOHBCM6xywH7eMiIucDfF+PevYbhE42nFYw204vmvqkE
         x8ktpZYNa+yVtcAmyhc8fi9L9P/L8/nBv1gj5YG3NcAAl8a0GJD5mKv7N2Z/6C2Vt+aT
         RhhfQIYdPtJ+2qEV0aKBYrd+UBv/WvSbhzehl878E9Uy6NI3nm6HFVuVWGCw+7hzX+Ua
         Anmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292559; x=1779897359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tcl+WzjjF0BVucHXtbsU//ErzfB4Mp5ZWOa4ul6dHBs=;
        b=ZM8r+qrcO5sMw2jcQY2be5H9+X88LO+yg5UK2xzNAETjgMGbtimJh5D0cwNnLr/Nph
         iU/umDWfFuPhHztdGaY+PplwiZ/+ZYLZXKNBC414qclgVCiWq8N1u3+hk6wFX/RwIn7r
         LWvST+fROmqzqc5bdqeugr+xg5//amM6iUM4h6Lpdh1yCni6kl14/DXo0a8bmNuGyrJk
         pDeD2LiDxH1KmTiGkYqw1jGlkLBk1LYl7UdAbXj/qErwgzu1vz6GhQaKCbMzkm30sdAE
         aoht/jPxZXaHP+IzfuEWt1LDKEluVXNoBfop/oYzTM6teNSxPek+OaHtpUU5MI2HACC/
         6JIQ==
X-Gm-Message-State: AOJu0YySvp8RCIxgbXiX0ZUZbICo7pdjehc+l6dl0i32dEIE3qEQ5yrd
	1mhBi/OHUC0U8YdhcHK5vQoSlaL3Qm1ieHtroVyV4dcRJJTMOCx3aFZN1AEdl2p4z1ef3IkmL+O
	mXjO2LWaDnuFdqIe1CbC5/anJB2NN5U4NlJZWvA5Rw1YABZfrw6DMxopqt5JNmiO69A==
X-Gm-Gg: Acq92OEYKYSrK50RXV2+R10E6a7CrRJavj/BgFscJUCxtUaaBCysR/8U8zaL882zMLk
	31t3PRkRPQUoJuEcYotyxocCBd/0SKNyvJxMNlt4PTzdfRg8qg8Tk1kHDI9Qf+cWAjdQzFL1Npa
	hkBbMtwo5XOGugzfI6RengzHpIdBwRXaYbTk+/l33TNgeP+Xtmya5ONtupFJ+Fi0VSr1D8HYInK
	XVykkUDtQ0Wq5BAllQ+CypNM5PXECKpNXPF02KKHABLvCT8vRx2uEzDAIIeITKgPLqzI5k/N2sd
	ovoJ2HhVHPcxkdODQ4R41gGD+5Ou7fDU7e579V3Ze/G0QY7/jq4XNJTIXWbPy1FLjTPqFpPpwNv
	VjXDL4G+UF7GU44v8mBXLFUSkvcfDi8WfRNQQLvrm88bZSSAxn81TMGU=
X-Received: by 2002:a17:903:24c:b0:2bd:eeb6:ff29 with SMTP id d9443c01a7336-2bdeeb70241mr136544675ad.12.1779292559400;
        Wed, 20 May 2026 08:55:59 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2bd:eeb6:ff29 with SMTP id d9443c01a7336-2bdeeb70241mr136544265ad.12.1779292558882;
        Wed, 20 May 2026 08:55:58 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c16ac4asm211289005ad.33.2026.05.20.08.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:55:58 -0700 (PDT)
Message-ID: <ce10baa3-bd63-472d-b5c9-248bb1a01731@oss.qualcomm.com>
Date: Wed, 20 May 2026 21:25:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
 <8ee8e01e-fc55-4786-9c28-48fb17bf2a44@oss.qualcomm.com>
 <fcf5054d-66da-4f9f-88f1-e49692557319@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <fcf5054d-66da-4f9f-88f1-e49692557319@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bKMdOIGvomQmMteOKFSR-OyZMGFxuKZW
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dd990 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=CJ_M6cvvuiLEDggrW1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1NCBTYWx0ZWRfX1hlOXNAUb/6A
 pRc59g9bK9NQijmCYXEOkwwGB07wwBAie3sbCUFDzPsbwCICIEopR4NFnXcQdoN6XnrnahrN7+S
 HLsZLtGFQgE/G7M+FICsUdr2Iruf6rRc/oq/bWzsjjiLYLpXPaK4QtGoStXyAn0g6FnH9j08Fta
 5KZfMWPuNOTjq7dwowJHaj2PCXWa/SEOeRjGEkkW2syPtqZwEGqOeo2c/muyl95upebuXp/W8En
 sH0+lznsLQMQOUbnqi26zxRSaW1BMXjg0JLZIllVV+hekJEahASK11N71fG2POL6uCe6JjOQGJD
 MaHDuzs9zOKkJ4eD3utp+VqINTAMrEsoLy8IoXmsW2FhQvDEPbr8QYqysW9m8sfDskL8qiektE7
 EmcDI0RU9+RypIUpftCYhZ6rQFkU0s1PGoF8WaTzJDPTvAf4wD6r6sunKuCUnvZw0AasxDu0m22
 NJCxMCijrFCAXqbdvlQ==
X-Proofpoint-ORIG-GUID: bKMdOIGvomQmMteOKFSR-OyZMGFxuKZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62336-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 933205916A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 1:03 PM, Neil Armstrong wrote:
> On 5/13/26 21:05, Vikash Garodia wrote:
>>
>>
>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>> Update the gen2 response and vdec s_fmt code to take in account
>>> the P010 and QC010 when calculating the width, height and stride.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 +++++++++++ 
>>> +++++---
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++ 
>>> ++++++++---
>>>   2 files changed, 39 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/ 
>>> iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/ 
>>> iris_hfi_gen2_response.c
>>> index 8e19f61bbbf9..0541e02d7507 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>> @@ -542,9 +542,24 @@ static void 
>>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>       pixmp_ip->width = width;
>>>       pixmp_ip->height = height;
>>> -    pixmp_op->width = ALIGN(width, 128);
>>> -    pixmp_op->height = ALIGN(height, 32);
>>> -    pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>>> +    switch (pixmp_op->pixelformat) {
>>> +    case V4L2_PIX_FMT_P010:
>>> +        pixmp_op->width = ALIGN(width, 128);
>>> +        pixmp_op->height = ALIGN(height, 32);
>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
>>> +        break;
>>> +    case V4L2_PIX_FMT_QC10C:
>>> +        pixmp_op->width = roundup(width, 192);
>>> +        pixmp_op->height = ALIGN(height, 16);
>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width 
>>> * 4 / 3, 256);
>>> +        break;
>>> +    case V4L2_PIX_FMT_NV12:
>>> +    case V4L2_PIX_FMT_QC08C:
>>> +        pixmp_op->width = ALIGN(width, 128);
>>> +        pixmp_op->height = ALIGN(height, 32);
>>> +        pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
>>> +        break;
>>
>> client facing api, good to have a default here
>>
>>> +    }
>>>       pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, 
>>> BUF_OUTPUT);
>>>       matrix_coeff = subsc_params.color_info & 0xFF;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/ 
>>> media/platform/qcom/iris/iris_vdec.c
>>> index 99d544e2af4f..eea69f937147 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -266,10 +266,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, 
>>> struct v4l2_format *f)
>>>           fmt = inst->fmt_dst;
>>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>>> -        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>> -        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>>>           fmt->fmt.pix_mp.num_planes = 1;
>>> -        fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f- 
>>> >fmt.pix_mp.width, 128);
>>> +        switch (f->fmt.pix_mp.pixelformat) {
>>> +        case V4L2_PIX_FMT_P010:
>>> +            fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>> +            fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>> +                ALIGN(f->fmt.pix_mp.width * 2, 256);
>>> +            break;
>>> +        case V4L2_PIX_FMT_QC10C:
>>> +            fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
>>
>> ALIGN ?
> 
> ALIGN only works with Power-Of-Two numbers, so we can't use ALIGN here.

Ack

> 
>>
>>> +            fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>> +                ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
>>> +            break;
>>> +        case V4L2_PIX_FMT_NV12:
>>> +        case V4L2_PIX_FMT_QC08C:
>>> +            fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>> +            fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>> +                ALIGN(f->fmt.pix_mp.width, 128);
>>> +            break;
>>> +        }
>>>           fmt->fmt.pix_mp.plane_fmt[0].sizeimage = 
>>> iris_get_buffer_size(inst, BUF_OUTPUT);
>>>           inst->buffers[BUF_OUTPUT].min_count = 
>>> iris_vpu_buf_count(inst, BUF_OUTPUT);
>>>           inst->buffers[BUF_OUTPUT].size = fmt- 
>>> >fmt.pix_mp.plane_fmt[0].sizeimage;
>>>
>>
> 


