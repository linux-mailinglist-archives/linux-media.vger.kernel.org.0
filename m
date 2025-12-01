Return-Path: <linux-media+bounces-47927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FBBC96614
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 10:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0AE53A27B0
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 09:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2873009E3;
	Mon,  1 Dec 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZvuPfbV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Soex1PFt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2511F131A
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581529; cv=none; b=Y2pr920pNLGjxXFF/DxJ+w11DkQ275KlT9d1arYjiemPA7hj3WHRdesMHc5qjkAwcRbw5B+g4am4fyIHUlqcmR+0x327GGICSNLDiGRJlMD+eWps8zfgAGnDCFfvlVaE0pC1yxflcVoOdxv3sA0WJUoeU/d3eeFujhGXBUPM5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581529; c=relaxed/simple;
	bh=d1YPt/BieKnS32qpxt0f/1gZvXiEbFjZ3F+HeMx0eYM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dgm5Rj9JB6gdxqJ618t2u1MLGe3tZFsSU60mJ4YSbwLCWeBA6hGlKvWNZrsiyMG+MVYHdCZlZ/Cfx37bxBMgXEohY/TKZSAO6yp3XnSxQLymA1RuOoh+8HFScsUtrphk8QQrac57eI0pi6F+f324TEynRVafhoR/T5Aa3PH5XAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZvuPfbV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Soex1PFt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B17uBg13837655
	for <linux-media@vger.kernel.org>; Mon, 1 Dec 2025 09:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBb8yaRvGG7cqB+3J6J3yJ0A3kSK6t3ir/ibbeefS8Q=; b=GZvuPfbVhW8jixFA
	9VImVMFWcd4lxZqmM+zmJkkVEECD48hogeBfs+5NmyZ4QMkv0uxhbaZKSbKS37CI
	j4qV7cKIwlWsYnGZXCy+owk2CgVoSoE/8Xs/Uqp1wpadYIfSjb+5U+UTyI2COhs9
	IVLhnylGtpztpj5cYDeE7tJe84kK0lPJyN0wHg7Qt9skvu68fgimh7CBpLJvbCBl
	iaohyPw+V7p81RfM7PNB/7wzmyzlxCrlkjGA/Ug4bUPRq3BIeDKsgoLBLwLCUdll
	aGkBIfxLj6tldULeuEgJsuTLDgZM9oD1HSMkqrwsNqcbm4hIXJ+aEkchmXiXMEcn
	fCPByw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as72p8aw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 09:32:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09693109so68112301cf.3
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 01:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764581526; x=1765186326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IBb8yaRvGG7cqB+3J6J3yJ0A3kSK6t3ir/ibbeefS8Q=;
        b=Soex1PFt9CT0br9r7OSTAiEw+DDmus69T0WZXi711iulW+lXsj87uiywcoKijs5KkT
         0QSWd/to2t3CUl6F1mM0wtC+2taYQY4ickl1U/Wv5Td4f0v0AtgrxZaMtvs+KcVCdQU9
         GA49nDOuUhlZ9dtwkQiA4q88HJUyDdRIOJd1JT6jze6nctaDcOBNT22KqlhCq/n06vFt
         Kf0IHC+X+sUaz+Ac0uwMh51VeuhuGLPpi6ovOilm5FAzpfAwEuBgyV19z/ew9D9qChaQ
         t/pz2zakcsnVcv6pDlDdA8CgMUj+fvIjEeQIcwSw/t7dewGhtEToYWJMcBRiv4dz7BDE
         I2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764581526; x=1765186326;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBb8yaRvGG7cqB+3J6J3yJ0A3kSK6t3ir/ibbeefS8Q=;
        b=CcT3vy/VCKqcmWlmeK+AqzN6T6VEG7F8vR6jeIzidp1jjDJ2yfh5p909+b96zFWvC7
         SnDXK6cfJ6PjsF/7QlQgmOtzKxT54y+yjhYD2UKeKTux4uGBx2F5Mw8terWVt34tvwPe
         fMHKmDHuw3GQGj48znDsS9z1z7I+RRYjWcByY7ocALi1q1K2dj4zv2sA/vKREm9vtDt4
         r98FJvTqXhfqq/+wsnqBWl7P6CDq4v6yrHgIRPOSYhxckk5iWugrlCB+to7ILIMYGyqa
         48984k+hxvhTkopcCP6+GdrsoJoqRMBKieZSg6Z39xtZmYY6rT629SJy5ue3PdtckyL8
         phDA==
X-Gm-Message-State: AOJu0Yyn57VYtz0PfFa16NjLQsGNO7xYbIVPEYQsyL7muM2AKVNdrmOQ
	fDR9hcsoPOdYuHmhyz37USAcQg6KkbTuRwj9IVmFag5+rQihRH9f8ITC15bIG0hIIpfshpNyBkQ
	offvRMt5hS1/6NnBVbKQjr1KVpYQQ2Uzj0B4eTv5noDJU2yBKZ2hlBpp8dwX5wQrU4Q==
X-Gm-Gg: ASbGncvQil3w2mRp9Hst5us081Pcy3a1Q+C4bXI61o1MMPe3cOCXNiO9ATLnyxzfwZ3
	biG1R4n2Exq6++0wdJz6i55ZZFgQeOQmElXGfYm47fzHmyZUzouyEgUEsvcZvzFgbqqXeihMY+B
	y235sllaIc/5V5wre/WaNLxGG53gSWD+/oId4DgG5erpaRsPDq+MaaIBPiwrtV/46Lxzr5uHkwk
	m3f5nQ2hPTC/O+uLK3NHeKx9VH+/4fLII5YJ6NALh1KTYdtWtJ8Q25L8F9E2pg2Ya3vaXEsZ2gT
	O9D/ck2hNK8o+fEo8DFIXVCzZF0WoHkfHxhqk2vfIJ8RvTyawaLGAHDkOrtgYYypdEMAK/xIO9z
	u3v5v5wgm2mUvrEy45DJL2noVW2aZVx5TanXeQui1kksVTrAk2cbUevqzjRnR8NtFdKUHonRVIt
	uReEyEkbSvZsaST6rlQvIX/lQK8sMejmfnimC4s2hWx+tcK4D1qYJKOCZmpVMZhfqQP4JcK6PgU
	4Hq
X-Received: by 2002:a05:622a:1825:b0:4ed:680e:29d2 with SMTP id d75a77b69052e-4efbdad8106mr305098861cf.44.1764581526095;
        Mon, 01 Dec 2025 01:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWSD38QG1mu9APl2h2haY5A+6wbEe34kE6DKN8h4+gSCrtYAP5OuELzDTtCtSIr1dxIkqGdA==
X-Received: by 2002:a05:622a:1825:b0:4ed:680e:29d2 with SMTP id d75a77b69052e-4efbdad8106mr305098731cf.44.1764581525702;
        Mon, 01 Dec 2025 01:32:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm1204101366b.7.2025.12.01.01.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 01:32:03 -0800 (PST)
Message-ID: <4553d9ed-ba4e-4f83-b48e-e819e7979293@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 10:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
To: Xiaolei Wang <xiaolei.wang@windriver.com>, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
Content-Language: en-US, nl
In-Reply-To: <20251201000026.690298-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N_istEA8kh8l_MX7mbs1Phynefucvcgp
X-Authority-Analysis: v=2.4 cv=fs7RpV4f c=1 sm=1 tr=0 ts=692d6097 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=mcWsbQw8XzSWm8k_J14A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA3NyBTYWx0ZWRfX/4h8cP3WVWc7
 cn6xrrLJAqmrXtLTWxRiEDj1Zdbto31HIhVRXyiY8BoUv91aW3GZEyP4yMjVFOv4XB8rVRIve7r
 1yoaBlzMbJfArSt0wD5F3i+NqTY5UNKUqvM2YM6ou7yNmpq+QBWJP0mk5vzUuuMivSQ8waqrtyM
 B/em+yacScYKE6acNmw4bhrVNyMY9MSM5jrOuGFVAA0RrPhpgXjN16faLc3VhBPcp7sQhm59ZSF
 skzFvXKUAzHIQJvqC5JCXUAcUKCNmnBuUjVn0vUy2ptHwUOnmSyhdTW3He7bY4QHNNYOY5pD3ie
 J3pt7H2Pe+qpj5QuLRdU14SAOJ5hEbH2f4CVOLwypzuHx5B6V2fGlP2IM0CSgjvwXMMR+b/pMxJ
 26vjRcOtHEpdN2muVjI5XRJcsm+TkQ==
X-Proofpoint-ORIG-GUID: N_istEA8kh8l_MX7mbs1Phynefucvcgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010077

Hi,

On 1-Dec-25 1:00 AM, Xiaolei Wang wrote:
> __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
> contains an assertion to verify that the v4l2_ctrl_handler::lock
> is held, as it should only be called when the lock has already
> been acquired. Therefore use our own mutex for the ctrl lock,
> otherwise a warning will be  reported.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Generally speaking as a default locking setup for sensor
drivers we are moving in the direction of removing driver
specific locks and instead using the control-handler
lock everywhere, including using it as the active state
lock, see e.g. :

https://lore.kernel.org/linux-media/20250313184314.91410-14-hdegoede@redhat.com/

which sets ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock
and then removes a bunch of manual mutex_lock / unlock calls
since all ops which get called with a sd_state will already
have the lock called when operating on the active_state
(and when called in try mode they should not touch anything
needing locking).

Note if you also want to make the ctrl_handler lock
the active state lock then you need to add calls to
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup()
to allocate the active-state to probe().

Regards,

Hans




> ---
>  drivers/media/i2c/ov5647.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fced..4e14eefba577 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1288,9 +1288,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	int hblank, exposure_max, exposure_def;
> +	struct v4l2_ctrl_handler *hdl = &sensor->ctrls;
>  
>  	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
>  
> +	hdl->lock = &sensor->lock;
> +
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
>  


