Return-Path: <linux-media+bounces-50238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC675D03965
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 15:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2B9930330C0
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 14:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F8636BCEC;
	Thu,  8 Jan 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQW+zTpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSFPdlTp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077F937418F
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883629; cv=none; b=qvV0bY350yWwhdr3yb8pNS17tizAqPe/4Dw8eYKj2BGwo+Ej5jc4XkC/cdbhKRT0cClA6gy9sPFW1j517V9qLvtMDpJm84xNs9fmjkbcIlv3b/koR+Bk/AwmBT7UJs3ZNjUZN3SekVHCsRs0oW5PDus0ZD79vRPagtRIJQwpaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883629; c=relaxed/simple;
	bh=2BZ7KVIaNwSuN//KdC4ICE74rFqcPFo97PQhKY1HK8s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UHVyglpF6VqvGs95pXbon0fo3ST4z/sozZAs8JRdPUz/pn18AfPDwSlkJjrE8ifbwpWQZPdcqJvlF/agRM3kUHiHWVYi+BaLt1lTkZ7pC1iBWA1gEbQBmEHI/5AaZjmqurh6huq3EU6/KSrgbzBdtnNzPm16Su7DnJC55giPzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQW+zTpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSFPdlTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088w9Po1570556
	for <linux-media@vger.kernel.org>; Thu, 8 Jan 2026 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQx1zHprubxK6pbdiaiiehW9y7JQyLOrnHLwGSB3tXk=; b=LQW+zTpYKLN1KhYj
	oXv8QrNbScWWvIc2MFyRMg2/CgqC9ZQTYYpyJFoaR4ZqHQHayejv5Fmn6E544cgv
	rqQLekHGGdUdLUABBVrU8sFc7nr3LUoG2WwqMq3IRM1ejzAumWu6LBnxJrUoo1/e
	D/4oJsuQvD/GDT+EVuZYTnsdjHBa34kJwS5W5aNX565g0fVY86fxNRVqaxp5pJYe
	OCk4SOJlMJCDScNydwyi6UxZqMHZtMxvF9aIOcOZiIajBgUCYmLC43s5swu6ufI0
	m0Olk69ltNWQOScfPPEjQi2v++Kt/137q4ZqfZZWJjJJNLLpd1Opd1P6j3muhcqS
	PaQ7Jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqs1c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 14:47:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b8738fb141so588431285a.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 06:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767883623; x=1768488423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQx1zHprubxK6pbdiaiiehW9y7JQyLOrnHLwGSB3tXk=;
        b=MSFPdlTpDiPRPyb0hABSX3q/+Cu7IOB0DPPbyzMPk4i6knS06QoYnPRLTDi0+htQ/U
         7ANEj6wH95eGfHFBBaMBZ9HcDQV0qagHHivRgAhIABjaPgHhGxBYVIGzkRS10CZkAVW7
         n0VlKzL/wgt6qT/JaplazPzCorclEAdZ1I1GauD7efl18rSCqjgWWLsClUGnrgqpXn6p
         VLK+0/BUZhM+BEv4cqhnScFRVttnUZu0ra0gGDED9cruih6cGuY/pks7RcI4MJisSL+J
         C/D75/S4ZP30u/2Z8tK31cEis0sC8OUtkEqBE0Agu7PYK7WEaOvSIXQ1QwT8An3ekmI1
         nT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883623; x=1768488423;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQx1zHprubxK6pbdiaiiehW9y7JQyLOrnHLwGSB3tXk=;
        b=OZgEEqdi/anKO9zDuBSDghGMZ+0N8eRNQwEyDukFdBKIMDbmOF0znVe19WOGG8YO/o
         /5tFpoKrme/6r/8cUU/mLYTaEBQq6tMtv3GcFDZv0WvFshQoVtv5oZVJtsWqa91NV9+U
         8OTm+1YhHV59YeyfneAXQzK1bv2sww3yk7g5pZepAPC7d1SQ9+iCXeGYEe8mMhAGWqAM
         frITeBDSEORyb+PYyVfJOm5luQSQmzkR76o5wZASfLtjD9JRlUpne3HL09V2rzhwhZ0w
         lf0A5GxDJW6XSFzz0jIekbpI9INLoq/QBItkpXy2jtQQ7k0jcvdtWBwQIoyx9KZG7JFx
         D6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQhUTeF0zwq9IVvVORDEQAf6uVcTvAGcvrj4eStbpUINrNO1Sp2PNneDSYuBATBvcD32EtEHfDLb/05g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFxTXdkhnr+MLn/ACOTemEeKyKdytihDdbdzdp3JUOmwGqchx
	rC/+S4EukxJuQBLq5iDqkYmISrKAvBllzYXIdOViOWlLzhh/ouECWZMDn0clppf6GhaSlGebIw9
	STqRLi+hhq0rNrsVI1DHbd+nZ34N+W7Yex/jWM/ZWdVfhTmlNvvaA3dF+YG571go5IQ==
X-Gm-Gg: AY/fxX6ZHa+ZSoTmTS4Jr/ULOxCh6hSozoF7Dm/OZ6Y0tTIy2Y+F7vTVeMesqrr//uY
	SI3iFbuWXJuWAeT+4oMytS6xwXOxtiFvfapscFlzHvbvspV7svsI+kujTs7FUoxtWnev5bsPJaN
	0MBYPclIMUrep8Z+Nyb2b7rrJUeKcLWKL3S2zUcg3gjEqLJTPWE/dXu7vloXZFDDni2S41MH278
	894ZDi4Pdl89uVtkFoiWw2xToFRChaB3Rt3MBjuqeBMWgFR3uthJVdoPXHZNC3cAuSVltszBVIX
	nEDBYY+qrZAEvPXQe/MX7K4VdzONZefbrXtSdQ7X9p5/1a0R58acwpDh2bqllFxfe7ZX9Lo3Emb
	24fZjwJ06E8GaVNInw9YhyZ8tr6LijIxRYblNpgK46DkG+5TFlcNj4DrmJ91WixSUZ/0xR0JIub
	4ngldov2vUiJWqLBAcItT8Z7nnNCP5YJuiAYaL3NTO/egbXIMFoS8TOxdt4Ao4PwB6ooyegTZdN
	2gQ
X-Received: by 2002:a05:620a:4105:b0:828:faae:b444 with SMTP id af79cd13be357-8c37f51e9b5mr1170491685a.20.1767883623404;
        Thu, 08 Jan 2026 06:47:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHF++IUjoZu07u3DNCo2b54I2vRi6XkQ2W4vI79GVNQhT0wdIcy7qCBj2EwhVVIzuBdxK5jSg==
X-Received: by 2002:a05:620a:4105:b0:828:faae:b444 with SMTP id af79cd13be357-8c37f51e9b5mr1170486985a.20.1767883622782;
        Thu, 08 Jan 2026 06:47:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84591b6240sm284329566b.10.2026.01.08.06.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:47:02 -0800 (PST)
Message-ID: <4f3c4058-4b62-421d-8515-69a6aa852196@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] media: i2c: ov01a10: Fix digital gain range
To: Mehdi Djait <mehdi.djait@linux.intel.com>, sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org
References: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=695fc368 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=9BBqhoCBsg4kyb4jw0YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eG41mTNZIo2s58MXPn7PZB8NxmvAr694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfX89S9dCmWHdC2
 ablUnQU5q1Uod+jYvrKDdzHOLfPN0F/0D4mM4UCHNydVpX+yP2l9p6DNV0/QPB/l680B0On52O7
 Z9XYu9c+4mA2uNXB36CZ2dMv4HUybYxZ1OHI9BijXnEsZX0uWKW8EQiRmrtZUAxLJpUABmppNuO
 Xqm11uZYw5PipEsz5CSrXZQMA3ac14+OjxqrkkiGy0Hv9lVnLYHMoJzUbpvFOXCf4Z1Ha8PX8NL
 HDA7Y4xEJ+OyHK0YnQJ2CdusFi7bsPW2Gnn80JBSKbe4od/PXZmLkOI/3pDMPVCr453WDXt/1/+
 JxjD1/CcApHgI/2N9J9Q+2QJnGp2SZLqKLSwWOfb9+mGAYOEcWmFIKVoht9LpzkvW9ZpGXPD+fp
 g3Lnu25ntykZN7B3hHgpp92W7tT1MA09BJapvr03KUeu9jGTFPEiajkB6eHYXG+m7h+h96FMHaA
 vBjV5SaRejHSY9XWXEw==
X-Proofpoint-ORIG-GUID: eG41mTNZIo2s58MXPn7PZB8NxmvAr694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080106

Hi,

On 8-Jan-26 14:57, Mehdi Djait wrote:
> Digital gain wraps-around at the maximum of 16838 / 0x3fff.
> Fix the maximum digital gain by setting it to 0x3fff.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/media/i2c/ov01a10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index a35648f29932..fb4212ae3fbb 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -63,7 +63,7 @@
>  #define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
>  #define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)
>  #define OV01A10_DGTL_GAIN_MIN		0
> -#define OV01A10_DGTL_GAIN_MAX		0x3ffff
> +#define OV01A10_DGTL_GAIN_MAX		0x3fff
>  #define OV01A10_DGTL_GAIN_STEP		1
>  #define OV01A10_DGTL_GAIN_DEFAULT	1024
>  


