Return-Path: <linux-media+bounces-49802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4ADCEBEB8
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 13:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB14C3008D68
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AC6320CDF;
	Wed, 31 Dec 2025 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzI0fMjG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYeLwPUF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C086352
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183182; cv=none; b=XOHoxRdWvaIqSD94avJHyZd99y8nerdALmUIenKKqioLDHmcAPNmERfzMN2xeg1sJtqDXhyeMSQK3kDFn7OKP1QOHvGpe5kG/pPxFtrr7pEjOFdHAEoms/5v2zBzpzd9rJlTmJWX3+kObubW00KJgtZZFeapxJFkusUbHtyy7F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183182; c=relaxed/simple;
	bh=s48nmK3NKQZE2PYmJaqjdLfD4WNlWWiVAbjusMsyznI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QfNLeS7UNGQ1W72UGwnXeWXcEjuLxoz48s8ybl8aLrK3zhIJQDJe0x1eqJw8k2S4xJgJGvO9SiWyCWdm31+/XHLIfLuMnD7695bKsaQShJ8kXnYuLECkzB4wmlE2AdM3rqb4+UfyUV0O1fkKg0kSU+ZB5GYEf6qrvsEtB48OOqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzI0fMjG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYeLwPUF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVBYMmf1152216
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqaI/0wCt3rL+jDr8bZjjFBJ3gytLvffjYnVSdSDcTQ=; b=QzI0fMjGmBr358bg
	2CS/dTAMIoJpNzpJkYjgCvduOyaU3pAr48ObPO3LjhEGsyn2jQpCEDN7z+B74yKl
	Gt724EiNw+yiEXdZOSsoO2w87KhS3/tkOzGmIn9MhvjI51Q/6N+7tjI0Kt2ekWWt
	fHvh/3TRV1uHy1iTsPTMeplqgSVr59F6233L8puBeZTu5YcPtAclwV7nOBMM/vqv
	lX942Yn1Ws9Txn3CudolgMbbmWXi/Na/GZcRLMO5E0kj/aUp3TDS1RMOL7jtoGA/
	hyKZ438tvDAHkuDab7WNtwXWmfabEO0nvhYjMeAImGWIxKTkjciRQKhUuHpQZqyM
	BGeu0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gvcrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:12:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so286124151cf.2
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 04:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183179; x=1767787979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HqaI/0wCt3rL+jDr8bZjjFBJ3gytLvffjYnVSdSDcTQ=;
        b=hYeLwPUF+rwOjDz4ywhj3ur5A7w3XaDNFYiH4WjsKmSm04SPSD52jHQ5VY0KzJn4mn
         6z9DlIosPImmWk87KHFyX34Lhvj84wMrgtOi0iVUxC7zTddhu07ZMtpKxV0Fd+DG9INP
         qAQC3in97flJ9sNXeaeLsbCWebDsJ8MWsTziD/Bl1Sv/S7S4WSETLzWACvQvZc9Swc7U
         aB3OcsCdh7DYs2YbZxwyJKerZBOEnAtiUoREcCEtQ5WJ9WV9qNX8/nC3Og3OrepU28/T
         WZFroFLs/kArodx+xq3K+UhwXNdAKQraGc9aNYjp+IUR8GFtrdm+27NI5qaJZS1nkQTP
         7f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183179; x=1767787979;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqaI/0wCt3rL+jDr8bZjjFBJ3gytLvffjYnVSdSDcTQ=;
        b=B/bXSirDmKqbXubnZ7ErxxbS6y51JM0BPpGDYbtB/6OAHYFSYaXxAIFVBwwpSEs++O
         k4cFj/PxwqdfgOAU+h6d4PGMCBBQhaeojymbb5nTtp0h6b6Rjo03waEvVQergClV8xUd
         VI4CSZwbqNJPUeWkIeo6SJ9Npf9I8y2dOqQLcZhs5EM55GqQo7JWV6e2fj/VlUmfxHl7
         DNCwQa9kMBDj0VNUAOnkMstCwjfhLhTX/H0ci2Xj9cjq9rgMVULhkUbtwvhqhUco8/g9
         fUwl6r9Cj22/WoXHvkIkZLyKwgl4vX7vHHGFX2baC0bT+BGCxy5XqUq8RDTpVCHyBVJv
         8WhQ==
X-Gm-Message-State: AOJu0Yx565IY/19QKyESdbo8F0hyesT+JjA+y1lsUF30pw6ANq3tgtSj
	fA8XPNsjr/SGxiuOfzo9QlDtlsFkuclnga2MAxNkNneSApFvUBLXnU7XvNEn93JAiBwLozmRcL+
	/9r/AGyovALQ0YVHX57h6KKHSIsUCfA4h9i114V68J8Fw2onCJu5hxvyXdsChKdtLdA==
X-Gm-Gg: AY/fxX5N0lrzgbdGY1KFfCIZ89f/sDgtEvsb4nZDLm7VHJtgoA1JW0gmC9qjKOsXKKO
	i2MZvzTXjNgqpNldqDMf8fQ+m0mbV2n1kl9mgdkrj9sqktMVg+cmRZBtqItR6Mol/wW4q9WT4Gi
	6gb220yy7gslLxRbwTfG4mJzHAy8mc+FOoyNhz4P8iNMRdH3DatL9gAzQZ+FLHDBz6qI/5mTQuk
	RujDIKAIKvtOpX1G69RseP7NpUG86i/tQaUOik1IlH0Xwi457YZwtnMW17MiAGFnyGxcDOh9KpC
	ytmkNWA/DayHQGY1Nvdi0FOXO/Khf+yKKWjvcBqH8xGdJTivRqrtVDOCc2BDJPTiMJlutBhdyDQ
	vNqoGEszMGqX1jVoTONja/v4j+27m+ka0eyVNALtrNvFMOgvKJftrxK5CyajWwpLJTlbgO0BWEe
	WVAz8XQxwK3wVJs8AYW01hlB1QWsicqq59wE2JjD95oMicOrLuFUeI6t9dcCoCw9wJpgeu/maul
	HGU
X-Received: by 2002:a05:622a:514e:b0:4ed:6989:85ff with SMTP id d75a77b69052e-4f4abcd0bbamr525591291cf.3.1767183178665;
        Wed, 31 Dec 2025 04:12:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDPr2gUPlTPcpeIgyyM1Wv8Y96/Cn8j+4GWpZ7ci5/ZXFIllyw3MrxDoMZgAhU1/Is7D+a4g==
X-Received: by 2002:a05:622a:514e:b0:4ed:6989:85ff with SMTP id d75a77b69052e-4f4abcd0bbamr525591031cf.3.1767183178261;
        Wed, 31 Dec 2025 04:12:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm4003050666b.23.2025.12.31.04.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:12:57 -0800 (PST)
Message-ID: <636403b7-cb5f-4997-b24c-e697626e17bc@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v3 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
To: Xiaolei Wang <xiaolei.wang@windriver.com>, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
 <20251231083924.2657165-2-xiaolei.wang@windriver.com>
Content-Language: en-US, nl
In-Reply-To: <20251231083924.2657165-2-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: df3FTLit9ixrAozvOM_UQk5jFKQywpj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNyBTYWx0ZWRfX/4lg23Yz4Gjk
 8JqBmH0UqZ6MxyQDen5x2a6aqTBmHB0hUzF+22j1m3It/KHuyuT9tM3VL2WLp4CORa9SK/J3RYf
 5n3tNnd9Jq7emPkr9Aw35vDZeIdGqHr4M50cuIRLpdct2xrTLlTXRJm3BlcowUsjoQSaDR2kt2j
 g84wYcrI9rHzcOwGvhLBsQa6lfihV/MYWmxeoxwMh+eF24e9Fx5N1rRMw5m9RbPmwQvcocPFGwt
 8kIaNp6zpgESLnoriiMt0nYc7s++QBi5hpvc4jdTQN43EnRViBnmu4yvFyJ72WPYaHhqEq+68S1
 HD/T+IkV1++GoTwbtYUuIKVGrz7AfJVsRJOWlQQcm4y3wcCtMJ7mSXeh7Muh/AhixAqDVOKDnEG
 7S9xlQl+DduOMCnkALV3BeebHpiMiEj4Fu7n3GN8DOBjMomAIpDBaRJDgzYNd/wGa4GyjolcTAI
 6o2LfH/Csz1mISfoaDg==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6955134b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=owoaAa1ZEmoxDWc961IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: df3FTLit9ixrAozvOM_UQk5jFKQywpj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310107

Hi Xiaolei,

Thank you for the new version and thank you for
addressing my comments about the register lists.

A few more comments inline, sorry for not catching these
in my earlier review.

On 31-Dec-25 09:39, Xiaolei Wang wrote:
> Use the new common CCI register access helpers to replace the private
> register access helpers in the ov5647 driver. This simplifies the driver
> by reducing the amount of code.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---

...

> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fced..cbcb760ba5cd 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c

...

>  static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>  {
> -	u8 channel_id;
> +	struct ov5647 *sensor = to_sensor(sd);
> +	u64 channel_id;
>  	int ret;
>  
> -	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
> +	ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
>  	if (ret < 0)
>  		return ret;
>  
>  	channel_id &= ~(3 << 6);
>  
> -	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
> -			    channel_id | (channel << 6));
> +	return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
> +			 channel_id | (channel << 6), NULL);
>  }

This can be replaced with:

At the top below:

#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)

add:

#define OV5647_REG_MIPI_CTRL14_CHANNEL_MASK	GENMASK(7, 6)
#define OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT	6

And then replace ov5647_set_virtual_channel() with:

static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
{
	struct ov5647 *sensor = to_sensor(sd);

	return cci_update_bits(sensor->regmap, OV5647_REG_MIPI_CTRL14,
			       OV5647_REG_MIPI_CTRL14_CHANNEL_MASK,
			       channel << OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT,
			       NULL);
}

...

> @@ -815,23 +726,23 @@ static int ov5647_power_on(struct device *dev)
>  static int ov5647_power_off(struct device *dev)
>  {
>  	struct ov5647 *sensor = dev_get_drvdata(dev);
> -	u8 rdval;
> +	u64 rdval;
>  	int ret;
>  
>  	dev_dbg(dev, "OV5647 power off\n");
>  
> -	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
> -				 ARRAY_SIZE(sensor_oe_disable_regs));
> +	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
> +				     ARRAY_SIZE(sensor_oe_disable_regs));
>  	if (ret < 0)
>  		dev_dbg(dev, "disable oe failed\n");

And here replace this read + write:

>  
>  	/* Enter software standby */
> -	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
> +	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>  	if (ret < 0)
>  		dev_dbg(dev, "software standby failed\n");
>  
>  	rdval &= ~0x01;
> -	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
> +	ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
>  	if (ret < 0)
>  		dev_dbg(dev, "software standby failed\n");

With:

	ret = cci_update_bits(sensor->regmap, OV5647_SW_STANDBY, 0x01, 0x00, NULL);
	if (ret < 0)
		dev_dbg(dev, "software standby failed\n");

...

>  static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
> -	u8 reg;
> +	u64 reg;
>  
>  	/* Non-zero turns on AGC by clearing bit 1.*/
> -	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
> +	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>  	if (ret)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
> -							: reg | BIT(1));
> +	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
> +							: reg | BIT(1), NULL);
>  }

And this is another opportunity to use cci_update_bits():

	return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
			       val ? 0 : BIT(1), NULL);


>  static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
>  {
> +	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
> -	u8 reg;
> +	u64 reg;
>  
>  	/*
>  	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
>  	 * clearing bit 0.
>  	 */
> -	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
> +	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>  	if (ret)
>  		return ret;
>  
> -	return ov5647_write(sd, OV5647_REG_AEC_AGC,
> +	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
>  			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
> -							: reg & ~BIT(0));
> +							: reg & ~BIT(0), NULL);
>  }


Same here, please switch this to use cci_update_bits()

Regards,

Hans




