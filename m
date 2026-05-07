Return-Path: <linux-media+bounces-60795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BujLHyN/GlhRQAAu9opvQ
	(envelope-from <linux-media+bounces-60795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:02:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2004E8B5F
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CD3D3001303
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BD23F23D6;
	Thu,  7 May 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMj3EvfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqD2jeHo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38509388E49
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158958; cv=none; b=js/GM/kSR4H4A3UH+WlX3nLouioMRi/IVWvWpvHWl60jwIwpIrjYXtADHFL5CjZxEtOaze7tpInwEVhgQhOfq47wHkU9mnx24aOrI9m8Bzi00GcEOvMF9XTw3UCwZFgRFyVE2aNnaU7TWDHT3+OHbMP0N2PxWg+9K/WGIrM+5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158958; c=relaxed/simple;
	bh=iknozmoubaPS9C3vQAAE5ouFTDJlZ0w6sUrgtlDSroA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkuJbkH6fTFl3i3VEqd+rSGMUM0iHNjI/d6UD8addyzWosZqmPqoH/DZsnoQO1xLjgtqJuY/rv7n2qGIuRyWNjRDkTSXUWqNGzcVZ+BipSfv0wVerM5/2P8Tz2QT3f+ELXhKh2xlLRSInu3D4nJRMWjHOpYygDQd1fjWtcmwThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMj3EvfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqD2jeHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BxgsY2734309
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq2JmSgVDwZCvKi3BDJ1/mS9IIBauiDG8gvNRwztHfM=; b=jMj3EvfNTZdIlV3T
	D2Xxt1c12lct//P0Or7TSZo4/vMUGOPIYBHakbDc4iNk5b+d92wwtZDL4A34vCOn
	PMk5atneueXFYiXVGW7c3uPAnrhRwxmpGz1oFISu3v7FHsHf91zUt4/odKkXnzJ6
	c3YIq7HRwPExqe9o1vOSb9Qq4gc7H5vXgPEuR4A0TvBCiudzPRfUqnqykKe8qhGK
	fdh+Y5halw5AReS7TNMWOCpQdcd37M5dY5PGyk0QsypHU/mCqfzXvyx4E4RGCC1C
	WKHxOLjob78KBsCAY28tb9ZLtOH/gTaWLbR8fRdSh1jI4iEWRZew4JC2yxidu2Vh
	aoihQQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr6u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:02:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366122e01fcso682216a91.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778158954; x=1778763754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fq2JmSgVDwZCvKi3BDJ1/mS9IIBauiDG8gvNRwztHfM=;
        b=iqD2jeHoREdqVtbhnzy6yP/qo+J/27k8vFFLm9bj/WVgwXneQ7wym0GgF49mokTlEx
         XJ7+vgNqybYk5TXj/ybo9QgzsHZ6kN+FzQseGdj2zBiGpzsGAOikopzd0vY+t4Ve2n13
         keEatKbsgrOC+NgnwOI2M7S813491g2GOmkoz9c3J/l5/9/3xJ1x7jpA15GRr/YRN6ZL
         bOCNz9eTL1b7PiAAwvl0s1PhI8QRQLBLB/PBahyOxGdke/pertSCl70oQx7BbkMfn6/Y
         TAdJNG0kTgDP1Myx4bgP+geLs8k2Uj+rm1sGkiRVA9wa3UEREIihKaYdmiqHOjva0z+I
         YBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158955; x=1778763755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq2JmSgVDwZCvKi3BDJ1/mS9IIBauiDG8gvNRwztHfM=;
        b=QEnYkUA1jpRz7uuknfm5bjjGBp2sWYG2cl79feJH0wsP9WQSgB9U0RIJPLdYZ43Xj8
         T6/LrpSkw6ZWPIyDCWoQwbvzHlBvKUvkR23nD3P6Gz8KjoUxF2QEDxRGceKh3nW/ET71
         dbFOQO6xuWXo1CAXeX0gzz9abie3Mv9M40XZl9oJ4ki/vfLYWB+ZhKIfQLLO+sOzZPx8
         KK7SAL60bbDZaJoS/BcciEcKFfVhuBpvAPXOMSwgM13qudkFkzpAUp7Pf8AlS8VqDOnY
         qurPU6Sx4V3mbKg6Tmal136DXrXQU/gu1/vWs0Orf3eK5kK0JFPT0NbKFdByoyuv6E4A
         OBaA==
X-Gm-Message-State: AOJu0YxvHpmD4NnlujQM1w99ryL1HAwKhzSAwZPneRW2PJ1IEXQjwGGW
	h5lTsRKlaLXPFEuit1nNHuHYF+gM4hIQ3XIMozjGJo23tcssTAoITRjOojybp+UA4PZ61UQghhR
	vgkC8woOR/YZgql668lg7A2ZqNn1WakvAULb1R8nFz18Y8Mz3lCrOFgqPcChOCVJEqw==
X-Gm-Gg: AeBDievWp7OjHlTA7A/9m4FGTMaOwyvpbhz6MMa6jr/3dX9SUVsR/WWvmb2QchlPOiR
	V9Il2ovtfaYMMfUJzSaEmnQ0ou9uvgK0i3TxWB110pVkb4z8QYfmjozekb2oFBSfO1PplPz4iwI
	zczY6uNucTAohBuHNbi7unPNvKdMEwQBVSoMXQ/mOqiOsZK/Iw5AvNzj+hlz3OFnM9+pDFav7sp
	NjoUGhAmHeStp0tgt076kAtPCEeRMpNHg4DtC6XhE+n2I7YFmNTfhPIig0OJZMokyTcIKH/Col6
	54ADz3NfmqGLdeKRGoDPOxuxzA4MZviJ1pYh/s6BHpb0AjV7jkCm9ML2LobCcWIfQGrn50D+Lzq
	IW8hWP9U5J7Mm/P0uNUYC9fmFlgpSyzNjJtF1zDoGoUBZwRc1eNt/n43yF6wPB39FTX8=
X-Received: by 2002:a17:90a:16c9:b0:365:df5d:ed71 with SMTP id 98e67ed59e1d1-365df5dee43mr3279068a91.27.1778158951845;
        Thu, 07 May 2026 06:02:31 -0700 (PDT)
X-Received: by 2002:a17:90a:16c9:b0:365:df5d:ed71 with SMTP id 98e67ed59e1d1-365df5dee43mr3278495a91.27.1778158942012;
        Thu, 07 May 2026 06:02:22 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3660a9895aesm2438084a91.14.2026.05.07.06.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:02:21 -0700 (PDT)
Message-ID: <45eb6961-3d47-4e73-90e9-394a533c6626@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:32:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8XyeEptf2wO2pTXe5rBAcntleC08dmCJ
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8d6b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iO13-Fdh5waaXsiW9E8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8XyeEptf2wO2pTXe5rBAcntleC08dmCJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX0wQPOe3k0l51
 sEJTp1U+s21maFqnSVmRmNAQH5NOiVBd05rV6P+nBtSe1KL+Acr8+vf4lk6nClZveyo8EJIv5N+
 DVt87/XuTgEGPo1EhHpZnarDE0dFYwOycm9kJvraUE1vv49pUkMFgQIYKgM/E6+6Xc/8Ki6/G9G
 zyNWHlP5vGO9GFcxe9wwb+U4T6Z0ua8comkuelUwzN+oOkO8kikW/obVpsnsA2b1hedMu4w5nwb
 /PJ/GjB9O+XKg0pKdkfDOD8ekKs9q0oFrXt7Ktqh1Pjq7ZIuZYLVwasQHpRfoqzKTgWMWxB31G9
 pJOeusv7I6+sYj258GKVDiXtWuWMkuuDBgoW85nj5yR9oJN26VWjD7muDpNXWr+OKYQ0GPr6jIl
 86qyuK9PAnT2tvFkms/TOhFmGRFo9my0MTZ6C7b8MF5/X7K5wEMj/LW62xd/wDuozWzQvcN5eK7
 eG1+OHWqoG7/kNTRccw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 9E2004E8B5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60795-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[20260329-iris-platform-data-v11-0-eea672b03a95.oss.qualcomm.com:query timed out,dikshita.agarwal.oss.qualcomm.com:query timed out,dmitry.baryshkov.oss.qualcomm.com:query timed out,20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585.oss.qualcomm.com:query timed out,20260507-iris-ubwc-v5-0-e9a3aee53c49.oss.qualcomm.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
> 
> v4l2-compliance results:
> 
> v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
> v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:5a00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 43 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK67609.731994] use of bytesused == 0 is deprecated and will be removed in the future,
> [67609.741833] use the actual size instead.
> m (Not Supported)
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, REQBUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (select, CREATE_BUFS): OK
>          Video Capture Multiplanar: Captured 61 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
> v4l2-compliance 1.33.0-5421, 64 bits, 64-bit time_t
> v4l2-compliance SHA: af4a91dea9a2 2025-10-29 10:33:25
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Decoder
>          Bus info         : platform:5a00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Decoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK (Not Supported)
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK (Not Supported)
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 465 buffers
>          test MMAP (select, REQBUFS): OK
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 465 buffers
>          test MMAP (epoll, REQBUFS): OK
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 465 buffers
>          test MMAP (select, CREATE_BUFS): OK
> the input file is smaller than 7077888 bytes
>          Video Capture Multiplanar: Captured 465 buffers
>          test MMAP (epoll, CREATE_BUFS): OK
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Fluster results for HFI Gen2 firmware:
> 
> ./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135

Thank you for listing out the failure ones, it makes it easier to review 
the failing ones.

> The failing test case:
> - Unsupported profile: H.264 Extended profile is deprecated.
>          - BA3_SVA_C
> - Interlaced content is not supported yet.
>          - CABREF3_Sand_D
>          - CAFI1_SVA_C
>          - CAMA1_Sony_C
>          - CAMA1_TOSHIBA_B
>          - CAMA3_Sand_E
>          - CAMACI3_Sony_C
>          - CAMANL1_TOSHIBA_B
>          - CAMANL2_TOSHIBA_B
>          - CAMANL3_Sand_E
>          - CAMASL3_Sony_B
>          - CAMP_MOT_MBAFF_L30
>          - CAMP_MOT_MBAFF_L31
>          - CANLMA2_Sony_C
>          - CANLMA3_Sony_C
>          - CAPA1_TOSHIBA_B
>          - CAPAMA3_Sand_F
>          - CVCANLMA2_Sony_C
>          - CVFI1_SVA_C
>          - CVFI1_Sony_D
>          - CVFI2_SVA_C
>          - CVFI2_Sony_H
>          - CVMA1_Sony_D
>          - CVMA1_TOSHIBA_B
>          - CVMANL1_TOSHIBA_B
>          - CVMANL2_TOSHIBA_B
>          - CVMAPAQP3_Sony_E
>          - CVMAQP2_Sony_G
>          - CVMAQP3_Sony_D
>          - CVMP_MOT_FLD_L30_B
>          - CVMP_MOT_FRM_L31
>          - CVNLFI1_Sony_C
>          - CVNLFI2_Sony_H
>          - CVPA1_TOSHIBA_B
>          - FI1_Sony_E
>          - MR6_BT_B
>          - MR7_BT_B
>          - MR8_BT_B
>          - MR9_BT_B
>          - Sharp_MP_Field_1_B
>          - Sharp_MP_Field_2_B
>          - Sharp_MP_Field_3_B
>          - Sharp_MP_PAFF_1r2
>          - Sharp_MP_PAFF_2r
>          - cabac_mot_fld0_full
>          - cabac_mot_mbaff0_full
>          - cabac_mot_picaff0_full
>          - cama1_vtc_c
>          - cama2_vtc_b
>          - cama3_vtc_b
>          - cavlc_mot_fld0_full_B
>          - cavlc_mot_mbaff0_full_B
>          - cavlc_mot_picaff0_full_B
> - Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
>          - FM1_BT_B
>          - FM1_FT_E
>          - FM2_SVA_C
> - Unsupported bitstream: SP slice type is not supported by hardware.
>          - SP1_BT_A
>          - sp2_bt_b
> 
> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 113/147
> The failing test case:
> - Unsupported level
>          - AMP_D_Hisilicon_3
>          - AMP_E_Hisilicon_3
>          - AMP_F_Hisilicon_3
>          - DELTAQP_A_BRCM_4
>          - IPRED_A_docomo_2
>          - IPRED_C_Mitsubishi_3
>          - LS_A_Orange_2
>          - LS_B_Orange_4
>          - PPS_A_qualcomm_7
>          - RAP_B_Bossen_2
>          - RPS_F_docomo_2
>          - SAO_G_Canon_3
>          - SDH_A_Orange_4
> - 10bit content not supported yet
>          - DBLK_A_MAIN10_VIXS_4
>          - INITQP_B_Main10_Sony_1
>          - TSUNEQBD_A_MAIN10_Technicolor_2
>          -  WPP_A_ericsson_MAIN10_2
>          -  WPP_B_ericsson_MAIN10_2
>          - WPP_C_ericsson_MAIN10_2
>          - WPP_D_ericsson_MAIN10_2
>          - WPP_E_ericsson_MAIN10_2
>          - WPP_F_ericsson_MAIN10_2
>          - WP_A_MAIN10_Toshiba_3
>          - WP_MAIN10_B_Toshiba_3
> - Unsupported resolution
>          - AMP_A_Samsung_7 - resolution is higher than max supported
>          - AMP_B_Samsung_7 - resolution is higher than max supported
>          - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>          - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>          - PICSIZE_C_Bossen_1 - resolution is higher than max supported
>          - PICSIZE_D_Bossen_1 - resolution is higher than max supported
>          - TUSIZE_A_Samsung_1 - resolution is higher than max supported
>          - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
> - CRC mismatch
>          - RAP_A_docomo_6
> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>          - VPSSPSPPS_A_MainConcept_1
> 
> ./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
> The failing test case:
> - Unsupported resolution
>          - vp90-2-02-size-08x08.webm
>          - vp90-2-02-size-08x10.webm
>          - vp90-2-02-size-08x16.webm
>          - vp90-2-02-size-08x18.webm
>          - vp90-2-02-size-08x32.webm
>          - vp90-2-02-size-08x34.webm
>          - vp90-2-02-size-08x64.webm
>          - vp90-2-02-size-08x66.webm
>          - vp90-2-02-size-10x08.webm
>          - vp90-2-02-size-10x10.webm
>          - vp90-2-02-size-10x16.webm
>          - vp90-2-02-size-10x18.webm
>          - vp90-2-02-size-10x32.webm
>          - vp90-2-02-size-10x34.webm
>          - vp90-2-02-size-10x64.webm
>          - vp90-2-02-size-10x66.webm
>          - vp90-2-02-size-16x08.webm
>          - vp90-2-02-size-16x10.webm
>          - vp90-2-02-size-16x16.webm
>          - vp90-2-02-size-16x18.webm
>          - vp90-2-02-size-16x32.webm
>          - vp90-2-02-size-16x34.webm
>          - vp90-2-02-size-16x64.webm
>          - vp90-2-02-size-16x66.webm
>          - vp90-2-02-size-18x08.webm
>          - vp90-2-02-size-18x10.webm
>          - vp90-2-02-size-18x16.webm
>          - vp90-2-02-size-18x18.webm
>          - vp90-2-02-size-18x32.webm
>          - vp90-2-02-size-18x34.webm
>          - vp90-2-02-size-18x64.webm
>          - vp90-2-02-size-18x66.webm
>          - vp90-2-02-size-32x08.webm
>          - vp90-2-02-size-32x10.webm
>          - vp90-2-02-size-32x16.webm
>          - vp90-2-02-size-32x18.webm
>          - vp90-2-02-size-32x32.webm
>          - vp90-2-02-size-32x34.webm
>          - vp90-2-02-size-32x64.webm
>          - vp90-2-02-size-32x66.webm
>          - vp90-2-02-size-34x08.webm
>          - vp90-2-02-size-34x10.webm
>          - vp90-2-02-size-34x16.webm
>          - vp90-2-02-size-34x18.webm
>          - vp90-2-02-size-34x32.webm
>          - vp90-2-02-size-34x34.webm
>          - vp90-2-02-size-34x64.webm
>          - vp90-2-02-size-34x66.webm
>          - vp90-2-02-size-64x08.webm
>          - vp90-2-02-size-64x10.webm
>          - vp90-2-02-size-64x16.webm
>          - vp90-2-02-size-64x18.webm
>          - vp90-2-02-size-64x32.webm
>          - vp90-2-02-size-64x34.webm
>          - vp90-2-02-size-64x64.webm
>          - vp90-2-02-size-64x66.webm
>          - vp90-2-02-size-66x08.webm
>          - vp90-2-02-size-66x10.webm
>          - vp90-2-02-size-66x16.webm
>          - vp90-2-02-size-66x18.webm
>          - vp90-2-02-size-66x32.webm
>          - vp90-2-02-size-66x34.webm
>          - vp90-2-02-size-66x64.webm
>          - vp90-2-02-size-66x66.webm
>          - vp90-2-08-tile_1x8.webm - resolution is higher than max supported
>          - vp90-2-08-tile_1x8_frame_parallel.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-1-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-2-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-4-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-8-1.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-8-2.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm - resolution is higher than max supported
>          - vp90-2-14-resize-10frames-fp-tiles-8-4.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-1-16.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-1-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-16-1.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-16-2.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-16-4.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-16-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-2-16.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-2-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-4-16.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-4-8.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-8-1.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-8-16.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-8-2.webm - resolution is higher than max supported
>          - vp90-2-14-resize-fp-tiles-8-4.webm - resolution is higher than max supported
> - Unsupported format
>          - vp91-2-04-yuv422.webm
>          - vp91-2-04-yuv444.webm
> - CRC mismatch
>          - vp90-2-22-svc_1280x720_3.ivf
> - Unsupported resolution after sequence change
>          - vp90-2-18-resize.ivf
>          - vp90-2-21-resize_inter_320x180_5_1-2.webm
>          - vp90-2-21-resize_inter_320x180_7_1-2.webm
>          - vp90-2-21-resize_inter_320x240_5_1-2.webm
>          - p90-2-21-resize_inter_320x240_7_1-2.webm
> - Unsupported stream
>          - vp90-2-16-intra-only.webm
> 
> Fluster results for HFI Gen1 firmware:
> 
> Tests failing with the Venus driver, but passing with the Iris:
> - H.264: BA3_SVA_C
> 
> - H.265: ipcm_A_NEC_3, ipcm_B_NEC_3, ipcm_C_NEC_3, ipcm_D_NEC_3,
>    ipcm_E_NEC_2, IPRED_B_Nokia_3, VPSSPSPPS_A_MainConcept_1
> 
> - VP9: vp90-2-14-resize-10frames-fp-tiles-1-2.webm,
>    vp90-2-14-resize-10frames-fp-tiles-2-1.webm,
>    vp90-2-14-resize-fp-tiles-1-2.webm,
>    vp90-2-14-resize-fp-tiles-2-1.webm,
>    vp90-2-14-resize-fp-tiles-4-1.webm,
>    vp90-2-14-resize-fp-tiles-4-2.webm,
>    vp90-2-15-segkey.webm
> 

Looks promising

> Tests failing with the Iris driver, but passing with the Venus (due to
> interlaced H.264 being not supported yet):
> 
> - H.264: cabac_mot_fld0_full, cabac_mot_mbaff0_full,
>    cabac_mot_picaff0_full, CABREF3_Sand_D, CAFI1_SVA_C, CAMA1_Sony_C,
>    CAMA1_TOSHIBA_B, cama1_vtc_c, cama2_vtc_b, CAMA3_Sand_E, cama3_vtc_b,
>    CAMACI3_Sony_C, CAMANL1_TOSHIBA_B, CAMANL2_TOSHIBA_B, CAMANL3_Sand_E,
>    CAMASL3_Sony_B, CAMP_MOT_MBAFF_L30, CAMP_MOT_MBAFF_L31,
>    CANLMA2_Sony_C, CANLMA3_Sony_C, CAPA1_TOSHIBA_B, CAPAMA3_Sand_F,
>    cavlc_mot_fld0_full_B, cavlc_mot_mbaff0_full_B,
>    cavlc_mot_picaff0_full_B, CVCANLMA2_Sony_C, CVFI1_Sony_D, CVFI1_SVA_C,
>    CVFI2_Sony_H, CVFI2_SVA_C, CVMA1_Sony_D, CVMA1_TOSHIBA_B,
>    CVMANL1_TOSHIBA_B, CVMANL2_TOSHIBA_B, CVMAPAQP3_Sony_E,
>    CVMAQP2_Sony_G, CVMAQP3_Sony_D, CVMP_MOT_FLD_L30_B,
>    CVMP_MOT_FRM_L31_B, CVNLFI1_Sony_C, CVNLFI2_Sony_H, CVPA1_TOSHIBA_B,
>    FI1_Sony_E, MR9_BT_B, Sharp_MP_Field_1_B, Sharp_MP_Field_2_B,
>    Sharp_MP_Field_3_B, Sharp_MP_PAFF_1r2, Sharp_MP_PAFF_2r
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dikshita Agarwal (11):
>        media: iris: Skip UBWC configuration when not supported
>        media: iris: Filter UBWC raw formats based on hardware capabilities
>        media: iris: Introduce set_preset_register as a vpu_op
>        media: iris: Introduce interrupt_init as a vpu_op
>        media: iris: add vpu op hook to disable ARP buffer
>        media: iris: Add platform data field for watchdog interrupt mask
>        media: iris: Add platform flag for instantaneous bandwidth voting
>        media: iris: Add framework support for AR50_LITE video core
>        media: iris: Introduce buffer size calculations for AR50LT
>        media: iris: add Gen2 firmware support on the Agatti platform
>        arm64: dts: qcom: agatti: add higher OPP levels
> 
> Dmitry Baryshkov (5):
>        media: iris: skip PIPE if it is not supported by the platform
>        media: iris: add minimal GET_PROPERTY implementation
>        media: iris: update buffer requirements based on received info
>        media: iris: implement support for the Agatti platform
>        media: venus: skip QCM2290 if Iris driver is enabled
> 
>   arch/arm64/boot/dts/qcom/agatti.dtsi               |  10 +
>   drivers/media/platform/qcom/iris/Makefile          |   2 +
>   drivers/media/platform/qcom/iris/iris_core.c       |   4 +
>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   3 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 ++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  15 +
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  78 +++
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   3 +
>   .../platform/qcom/iris/iris_platform_common.h      |  11 +
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |   6 +
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 118 ++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_resources.c  |   2 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       |   9 +
>   drivers/media/platform/qcom/iris/iris_venc.c       |   9 +
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |   6 +
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      |   2 +
>   drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 414 ++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  38 ++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  17 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
>   .../platform/qcom/iris/iris_vpu_register_defines.h |   1 -
>   drivers/media/platform/qcom/venus/core.c           |   4 +-
>   30 files changed, 1786 insertions(+), 9 deletions(-)
> ---
> base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
> change-id: 20260507-iris-ar50lt-06228469aa5b
> prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com
> prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
> prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
> prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
> prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
> prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
> prerequisite-message-id: 20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com
> prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
> prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
> prerequisite-message-id: 20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com
> prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
> prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
> prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
> prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
> prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
> prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
> prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
> prerequisite-message-id: 20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com
> prerequisite-patch-id: 34d473ba50399f8cfaf583f4def12de776aad65d
> prerequisite-patch-id: 5a6a2b41c9312687512db5d12bac95114b8d8719
> prerequisite-patch-id: e6ec4cd9eb5e93f3443f5f496a1b990a95b5d96d
> prerequisite-patch-id: 4be4bbb454444d6f314c2b6ad6a73290184e6d57
> prerequisite-patch-id: fd9cd7882f2a8f1b6141f48ff5c3da708839d03f
> prerequisite-patch-id: 952471fa5477280d399978c05fbc9bfe6d2d33b0
> prerequisite-patch-id: 01c5b37358de833f85de1954f770fe0489818a16
> prerequisite-patch-id: dd14b47d6cd8ff14d1bc78c187c061f6fe262fda
> prerequisite-patch-id: f4eba0865e7f91bce3fb4b2c627ee123980e0ff9
> prerequisite-patch-id: 72984784b916e2d94ede8ab7d52cc0dedfa37c41
> prerequisite-patch-id: 2fabf4e36b4e4f74b27fe75133ab8ba0ec9b6e3d
> prerequisite-message-id: 20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com
> prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4
> prerequisite-change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb:v4
> prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
> prerequisite-patch-id: 38d706b45998b7b5fbf90e27ecf9c856354f5a23
> prerequisite-patch-id: 16ea0271e2c2c708c1ad1ba3490f4b05fc04173d
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 


