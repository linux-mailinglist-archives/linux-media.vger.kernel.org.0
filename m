Return-Path: <linux-media+bounces-49629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C15CE60B2
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E477D30084CC
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84E73A1E8A;
	Mon, 29 Dec 2025 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leLAM9Li";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZqtPVtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BA02288F7
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990333; cv=none; b=FUboNRwg861i6o77UXHqOzlx90NgE9qlKwDq+LFj8qyEHei5HXzho70C960DDHHexVHmlx0VZdBricw0yKN+GCTNMcKnkMysaZ5iwtZ6dGf4TtXCzMJRXaPcB6/EtMoivjpoQRviJUzdsy7xSFPEJlTCCpcz+uqrw73iQdZqVvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990333; c=relaxed/simple;
	bh=vDDiDmxRbvYhAZNxBBOVZ1KAry0fb8x4OIAmMpKWfPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtfYh3OwJNZyoC2IWus11s+aV1utmTl6o1GFQ7/hEG5SpMtIUqzsF/uklFDgAtpolHYBuWzHVtT5ZTE+AtSv9secMDeMQusSmw1nEv4PRJnjDxy5ESZY0zNehMHKWzef/8MpOkqKmNSkF0Ake9v2ofIPZEhopUebx2lmjnWp99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leLAM9Li; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZqtPVtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMCYAo4160832
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv7uyMDZzORjDkCVkl/WQ7lhTJd+s1/tbpQmRrALYXI=; b=leLAM9LicLgUC0CH
	PMILVlpqHvvBPPyzaGfeDpyj3JUyKxyTwMC+jfa8fwNWu3t20+Hn6sJOWiCF6sl4
	vSlElHyAkQZa+o1wApsn92shqSPQmVX19oI3zxB/Zk/wOIyIwTh3WB3FdbT+UteX
	4rvEQh4jhslvk+GnBr2n1gwhzew7b+F/noWuINFghbdws+STWq7+dyAV/6OrkJ3o
	NPGRouvp8Xxl5fL4upGio1zzT/ClIgXrQWKNFF2LTCXmIkdry90eKa59vnyCRrGl
	BiGqEommGpCITbXErzmqFqxs/LTPC3btn2i/5gGdwUeNd8oRHKCO5eZALrXXemy6
	EGnoYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wujnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:38:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so16897479b3a.3
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766990329; x=1767595129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jv7uyMDZzORjDkCVkl/WQ7lhTJd+s1/tbpQmRrALYXI=;
        b=WZqtPVtDUUCBTZSFV3hCFJ7PzXs8V1iekSTSF6nvTXlOV3PNRFjKN6HTnD8pYvvcpt
         cBJ0fpTZ9C8lK/lHmAhQUFQrfvBaKYyMNB+3kfjlSA4jnp7IS8xyBZGbOTNmwykznNd4
         1UaJA89qrjn5YYlnz+tWpeHh7Y6Kh6Kvd3/cqOJHoF5DU7roDeWh6/9KEzvrm/f5gisS
         shaaMTXDjKVNgfWrm5uydFCgINZ4OMjD8rw/BBIc2nzRdRh4IbUIfs/vm8p4JyORb2m9
         CPpD7GwImHxaPB1l1mNw3KCwRq/cvIaYwbo1isqzmv9jzUp2P5ucajowp2SBysXr65Mm
         4ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766990329; x=1767595129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv7uyMDZzORjDkCVkl/WQ7lhTJd+s1/tbpQmRrALYXI=;
        b=JGsd1MXoKS3O38s51fIk0moRufiUeiSUlZ/AVwOCrt9q6BZ3cIQMgySY6KMWuvczL/
         0oZDmFNsXCTvme/ySQ7bxm2k8/ITzw0th1ao7jJ8s+xtBemToz7mQHVHH+uKuGukTviQ
         ezgUU97cRHCOWb+pE2TLF0FgF1002aaZycRPfrkrrqu0LmFTYvyqVOvKiZUyHiMr+I5d
         81Ab6zbJHVo01/8UJJ2bT3lqYJCapNWgj1M3H9N0udQS9RHwxkYiuvBtky23MEP0ff1V
         iuzuu9Z+8mlZ185T0S3K1ddr9QKzgjZi9K08I6YTciVTweBH8vXPrPAXy7s9mx6+jbFp
         i/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWhd8wl5IUCsnNKneCUQwpoze6yyPV/6qrWJm+S4t8me2j2g6K18/1Yor7PS0jtbNy2CzPJaiP9a8FDgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytD+YwDjUAgZ7E/FLWvsWcoQUF++xVFw1U9fqTlo34cuv3pNzi
	DhBNqgZevsoOyG0rx1vNQEjuQBTc8IDqt+bxUeT5Zh0+A0lUmNsVqPrWFL5gYzucSJwYiTuXrbH
	v2PijzRoaNUn94fZtyrQT2BDei2BAKLxY87F4oGPSBlOhV1XTs2ukcoz0lx5H8hHZKA==
X-Gm-Gg: AY/fxX6ERz/12wSo/s85rEdttdUWQJ62OvgJ/U69Wl/+U9LSI97KhlR8/y+GTPCMA3D
	VTxO4dH0cFECV/M+vxUCFVJze92OoX5NibZzuZuiNs2SbA13H2nSWnXYiFz+dHw/NvntGqTWSNz
	yfg2PsZpPIS4Kng211ZnBPVyLslNm6iDbWvZMccrt7HbefYyMOw8t354k7XZBAr03quOXOAp1hD
	qI5nCZPow/1j9T+IlMva7BQXpSN71b0n8UO8FZ0dIza/7ySIL3n8xDEv+pqR7i7eJ1pmH7ip5B8
	hhNNSY1tnbTDJz8u3OSmVMcN+9WEG+MNHReJw3esgs2LkT4nmDyLHZsFRhJKNV1B4sKJgZwTz8w
	vW+poDKOvWzWD/feFVZKn0bv/lhMmCz75YOvvFgU04g==
X-Received: by 2002:a05:6a20:7488:b0:366:1a31:a70a with SMTP id adf61e73a8af0-376a88c7406mr27107045637.10.1766990328898;
        Sun, 28 Dec 2025 22:38:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmEGj2+F3jqj3Q0oymWU6NFJL6UfDpWn5d/J7vK7cEpQOy11Da5rVt+NR5bsJ+wQzGnjq5sA==
X-Received: by 2002:a05:6a20:7488:b0:366:1a31:a70a with SMTP id adf61e73a8af0-376a88c7406mr27107028637.10.1766990328385;
        Sun, 28 Dec 2025 22:38:48 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm28289420b3a.64.2025.12.28.22.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 22:38:48 -0800 (PST)
Message-ID: <fef64cb8-06a7-580a-7d91-04013ed1c5dd@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1OCBTYWx0ZWRfX8CUdxWFlkbsT
 qFAdH4SUDXyLO4yHotj5ps0o4b5vQqBcMvPRzAORbGSuV0DT7QYf/U7xw57/RV/h2rvLXPnsuG0
 4KdpoxBXZZd9Dz0VzjHdl1HhfSLgk7Uh+GzoTJ9dBvBdc3vN6sRp5ZINLJPk8vxXuUCxE9/GVvD
 Ouhcqyfj+QciID6xLx4NhK2iHAYv8zrUhW3siBrPIavAdWso3IoH+X/3HU1xRbx1vnIshavy+Mi
 r8M9BFCXUfzEw48Ew2Ds73GQWLgaEQbrqpLpN2713w8IN+6oLV1OVw7T8D63q+7XD4uNrDOJHaf
 M018sgIcM8KQYOxT8Rbt7j8JxLWTjk5GEz2x9BUQVX3NLvVnhxLPyOErmMurVWVi6Up3CGocnVU
 mXh7LkgjLgMk5ULfKKPy+OHKuAr1bnYNU//DptZ0a/xr9UZP7vI5MC0plHI4TpN57NZL8lNTMws
 nErIWFW9Zdt/L32ru2g==
X-Proofpoint-ORIG-GUID: LTxgJARUVzvWVfIhoQDkQXWIaez0PxOF
X-Proofpoint-GUID: LTxgJARUVzvWVfIhoQDkQXWIaez0PxOF
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=695221fa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dbtYoQ3qVXiIkkONYLQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290058



On 12/19/2025 1:12 PM, Wangao Wang wrote:
> Hi All,
> 
> This patch series introduces several enhancements to the Qualcomm Iris
> encoder driver, improving support for V4L2 controls and enabling more
>  video encoding features.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on 
> gen1:QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.

Pls test it with SM8250 as well since you are updating the corresponding
platform file.

> 
> Commands used for V4l2-ctl validation:
> 
> Intra Refresh:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h264 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_cyclic.h264 \
> --set-ctrl intra_refresh_period_type=1,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_random.h265 \
> --set-ctrl intra_refresh_period_type=0,intra_refresh_period=30
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ir_cyclic.h265 \
> --set-ctrl intra_refresh_period_type=1,intra_refresh_period=30
> 
> B frames:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/b_frames.h264 \
> --set-ctrl video_b_frames=1
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/b_frames.h265 \
> --set-ctrl video_b_frames=1
> 
> LTR:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ltr.h264 \
> --set-ctrl ltr_count=2,frame_ltr_index=1
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/ltr.h265 \
> --set-ctrl ltr_count=2,frame_ltr_index=1
> 
> Hierarchical Coding:
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding_layer1_3M.h264 \
> --set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_1_bitrate=3000000
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding_layer0_6M.h264 \
> --set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=2,h264_hierarchical_lay_0_bitrate=6000000
> 
> ./v4l2-ctl --verbose -d /dev/video1 \
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
> --set-selection-output target=crop,width=1920,height=1080 \
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
> --stream-from=input_nv12_1080p.yuv \
> --stream-to=output/hier_coding.h265 \
> --set-ctrl hevc_hierarchical_coding_type=1,hevc_hierarchical_coding_layer=5
> 
> The result of v4l2-compliance on QCS8300:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Encoder
>         Bus info         : platform:aa00000.video-codec
>         Driver version   : 6.18.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 52 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>         test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, CREATE_BUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, CREATE_BUFS): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> The result of v4l2-compliance on QCS6490:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>         Driver name      : iris_driver
>         Card type        : Iris Encoder
>         Bus info         : platform:aa00000.video-codec
>         Driver version   : 6.18.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 33 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>         test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, REQBUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (select, CREATE_BUFS): OK
>         Video Capture Multiplanar: Captured 61 buffers
>         test MMAP (epoll, CREATE_BUFS): OK
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> Dependencies:
> https://lore.kernel.org/all/20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com/
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add comment for ir_period calculation.(bod,Dikshita)
> - Correct the maximum value of IR_PERIOD.(Dikshita)
> - Add a patch to optimize the calculation of hdr size.(bod)
> - Correct the num_recon calculation.(Dikshita)
> - Add a patch to simplify the calculation of COMV size.(Dikshita)
> - Catch the result code of session_set_property.(bod)
> - Add comment for shift operation in hfi_buffer_get_recon_count.(bod)
> - Add support for layer bitrate setting.(Dikshita)
> - Link to v1: https://lore.kernel.org/r/20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com
> 
> ---
> Wangao Wang (6):
>       media: qcom: iris: Add intra refresh support for gen1 encoder
>       media: qcom: iris: Add Long-Term Reference support for encoder
>       media: qcom: iris: Add B frames support for encoder
>       media: qcom: iris: Add hierarchical coding support for encoder
>       media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
>       media: qcom: iris: Simplify COMV size calculation
> 
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 476 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  16 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  98 ++++-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  49 +++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  18 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>  .../platform/qcom/iris/iris_platform_common.h      |  31 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 161 ++++++-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 226 +++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  65 ++-
>  10 files changed, 1102 insertions(+), 42 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251125-batch2_iris_encoder_enhancements-3e5c42b93a25
> prerequisite-message-id: 20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com
> prerequisite-patch-id: 2b77a7b9bfb436751da0bf69488dbff567a38479
> prerequisite-patch-id: 190f29ef211b046f0d031e3a4b52f2c3bccd0cd9
> prerequisite-patch-id: 92ff1a1958eeacd53d70e155bb8214f9987ddf85
> prerequisite-patch-id: 0dae6aaa8db7df0729436cf9268d29ea363f0eed
> prerequisite-patch-id: 6382693f5a5a7438660f2e592b30163551d92791
> prerequisite-patch-id: 9aa16211c36540a61d219eb25f09b7625b9bdbde
> 
> Best regards,

