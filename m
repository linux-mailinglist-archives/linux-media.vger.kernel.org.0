Return-Path: <linux-media+bounces-40140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B81B2A0D5
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C8E189BFA8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383E631A042;
	Mon, 18 Aug 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KvcJbrd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165A30EF8D;
	Mon, 18 Aug 2025 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517684; cv=none; b=mVTntFmlZZIXzlo1OmCg+++S1Xy0dfl80H35K2yixI7Giy8823OhaPfm60BEkvGWr9nD1+r6ZDMXK+Y6c53G8jfPR9nfp4SGpPw6OoduFGlF0Lu/+83E0sGgpi0my5IqeZvtS84uvLn1swOnhE3EuikTKk4dD/GvYTvvEcnXxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517684; c=relaxed/simple;
	bh=ujytadS7q4vLmQociWZNkju6c+1J60CEhU1ajzCGex4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ULkDzXKFbOfklJNm3rGtieEIWIGvgXc2WXuG+aOTZMR0RcNDyQM0U7eOMxj6MkNjL5BUiP81ziyE2+qlg5zJ1LT6TR9lQ/yx0HeiU2e29UDQ3ymncypyeULkX/lZDXGqWKapROkTXqIa3SmrNiXYIou2FkGE78oO+O5avoGkwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KvcJbrd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8N87d030849;
	Mon, 18 Aug 2025 11:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNGUvZrnHHcxy6U22m/vR79Y3xPLRxHQ+ynVOLcN4cI=; b=KvcJbrd6w8g0Preq
	fNy5GDss6vUSSUD54eKu7P5KPpNmx7jzS4UfjNcFiTa3mI3aVXFNFulSWf2AzXye
	eMAfnPWO68mCf01RHPidxJHZbMh2DBFScMtW5FqclCXRxDBA6+by78x8vPvR4ylL
	BmyL+8vCygUOfD2bV1FmlvcGh8TjdoPAU4eMTXG1Jed/PraMhNLajq0bmt0/zYsw
	tq+XoQ2xaLrkybCJJnnkMwyEy6m1bt1gjd7soJoSQcbFF448aZdUUmjfONlFgNm5
	pNw2ONmh7som1tPwM+6Text+htNV9+arF31ZBHoth/M3+jUjZERrfaJJktz8q7/u
	HEkWlQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvhe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 11:47:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57IBlscb008113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 11:47:54 GMT
Received: from [10.50.26.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 04:47:50 -0700
Message-ID: <302fcfba-1066-f1f4-792f-cd91af4f7cdb@quicinc.com>
Date: Mon, 18 Aug 2025 17:17:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/24] Enable H.264/H.265 encoder support and fixes in
 common code
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <3f60cd7a-c9af-423e-81ec-678ba441dbc9@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <3f60cd7a-c9af-423e-81ec-678ba441dbc9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mJGN2zZc5Jw4E35qVTS3DkLloeQy88HQ
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a312eb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=4TLugxlAAAAA:8 a=GjE4Rd3cIaPu5Xod0JUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=DjKI-ePmiDMA:10 a=p9Gh1Lb1zVQA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=POtbf82_kfE2Tp1tNcud:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX7Jg8Rtc0bWSa
 BMQnjVmD8+sIoArrNlSgywWzTfSdeXha1W6lH8desKHEamrf1kPPv/ZGL060RVUWLBVAO5AtMK6
 u1wvVWV60wBidGH5s0dsP+lKaAXLcHGrhP3mC2VIa+mGpUHOEMY/SoLVRDS0hSIWYpH/k/ZXIFA
 bzqyP0Yjo+Q2jIPuYsOqHOWqu5JjNucYeHXNvG71Abnya3bFk/bjuiO5YAIW2OrV4C96Jw+B4G7
 4xgmNzghUjN7OBz1GubnskLOFqR5NvlhaKyS/ItCAOQjXDyJkRgiqMANGcrTi1Fxn6cFQqhKbSg
 quA8U6FqXByb5EMt/TeTO5mlolsC0Cz8tCtoVfKocs/+UMW5ST9a7F1z35ccaRUV4Sitk466wwM
 NfyrTeRZ
X-Proofpoint-ORIG-GUID: mJGN2zZc5Jw4E35qVTS3DkLloeQy88HQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039



On 8/13/2025 8:57 PM, Neil Armstrong wrote:
> On 13/08/2025 11:37, Dikshita Agarwal wrote:
>> Hi All,
>>
>> This patch series adds support for H.264 and H.265 encoder in iris
>> driver and includes a few fixes and cleanup in the common code that were
>> identified during encoder bring-up process.
>>
>> The changes include:
>> - Enabling support for H.264 and H.265 encoding.
>> - Fixes and improvements in shared componenets used by both encoder and
>> decoder paths.
>> - Ensuring compatibility and stability with the existing decoder flow.
>>
>> Changes in v2:
>> - Fixed sparse/coccinnelle issues.
>> - Fixed the kernel doc warning.
>> - Removed unsupported PEAK_BITRATE property from SM8250.
>> - Dropped patch 04/25 to fix quality issue with encoder.
>> - Enhanced command handling for encoder to allow start/stop commands.
>> - Expanded rate control condition checks to include additional rate
>>    control types for HFI Gen2.
>> - Updated default value to MAX_QP for all caps related to max QP settings.
>> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
>> - Link to v1:
>> https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
>>
>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
>> that the existing decoder functionality remains uneffected.
>>
>> Commands used for V4l2-ctl validation:
>>
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>>
>> v4l2-ctl --verbose
>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
>>
>> Commands used for GST validation:
>>
>> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
>> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=/tmp/gst_cyclists_1280x720_92frames.h264
>>
>> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
>> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=/tmp/gst_cyclists_1280x720_92frames.hevc
>>
>> The result of v4l2-compliance on SM8550:
>> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
>>
>> Compliance test for iris_driver device /dev/video1:
>>
>> Driver Info:
>>          Driver name      : iris_driver
>>          Card type        : Iris Encoder
>>          Bus info         : platform:aa00000.video-codec
>>          Driver version   : 6.16.0
>>          Capabilities     : 0x84204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>          Detected Stateful Encoder
>>
>> Required ioctls:
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video1 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 37 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>          test read/write: OK (Not Supported)
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (select, REQBUFS): OK
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (epoll, REQBUFS): OK
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (select, CREATE_BUFS): OK
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (epoll, CREATE_BUFS): OK
>>          test USERPTR (select): OK (Not Supported)
>>          test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0,
>> Warnings: 0
>>
>> The result of v4l2-compliance on SM8250:
>> v4l2-compliance 1.29.0-5270, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: dc947661089e 2024-11-11 10:25:38
>>
>> Compliance test for iris_driver device /dev/video1:
>>
>> Driver Info:
>>          Driver name      : iris_driver
>>          Card type        : Iris Encoder
>>          Bus info         : platform:aa00000.video-codec
>>          Driver version   : 6.16.0
>>          Capabilities     : 0x84204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>          Detected Stateful Encoder
>>
>> Required ioctls:
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video1 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 19 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>          test read/write: OK (Not Supported)
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (select, REQBUFS): OK
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (epoll, REQBUFS): OK
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (select, CREATE_BUFS): OK
>>          Video Capture Multiplanar: Captured 61 buffers
>>          test MMAP (epoll, CREATE_BUFS): OK
>>          test USERPTR (select): OK (Not Supported)
>>          test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0,
>> Warnings: 0
>>
>> Looking forward to your review and feedback.
>>
>> Thanks,
>> Dikshita
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>> Dikshita Agarwal (24):
>>        media: iris: Fix buffer count reporting in internal buffer check
>>        media: iris: Report unreleased PERSIST buffers on session close
>>        media: iris: Fix memory leak by freeing untracked persist buffer
>>        media: iris: Fix port streaming handling
>>        media: iris: Allow substate transition to load resources during
>> output streaming
>>        media: iris: Always destroy internal buffers on firmware release
>> response
>>        media: iris: Update vbuf flags before v4l2_m2m_buf_done
>>        media: iris: Allow stop on firmware only if start was issued.
>>        media: iris: Send dummy buffer address for all codecs during drain
>>        media: iris: Fix missing LAST flag handling during drain
>>        media: iris: Add support for video encoder device
>>        media: iris: Initialize and deinitialize encoder instance structure
>>        media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
>>        media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for
>> encoder
>>        media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
>>        media: iris: Add encoder support for V4L2 event subscription
>>        media: iris: Add support for G/S_SELECTION for encoder video device
>>        media: iris: Add support for G/S_PARM for encoder video device
>>        media: iris: Add platform-specific capabilities for encoder video
>> device
>>        media: iris: Add V4L2 streaming support for encoder video device
>>        media: iris: Set platform capabilities to firmware for encoder
>> video device
>>        media: iris: Allocate and queue internal buffers for encoder video
>> device
>>        media: iris: Add support for buffer management ioctls for encoder
>> device
>>        media: iris: Add support for drain sequence in encoder video device
>>
>>   drivers/media/platform/qcom/iris/Makefile          |   5 +-
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 220 ++++--
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
>>   drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
>>   drivers/media/platform/qcom/iris/iris_common.h     |  18 +
>>   drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 +++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 485 +++++++++---
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 357 ++++++---
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  74 +-
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
>>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
>>   .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  39 +-
>>   drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>   drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 249 +-----
>>   drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>>   drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 847
>> ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
>>   33 files changed, 4970 insertions(+), 713 deletions(-)
>> ---
>> base-commit: c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067
>> change-id: 20250704-iris-video-encoder-b193350b487a
>>
>> Best regards,
> 
> I have a successfull encoding on SM8650-HDK with the following commands
> (ffmpegs segfaults en encoding):
> 
> wget
> https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_30MB.mp4 -O Big_Buck_Bunny_1080_10s_30MB_h264.mp4
> ffmpeg -c:v h264_v4l2m2m -i Big_Buck_Bunny_1080_10s_30MB_h264.mp4 -pix_fmt
> nv12 Big_Buck_Bunny_1080_10s.yuv
> v4l2-ctl --verbose
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=Big_Buck_Bunny_1080_10s.yuv
> --stream-to=Big_Buck_Bunny_1080_10s.h264 -d /dev/video1
> v4l2-ctl --verbose
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=Big_Buck_Bunny_1080_10s.yuv
> --stream-to=Big_Buck_Bunny_1080_10s.hevc -d /dev/video1
> 
> But the video is 1280x720, if I drop the `--set-selection-output

Seems like a bug, checking and will fix in next revision

> target=crop,top=0,left=0,width=1920,height=1080` I correctly get 1920x1080
> but the color keeps moving like if the colors stride is wrong.

For input resolutions that are not 16x16 aligned, require the client to set
the crop rectangle using the s_selection API as per v4l2 specification.
Pls see
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html
4.5.2.5.6

Thanks,
Dikshita

> 
> Neil
> 
> 

