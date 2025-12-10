Return-Path: <linux-media+bounces-48541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FECB2626
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D6AD302C23F
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ECB3002BB;
	Wed, 10 Dec 2025 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGKqoe1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gr+1IVIG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043B2FE05F
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765354915; cv=none; b=VkkonBbcr6o9O0iu0QEoJrvQ81NkAHPPYZbb1kYd9iFijLo88RUt+fwnJcLyS2iepFCH19hE20TE7AC2vKPgVGZ7G57ihQqZPQNCie8aQnuHl7o3sCX2Ru87GANOTCj1r1RYHlGgQgmd8NhqMr7Ukg4PJ+BYCjSRsm67/eXNoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765354915; c=relaxed/simple;
	bh=UO5R4ISps+SdV2TiPf7w8ec9+xIFI4520fnD1HzQP9E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cNmiwMfFyah1kM9Q7ocoDz0ffc1TBXK7cpKyU4ILx0T4F3/Kbk0kEIYoLEjLKAcNHKke9tT9/0ZswUg5Lt469OPmb/422siAhfVd8S50dZDXQDnkMo3n842x0pv8KpDZBW20Mvl6U9yonLmxQxM8/JhyLuaSx0eg41B/tE1s7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGKqoe1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gr+1IVIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DmCQ1243363
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hxb6Hfleya0YfAM8HHd/h/maKftZ6nHvrFKsgbEF88E=; b=BGKqoe1dGevOtRE6
	/Z2PKLqj053l0F4AFKQJKbbnNzyil7dmCd+rv0kVP8KmmQvRprQFZq6GsCEaYWEy
	xftPx7K3ehkQVOfjStnTsiFOBqlIZroWdHU3gIn0+z6qABqj7D6DzgtEOLl3dr8G
	jntgo5FlsKGOzA3Ydk+8vKbXYESYa9CC8qrFxdjXERTt9rtbBmvipbdq0IasYEQx
	8DNCVGRh1j04Mfyi4PxqBDKDDu0GPDL1SnIgQH09YC9w77u1GBglfzYkJxBUDmYc
	zeoNDGmtNAQCxQpd1Pu+jiWIGaWykise2CQoEAcVnjoba9tuT1En3caz2ExX28y7
	MkrzKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vu2d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:21:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb35b1147so10127291cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765354912; x=1765959712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hxb6Hfleya0YfAM8HHd/h/maKftZ6nHvrFKsgbEF88E=;
        b=gr+1IVIGrdZr1BpderCis6b59Sv5HTjql8XH4nNPfrtCp5J0UszPBJYzFc704jYXsb
         zrDgylFadi3J7nyny19ebVEaH6/Y5iW+5J+5TGIqTvRoTjqERxPcIB2/GmwB/QSCw1y3
         R3JSLasHwNJ/SYQQVA5ge7/zK1SlCxLHOKFV4HJmjmI+tnezcr4jX5TGa8bwWM7ePWiQ
         y9o1POQy0TjZbLQFHKOmExZrzyKg96iFXohYOJwIpLr/nA7TuJG/58XiLKh+szZoLRTt
         kefZHsfQgPPPc8tSjMVbp3F10/2BcgkGlx2hKUjCyHlSdBATFE6yOFD9LrAo6xUCL1ZP
         cGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354912; x=1765959712;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxb6Hfleya0YfAM8HHd/h/maKftZ6nHvrFKsgbEF88E=;
        b=Lqj3kinS1Vyi+3LhY97WWI0bAj5zx2mOT0s8dtbysJErxLoOYlsfLzulmrrh1r9jDb
         9D0ifosao3S6ciCuMmVhGuWObPAfMa3lC88QzloGg0Zr8CTu6TkgnNgZCctq1D2RfTnl
         fY7o2mm9LDjOsQRWzz+81z4/oZB5LseR1cZsRinZ1CjJdDhbU5s1E5yAhxm5xABfuCAG
         z428mnZr3ql+PFH4qMUjCu75gj0qkV+xkA+j+FIpxfickQrqbSNuGhmPrXgmBdaOsjkO
         ON752FLCxyVgjGqCqc3iLTNM80T0Xv4HxdxmKsEpCpYZKcTpLiPNM+pjGv2ha08/Qe0K
         lbiw==
X-Gm-Message-State: AOJu0Ywlyf1eqMt+Gm4oZhxOjLTOdI7S0x4nFQpEs/V+z9lqu0hRIuJi
	EElYW/KL0TxsYIZ53tg8TEpssuMh/6LOY9XOSTRlXp73BPIF0FPFKoqPOkkAKQoO4+bCarWJdTM
	6Vx6azup8oiW1gixLKvIsIi9we1vGCXtRhkPg0+GnUDW4DIMUlUv+TYxGWEe7xviCsA==
X-Gm-Gg: ASbGncsmHYR7GJiN+XYlrlaIwycEiOZfMoDUmyzovQ+jbilgpWfcKw6QJhSFRiXgnYW
	vjV39ZjbT5AlrV/39tJjdVfTDW8Cq9TsO7YekR64QVDyDmRTb6imAPDvzeNxlpmpiafbgK+OGXA
	EZ3FlNOzydXpwkVZoIyGraRn+b/dLE6kl7TO7V0wZtSAOJCQFTabZbDKCkFmTjDPMHeSxbclJVY
	avh2J95ihZSDvOAoh6EdPV6jxP/wLNPqkA+5fqOYMvFWCAuNC76Jyh8+YYf+uynRHwmYjcIOVF3
	ESp0Ny41vk0u54XVL1Ha+034iyTxJPupdnovF4ymNG6WFrlylB1F6vtvihP2aTYOcLXmMGOaTHW
	AIOgGDHN6MchV6GcJOfAQ6dmLvtOnAggdLhVXlyxRCV13w1bi+88ni/N6DUEa7E3CY2iZ4BF+Q/
	u1CnDY611fyy8YfMMW74l+UQBif1IUB1j4K/RRgJRkqq4CKM1tqsp05qVuCn9TWXhNExCZTMePy
	4pR
X-Received: by 2002:ac8:5ccf:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f1b1947c54mr20000571cf.0.1765354911860;
        Wed, 10 Dec 2025 00:21:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt5hHH1XmxzyGPV2DuSarJveef/bWqsC0tPz9tuqzLf4WEb0nH5V2QLsZulrLYRPVHhG40DA==
X-Received: by 2002:ac8:5ccf:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f1b1947c54mr20000381cf.0.1765354911437;
        Wed, 10 Dec 2025 00:21:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4457f91sm1649069366b.7.2025.12.10.00.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 00:21:50 -0800 (PST)
Message-ID: <023d20e6-23ef-4f64-8ea6-31f973b33c95@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 09:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] media: dw9714: Fix powerup sequence
To: Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ondrej Jirman <megi@xff.cz>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z6I1SJHBEZehtliz4D4dPCyzFdwASsVe
X-Proofpoint-ORIG-GUID: z6I1SJHBEZehtliz4D4dPCyzFdwASsVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MSBTYWx0ZWRfX9vBangrcylcT
 2zjYKPUG6EUofu7Ep1usoTgszr0YMry6WukMZqqsUfpeP7s9wqqScu8PQ+gCp5TesBRYrBo1lqU
 X3pVN0s6/XbVW5EL0bcbdeyuu/M76hNE5s7Hx++YdG5lq+G6FD+IEppxWklI4J2RGpay06lV/xJ
 +RDisavDXqBjzm/qpc3XDE3nlKMOfzXlSLT8px0xJwJ2w03WpD+0ZpDXJ3TOu/CF2DhoPGbYg0V
 amO/tgjRyPPY0cXstQaLxBvHIjJOND6pyX2ImIZwYKamuUqfsfobdDvGLchNvrMLsywPcX98iYd
 8pq19UMoKRyrHx2al7LHGHul5TvcGbEUGCAAB88/DB4qhQMjYTEm/k1wtrJvly42lapiV54sX2f
 YXIUf4HL6Fe5QEvQgIsKbAaFwgseQg==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=69392da0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KtRVGM7OAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=p84Ubd_8bvLkjSw0z5YA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100071

Hi,

On 10-Dec-25 8:53 AM, Ricardo Ribalda wrote:
> We have experienced seen multiple I2C errors while doing stress test on
> the module:
> 
> dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
> dw9714 i2c-PRP0001:01: I2C write fail
> 
> Inspecting the powerup sequence we found that it does not match the
> documentation at:
> https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf
> 
> """
> (2) DW9714A requires waiting time of 12ms after power on. During this
> waiting time, the offset calibration of internal amplifier is
> operating for minimization of output offset current .
> """
> 
> This patch increases the powerup delay to follow the documentation.
> 
> Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/media/i2c/dw9714.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> index 1e7ad355a388cfc37253bd764ec8df98f59beeea..3288de539452ebae41daa0988b2d52f27a790da7 100644
> --- a/drivers/media/i2c/dw9714.c
> +++ b/drivers/media/i2c/dw9714.c
> @@ -149,7 +149,7 @@ static int dw9714_power_up(struct dw9714_device *dw9714_dev)
>  
>  	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
>  
> -	usleep_range(1000, 2000);
> +	usleep_range(12000, 14000);
>  
>  	return 0;
>  }
> 
> ---
> base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
> change-id: 20251210-dw9174-timing-9e58903399c9
> 
> Best regards,


