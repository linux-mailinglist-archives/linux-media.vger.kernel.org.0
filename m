Return-Path: <linux-media+bounces-49741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8279CEA18E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 16:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96EC03024881
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 15:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319EA31D38A;
	Tue, 30 Dec 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PsnxfuPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpySvnpg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A271FBC8E
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767109497; cv=none; b=q8bt57XFqkxmKyAlNmA4MpLlFS9ImUpBg0Jn0r4vZfgeW5wjeV2MmK0KEcAaSlV+1/Cymy/Y8s8/6M4xNKNgPRWCKzzYRsuGaJnkMB696MD0iBzL1SCqNYlZdgdQja9VGzpyp9or5UpMFrB6XueQVCGkIrWeoC/tjd9TyFV5h0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767109497; c=relaxed/simple;
	bh=bXe07eI0lXCY+EHimWchdI9pNBkLI64rFNZ/EFVRsHc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tESs0SiSEkT9WSLb2zpayJBKFeRD8yf3jQk7zmubG3WsDL5YC/TBPDGn1zsiQqAg749K21cURKWppD6P5ca3OpipvX9IAbjUHpfDghbTo/LJJX0UTxbLgH6zM4xl/AAWiXYAXCKx/bPWIzxogLrG/2ssPwKZWZIUBEnggk9dmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PsnxfuPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpySvnpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD7GSP2548850
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 15:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmFU46pGhp9e+yGy/XvLGtx+YHG+nP0eFl4zQFK/ysU=; b=PsnxfuPnAAhOCSZY
	b76grlLifd/cdcnLFKhCkWPuxX+o8GW9LKau95roKUHebtc6O3/CfylYXgV14Ngg
	szNvf0dqBnMhhUCDmMiraz+oTjcUNmbl14BRpjTcLorrkFK794i4Uf0YF8kkqfdv
	DQU3mqvwyUqO2JxLF9T7dbtynVo8S3JDW8Tx2GqbqZBubKhpQi489j3L9Jgc3iw2
	/jluIOWcLEsMMlx9sPU5kuezj/ynz8pvfrw9AWqEGRcwjp7lTVgb3xarzjMfIDpe
	CCZEkS5vvTlo/8qUGAwiVZK6p0MC2OjajkU/DhxiQ13AyyEx5RcJyLB5V4GWNCr2
	jcnFIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399jvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 15:44:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso278900181cf.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767109494; x=1767714294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmFU46pGhp9e+yGy/XvLGtx+YHG+nP0eFl4zQFK/ysU=;
        b=BpySvnpgnNzuRfUfjhReN4JwT+yD0Je2xd2rDK5nIeVZd4cY4H54/OZ9ioXLp13qtM
         NF+kRy4etdijwdOZqZPzI627glU/usTdVIadtfnMVtA237l7onnkkeYSWtP/yglAB6IC
         sq1fr9b3X+lrmu+kDdPxX5e7sLMuFoWVUP4ZC2UW5p3jqUdY4Srza1hNAEdQ19VkoESN
         n7e+a5jwtKAwKM1F4porBZbQ95yyXBw3Le0FN20jgSruLx9U5C+YH8K03P3HMCkZDhOx
         O53E026yFfJE5pcRS2+LYHFew332QRezqK/7lqhy+P588nCs2EIPiJIt71Ar60goijs6
         belg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109494; x=1767714294;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmFU46pGhp9e+yGy/XvLGtx+YHG+nP0eFl4zQFK/ysU=;
        b=Yblx3kL6LLGc1leztd6mDmkF7ygaM5oqj0RnG64vvGVk68LNK146aMPTXK5fKuXf8s
         eCJpbPBzg0IxiLuclU1zi2EmRe8iW5p2r1M8nP2Nak1w+IYWSOxdQFUaIGh0OMbf5+jm
         4paFsEw47XKTAcrfZZeXDGMfurYrj2IWh+uvasZ+JU+3navwaVSbVbOiaiFUEyZw0Vnf
         r8H0i52I9/SYBeWTsU8IIWL6VAFFOVKfjkt7wwq6F83SNfnqiw3AD+l/CgQiwV5wm+mq
         bqL9NpoM+klpjBQDcjM8MrKzAESVeTpMiBlSgX6WNwMQ3Dq0y/2BFUzU0BRI92Ed/xux
         X15g==
X-Forwarded-Encrypted: i=1; AJvYcCUBe4rO8pc0LzsAiHpDrSgSG1kWzpd+MkI/iQZuUl+YKAG5QoohCVHTlsp8YBgl+zXf7TMybWJUpY67Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrzuYW7KNxOAPdfHB/DZ+Izb8YK/QSBwFMVyuUV+9q4jWmYJN
	ygRy5panppIPMoL9M7R/4AE6QQz45Pxi95EtVyemLz7Uugkr5ASLoEuAdfksmRBQ+uRlmS1ydcX
	M69DHYc85F/wx0AqU7gCGczZnMOW9MHpWRzGpdRTFnIwRYhQ++eoqKUJq0sBxBACYl7JKgxwyNw
	==
X-Gm-Gg: AY/fxX6yQ6HPbnuz7tqx4hBidKqRnltZnHDIwfeDLJ/4ooN8GzqVyratd78Nd/7g2bZ
	v+1zjShYmpJyFIEECGo/yxjAG5kWUpFUUGkzY28e1J8+dZVIcGqzBavW/MD92aRbcEdkABBSpwa
	BD6QcP9pNqu0IjyKyB/2NbndFQGxTriy2Zlfwupc7kNUK+DBv+Tc/sQ+l21TrrC1dgnPdm5W5pP
	zUMOeRRLG9ilXf0+SXiNcY+/PTejnHyAlYw2dqxvDZGqyKb4JtCDpxVKdOZkD7xZmg+L/+4NcG5
	h/3sw3KPosm78iNqBXIFYRvXN+HDv+KaqP2u9/7SPPQlF+TUSBt28AIWqVY8PEAvRblH/WOfRGL
	49YwVJDjxh8RG1CSncCcySlmenI8IDrBagqWkVceA1RfW5ZpI+jr+M0kvw5H+2BL8uuUSw18dmH
	tlhJ7Rw3cCPOHO/o8izxwGEicMjjt2kt4rsoyWZJQtpFU4EVL9AZMzwD7dKbTqkf9CC65398R0h
	Yyg
X-Received: by 2002:a05:622a:1f14:b0:4ee:60a6:ee03 with SMTP id d75a77b69052e-4f4abd6fb88mr389474041cf.41.1767109493724;
        Tue, 30 Dec 2025 07:44:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfE6OnDxpzK4u1PkabTXWBG2CY0EjjZOWfnDs/loYl+WyD2akesaMGss54Cn1IjRcVQH+U7A==
X-Received: by 2002:a05:622a:1f14:b0:4ee:60a6:ee03 with SMTP id d75a77b69052e-4f4abd6fb88mr389473681cf.41.1767109493110;
        Tue, 30 Dec 2025 07:44:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60500sm3659485066b.13.2025.12.30.07.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 07:44:52 -0800 (PST)
Message-ID: <66b254da-dd2d-44a4-9ab6-257550aac3b3@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 16:44:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/15] media: aptina-pll: Add comment documenting the
 PLL chain
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
 <20251224-mt9m114-atomisp-v4-2-60b25da7a1bc@oss.qualcomm.com>
 <20251228125044.GD21104@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20251228125044.GD21104@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K1mm8ShtsgfMkIy4JfpD6OrjRqZhGxXS
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=6953f377 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=KrJc3ju1l11p_CkzqNoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE0MSBTYWx0ZWRfX4U4XkzUZh6AF
 EPWhh4WkqmnWXyt47FfjhutXJeXZnZfCUqwyMEXK6066KVgFDarglixb5GZKIEZ3iX0TlNJIy5L
 Fv+eQeskkHyKomP189IUFkUmcet+mTQ2qUrBIfrIv/uTczyoCcY+9UTfGLc05WeZQuHKi7aWAO1
 NgSs6fOTVRMzLmQib/cA0bAGewmT/dxHW04bogkAyFplBCKaCldjGMGQ+at+mR+BnXbS728CUoi
 3snsF2LTnLNeeRcL5XWO9Fe8DFrzG6rhyvN1dF8aZLaZW3ZmbSQ+OTLhYM5/YoNrQXGVgQyHodU
 klTpI+E+dHLfgPhtiyKe9BMmp1cD6T7raSrb5TDGaKSnpfpkAeG5VEsqDyqAZKaFbGogmfK+WGg
 KLe/hi+w7F8R+27ueWfivw20bPdjltAe++BBrI2iew7h5TxCKmvSMuPKy0SdFHxl5Hx3f0CUI1T
 GdZ2hq+ZeJ3Web0ypjQ==
X-Proofpoint-ORIG-GUID: K1mm8ShtsgfMkIy4JfpD6OrjRqZhGxXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300141

Hi Laurent,

On 28-Dec-25 13:50, Laurent Pinchart wrote:
> On Wed, Dec 24, 2025 at 01:31:11PM +0100, Hans de Goede wrote:
>> Add a code-comment documenting the PLL chain, this is a verbatim
>> copy of Laurent's ASCII-art PLL chain from the mailinglist.
>>
>> Link: https://lore.kernel.org/linux-media/20250629204655.GA2059@pendragon.ideasonboard.com/
>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>> Suggested-by: should really be Co-authored-by since I just copy and
>> pasted Laurent's comment from the list, but that requires Laurent's S-o-B.
>>
>> Laurent can you give your S-o-B for adding a Co-authored-by ?
> 
> If you insist,
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

> but it's such a small patch that it doesn't matter much to me.

Given your request to add this to mt9m114.c, I'll just squash this into
"[PATCH v4 03/15] media: mt9m114: Use aptina-PLL helper to get PLL values"

and not add a Co-authored-by.

> 
>> ---
>> Changes in v4:
>> - New patch in v4 of this series
>> ---
>>  drivers/media/i2c/aptina-pll.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
>> index cd2ed4583c97ec87e516acfd249fdccf2f9efbb8..4a519ab587ba4cfb9945a1bb05e87a3b5e6d28c9 100644
>> --- a/drivers/media/i2c/aptina-pll.c
>> +++ b/drivers/media/i2c/aptina-pll.c
>> @@ -12,6 +12,16 @@
>>  
>>  #include "aptina-pll.h"
>>  
>> +/*
>> + * Based on the docs the PLL is believed to have the following setup:
>> + *
>> + *         +-----+     +-----+     +-----+     +-----+     +-----+
>> + * Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
>> + *         +-----+     +-----+     +-----+     +-----+     +-----+
>> + *                                         fBit       fWord       fSensor
>> + * ext_clock    int_clock   out_clock                             pix_clock
>> + */
> 
> I think this belongs to mt9m114.c. The other sensor that uses
> aptina-pll, MT9P031, does not include the x2 multiplier or /2 divider,
> and has no concept of fBit as it has a parallel output only.
> 
> Could you please also capture that the datasheet has a constraint on
> fBit, which we translate to a constraint on out_clock for the PLL
> calculator by dividing it by 2 ?

Ack will do and as mentioned above, I'll squash this into:

[PATCH v4 03/15] media: mt9m114: Use aptina-PLL helper to get PLL values

for v5 then.

Regards,

Hans




> 
>> +
>>  int aptina_pll_calculate(struct device *dev,
>>  			 const struct aptina_pll_limits *limits,
>>  			 struct aptina_pll *pll)
> 


