Return-Path: <linux-media+bounces-40718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4AB30FD2
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF1C1CC70EE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1232E7176;
	Fri, 22 Aug 2025 07:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RcfZEIvI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5B2E7166;
	Fri, 22 Aug 2025 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755846156; cv=none; b=AHWINQItK22OXCu4LdWSAAytdvRMeXEfG5tmgm9sNmwkgiPGuDgd/f83iKkA82X9TsBAZIWspIKegA7dSrryV2+tIZge3yHzFAYEfWmt+lhXrvig9xotaCzQsz3JqMVmO03K356WJEEVPN5ZN48UWuQw2BQ+DOBTTm7J+WeBwEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755846156; c=relaxed/simple;
	bh=0yrAk2DiqdvPdr88YVo2+ZhQ1t9DTmYj2ScMPTBabQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JR0X7brte1WIIPOUSAzHj7hpAjEIOM9Bj2LO42X81sO4ukrHn18AyxAmp6DNoLyKYLJGLU8LQkdYCaZnc8aoVn+0H8g72I1wgmFgoyY7fl2y7re4kLxsmixLKEVxdAeQ7ujubXd0vIFgpFPJTswG+Uz13CwhVhdOmyjRZKI/KBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RcfZEIvI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uRg8005989;
	Fri, 22 Aug 2025 07:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJVX3aQW2q/r67bPG54L2hL/Bf9G5a5vOq1UeQFrur4=; b=RcfZEIvIetaD98Mn
	cSKAd+UvcBN2+4FhwEpsezbSukUJYXJzqKV9mpcK4ng+MjMXyRWrGevQLk+Y8RTv
	IVQ32RtPv0uTZ7HHzqdgfOpS+jyHNHXQWgIej133E3Bp54LsFiuawYseRNxaWbPd
	+mrQwIvxiYGC0Nn65fdAwnuyYFN3XDFBpnKUcK58tKC203Bwc1p38q94fjASE8mD
	sbOA5ndNQtbn9nv8P7HOfWsnKr8fBR+zrfwNo3ZWd6UeAsxnSJvNc8vSDCOmBW/x
	vf5kAJQM4Zs/ma+nsx7zmXrZVSCGkXa/VCiK8VAbzikeeGeFUlzzYlycAwFsmRZk
	y5oQnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dr2cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 07:02:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M72QO9020537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 07:02:26 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 00:02:22 -0700
Message-ID: <cdce193e-c055-6599-16e5-83e33123099e@quicinc.com>
Date: Fri, 22 Aug 2025 12:32:19 +0530
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
Content-Language: en-US
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
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <19f844ee-da08-4497-a4f7-c90d45554534@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <19f844ee-da08-4497-a4f7-c90d45554534@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8lfkaE2LZl1R
 U/N75f4ISIlUkaPBit/iYqBIg7uSA4J+9nmRiv+IpE2YxtMbbZOjy44ZFiH32wxOt2tHmZGHhor
 z/gtxqz2LohQ7NTj8JnLN2R2Kqde3eqCskGIWz7DdMmOK6Ko13OEt720uuSvC6JA5eH2ClRri8K
 1N7uT/6dwP3mP3PJXE9ScxlIaoYM6fK9+PEbNxEnkiVC3S1JQ+0FWznraxwROt5aQJfoa1AAIVA
 65eN5r/6kHKuJabHjoS0W4WAwGsbEY6VoPm4Fg3ufPYS5bjXtwGmBztHqTi+CQJy8l7B1ErVpdt
 EMCUzj06ikeccv/EsM+3WtxlgGODn0PITCM86SI9IIVScg30i4Lu43jAUWJBFLLSJU8tmlSzGfL
 Wmkqk3kcD57BKEfnEOqcGu35vgjfMA==
X-Proofpoint-ORIG-GUID: R_6LC7i4LLa3D9RmkK5y2WTxijzOXPjV
X-Proofpoint-GUID: R_6LC7i4LLa3D9RmkK5y2WTxijzOXPjV
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a81603 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=Pj3T067YBZOXwuqdKnkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/21/2025 6:28 PM, Neil Armstrong wrote:
> On 21/08/2025 09:21, Dikshita Agarwal wrote:
>>
>>
>> On 8/20/2025 8:29 PM, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 20/08/2025 11:07, Dikshita Agarwal wrote:
>>>> Hi All,
>>>>
>>>> This patch series adds support for H.264 and H.265 encoder in iris
>>>> driver and includes a few fixes and cleanup in the common code that were
>>>> identified during encoder bring-up process.
>>>>
>>>> The changes include:
>>>> - Enabling support for H.264 and H.265 encoding.
>>>> - Fixes and improvements in shared componenets used by both encoder and
>>>> decoder paths.
>>>> - Ensuring compatibility and stability with the existing decoder flow.
>>>>
>>>> Changes in v3:
>>>> - Fixed the log when destroying the interanl buffers (Jorge)
>>>> - Updated commit text with issue details in patch 05/25 (Krzysztof)
>>>> - Added a patch to simplify conditional logic in stop handling for hfi
>>>> gen1 (Bryan)
>>>> - Reduced duplicate code while registering video devices (Bryan)
>>>> - Added a fix for try fmt handling in decoder (Self)
>>>> - Fixed the value of max core mbps for qcs8300 (Vikash)
>>>> - Simplied the frame rate handling in driver by using non q16 format and
>>>> converted to q16 when setting to firmware (Vikash)
>>>> - Fixed the issue with bitstream resolution setting to firmware (Neil)
>>>> - Addressed other review comments (Vikash, Bryan)
>>>> - Link to v2:
>>>> https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
>>>>
>>>> Changes in v2:
>>>> - Fixed sparse/coccinnelle issues.
>>>> - Fixed the kernel doc warning.
>>>> - Removed unsupported PEAK_BITRATE property from SM8250.
>>>> - Dropped patch 04/25 to fix quality issue with encoder.
>>>> - Enhanced command handling for encoder to allow start/stop commands.
>>>> - Expanded rate control condition checks to include additional rate
>>>>     control types for HFI Gen2.
>>>> - Updated default value to MAX_QP for all caps related to max QP settings.
>>>> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
>>>> - Link to v1:
>>>> https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
>>>>
>>>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>>>> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
>>>> that the existing decoder functionality remains uneffected.
>>>>
>>>> Commands used for V4l2-ctl validation:
>>>>
>>>> v4l2-ctl --verbose
>>>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>>>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>>>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>>>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>>>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>>>>
>>>> v4l2-ctl --verbose
>>>> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>>>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>>>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>>>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>>>> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
>>>
>>> - I've tested this serie on SM8650, first I failed to get HEVC working with
>>> the following command:
>>>
>>> v4l2-ctl --verbose
>>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NV12
>>> --set-selection-output target=crop,top=0,left=0,width=1920,height=1080
>>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>>> --stream-from=Big_Buck_Bunny_1080_10s.yuv
>>> --stream-to=Big_Buck_Bunny_1080_10s.hevc -d /dev/video1
>>>
>>> I got:
>>> qcom-iris aa00000.video-codec: session error received 0x1000005: unknown
>>>
>>> I checked the diff with v2, and reverting this make HEVC encoding work
>>> again:
>>
>> This is strange, we don't see any such issue on SM8550.
>> Could you pls share the full logs.
> 
> I tried again with a 720p stream with your exact command line from the
> cover letter
> and it still fails with HEVC:
> $ v4l2-ctl --verbose
> --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
> --stream-from=Big_Buck_Bunny_720_10s.yuv
> --stream-to=Big_Buck_Bunny_720_10s.hevc -d /dev/video1
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Capture Multiplanar:
>     Width/Height      : 320/240
>     Pixel Format      : 'HEVC' (HEVC)
>     Field             : None
>     Number of planes  : 1
>     Flags             :
>     Colorspace        : Default
>     Transfer Function : Default
>     YCbCr/HSV Encoding: Default
>     Quantization      : Default
>     Plane 0           :
>        Bytes per Line : 0
>        Size Image     : 245760
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Output Multiplanar:
>     Width/Height      : 1280/736
>     Pixel Format      : 'NV12' (Y/UV 4:2:0)
>     Field             : None
>     Number of planes  : 1
>     Flags             :
>     Colorspace        : Default
>     Transfer Function : Default
>     YCbCr/HSV Encoding: Default
>     Quantization      : Default
>     Plane 0           :
>        Bytes per Line : 1280
>        Size Image     : 1413120
> VIDIOC_G_SELECTION: ok
> VIDIOC_S_SELECTION: ok
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_REQBUFS returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_QBUF returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_QBUF returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_QBUF returned 0 (Success)
>         VIDIOC_QUERYBUF returned 0 (Success)
>         VIDIOC_G_FMT returned 0 (Success)
>         VIDIOC_QBUF returned 0 (Success)
>         VIDIOC_STREAMON returned 0 (Success)
> VIDIOC_G_FMT: ok
> VIDIOC_DQBUF: failed: Input/output error
> out dqbuf: 0 seq:      0 bytesused: 0 ts: 0.000000 field: Any
> VIDIOC_DQBUF: failed: Input/output error
> 

Thanks for the logs, but those didn't give any useful info on this issue,
We would firmware logs to check this, as we are not able to reproduce this
issue on SM8550.

Please use below patch to enabled firmware logs and share the debug output.

if you see any issue due to higher logging, you can reduce the paylod value
for HFI_PROP_DEBUG_LOG_LEVEL to 0x00000018.

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c
b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 92112eb16c110..b7061faa82ae2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -87,6 +87,10 @@ int iris_hfi_core_init(struct iris_core *core)
 	if (ret)
 		return ret;

+	ret = hfi_ops->sys_set_debug(core);
+	if (ret)
+		return ret;
+
 	return hfi_ops->sys_interframe_powercollapse(core);
 }

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h
b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index b51471fb32c70..edda5a531953d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -108,6 +108,7 @@ struct iris_hfi_prop_type_handle {
 struct iris_hfi_command_ops {
 	int (*sys_init)(struct iris_core *core);
 	int (*sys_image_version)(struct iris_core *core);
+	int (*sys_set_debug)(struct iris_core *core);
 	int (*sys_interframe_powercollapse)(struct iris_core *core);
 	int (*sys_pc_prep)(struct iris_core *core);
 	int (*session_set_config_params)(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index c97e4910e8528..ec3e59c615a40 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -54,6 +54,23 @@ static int iris_hfi_gen2_sys_image_version(struct
iris_core *core)
 	return ret;
 }

+static int iris_hfi_gen2_sys_set_debug(struct iris_core *core)
+{
+	struct iris_hfi_header *hdr;
+	int ret;
+
+	hdr = kzalloc(SYS_IFPC_PKT_SIZE, GFP_KERNEL);
+	if (!hdr)
+		return -ENOMEM;
+
+	iris_hfi_gen2_packet_set_debug(core, hdr);
+	ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
+
+	kfree(hdr);
+
+	return ret;
+}
+
 static int iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
 {
 	struct iris_hfi_header *hdr;
@@ -1170,6 +1187,7 @@ static int
iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
+	.sys_set_debug = iris_hfi_gen2_sys_set_debug,
 	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 	.session_open = iris_hfi_gen2_session_open,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index aa1f795f5626c..4f0f4e95652c1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -187,6 +187,9 @@ enum hfi_packet_firmware_flags {
 	HFI_FW_FLAGS_SYSTEM_ERROR		= 0x00000008,
 };

+#define HFI_PROP_DEBUG_CONFIG                                   0x0300000a
+#define HFI_PROP_DEBUG_LOG_LEVEL                                0x0300000b
+
 struct hfi_debug_header {
 	u32 size;
 	u32 debug_level;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc6..14b0abbb8bc02 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -222,6 +222,33 @@ void iris_hfi_gen2_packet_image_version(struct
iris_core *core, struct iris_hfi_
 				    NULL, 0);
 }

+void iris_hfi_gen2_packet_set_debug(struct iris_core *core, struct
iris_hfi_header *hdr)
+{
+	u32 payload = 0;
+
+	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
+
+	payload = 0;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_DEBUG_CONFIG,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32_ENUM,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+
+	payload = 0x0000001c;
+	iris_hfi_gen2_create_packet(hdr,
+				    HFI_PROP_DEBUG_LOG_LEVEL,
+				    HFI_HOST_FLAGS_NONE,
+				    HFI_PAYLOAD_U32_ENUM,
+				    HFI_PORT_NONE,
+				    core->packet_id++,
+				    &payload,
+				    sizeof(u32));
+}
+
 void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32
pkt_type,
 					  u32 flags, u32 port, u32 session_id,
 					  u32 payload_type, void *payload,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 25b9582349ca1..f44c09af694a0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -121,5 +121,6 @@ void iris_hfi_gen2_packet_session_property(struct
iris_inst *inst,
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct
iris_hfi_header *hdr);
+void iris_hfi_gen2_packet_set_debug(struct iris_core *core, struct
iris_hfi_header *hdr);

 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 2f1f118eae4f6..345e438967ead 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -949,7 +949,7 @@ static void iris_hfi_gen2_flush_debug_queue(struct
iris_core *core, u8 *packet)

 		packet[pkt->size] = '\0';
 		log = (u8 *)packet + sizeof(*pkt) + 1;
-		dev_dbg(core->dev, "%s", log);
+		dev_err(core->dev, "%s", log);
 	}
 }

Thanks,
Dikshita

