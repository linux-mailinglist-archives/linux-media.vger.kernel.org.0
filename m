Return-Path: <linux-media+bounces-49405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B91CCD89D2
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 10:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABBF0301C94B
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 09:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E51032938D;
	Tue, 23 Dec 2025 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJvMdc5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWYd3CYw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E25E2C028B
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766482779; cv=none; b=SQE+Uh3cJ0/0OevT+3QsImibGZ1aYKFzOuC/RNJq4ofAfmHWvKn4oqS560WPvYrjte7up18YGfUT8+jyA8Qqy2g/hKW1aqeSh6gpElUfdo+B3m81uRgnJHIfRWT57MPRpiWsRtqEFLJgkYjOGP2V61/pqrxiQ8X1slldEKmQtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766482779; c=relaxed/simple;
	bh=JAL8vNizEoWGlH+m9evG9F0h5x4ut+t3y+PhmqrtkVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvKsGj1WpAsDeA3D0jQlEtBadfw4csFgtMqYizDBVP0Cb34aRNCjjQIvPd/9f/dWkaWwBHtrrqpaLjeDFJvEqzGMLEd2WhmirvoVTyW633tykFjACbbewzD3O/EgC6RqZrUSmMnl4k/GsupGNNBVc5GuSlqvayVwEkH9rsGf5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJvMdc5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWYd3CYw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4xnde1901934
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 09:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltnrrI+3PK4TiGwpuOk8vKM6xutJZYHE/BDVVm8V/uM=; b=SJvMdc5O5yKAyaL/
	r6uX6nZELqqvBZTep4RiyARo4MWFwFA9pT2ErUOPBTGibrs4QPbzjm99EPUPe5Jr
	JdTwGH3viVOciRPf5oiJlamPmrDUGfLirDO7H0t15sikcUVTwl5RlT0xaEBxvrE9
	1brGuyC1Dt64QRKQ7SWbPDnq7XgGPcJBjynENLZRl5xQi55DA7N4txv0BUqyJHYY
	9jjS+g351cYIwBk4VWfXwwpo/2DAQTrqkSqhF0cGBy7IpEBuaq6b3VaU7DASN9Te
	nSIXjswS1InWB8bS0NCNHsP4g12E6Z6nRwSiEYT0L7/c0B2oRGAatYwzUAHWnVtu
	YVjM4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jh2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 09:39:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7dd05696910so7337146b3a.2
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766482776; x=1767087576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltnrrI+3PK4TiGwpuOk8vKM6xutJZYHE/BDVVm8V/uM=;
        b=iWYd3CYwXt8SamSCezB3634G/o0qDqTGB5c3t4bUkjAqYJdxFy5H6HX5qSaUA0DDdZ
         c7P2LkPAx0tYpXwQ+JDppfMV+609QCbgHglnq5V3ZskhB7jURATpnjSMnEJz5j79zw6V
         PrDmKlYpB2LLyOpz4vac3eDRX55mXzVaw2dLl5T8tYQAAQs5CSN8Pv4qvYpH63GW66Ic
         +5vLoI6Q/w6aSz7fCT/0/8sYPhNpZFnkClMy2PGpks+oI7f1sQQ23SW6AtFCGuUMbOJc
         8eyYDxDeHfFh1woYh/isv1sUF1VFucCjuZNMhpfQLx3ef0wxCYQiqNq9Kdw1b9zs6dXp
         A68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482776; x=1767087576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltnrrI+3PK4TiGwpuOk8vKM6xutJZYHE/BDVVm8V/uM=;
        b=BpVz+9eC4C43SycsER9WjvXKdNEAOOUw8/s/ZCYinaqZNH1YNB0b+zecPNP64nWcDJ
         YZE2AOlaGHKa241jc1+FvEyd8QAlvCJzfzcHo8ytKu+CW9zBh1qaRZuUKRT00iO9iEpf
         djCTP6dG9YDUKj4VTf01QO89hcYu9VKoLp+gP2wvA+ChgmR42xwBgHkwpA7nblEg3oaI
         4QGEcD00VNhVipR/ONSFz0PRTH0e8oOl0QKCBNTpID+76wzf7mtHW3P7Bghg1Ro319p2
         oo9T9Q/q1oVK8XqT7luLhnGL+y3ogN0W4+PRzs1ngr1Gf/5CBn50Gljtjaz7ilE5sqxL
         jvTw==
X-Forwarded-Encrypted: i=1; AJvYcCWfCWZOBLsEMZPlcS1+d9H/ccO22MyTQnbDX23Un0ip1iglOy36gfH7yRI/o/xSj0IyvYaU4LfBVl7JiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaHZ8nw/xafsYPZvuLEQw92GTMZJVRTK2zAtfAwL8ORriZB67r
	IEVoVylGQucDK2J+giJSuXBfixlOeFH3yo2ePR0hDG5QhuxfZv+V/vQredTF0vR25Nu+o2y1H7s
	KuuinfTe4Ev3bDNMye0HYUeUXCB3HTQeH5JHCjfs9TWwSpsWp7VEBh7DblEXf3KPFXA==
X-Gm-Gg: AY/fxX7LflyfvBCZMWO7sWHeA1YlUOQCUzUryARbby4tri/FMQua0i870qPTwe7eOGd
	jnT1NerYa1dQW7ho++VwWsrdyZa7uAboB7qNeLuJHoDS2wucF+ARBhgtPFIjNnk9DN65cYIkSM4
	s2SMA39PeOwHPcsLf5O633/CEyzsnpM8q4wCCa81RFfs1vdrsvaQMNqNdlqLqOhdxE7HP21B+Ck
	JlCg5whB2jPZaDvIKvY75frhfJv2C97EDLpudEohsSZ0zGwBtj4+R3EaKt6VWhl6MWxLuGtUhg0
	DIAIuETFggu7NkGt4AxsWrORbbxUSvPV0cyu4T3SSILKUZMB6RG5ua3db35upbYZ/0GQsZAfaZY
	zAMF6q7yI1oQDtY667UTghZ/ZIVnzpS4FFeoLu7sT
X-Received: by 2002:a05:6a20:729e:b0:366:14ac:e202 with SMTP id adf61e73a8af0-376aa7f0d14mr12264276637.64.1766482776213;
        Tue, 23 Dec 2025 01:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVwlRdEP6DXgpjdadPBcZWyCly4guoBHOf0x/UtW9KheuofYH7G5h+sDzt46E0I5Q6mJCSWw==
X-Received: by 2002:a05:6a20:729e:b0:366:14ac:e202 with SMTP id adf61e73a8af0-376aa7f0d14mr12264262637.64.1766482775709;
        Tue, 23 Dec 2025 01:39:35 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c627f3fsm11837818a12.31.2025.12.23.01.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:39:35 -0800 (PST)
Message-ID: <a90943c6-0e7f-51cb-05d6-41e131797196@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 15:09:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] media: iris: Fix fps calculation
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Keke Li <keke.li@amlogic.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
 <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NiBTYWx0ZWRfX7vhMXWYkJdkD
 JVdyeGShrEcxpE7FAsWSS6qRc5xgk6YhSDeqP0Oq38ho3cCjApnsCSrOWskMw5sl0dlhFNXXRL+
 vfgWbc0YScvLyjM9/VRoGj9mNKlrBsveYAcxP3+O9y9gO12hESOlhVcYx57Podx7fi11FWGb7NO
 cnOto4lhJQnZU3KtImFBYRgOcNlzXV/+P2ksu1HFICN8LH095Y6dTbsbhTCYpxZnF8aUo0pFHsA
 ZGbn8NVewpY2PONshLZ32JBIxNhTo/1Dl79S3MP7wl9BL0LiFnRVgWZDNcp+kLNAqK3rdRG8tv/
 wN51If485vY4FNXS6Vr9nFU53nytLuBNNnK/VAv8JNAERz5wzVpD6UEGAPAVn2z7Nhfd4IX3Fen
 U5GrF7p0T4fVfXomiz7Q7dYwS62r2C/kaY79zwH2eUGmjIsMZN1GZ2ru0+BsQvE2pVLOpYkk898
 AtJzjBdRf5Qy5jQu+kA==
X-Proofpoint-GUID: UtlfRUxUHzTlOnhf1sR-xwfsVuYy59Qg
X-Proofpoint-ORIG-GUID: UtlfRUxUHzTlOnhf1sR-xwfsVuYy59Qg
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a6359 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=oASd5UHybYt+Hs44tZ/i0A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8
 a=OC_TLObswgNljWciDgcA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230076



On 12/16/2025 9:12 PM, Ricardo Ribalda wrote:
> iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> a normal division.
> 
> Now that we are at it, mark the fps smaller than 1 as invalid, the code
> does not seem to handle them properly.
> 
> The following cocci warning is fixed with this patch:
> ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> 
> Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 5830eba93c68b27fa9db87bac63a691eaca338d2..3b941aeb55a2f498898a27a5f8cb58cdb26fdfed 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -382,8 +382,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  	struct v4l2_fract *timeperframe = NULL;
>  	u32 default_rate = DEFAULT_FPS;
>  	bool is_frame_rate = false;
> -	u64 us_per_frame, fps;
> -	u32 max_rate;
> +	u32 fps, max_rate;
>  
>  	int ret = 0;
>  
> @@ -405,23 +404,19 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
>  			timeperframe->denominator = default_rate;
>  	}
>  
> -	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> -	do_div(us_per_frame, timeperframe->denominator);
> -
> -	if (!us_per_frame)
> +	fps = timeperframe->numerator / timeperframe->denominator;

This is wrong, should be timeperframe->denominator/timeperframe->numerator
Also I think it would be better to clamp the fps?

Thanks,
Dikshita

> +	if (!fps)
>  		return -EINVAL;
>  
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
>  	if (fps > max_rate) {
>  		ret = -ENOMEM;
>  		goto reset_rate;
>  	}
>  
>  	if (is_frame_rate)
> -		inst->frame_rate = (u32)fps;
> +		inst->frame_rate = fps;
>  	else
> -		inst->operating_rate = (u32)fps;
> +		inst->operating_rate = fps;
>  
>  	if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
>  	    (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
> 

