Return-Path: <linux-media+bounces-32123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1655FAB1063
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2941EA06CBF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202A928EA45;
	Fri,  9 May 2025 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cmLqk4FQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1563E27466F;
	Fri,  9 May 2025 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785704; cv=none; b=auC4uOFB9u4A7NR0AjZudOYFMmmamtQj4bNwqmAq+vwMxZ6mwK9e/m67H/WHq30WfVdDwthdhIYw7O0PqN0t++6s1stxP5SxN7oYaNF11cfbjJl5k91Pk7KSae5m5VYq6+nEKlwAtHl0i/ZdgfQTaku1jLRS4M3ecvoxbLtVs5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785704; c=relaxed/simple;
	bh=zxQu48Kq/hRF1zS28G5QiRU7GwVnqoghBnpivOxcoM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Joo4R4zKYuaigIhv9rt+TTGzOfJjZftior/s/AAYDeX2XlTrplfq/pfGC4HPZ/O/OXkDmbQ9w2EYAu7/oFV3ANOhuZhhdwoATzVQ72zEIjcVF1kfsZk8535ZQl15uH0Q7h6KVPrr4YlhFed8i3DLzqcib4ZzcHWiTLqpHz+PfgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cmLqk4FQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492i3O1016663;
	Fri, 9 May 2025 10:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WA5bvh1QmRWT1B//T7K/FlcwxuQd06j2MHRfAfFUhNk=; b=cmLqk4FQnVEV4DEf
	mfF9HejoqKlLpA0Kvfksa+jRmVlBsNBCzXaTy3XFeU4LYN56WNmScS7RgvMIsoC2
	sMdm0at4g8+Xl6pkmhxdyaS4eIMaMQOuqbAmQCiuAzb0kfU4wFxXpa4ZzkTE5Kao
	WEKDmUi3j5oqn+DTxTsqq3h1421jZJycI6CJ2n/OfmCx5166XuT5zzvsPuD0ahud
	B7sMX53hyopneX0iCjfdGBiCvDKMoNx89NOpBUU+M8fR9sbIXYCmNYE2J3gi7RDj
	O0p32u9KWobJjD1v8g8akiqJUUfG8vUlGzCPnQkqNVcqBPJcV2JLK4o4t414i6Fa
	AdnLkg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8v8a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 10:14:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549AEsln008167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 10:14:54 GMT
Received: from [10.50.48.67] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 03:14:49 -0700
Message-ID: <13f63e39-9716-86a4-cba3-d287fb8b5928@quicinc.com>
Date: Fri, 9 May 2025 15:44:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 00/26] Add support for HEVC and VP9 codecs in decoder
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, <stable@vger.kernel.org>
References: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250509-video-iris-hevc-vp9-v5-0-59b4ff7d331c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -gCCBiatCcoxsw4El-XzhrHqs2b5bXY7
X-Proofpoint-ORIG-GUID: -gCCBiatCcoxsw4El-XzhrHqs2b5bXY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5OCBTYWx0ZWRfX9KDX64wCQk4A
 5XoNuAsrcaEmGlkPF2ZrG9iLQhDhOspgKbh1AfOStWeBuXQ4wp4bf5Wx0V5tDqbfUpbspfccgzV
 FjDB1W5TtmoKGV6Hrbac1FrJb7i+NRumdEOJDvQSLPP8jaY7ez7zTDcBMNKm7LrsyBjhiSKcTY9
 voxRgnjTl5HCx+qicbjXV6QZNSFHwm2SLhKdrVsrSPIeJd+ROletgl9oE4K4y4yjpvGmibuX4zQ
 snz/ijsv2Fi62CgDwoYz2JAptnSk4Oem/ackgDLc+Zlr145uBW5xKkxoWVI/FNkbYhTCHSnTVfE
 GsWOleG1JXCZxEOAggMeujGxrPUImtbJvL3xkkRivJp2fYTmWh3rmaDUpy9/U+AdYobkGJg6Ep5
 EaiBcCFq9Hq201RPlL3iVOuPb+DvyWOgSgR0jCvY1bGtCK5pdpIMdy78rl8xV/M2DFxlaacJ
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681dd59f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=xOd6jRPJAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=2t6H7hArUkWbbcs1qwUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090098


On 5/9/2025 2:08 PM, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds initial support for the HEVC(H.265) and VP9
> codecs in iris decoder. The objective of this work is to extend the 
> decoder's capabilities to handle HEVC and VP9 codec streams,
> including necessary format handling and buffer management.
> In addition, the series also includes a set of fixes to address issues
> identified during testing of these additional codecs.
> 
> These patches also address the comments and feedback received from the 
> RFC patches previously sent. I have made the necessary improvements 
> based on the community's suggestions.
> 
> Changes in v5:
> - Splitted patch 01/25 in two patches (Bryan)
> - Link to v4: https://lore.kernel.org/r/20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com
> 
> Changes in v4:
> - Splitted patch patch 06/23 in two patches (Bryan)
> - Simplified the conditional logic in patch 13/23 (Bryan)
> - Improved commit description for patch patch 13/23 (Nicolas)
> - Fix the value of H265_NUM_TILE_ROW macro (Neil)
> - Link to v3: https://lore.kernel.org/r/20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com
> 
> Changes in v3:
> - Introduced two wrappers with explicit names to handle destroy internal 
> buffers (Nicolas)
> - Used sub state check instead of introducing new boolean (Vikash)
> - Addressed other comments (Vikash)
> - Reorderd patches to have all fixes patches first (Dmitry)
> - Link to v2: 
> https://lore.kernel.org/r/20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com
> 
> Changes in v2:
> - Added Changes to make sure all buffers are released in session close 
> (bryna)
> - Added tracking for flush responses to fix a timing issue.
> - Added a handling to fix timing issue in reconfig
> - Splitted patch 06/20 in two patches (Bryan)
> - Added missing fixes tag (bryan)
> - Updated fluster report (Nicolas)
> - Link to v1: 
> https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com
> 
> Changes sinces RFC:
> - Added additional fixes to address issues identified during further 
> testing.
> - Moved typo fix to a seperate patch [Neil]
> - Reordered the patches for better logical flow and clarity [Neil, 
> Dmitry]
> - Added fixes tag wherever applicable [Neil, Dmitry]
> - Removed the default case in the switch statement for codecs [Bryan]
> - Replaced if-else statements with switch-case [Bryan]
> - Added comments for mbpf [Bryan]
> - RFC: 
> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
> 
> These patches are tested on SM8250 and SM8550 with v4l2-ctl and 
> Gstreamer for HEVC and VP9 decoders, at the same time ensured that 
> the existing H264 decoder functionality remains uneffected.
> 
> Note: 1 of the fluster compliance test is fixed with firmware [3]
> [3]: 
> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u 
> 
> The result of fluster test on SM8550:
>  131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
>  GStreamer-H.265-V4L2-Gst1.0.
>  The failing test case:
>  - 10 testcases failed due to unsupported 10 bit format.
>    - DBLK_A_MAIN10_VIXS_4
>    - INITQP_B_Main10_Sony_1
>    - TSUNEQBD_A_MAIN10_Technicolor_2
>    - WP_A_MAIN10_Toshiba_3
>    - WP_MAIN10_B_Toshiba_3
>    - WPP_A_ericsson_MAIN10_2
>    - WPP_B_ericsson_MAIN10_2
>    - WPP_C_ericsson_MAIN10_2
>    - WPP_E_ericsson_MAIN10_2
>    - WPP_F_ericsson_MAIN10_2
>  - 4 testcase failed due to unsupported resolution
>    - PICSIZE_A_Bossen_1
>    - PICSIZE_B_Bossen_1
>    - WPP_D_ericsson_MAIN10_2
>    - WPP_D_ericsson_MAIN_2 
>  - 2 testcase failed due to CRC mismatch
>    - RAP_A_docomo_6
>    - RAP_B_Bossen_2
>    - BUG reported: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
>      Analysis - First few frames in this discarded by firmware and are 
>      sent to driver with 0 filled length. Driver send such buffers to 
>      client with timestamp 0 and payload set to 0 and 
>      make buf state to VB2_BUF_STATE_ERROR. Such buffers should be 
>      dropped by GST. But instead, the first frame displayed as green 
>      frame and when a valid buffer is sent to client later with same 0 
>      timestamp, its dropped, leading to CRC mismatch for first frame.
> 
>  235/305 testcases passed while testing VP9-TEST-VECTORS with 
>  GStreamer-VP9-V4L2-Gst1.0.
>  The failing test case:
>  - 64 testcases failed due to unsupported resolution
>    - vp90-2-02-size-08x08.webm
>    - vp90-2-02-size-08x10.webm
>    - vp90-2-02-size-08x16.webm
>    - vp90-2-02-size-08x18.webm
>    - vp90-2-02-size-08x32.webm
>    - vp90-2-02-size-08x34.webm
>    - vp90-2-02-size-08x64.webm
>    - vp90-2-02-size-08x66.webm
>    - vp90-2-02-size-10x08.webm
>    - vp90-2-02-size-10x10.webm
>    - vp90-2-02-size-10x16.webm
>    - vp90-2-02-size-10x18.webm
>    - vp90-2-02-size-10x32.webm
>    - vp90-2-02-size-10x34.webm
>    - vp90-2-02-size-10x64.webm
>    - vp90-2-02-size-10x66.webm
>    - vp90-2-02-size-16x08.webm
>    - vp90-2-02-size-16x10.webm
>    - vp90-2-02-size-16x16.webm
>    - vp90-2-02-size-16x18.webm
>    - vp90-2-02-size-16x32.webm
>    - vp90-2-02-size-16x34.webm
>    - vp90-2-02-size-16x64.webm
>    - vp90-2-02-size-16x66.webm
>    - vp90-2-02-size-18x08.webm
>    - vp90-2-02-size-18x10.webm
>    - vp90-2-02-size-18x16.webm
>    - vp90-2-02-size-18x18.webm
>    - vp90-2-02-size-18x32.webm
>    - vp90-2-02-size-18x34.webm
>    - vp90-2-02-size-18x64.webm
>    - vp90-2-02-size-18x66.webm
>    - vp90-2-02-size-32x08.webm
>    - vp90-2-02-size-32x10.webm
>    - vp90-2-02-size-32x16.webm
>    - vp90-2-02-size-32x18.webm
>    - vp90-2-02-size-32x32.webm
>    - vp90-2-02-size-32x34.webm
>    - vp90-2-02-size-32x64.webm
>    - vp90-2-02-size-32x66.webm
>    - vp90-2-02-size-34x08.webm
>    - vp90-2-02-size-34x10.webm
>    - vp90-2-02-size-34x16.webm
>    - vp90-2-02-size-34x18.webm
>    - vp90-2-02-size-34x32.webm
>    - vp90-2-02-size-34x34.webm
>    - vp90-2-02-size-34x64.webm
>    - vp90-2-02-size-34x66.webm
>    - vp90-2-02-size-64x08.webm
>    - vp90-2-02-size-64x10.webm
>    - vp90-2-02-size-64x16.webm
>    - vp90-2-02-size-64x18.webm
>    - vp90-2-02-size-64x32.webm
>    - vp90-2-02-size-64x34.webm
>    - vp90-2-02-size-64x64.webm
>    - vp90-2-02-size-64x66.webm
>    - vp90-2-02-size-66x08.webm
>    - vp90-2-02-size-66x10.webm
>    - vp90-2-02-size-66x16.webm
>    - vp90-2-02-size-66x18.webm
>    - vp90-2-02-size-66x32.webm
>    - vp90-2-02-size-66x34.webm
>    - vp90-2-02-size-66x64.webm
>    - vp90-2-02-size-66x66.webm
>  - 2 testcases failed due to unsupported format
>    - vp91-2-04-yuv422.webm
>    - vp91-2-04-yuv444.webm
>  - 1 testcase failed with CRC mismatch
>    - vp90-2-22-svc_1280x720_3.ivf
>    - Bug reported: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>  - 2 testcase failed due to unsupported resolution after sequence change
>    - vp90-2-21-resize_inter_320x180_5_1-2.webm
>    - vp90-2-21-resize_inter_320x180_7_1-2.webm
>  - 1 testcase failed due to unsupported stream
>    - vp90-2-16-intra-only.webm
> 
> The result of fluster test on SM8250:
>  133/147 testcases passed while testing JCT-VC-HEVC_V1 with
>  GStreamer-H.265-V4L2-Gst1.0.
>  The failing test case:
>  - 10 testcases failed due to unsupported 10 bit format.
>    - DBLK_A_MAIN10_VIXS_4
>    - INITQP_B_Main10_Sony_1
>    - TSUNEQBD_A_MAIN10_Technicolor_2
>    - WP_A_MAIN10_Toshiba_3
>    - WP_MAIN10_B_Toshiba_3
>    - WPP_A_ericsson_MAIN10_2
>    - WPP_B_ericsson_MAIN10_2
>    - WPP_C_ericsson_MAIN10_2
>    - WPP_E_ericsson_MAIN10_2
>    - WPP_F_ericsson_MAIN10_2
>  - 4 testcase failed due to unsupported resolution
>    - PICSIZE_A_Bossen_1
>    - PICSIZE_B_Bossen_1
>    - WPP_D_ericsson_MAIN10_2
>    - WPP_D_ericsson_MAIN_2
> 
>  232/305 testcases passed while testing VP9-TEST-VECTORS with
>  GStreamer-VP9-V4L2-Gst1.0.
>  The failing test case:
>  - 64 testcases failed due to unsupported resolution
>    - vp90-2-02-size-08x08.webm
>    - vp90-2-02-size-08x10.webm
>    - vp90-2-02-size-08x16.webm
>    - vp90-2-02-size-08x18.webm
>    - vp90-2-02-size-08x32.webm
>    - vp90-2-02-size-08x34.webm
>    - vp90-2-02-size-08x64.webm
>    - vp90-2-02-size-08x66.webm
>    - vp90-2-02-size-10x08.webm
>    - vp90-2-02-size-10x10.webm
>    - vp90-2-02-size-10x16.webm
>    - vp90-2-02-size-10x18.webm
>    - vp90-2-02-size-10x32.webm
>    - vp90-2-02-size-10x34.webm
>    - vp90-2-02-size-10x64.webm
>    - vp90-2-02-size-10x66.webm
>    - vp90-2-02-size-16x08.webm
>    - vp90-2-02-size-16x10.webm
>    - vp90-2-02-size-16x16.webm
>    - vp90-2-02-size-16x18.webm
>    - vp90-2-02-size-16x32.webm
>    - vp90-2-02-size-16x34.webm
>    - vp90-2-02-size-16x64.webm
>    - vp90-2-02-size-16x66.webm
>    - vp90-2-02-size-18x08.webm
>    - vp90-2-02-size-18x10.webm
>    - vp90-2-02-size-18x16.webm
>    - vp90-2-02-size-18x18.webm
>    - vp90-2-02-size-18x32.webm
>    - vp90-2-02-size-18x34.webm
>    - vp90-2-02-size-18x64.webm
>    - vp90-2-02-size-18x66.webm
>    - vp90-2-02-size-32x08.webm
>    - vp90-2-02-size-32x10.webm
>    - vp90-2-02-size-32x16.webm
>    - vp90-2-02-size-32x18.webm
>    - vp90-2-02-size-32x32.webm
>    - vp90-2-02-size-32x34.webm
>    - vp90-2-02-size-32x64.webm
>    - vp90-2-02-size-32x66.webm
>    - vp90-2-02-size-34x08.webm
>    - vp90-2-02-size-34x10.webm
>    - vp90-2-02-size-34x16.webm
>    - vp90-2-02-size-34x18.webm
>    - vp90-2-02-size-34x32.webm
>    - vp90-2-02-size-34x34.webm
>    - vp90-2-02-size-34x64.webm
>    - vp90-2-02-size-34x66.webm
>    - vp90-2-02-size-64x08.webm
>    - vp90-2-02-size-64x10.webm
>    - vp90-2-02-size-64x16.webm
>    - vp90-2-02-size-64x18.webm
>    - vp90-2-02-size-64x32.webm
>    - vp90-2-02-size-64x34.webm
>    - vp90-2-02-size-64x64.webm
>    - vp90-2-02-size-64x66.webm
>    - vp90-2-02-size-66x08.webm
>    - vp90-2-02-size-66x10.webm
>    - vp90-2-02-size-66x16.webm
>    - vp90-2-02-size-66x18.webm
>    - vp90-2-02-size-66x32.webm
>    - vp90-2-02-size-66x34.webm
>    - vp90-2-02-size-66x64.webm
>    - vp90-2-02-size-66x66.webm
>  - 2 testcases failed due to unsupported format
>    - vp91-2-04-yuv422.webm
>    - vp91-2-04-yuv444.webm
>  - 1 testcase failed with CRC mismatch
>    - vp90-2-22-svc_1280x720_3.ivf
>    - Bug raised: 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>  - 5 testcase failed due to unsupported resolution after sequence change
>    - vp90-2-21-resize_inter_320x180_5_1-2.webm
>    - vp90-2-21-resize_inter_320x180_7_1-2.webm
>    - vp90-2-21-resize_inter_320x240_5_1-2.webm
>    - vp90-2-21-resize_inter_320x240_7_1-2.webm
>    - vp90-2-18-resize.ivf
>  - 1 testcase failed with CRC mismatch
>    - vp90-2-16-intra-only.webm
>    Analysis: First few frames are marked by firmware as NO_SHOW frame.
>    Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>    Such buffers should be dropped by GST. But instead, the first frame 
>    is being displayed and when a valid buffer is sent to client later
>    with same timestamp, its dropped, leading to CRC mismatch for first 
>    frame.
> 
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Stefan Schmidt <stefan.schmidt@linaro.org>
> To: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (26):
>       media: iris: Skip destroying internal buffer if not dequeued
>       media: iris: Verify internal buffer release on close
>       media: iris: Update CAPTURE format info based on OUTPUT format
>       media: iris: Avoid updating frame size to firmware during reconfig
>       media: iris: Drop port check for session property response
>       media: iris: Prevent HFI queue writes when core is in deinit state
>       media: iris: Remove error check for non-zero v4l2 controls
>       media: iris: Remove deprecated property setting to firmware
>       media: iris: Fix missing function pointer initialization
>       media: iris: Fix NULL pointer dereference
>       media: iris: Fix typo in depth variable
>       media: iris: Track flush responses to prevent premature completion
>       media: iris: Fix buffer preparation failure during resolution change
>       media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length
>       media: iris: Skip flush on first sequence change
>       media: iris: Remove unnecessary re-initialization of flush completion
>       media: iris: Add handling for corrupt and drop frames
>       media: iris: Add handling for no show frames
>       media: iris: Improve last flag handling
>       media: iris: Remove redundant buffer count check in stream off
>       media: iris: Add a comment to explain usage of MBPS
>       media: iris: Add HEVC and VP9 formats for decoder
>       media: iris: Add platform capabilities for HEVC and VP9 decoders
>       media: iris: Set mandatory properties for HEVC and VP9 decoders.
>       media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>       media: iris: Add codec specific check for VP9 decoder drain handling
> 
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  35 +-
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  37 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  56 ++-
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>  drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>  .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
>  .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>  drivers/media/platform/qcom/iris/iris_state.c      |   2 +-
>  drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 116 +++---
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>  24 files changed, 1159 insertions(+), 211 deletions(-)
> ---
> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
> change-id: 20250508-video-iris-hevc-vp9-bd35d588500f

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # on sa8775p-ride
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # on qcs8300-ride

