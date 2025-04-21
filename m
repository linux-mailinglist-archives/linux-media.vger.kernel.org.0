Return-Path: <linux-media+bounces-30589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B9A94FD7
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E977A2DDF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE39262815;
	Mon, 21 Apr 2025 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LJhCLOOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9914926156E;
	Mon, 21 Apr 2025 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233553; cv=none; b=Qa1rTf8CDRKRkMaELoWDwZb0X3Z3jLwhxgyh8ZejIn9In45fStGZZfY8MlqGWX8Mzgmxvo1yy5tPwrm73XCk6/zcKNk4Dp4UPoJJfloi8x5mbviuS1nZS8oo3DadprKwtIH4Bp8eRmaI9IuMmxz+Wqilkknvu8MDczh4ACE0OG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233553; c=relaxed/simple;
	bh=RbservHcGk2EKwF/AMkeHfmBaDZn1bslhhvoHXuJYKo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=UfPFb5KyctodH3oKuP5P9Ag+VZ5QvbrO6tr8rSR7SyO9ijRkqHkR7sewzur/DTw97z5JyCZruEt8ASfUz9edbit9OI1AuIdwO7g4OKd8BOhcavKxzQTOxVKmofuZX9T5TFuUG4YrAph6l9g8YlAyxF/ccUvslUlgJuI2civDbmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LJhCLOOM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA8lNA006915;
	Mon, 21 Apr 2025 11:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tawL9xPcbCqOFuuclDsqO2efguvIRgD7kW4jLpmQU4=; b=LJhCLOOMwNwgktn/
	jPEWVJjn/1cVEuf7yL+ynAsSQty6z6O5vQ9JQ9b3+/YJJwVz3HcSYEmC2E2p67NU
	dvyr8cqUGgaUT4yN4y9bXqVkHZeQZuF9rYGCSYx3BtvQYMvKwsJJzHueI2NaiAtO
	IIaCiESx1yC34MGmmf1hjuMxSKU9TeH643agmSLkXt6FC7qK+6pXPEw0GdhiJWyX
	bRggG/e6jliSbaBbXWPS5zgTbg4weB43i55Apdkt3CZ+gHrNyRPYcFT7BJtgLugf
	6D70h265jlQ/MdHi4Zxo8idqLEu0pfJVNHBd6w5EFQZMcaWfg++SHKACkvRCT4JX
	TX9Ybw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1by40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 11:05:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LB5gYg011032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 11:05:42 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 04:05:36 -0700
Message-ID: <2a5fa0c6-37cc-96c7-57f9-f3939dc669c6@quicinc.com>
Date: Mon, 21 Apr 2025 16:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <b8d0deac8f6ae883f3a2374ecf56756c83a57ef1.camel@ndufresne.ca>
Content-Language: en-US
In-Reply-To: <b8d0deac8f6ae883f3a2374ecf56756c83a57ef1.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68062688 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=e5mUnYsNAAAA:8
 a=YbpzZouEt4zClhb8bCMA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 8AVvMU2jTeGw86oorCjgoP2bY8BI1LFo
X-Proofpoint-ORIG-GUID: 8AVvMU2jTeGw86oorCjgoP2bY8BI1LFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210085

Hi Nicolas,

On 4/9/2025 12:07 AM, Nicolas Dufresne wrote:
> Hi,
> 
> This is for Bryan and Vikash to review first, but here's some initial feedback on that report.
> 
> Le mardi 08 avril 2025 à 21:24 +0530, Dikshita Agarwal a écrit :
>> Hi All,
>>
>> This patch series adds initial support for the HEVC(H.265) and VP9
>> codecs in iris decoder. The objective of this work is to extend the 
>> decoder's capabilities to handle HEVC and VP9 codec streams,
>> including necessary format handling and buffer management.
>> In addition, the series also includes a set of fixes to address issues
>> identified during testing of these additional codecs.
>>
>> These patches also address the comments and feedback received from the 
>> RFC patches previously sent. I have made the necessary improvements 
>> based on the community's suggestions.
>>
>> Changes sinces RFC:
>> - Added additional fixes to address issues identified during further 
>> testing.
>> - Moved typo fix to a seperate patch [Neil]
>> - Reordered the patches for better logical flow and clarity [Neil, 
>> Dmitry]
>> - Added fixes tag wherever applicable [Neil, Dmitry]
>> - Removed the default case in the switch statement for codecs [Bryan]
>> - Replaced if-else statements with switch-case [Bryan]
>> - Added comments for mbpf [Bryan]
>> - RFC: https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>
>> These patches are tested on SM8250 and SM8550 with v4l2-ctl and 
>> Gstreamer for HEVC and VP9 decoders, at the same time ensured that 
>> the existing H264 decoder functionality remains uneffected.
>>
>> Note: 1 of the fluster compliance test is fixed with firmware [1]
>> [1]: https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u 
>>
>> The result of fluster test on SM8550:
>>  131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
>>  GStreamer-H.265-V4L2-Gst1.0.
>>  The failing test case:
>>  - 10 testcases failed due to unsupported 10 bit format.
>>    - DBLK_A_MAIN10_VIXS_4
>>    - INITQP_B_Main10_Sony_1
>>    - TSUNEQBD_A_MAIN10_Technicolor_2
>>    - WP_A_MAIN10_Toshiba_3
>>    - WP_MAIN10_B_Toshiba_3
>>    - WPP_A_ericsson_MAIN10_2
>>    - WPP_B_ericsson_MAIN10_2
>>    - WPP_C_ericsson_MAIN10_2
>>    - WPP_E_ericsson_MAIN10_2
>>    - WPP_F_ericsson_MAIN10_2
>>  - 4 testcase failed due to unsupported resolution
>>    - PICSIZE_A_Bossen_1
>>    - PICSIZE_B_Bossen_1
>>    - WPP_D_ericsson_MAIN10_2
>>    - WPP_D_ericsson_MAIN_2 
>>  - 1 testcase failed as bitstream is invalid (this fails with reference 
>>    as well)
>>    - RAP_B_Bossen_2
> 
> I was surprised of this comment, so I ran it myself through the
> official JCT reference decoder.
> 
>    [JCT-VC-HEVC_V1] (JCT-VT-H.265) RAP_B_Bossen_2                  ... Success
> 
> I'm pretty sure this stream is valid. I personally care about these
> reports since otherwise we cannot differentiate HW limitation, FW bugs
> or V4L2 API limitation. The later is really something we want to know
> about, since we can fix it. We cannot fix HW, and its up to the vendor
> to fix their firmware.
> 
> This specific test is very nice test. It changes the coding
> width/height but keeps the conf window the same (416x240).
> 
> Here's the coded size changes I could see:
> 
> Frame  0: 448 x 256
> Frame 25: 416 x 240
> Frame 70: 448 x 256
> 
> Each time, the driver must sent SRC_CHANGE, and if all went well, the
> decoder should reallocate. Note that all this code in GStreamer is
> recent, so it also a possibility, but something we can fix. I haven't
> tried ffmpeg much, but same.
> 
I checked again, we are able to decode this clip.
But this fails with CRC mismatch, and If frames with 0 length and error
flag are dropped, CRC also matches and testcase is passing
>>  - 1 testcase failed due to CRC mismatch
>>    - RAP_A_docomo_6
>>      Analysis - First few frames in this discarded by firmware and are 
>>      sent to driver with 0 filled length. Driver send such buffers to
>>      client with timestamp 0 and payload set to 0 and 
>>      make buf state to VB2_BUF_STATE_ERROR. Such buffers should be 
>>      dropped by GST. But instead, the first frame displayed as green 
>>      frame and when a valid buffer is sent to client later with same 0 
>>      timestamp, its dropped, leading to CRC mismatch for first frame.
> 
> This looks like a firmware bug, even if GStreamer had drop them all,
> the CRC would still miss-match.
> 
I tried to drop the frames with 0 length and ERROR flag and I could confirm
that CRC does match and testcase pass.

> Important question is if this worked on Venus firmware ? If so, it
> sounds like it should be addressed.
> 
Venus firmware has different design than iris, venus fimware doesn't send
these zero length buffer to driver for the discarded frame while iris
firmware does send such frames to driver.
>>
>>  235/305 testcases passed while testing VP9-TEST-VECTORS with 
>>  GStreamer-VP9-V4L2-Gst1.0.
>>  The failing test case:
>>  - 64 testcases failed due to unsupported resolution
>>    - vp90-2-02-size-08x08.webm
>>    - vp90-2-02-size-08x10.webm
>>    - vp90-2-02-size-08x16.webm
>>    - vp90-2-02-size-08x18.webm
>>    - vp90-2-02-size-08x32.webm
>>    - vp90-2-02-size-08x34.webm
>>    - vp90-2-02-size-08x64.webm
>>    - vp90-2-02-size-08x66.webm
>>    - vp90-2-02-size-10x08.webm
>>    - vp90-2-02-size-10x10.webm
>>    - vp90-2-02-size-10x16.webm
>>    - vp90-2-02-size-10x18.webm
>>    - vp90-2-02-size-10x32.webm
>>    - vp90-2-02-size-10x34.webm
>>    - vp90-2-02-size-10x64.webm
>>    - vp90-2-02-size-10x66.webm
>>    - vp90-2-02-size-16x08.webm
>>    - vp90-2-02-size-16x10.webm
>>    - vp90-2-02-size-16x16.webm
>>    - vp90-2-02-size-16x18.webm
>>    - vp90-2-02-size-16x32.webm
>>    - vp90-2-02-size-16x34.webm
>>    - vp90-2-02-size-16x64.webm
>>    - vp90-2-02-size-16x66.webm
>>    - vp90-2-02-size-18x08.webm
>>    - vp90-2-02-size-18x10.webm
>>    - vp90-2-02-size-18x16.webm
>>    - vp90-2-02-size-18x18.webm
>>    - vp90-2-02-size-18x32.webm
>>    - vp90-2-02-size-18x34.webm
>>    - vp90-2-02-size-18x64.webm
>>    - vp90-2-02-size-18x66.webm
>>    - vp90-2-02-size-32x08.webm
>>    - vp90-2-02-size-32x10.webm
>>    - vp90-2-02-size-32x16.webm
>>    - vp90-2-02-size-32x18.webm
>>    - vp90-2-02-size-32x32.webm
>>    - vp90-2-02-size-32x34.webm
>>    - vp90-2-02-size-32x64.webm
>>    - vp90-2-02-size-32x66.webm
>>    - vp90-2-02-size-34x08.webm
>>    - vp90-2-02-size-34x10.webm
>>    - vp90-2-02-size-34x16.webm
>>    - vp90-2-02-size-34x18.webm
>>    - vp90-2-02-size-34x32.webm
>>    - vp90-2-02-size-34x34.webm
>>    - vp90-2-02-size-34x64.webm
>>    - vp90-2-02-size-34x66.webm
>>    - vp90-2-02-size-64x08.webm
>>    - vp90-2-02-size-64x10.webm
>>    - vp90-2-02-size-64x16.webm
>>    - vp90-2-02-size-64x18.webm
>>    - vp90-2-02-size-64x32.webm
>>    - vp90-2-02-size-64x34.webm
>>    - vp90-2-02-size-64x64.webm
>>    - vp90-2-02-size-64x66.webm
>>    - vp90-2-02-size-66x08.webm
>>    - vp90-2-02-size-66x10.webm
>>    - vp90-2-02-size-66x16.webm
>>    - vp90-2-02-size-66x18.webm
>>    - vp90-2-02-size-66x32.webm
>>    - vp90-2-02-size-66x34.webm
>>    - vp90-2-02-size-66x64.webm
>>    - vp90-2-02-size-66x66.webm
>>  - 2 testcases failed due to unsupported format
>>    - vp91-2-04-yuv422.webm
>>    - vp91-2-04-yuv444.webm
>>  - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
>>    - vp90-2-22-svc_1280x720_3.ivf
> 
> Not completely true:
> 
> 	[VP9-TEST-VECTORS] (libvpx-VP9) vp90-2-22-svc_1280x720_3.ivf ... Success
> 
> But fails with the GStreamer libvpx integration. Would you mind filling
> an issue please ? There is clearly a GStreamer bug (not a reference
> one), please document it as-such in the next report.
> 
Sure, raised the bug for this
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371

>>  - 2 testcase failed due to unsupported resolution after sequence change
>>    - vp90-2-21-resize_inter_320x180_5_1-2.webm
>>    - vp90-2-21-resize_inter_320x180_7_1-2.webm
> 
> Just be more precise, inter-frame resolution changes are not currently
> supported in V4L2 stateful decoders. The concept and internals are
> ready though. Basically, userpace would have to progressively re-
> allocate the frames as they get dequeued, before being re-queued. That
> is significant userspace modification, fine to not support it atm.
> 

Sorry for confusion.
What I meant was, there is a source change in the clip from 320,180 to
160,90 -> this is lower than what hardware supports, min supported wxh is 96x96

Which is why client is not able to setup the capture queue and testcase
fails. This is expected behavior for such clips.

>>  - 1 testcase failed due to unsupported stream
>>    - vp90-2-16-intra-only.webm
>>  Note: There is a timing issue with the clips having multiple resolution 
>>  change. Where firmware returned all the buffers with previous sequence 
>>  and has no buffer left to attach the LAST flag to. At the same time,
>>  client is not queueing any further buffers, so there is deadlock where 
>>  client is waiting for LAST flag, while firmware doesn't have any 
>>  capture buffer to attach LAST flag to.
>>  Ideally client should keep queueing the buffers on capture queue untill
>>  the LAST flag is received.
> 
> At least GStreamer do, so I slightly doubt your analyzes (happy to see
> a bug report with relevant demonstration showing that !). I'll read it
> as there is still bug with the resolution change draining process in
> this driver.
> 
Sure, raised the bug with all the details
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4370
>>
>> The result of fluster test on SM8250:
>>  132/147 testcases passed while testing JCT-VC-HEVC_V1 with
>>  GStreamer-H.265-V4L2-Gst1.0.
>>  The failing test case:
>>  - 10 testcases failed due to unsupported 10 bit format.
>>    - DBLK_A_MAIN10_VIXS_4
>>    - INITQP_B_Main10_Sony_1
>>    - TSUNEQBD_A_MAIN10_Technicolor_2
>>    - WP_A_MAIN10_Toshiba_3
>>    - WP_MAIN10_B_Toshiba_3
>>    - WPP_A_ericsson_MAIN10_2
>>    - WPP_B_ericsson_MAIN10_2
>>    - WPP_C_ericsson_MAIN10_2
>>    - WPP_E_ericsson_MAIN10_2
>>    - WPP_F_ericsson_MAIN10_2
>>  - 4 testcase failed due to unsupported resolution
>>    - PICSIZE_A_Bossen_1
>>    - PICSIZE_B_Bossen_1
>>    - WPP_D_ericsson_MAIN10_2
>>    - WPP_D_ericsson_MAIN_2
>>  - 1 testcase failed as bitstream is invalid (this fails with reference
>>    as well)
>>    - RAP_B_Bossen_2
>>
>>  232/305 testcases passed while testing VP9-TEST-VECTORS with
>>  GStreamer-VP9-V4L2-Gst1.0.
>>  The failing test case:
>>  - 64 testcases failed due to unsupported resolution
>>    - vp90-2-02-size-08x08.webm
>>    - vp90-2-02-size-08x10.webm
>>    - vp90-2-02-size-08x16.webm
>>    - vp90-2-02-size-08x18.webm
>>    - vp90-2-02-size-08x32.webm
>>    - vp90-2-02-size-08x34.webm
>>    - vp90-2-02-size-08x64.webm
>>    - vp90-2-02-size-08x66.webm
>>    - vp90-2-02-size-10x08.webm
>>    - vp90-2-02-size-10x10.webm
>>    - vp90-2-02-size-10x16.webm
>>    - vp90-2-02-size-10x18.webm
>>    - vp90-2-02-size-10x32.webm
>>    - vp90-2-02-size-10x34.webm
>>    - vp90-2-02-size-10x64.webm
>>    - vp90-2-02-size-10x66.webm
>>    - vp90-2-02-size-16x08.webm
>>    - vp90-2-02-size-16x10.webm
>>    - vp90-2-02-size-16x16.webm
>>    - vp90-2-02-size-16x18.webm
>>    - vp90-2-02-size-16x32.webm
>>    - vp90-2-02-size-16x34.webm
>>    - vp90-2-02-size-16x64.webm
>>    - vp90-2-02-size-16x66.webm
>>    - vp90-2-02-size-18x08.webm
>>    - vp90-2-02-size-18x10.webm
>>    - vp90-2-02-size-18x16.webm
>>    - vp90-2-02-size-18x18.webm
>>    - vp90-2-02-size-18x32.webm
>>    - vp90-2-02-size-18x34.webm
>>    - vp90-2-02-size-18x64.webm
>>    - vp90-2-02-size-18x66.webm
>>    - vp90-2-02-size-32x08.webm
>>    - vp90-2-02-size-32x10.webm
>>    - vp90-2-02-size-32x16.webm
>>    - vp90-2-02-size-32x18.webm
>>    - vp90-2-02-size-32x32.webm
>>    - vp90-2-02-size-32x34.webm
>>    - vp90-2-02-size-32x64.webm
>>    - vp90-2-02-size-32x66.webm
>>    - vp90-2-02-size-34x08.webm
>>    - vp90-2-02-size-34x10.webm
>>    - vp90-2-02-size-34x16.webm
>>    - vp90-2-02-size-34x18.webm
>>    - vp90-2-02-size-34x32.webm
>>    - vp90-2-02-size-34x34.webm
>>    - vp90-2-02-size-34x64.webm
>>    - vp90-2-02-size-34x66.webm
>>    - vp90-2-02-size-64x08.webm
>>    - vp90-2-02-size-64x10.webm
>>    - vp90-2-02-size-64x16.webm
>>    - vp90-2-02-size-64x18.webm
>>    - vp90-2-02-size-64x32.webm
>>    - vp90-2-02-size-64x34.webm
>>    - vp90-2-02-size-64x64.webm
>>    - vp90-2-02-size-64x66.webm
>>    - vp90-2-02-size-66x08.webm
>>    - vp90-2-02-size-66x10.webm
>>    - vp90-2-02-size-66x16.webm
>>    - vp90-2-02-size-66x18.webm
>>    - vp90-2-02-size-66x32.webm
>>    - vp90-2-02-size-66x34.webm
>>    - vp90-2-02-size-66x64.webm
>>    - vp90-2-02-size-66x66.webm
>>  - 2 testcases failed due to unsupported format
>>    - vp91-2-04-yuv422.webm
>>    - vp91-2-04-yuv444.webm
>>  - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
>>    - vp90-2-22-svc_1280x720_3.ivf
>>  - 5 testcase failed due to unsupported resolution after sequence change
>>    - vp90-2-21-resize_inter_320x180_5_1-2.webm
>>    - vp90-2-21-resize_inter_320x180_7_1-2.webm
>>    - vp90-2-21-resize_inter_320x240_5_1-2.webm
>>    - vp90-2-21-resize_inter_320x240_7_1-2.webm
>>    - vp90-2-18-resize.ivf
>>  - 1 testcase failed with CRC mismatch
>>    - vp90-2-16-intra-only.webm
>>    Analysis: First few frames are marked by firmware as NO_SHOW frame.
>>    Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>>    Such buffers should be dropped by GST. But instead, the first frame 
>>    is being displayed and when a valid buffer is sent to client later
>>    with same timestamp, its dropped, leading to CRC mismatch for first 
>>    frame.
> 
> I checked this one, 3 first frame are "decode only" indeed. Though, by
> returning these buffer with STATE_ERROR, you loose the ability to show
> these frame later. GStreamer should be fixed to do internal ref frame
> management, not silently drop these though.
> 
> What you can do instead, is leave these frames queued, and only mark
> them done once you hit a matching show_existing_frame. It will fix this
> specific stream (and most usage of show existing frame in the wild),
> but show-existing frame will remain broken. The other solution is to
> keep the reference frame internal, and output copies, but that imply
> some HW design, and also cost quite a lot in bandwidth.
> 
> This test hits the known V4L2 queue limitation that it can only output
> a frame once, and can only input a frame once (you cannot encode twice
> the same frame notably). I open to suggestion how to fix those, but I
> don't have any solutions for now.
> 
I am also checking with firmware team internally on any approach to handle
such use-cases.

Thanks,
Dikshita
> p.s. a third solution is make the firmware stateless :-D
> 
>>  Note: Same timing issue as observed on SM8550 is seen on SM8250 as 
>>  well.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>> Dikshita Agarwal (20):
>>       media: iris: Skip destroying internal buffer if not dequeued
>>       media: iris: Update CAPTURE format info based on OUTPUT format
>>       media: iris: Add handling for corrupt and drop frames
>>       media: iris: Avoid updating frame size to firmware during reconfig
>>       media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>>       media: iris: Add handling for no show frames
>>       media: iris: Improve last flag handling
>>       media: iris: Skip flush on first sequence change
>>       media: iris: Prevent HFI queue writes when core is in deinit state
>>       media: iris: Remove redundant buffer count check in stream off
>>       media: iris: Remove deprecated property setting to firmware
>>       media: iris: Fix missing function pointer initialization
>>       media: iris: Fix NULL pointer dereference
>>       media: iris: Fix typo in depth variable
>>       media: iris: Add a comment to explain usage of MBPS
>>       media: iris: Add HEVC and VP9 formats for decoder
>>       media: iris: Add platform capabilities for HEVC and VP9 decoders
>>       media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>       media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>>       media: iris: Add codec specific check for VP9 decoder drain handling
>>
>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  22 +-
>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  44 ++-
>>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  22 +-
>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>  drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>  .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>  .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>  .../platform/qcom/iris/iris_platform_sm8550.c      | 143 +++++++-
>>  drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +-
>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 113 +++---
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>  20 files changed, 948 insertions(+), 153 deletions(-)
>> ---
>> base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
>> change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d
>>
>> Best regards,

