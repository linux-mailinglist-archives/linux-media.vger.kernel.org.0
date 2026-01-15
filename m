Return-Path: <linux-media+bounces-50737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C9D21D72
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 01:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED114301EFF2
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 00:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134221E49F;
	Thu, 15 Jan 2026 00:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDx7re6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUyBJH38"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171694A3E
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436457; cv=none; b=V6b4/un6QyIarLt9kMpKNd2nuf3LF/AUwDmhjE2pi0KZR+e57IJQjqqE+b66BOvnEjyS/Vlfa0FypYrJq8AsGf8WeXB+LpoDc32oeqFpTfQRzIP16nD9MuOfdacE/Kg+5jQp3iDqi9AzqsOWmqFNHZW2+aqb/YAQnfi18S+09ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436457; c=relaxed/simple;
	bh=WU6TTWstatUD1H6ggDH5RSyRcREd9nTuVHet71V+1YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZrloHg+MgjW9dYKAkasPoI1cIDugEFGOMrGr3rk364r0Ve1hzqlo1dtFdW7e0pEIfSXtLdzeypa4YN8NmH+D/paC6ORKXOZi5ZWS9mhbUgytDc2Ab+vIqOuhznwdxcXmhQzku9n/TRKfThJsE3HwVpbcZkRKrl15YXlgb3yboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDx7re6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUyBJH38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKGTPq4135940
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 00:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	131X5QUwDFZmhjmYsknf4+3HMILLz8IAS/UGgKzJ1EE=; b=eDx7re6IlDnLBwd9
	xcn0PNAS9nt4w9WDO0wDP3/gzwBfmFkfgdDapXQeMLoJNcRPqbaucqhVpdLIHckz
	N1M9SX/WnqKkUUACWqUzq2diyhZrGcTnH8rr8Ub4cKE/70/2MxPNsjzL2gmaukgR
	sGWNEY7nM9bABDbcvJ6ErezEkGk16rET85D6P0NWHmG22EZLpSJhxkdW8nUJaco2
	iJjzuhVnHaOccjewzjTULuX5+c6ptvdvFPHA5P5Y7PZ/dhNHaHIF19tjW8QHXl/r
	X+ZrSuShPtIHnQwRaitpUM1nHl2W4QYM8uPuFa1eviYqzOSll9yz0UOi2LLj3ZFl
	UnWpCA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1prjq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 00:20:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12334eccc8eso55138c88.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 16:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768436454; x=1769041254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=131X5QUwDFZmhjmYsknf4+3HMILLz8IAS/UGgKzJ1EE=;
        b=NUyBJH388sCskMihxrBsvYV+B9WBLjHqDWm8R7MCo458Kf6CqKPJRil+KrkTCPP7Rb
         T4hSMRprRWwiD/50LpC3klEdaT0V+Dez1CA4XO0d0cBnIH8WKPvbkYpdX3mIN/yyX97y
         1EosY+3avg8xlzyxkJ2dsrigFKMLFtQXayjL/6i4WUOHr53Q3Dro08Loi/UEgg3dY0Jy
         +hmT0gsCB8IzllEpAMeYr2Gaie7TuRK8r33l4O+ZgUuH8DI+xoYgdKi7rWM8NqKcFwI0
         45LHRQyQs/Kut/ZAEaFuKtkp+DGRbXZv+XDXrqINMYc2yf6WN+4bWUnlymikncwNH9K/
         4S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768436454; x=1769041254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=131X5QUwDFZmhjmYsknf4+3HMILLz8IAS/UGgKzJ1EE=;
        b=qNqj2wPD1ymPEZrImGeS9CbPA86q93wR4qL/8iHxyJRgwaHLbOowoZyZC4pXo9w3T8
         CqfP4eF001OZH0uTSaCnVyZY9+Dz2/herm3TWjDDBqI+zGfiCRYP765J0kX914SmfA+j
         /shD+9/jO4yakk9YQ7CE/WigHgp1TanBwl8QGoKarmPLWqMyehkNX8uZDHP0nvdhOROx
         3wuOzWP7e2BnlAeDJoSW4Cp0RfJILglc3XnymDEpuVxH5S0eNvg1vaomDhJojITVvLSg
         TPbFvRc9nN9imTWztZWX/279lbC1wwNcEhBD6ksdkd1JFvalKGW24iKwMG5Zzn9Qbqec
         63ig==
X-Gm-Message-State: AOJu0YyaF79iPZbmKF0vaTXdX0by3lUgPCKyOsgO3hnt6b4rpzJ4rrbp
	gQ9LtQBEoPONKEJmPhdS1HyLaYLj63re2yVRz1SsInC7MZXU9nzCTUstazytmHFaEubZSeEiywq
	MOtYiKWhosGb9xktMNQBlCK/H7SA/YDTdrij+xEeNgftFsSMMmcuZY0A5FYEneEYvYQ==
X-Gm-Gg: AY/fxX5CUmSR5fvN8Md8vyCoOoxalHwtBvKBZiFGh5+VGsakR5BVArsKYDUIUDiPZWL
	eDePsUs2OvkAa817Tfsj9jXESMAr42k+ZHWuiQhw82hxm5UgWWN0dLH3bZXJ/kaB66+WmNzih/E
	PPKaCZ4pvWaAPGupMV+Hh7LpQ8+sf9YvnuMs62R29L36RHVEh6iOJtp0x5G9PMiHRc0OiGwvEIC
	SrRBTJzoQKjERaxBYJ5kXfEjTwLHdbPD8q6KxXL3NDp2CBfGOsMnORuolkYJzhUw0vzHX0iB76K
	yVCIXIfwv3TBY+WDY9Jqg+jtQwF4xyqBB/C23jyRJYqZMTiDTxAMQEGulsbt5JYwc75clPDvGjT
	vCCJ1YXMupJzicnxPNnD8kdEvUgT3/QJjCKXsEQxMNGhFLjW5VaEbdqznQce5zi6vZBYnTTQX
X-Received: by 2002:a05:7301:1f09:b0:2ae:5e96:9d1b with SMTP id 5a478bee46e88-2b487086c53mr2907827eec.5.1768436454421;
        Wed, 14 Jan 2026 16:20:54 -0800 (PST)
X-Received: by 2002:a05:7301:1f09:b0:2ae:5e96:9d1b with SMTP id 5a478bee46e88-2b487086c53mr2907805eec.5.1768436453796;
        Wed, 14 Jan 2026 16:20:53 -0800 (PST)
Received: from [10.110.121.92] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673266sm21358040eec.1.2026.01.14.16.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 16:20:53 -0800 (PST)
Message-ID: <763b6cdd-514c-4aff-b7db-8c0a17fdb645@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:20:52 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
 <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
 <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAwMCBTYWx0ZWRfX4Jm3BLa6MqpQ
 R/V1LE0MjtJhPTk/t9KNpVPF81IvAz0YrAsWaS1dTpyVLAQkSAyVs+x5ka6W0M9I12FdOkz0w9a
 1ykkPAaJBZNOJd/6c5TQM9Ysst/l43U0f1F17q+0Bzh1O0Hlt1JSu5qxGcvO158y16sdqT/hSc6
 4FPiCae9dfD+dvSDFebilzVGsS1dd0H1GG69uGIU+uAVw7+G3E4KqGkOJoK3oQkzpMmwgx/53pn
 fS3eZ8oTO/s3HHda83l+2DyRrq8BAFDkcdNOpoYQAKUOFw0B1EJgJwREpv+rJ6Z9Vh6UacP22Ro
 lN5u0syM7gfrKxNQxE02SjMTUcxSjJBtu9099nB97wQq15SKNsZx/lXk3NIsfeLgNLuqC0QPmw9
 C2+hv3zYUigNVAQz/IBa3prkXcZVHKfkLq/M/ct77Y4348um3OzX9YhG7cz38QljgVrN1c45Uxt
 dcAKndTsQf4VqlG/EWQ==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=696832e7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nO6hRiE8Sj2kV28_dfAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: kPP6EgtR2mDiOkiOnlSG0ozTnE0pbnR5
X-Proofpoint-ORIG-GUID: kPP6EgtR2mDiOkiOnlSG0ozTnE0pbnR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_07,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150000


On 1/14/2026 8:14 AM, Nicolas Dufresne wrote:
> Hi,
>
> Le mardi 13 janvier 2026 à 12:33 -0800, Deepa Guthyappa Madivalara a écrit :
>> Add compound control, V4L2_CID_MPEG_VIDEO_ENC_ROI, for
>> video encoder Region of Interest to allow applications to specify
>> different quality levels for specific regions in video frames. Define
>> struct v4l2_ctrl_enc_roi_params to hold up to 10 rectangular ROI,
>> regions and their corresponding delta_qp value (v4l2_roi_param)
>> that adjust quantization relative to the frame's base value.
>>
>> This enables use cases like prioritizing quality for faces in video
>> conferencing or important objects in surveillance footage while reducing
>> bitrate for less critical areas.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/ext-ctrls-codec.rst         |  7 +++++++
>>   include/media/v4l2-ctrls.h                              |  1 +
>>   include/uapi/linux/v4l2-controls.h                      |  1 +
>>   include/uapi/linux/videodev2.h                          | 17 +++++++++++++++++
>>   4 files changed, 26 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index c8890cb5e00ac05649e6c344c2a6b938b2ec1b24..0eecb46bb356c01411dfc313b92376593bcd86f6 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1668,6 +1668,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW custom range.
>>       Applicable to encoders
>>   
>> +``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
>> +    Defines the control id to configure specific delta QP for one or more
>> +    rectangular regions of interest. The struct v4l2_ctrl_enc_roi_params
>> +    is defined to hold up to 10 v4l2_rect regions and their corresponding
>> +    delta_qp with a range of -31 to 30.
>> +    Applicable to encoders
> Any justification for this range ? Also, I believe I've seen hardware support
> both delta and absolute values. Since it meant to be generic, some research is
> needed. If we delibaritly ignore absolute, perhaps the CID should be named
> accordingly ? Something like V4L2_CID_MPEG_VIDEO_ENC__DELTAQP_ROI ?

As per Android ROI API - MediaCodec API QP from the app is an offset QP,
meaning userspace will received offset Qp and it converts it to deltaQp
before passing onto the driver in Android HAL. I have used the same idea.
Delta MbQP = frame QP + Offset Qp. This is clamped to -31 to 30 currently
and set to driver as delta QP, hence I have it as -31 to 30.

Absolute values are mostly for frame QP, I would say. All the 
information out there for ROI
kind of implies to deltaQP, but we could be more precise as well.
Let me know if it is a must to change to CID.

>> +
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 31fc1bee3797bfe532931889188c8f7a9dedad39..c44fad7f51db45a437dd3287aa16830585ac42f3 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -91,6 +91,7 @@ union v4l2_ctrl_ptr {
>>   	struct v4l2_ctrl_av1_frame *p_av1_frame;
>>   	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
>>   	struct v4l2_rect *p_rect;
>> +	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
>>   	void *p;
>>   	const void *p_const;
>>   };
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..5f2621365593ee19a7792fb25ea29acf6a7860f1 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -918,6 +918,7 @@ enum v4l2_mpeg_video_av1_level {
>>   };
>>   
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ENC_ROI  (V4L2_CID_CODEC_BASE + 658)
>>   
>>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index add08188f06890182a5c399a223c1ab0a546cae1..18a5ae34842721c2647a7a76365e4d299d2b8a44 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1909,6 +1909,7 @@ struct v4l2_ext_control {
>>   		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
>>   		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
>>   		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_mastering_display;
>> +		struct v4l2_ctrl_enc_roi_params __user *p_enc_roi_params;
>>   		void __user *ptr;
>>   	} __attribute__ ((packed));
>>   } __attribute__ ((packed));
>> @@ -1990,6 +1991,8 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>>   	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>>   	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
>> +
>> +	V4L2_CTRL_TYPE_ENC_ROI_PARAMS	    = 0x284,
>>   };
>>   
>>   /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
>> @@ -2540,6 +2543,20 @@ struct v4l2_streamparm {
>>   	} parm;
>>   };
>>   
>> +/* Roi format
>> + */
>> +#define VIDEO_MAX_ROI_REGIONS         10
> Let's not hardcode hardware spececific constraints in the API. We have dynamic
> arrays now in compount controls, and you can define the maximum dimension and
> all.
>
>
>> +
>> +struct v4l2_roi_param {
>> +	struct v4l2_rect roi_rect;
>> +	__s32 delta_qp;
>> +};
>> +
>> +struct v4l2_ctrl_enc_roi_params {
>> +	__u32 num_roi_regions;
> With the dynamic arrays, this will not be needed.
>
> cheers,
> Nicolas
>
>> +	struct v4l2_roi_param roi_params[VIDEO_MAX_ROI_REGIONS];
>> +};
>> +
>>   /*
>>    *	E V E N T S
>>    */

