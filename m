Return-Path: <linux-media+bounces-40529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA9B2EF76
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0565716CAA2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAE72E8B89;
	Thu, 21 Aug 2025 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cIo7KwcM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886927B352;
	Thu, 21 Aug 2025 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760911; cv=none; b=N+6wwPLYVq9vH8a1rGJdZAiLJbJWTB7Bltlf7KaunD6nfWPhWdpurMO3fEBhtESWfd7BwCIe0IjWOkyjeWiggTZixjMb73kW7PVP+V/8uDrybuESgzG6z4WBn3ZEZ2PIUUYqC4SZ7QCCembp9V/jDtrSsTS0scBBZHZND05zyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760911; c=relaxed/simple;
	bh=1NsbptHJS9Tw4hMt6ppUY/yJgXAOq0MOVzwRUq05RE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y61eHIELlzV8jyjC3d23+EfNnRlqoaXzr71pq5ya7YRO5DUTIR4zMCEqTK5/WZm4AF+lbTpZoQPNLbciw3QFpGpaxDNOJ4rPir55ppIEQbxkqU5QVHGKXEQb3tGY7pyiJcxRi9nU64v27FvNWegFbNzo1Ji2bsiJdXjJViTWKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cIo7KwcM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L77L9H010171;
	Thu, 21 Aug 2025 07:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtqc3YGPMT4rl9KkdHqWMqFxRLHlT+YOidRDb5qhYa4=; b=cIo7KwcMAdPX7kgn
	QYhBY5aF/OzZjRE51UK+ZSQBuD6/4fuGTvGIyZmgmMoaA7RHmfdc9ACN++2KlQi0
	bBYvjQFDksfT0C9v88jYXd/5hTjgy2JgtCog3HshMX5ObbhRZdBnZ5cefSfrHXyf
	KVV5ONIY7MBMzhKVo6YFDOsuSxbVNrQSV/OlrcnAHY72t/s9zdxcc0DQrpF1yBHt
	bQVuHtfVccuho/T0Ip/HZsWtEKPZ2Vv1friwGXPbt213I6SOS+47EVd2daAllRjV
	PhL11nU3Iit7SYOlUKAMYRphAmppkmV4hlUGfpsH3bwAAsvFDzySMh9+NX1hRFqC
	5BraPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a4evt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 07:21:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57L7Le1l002914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 07:21:40 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 00:21:36 -0700
Message-ID: <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
Date: Thu, 21 Aug 2025 12:51:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a6c905 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=p0WdMEafAAAA:8 a=ro28NqPl9wecg9bO1QYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-ORIG-GUID: 1_cMZfG60MD-70Qbn9ikJqd0qCoAOdhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyE+Z77Vr7boo
 0EhvMKF26OKGq5i4GPMBTzJ+ReK6QDMPuDQKDAGQ53iWc1BwvrN8wH/PhhENQejj2hz9TiAufJu
 6HqFqTT1GkWd+onm8nAlHnnPdrrQ11g4lXt9G6c1PWf2feg2dx7hxuDr31BT3/WcImckIIWktgJ
 ZTYEyXLNsds7Ey9uC7QONsbGn2ildEH/ivNNN+vOEYw3S4hc6wNxlAZ6fvDMnKB6CPOObCarrca
 1u67WB95MldkRaU6sn27WxHBaOTxh2yVFFosXd98IDNgyRBS0MvCXTyOp7Fn24ZrkOY2dk22yge
 VfLBmdqfL1GWE/hNNXjJqhpwaEZb9ZWNUpEHnnJKuHnAlBxYgVaI460xclyTZoCOuGoUlAYi8GE
 qDgw8FDyH2BvuvHd4HE5i9rprFLCbg==
X-Proofpoint-GUID: 1_cMZfG60MD-70Qbn9ikJqd0qCoAOdhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 8:29 PM, Neil Armstrong wrote:
> Hi,
> 
> On 20/08/2025 11:07, Dikshita Agarwal wrote:
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
>> Changes in v3:
>> - Fixed the log when destroying the interanl buffers (Jorge)
>> - Updated commit text with issue details in patch 05/25 (Krzysztof)
>> - Added a patch to simplify conditional logic in stop handling for hfi
>> gen1 (Bryan)
>> - Reduced duplicate code while registering video devices (Bryan)
>> - Added a fix for try fmt handling in decoder (Self)
>> - Fixed the value of max core mbps for qcs8300 (Vikash)
>> - Simplied the frame rate handling in driver by using non q16 format and
>> converted to q16 when setting to firmware (Vikash)
>> - Fixed the issue with bitstream resolution setting to firmware (Neil)
>> - Addressed other review comments (Vikash, Bryan)
>> - Link to v2:
>> https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
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
> 
> - I've tested this serie on SM8650, first I failed to get HEVC working with
> the following command:
> 
> v4l2-ctl --verbose
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=Big_Buck_Bunny_1080_10s.yuv
> --stream-to=Big_Buck_Bunny_1080_10s.hevc -d /dev/video1
> 
> I got:
> qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
> 
> I checked the diff with v2, and reverting this make HEVC encoding work again:

This is strange, we don't see any such issue on SM8550.
Could you pls share the full logs.

> ===========================><=================================================
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -194,9 +194,8 @@ static int
> iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>                 inst_hfi_gen2->src_subcr_params.bitstream_resolution =
> resolution;
>                 payload_type = HFI_PAYLOAD_U32;
>         } else {
> -               codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -               resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width,
> codec_align) << 16 |
> -                       ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
> +               resolution = inst->fmt_dst->fmt.pix_mp.width << 16 |
> +                       inst->fmt_dst->fmt.pix_mp.height;
>                 inst_hfi_gen2->dst_subcr_params.bitstream_resolution =
> resolution;
>                 payload_type = HFI_PAYLOAD_32_PACKED;
>         }
> ===========================><=================================================
> Did I pass some wrong parameters ? I don't expect the fw to crash.
> 
> - On the 1280x720 output bug, I tried the same commands as v2:
> v4l2-ctl --verbose
> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
> --stream-from=Big_Buck_Bunny_1080_10s.yuv
> --stream-to=Big_Buck_Bunny_1080_10s.h264 -d /dev/video1
> 
> And I still get a 1280x720 h264 video, did I miss something ?

The above chnage which you reverted is needed to resolve this bug,
basically if you don't set the resolution aligned with 16 (for H264) and 32
(for HEVC) firmware will reject the property and encode to some default
resolution which is 720p in this case.

> 
> - Finally I tested the firmware you sent today
> (https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/654),
> first thanks a lot for that !
> 
> But then I was unable to encode with this firmware (v2 or v3 patchset), I
> got around all the firmwares
> I got and here's the results:
> | QC_IMAGE_VERSION_STRING                                     | BUILD_DATE 
> | Release                         | decoding | encoding v2 | encoding v3 |
> |-------------------------------------------------------------|-------------|---------------------------------|----------|-------------|-------------|
> | video-firmware.3.4-245082a0a3cc5e740f6340c295000ab4bcfc367d | Aug 24 2023
> | VIDEO.LA.4.0.r2-02400-lanai.0-1 | OK       | OK          | KO HEVC     |
> | video-firmware.3.4-457429862ac40592d143de942b04d80fd9987e56 | Jan 29 2024
> | VIDEO.LA.4.0.r2-03800-lanai.0-1 | OK       | OK          | KO HEVC     |
> | video-firmware.3.4-0d8a914b010672616a0d0613e22866c0b639a807 | Aug 14 2024
> | VIDEO.LA.4.0.r2-05900-lanai.0-1 | OK       | KO          | KO          |
> | video-firmware.3.4-75ad4eb9657cf50ee663b05f78c01d6ceccd5632 | Jan 29 2025
> | VIDEO.LA.4.0.r2-05900-lanai.0-1 | OK       | KO          | KO          |
> | video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693 | Aug 14 2025
> | VIDEO.VPU.3.4-0054              | OK       | KO          | KO          |
> ------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> The change occurs around Aug 14 2024, So I checked the downstream driver
> and I found that fixes the encoding:
> ===========================><=================================================
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -863,9 +863,18 @@ static inline
>  u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>                        u32 frame_width_coded)
>  {
> -       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
> -                     (((((max_t(u32, (frame_width_coded),
> -                                (frame_height_coded)) + 3) >> 2) << 5) +
> 256) * 16)), 256);
> +       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0,
> vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0,
> size_top = 0;
> +
> +       vpss_4tap_top = ((((max_t(u32, frame_width_coded,
> frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
> +       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
> +       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded)
> + 3) >> 2) << 4) + 256;
> +       vpss_div2_left = ((((max_t(u32, frame_width_coded,
> frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
> +       vpss_top_lb = (frame_width_coded + 1) << 3;
> +       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
> +       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
> +       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
> +
> +       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb,
> DMA_ALIGNMENT);
>  }

Seems this calculation is different for iris3 and iris33, hence you see
this issue on SM8650.

Updating this calculation in common code will increase the buffer size with
from ~400KB to ~2.2 MBs (for 640x480) and even more for higher resolution.

@vikash, pls comment if we should update in common code or have this
implemented specific for iris33 separately using some ops.

Thanks,
Dikshita

> 
>  static inline
> ===========================><=================================================
> 
> And I checked and encoding still works with the "old" firmwares.
> 
> With both changes, I can get H264 & HEVC encoding working on any firmware.
> 
> Neil
> 
> 
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
>> Dikshita Agarwal (26):
>>        media: iris: Fix buffer count reporting in internal buffer check
>>        media: iris: Report unreleased PERSIST buffers on session close
>>        media: iris: Fix memory leak by freeing untracked persist buffer
>>        media: iris: Fix port streaming handling
>>        media: iris: Allow substate transition to load resources during
>> output streaming
>>        media: iris: Always destroy internal buffers on firmware release
>> response
>>        media: iris: Update vbuf flags before v4l2_m2m_buf_done
>>        media: iris: Simplify session stop logic by relying on vb2 checks
>>        media: iris: Allow stop on firmware only if start was issued.
>>        media: iris: Send dummy buffer address for all codecs during drain
>>        media: iris: Fix missing LAST flag handling during drain
>>        media: iris: Fix format check for CAPTURE plane in try_fmt
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
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 480 +++++++++---
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 ++++++---
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  74 +-
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 522 ++++++++++++-
>>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 ++++++++-
>>   .../platform/qcom/iris/iris_platform_sm8250.c      | 234 +++++-
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
>>   drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>>   drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
>>   drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>>   drivers/media/platform/qcom/iris/iris_venc.c       | 579 ++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>>   drivers/media/platform/qcom/iris/iris_vidc.c       | 299 +++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 847
>> ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  20 +
>>   33 files changed, 4964 insertions(+), 712 deletions(-)
>> ---
>> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
>> change-id: 20250704-iris-video-encoder-b193350b487a
>>
>> Best regards,
> 

