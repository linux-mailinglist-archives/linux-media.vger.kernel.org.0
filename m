Return-Path: <linux-media+bounces-31154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B77A9ECAA
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6C0D1882EE4
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475001632DD;
	Mon, 28 Apr 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IdJnQfvk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE525F7A4;
	Mon, 28 Apr 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832586; cv=none; b=AeYAK3eO4c9f/G2ex7pGfdofORRQAW3Sli88EA1sF55bKEvN8jM/tc6nQuKjAQPJvWz3oszzjF+VSUsxOjcT+EjXGYb5FnHTuBJJDsplXLlBetHl8vVfrznZ6vErHhbGIq48YYfSSfb76Y1l0cPhAFB3mPbIgTy1h0rwYR++sQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832586; c=relaxed/simple;
	bh=4ro920v1aAqEvS6v4QONEIT9SmE9WBFvuHC8MXH2IiA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=vB8xl1FBz90k+OdS2e/4bGym1fK9wlvgR5+4xIqRVRAYeP+vuLqLAclMf7FBRQoXZy4AO0Ur9GirsGvfNi2C5EqlGNn/bXZ915nBeIdQMv+UqLAGv1TLgtTieW/ryy8CJkk2smSErHY/yepQSufq2rnQR8lDSngFj89mtLETHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IdJnQfvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6a73f022474;
	Mon, 28 Apr 2025 09:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bx3Q4WFp8LOXo/tGyprnYc
	g3bKCz9Ob2WclvM87Dpyo=; b=IdJnQfvkokzNvgRUyiiMSoy4Mi9X8zOVez498Z
	1j7Vycwe2oIJqp2jxaBQFtCgYv9S2Hm910wWObVu+953UfKbUFngfdgkU8OhrMm0
	aUxYuH/ehf/LR37a1Ne7TwsgwLai64xdM5DiLru6/qvqp4rrRtLfFtDzheCnNSD3
	I3+zl7eCiIY5CZgK5PxGwVLjzENkR9UpiHj1AoCaL34wtL3drX4ZUk2HJEzcnleU
	Glsm8VuzqLfK4SPEfAU+1pLpSmCHG6rlvkba85bg3Sr+cX2nXTToNH+sUKdKVgaB
	kIUvTryLTvaW6L566RjW1oTe2k48bOtvmbGLRDNDi/9axJpA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmyfc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:29:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S9TbGM019470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 09:29:37 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Apr 2025 02:29:31 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v2 00/23] Add support for HEVC and VP9 codecs in decoder
Date: Mon, 28 Apr 2025 14:58:48 +0530
Message-ID: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBKD2gC/22Py2rDMBBFf8Vo3QkjyaolU0r+I4Qgj0eJoH5Ec
 k0g5N+r2Nsuz4U5985TZE6Rs2irp0i8xhynsYD6qATd/HhliH1hoVAZrJWFO00DxBQz3HglWGc
 H3GkZNJLWDkU5nBOH+Nikp/POie+/xb3soRg4Z7+52+prV8sGlmmOBHmwD4N7xSoR1gYQAiqkT
 vbIzh5/4ujTdJjS9ftd949M1WVnthrxsnvM2yGlDQYNlfhY5lAc6VC+2SSdzwwFhri0lXbWy07
 rIOvG+aANeScNGQ7kOsT+U2EdbPDi/Hr9Af7538xCAQAA
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832570; l=14316;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=4ro920v1aAqEvS6v4QONEIT9SmE9WBFvuHC8MXH2IiA=;
 b=JO1HR2WxWsOl9lLSNRbHHBctrocEnoqx0MB+tstrbyCFbqVnzh/mnpc46PwmMKHTiGVBKs2Z8
 4XyH5xUvcGTAMWjkBxYImsY7YSP5rc2shAVogoUi2w5z5pF5qdG713w
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GSPIvmGvAHN7YbjQSKxl4yuHcb_nNla0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA3OCBTYWx0ZWRfX5JGY1izBAqYI 5wXjsictjHDfwzrTlDC0MJGa9y22ImxxfsTmfsGdpVD2PoD5GGqxAdKPvDirVEOJhvbEK4049OU 5sYriJvqKdIpdGUtK7PrCNmlpmjSNWH1fZBFH9/anc6+JM/kwjBTV9a+IOZjbW8WBC0vURXlD8k
 7cvNNrd03MGWBnmGZGf5S++tkuVWrpkR8AnMfwDHRJQL6c8oX7LtXUzzlcGS/x1drddbNmYgZtk zQXN/fwRz6hF3W/TghfG7noHS23hbeAxzf3MlnM4tPjIJY6CBwTfZmA6zu2+S5sic9CYUeCqys4 skyp08vm6HupPSQcd4CpryS55vj4mDfKB5rKetB1mjXW8JnRBWtQfBPyn00dR+7wW6u9ZyR+fcx
 I1vHRkhgNJiQqS2LYdHrf0DFm6O8As12D6IlomrcSw4xbBcfXi3Bn8DAxn396R8LMY4qFvsD
X-Proofpoint-GUID: GSPIvmGvAHN7YbjQSKxl4yuHcb_nNla0
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f4a82 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=x1_dW0rikMPTmAfqnIoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280078

Hi All,

This patch series adds initial support for the HEVC(H.265) and VP9
codecs in iris decoder. The objective of this work is to extend the 
decoder's capabilities to handle HEVC and VP9 codec streams,
including necessary format handling and buffer management.
In addition, the series also includes a set of fixes to address issues
identified during testing of these additional codecs.

These patches also address the comments and feedback received from the 
RFC patches previously sent. I have made the necessary improvements 
based on the community's suggestions.

Changes in v2:
- Added Changes to make sure all buffers are released in session close 
(bryna)
- Added tracking for flush responses to fix a timing issue.
- Added a handling to fix timing issue in reconfig
- Splitted patch 06/20 in two patches (Bryan)
- Added missing fixes tag (bryan)
- Updated fluster report (Nicolas)
- Link to v1: 
https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com

Changes sinces RFC:
- Added additional fixes to address issues identified during further 
testing.
- Moved typo fix to a seperate patch [Neil]
- Reordered the patches for better logical flow and clarity [Neil, 
Dmitry]
- Added fixes tag wherever applicable [Neil, Dmitry]
- Removed the default case in the switch statement for codecs [Bryan]
- Replaced if-else statements with switch-case [Bryan]
- Added comments for mbpf [Bryan]
- RFC: 
https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/

This patch series depends on [1] & [2]
[1] https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org/
[2] https://lore.kernel.org/linux-media/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com/

These patches are tested on SM8250 and SM8550 with v4l2-ctl and 
Gstreamer for HEVC and VP9 decoders, at the same time ensured that 
the existing H264 decoder functionality remains uneffected.

Note: 1 of the fluster compliance test is fixed with firmware [3]
[3]: 
https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u 

The result of fluster test on SM8550:
 131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
 GStreamer-H.265-V4L2-Gst1.0.
 The failing test case:
 - 10 testcases failed due to unsupported 10 bit format.
   - DBLK_A_MAIN10_VIXS_4
   - INITQP_B_Main10_Sony_1
   - TSUNEQBD_A_MAIN10_Technicolor_2
   - WP_A_MAIN10_Toshiba_3
   - WP_MAIN10_B_Toshiba_3
   - WPP_A_ericsson_MAIN10_2
   - WPP_B_ericsson_MAIN10_2
   - WPP_C_ericsson_MAIN10_2
   - WPP_E_ericsson_MAIN10_2
   - WPP_F_ericsson_MAIN10_2
 - 4 testcase failed due to unsupported resolution
   - PICSIZE_A_Bossen_1
   - PICSIZE_B_Bossen_1
   - WPP_D_ericsson_MAIN10_2
   - WPP_D_ericsson_MAIN_2 
 - 2 testcase failed due to CRC mismatch
   - RAP_A_docomo_6
   - RAP_B_Bossen_2
   - BUG reported: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
     Analysis - First few frames in this discarded by firmware and are 
     sent to driver with 0 filled length. Driver send such buffers to 
     client with timestamp 0 and payload set to 0 and 
     make buf state to VB2_BUF_STATE_ERROR. Such buffers should be 
     dropped by GST. But instead, the first frame displayed as green 
     frame and when a valid buffer is sent to client later with same 0 
     timestamp, its dropped, leading to CRC mismatch for first frame.

 235/305 testcases passed while testing VP9-TEST-VECTORS with 
 GStreamer-VP9-V4L2-Gst1.0.
 The failing test case:
 - 64 testcases failed due to unsupported resolution
   - vp90-2-02-size-08x08.webm
   - vp90-2-02-size-08x10.webm
   - vp90-2-02-size-08x16.webm
   - vp90-2-02-size-08x18.webm
   - vp90-2-02-size-08x32.webm
   - vp90-2-02-size-08x34.webm
   - vp90-2-02-size-08x64.webm
   - vp90-2-02-size-08x66.webm
   - vp90-2-02-size-10x08.webm
   - vp90-2-02-size-10x10.webm
   - vp90-2-02-size-10x16.webm
   - vp90-2-02-size-10x18.webm
   - vp90-2-02-size-10x32.webm
   - vp90-2-02-size-10x34.webm
   - vp90-2-02-size-10x64.webm
   - vp90-2-02-size-10x66.webm
   - vp90-2-02-size-16x08.webm
   - vp90-2-02-size-16x10.webm
   - vp90-2-02-size-16x16.webm
   - vp90-2-02-size-16x18.webm
   - vp90-2-02-size-16x32.webm
   - vp90-2-02-size-16x34.webm
   - vp90-2-02-size-16x64.webm
   - vp90-2-02-size-16x66.webm
   - vp90-2-02-size-18x08.webm
   - vp90-2-02-size-18x10.webm
   - vp90-2-02-size-18x16.webm
   - vp90-2-02-size-18x18.webm
   - vp90-2-02-size-18x32.webm
   - vp90-2-02-size-18x34.webm
   - vp90-2-02-size-18x64.webm
   - vp90-2-02-size-18x66.webm
   - vp90-2-02-size-32x08.webm
   - vp90-2-02-size-32x10.webm
   - vp90-2-02-size-32x16.webm
   - vp90-2-02-size-32x18.webm
   - vp90-2-02-size-32x32.webm
   - vp90-2-02-size-32x34.webm
   - vp90-2-02-size-32x64.webm
   - vp90-2-02-size-32x66.webm
   - vp90-2-02-size-34x08.webm
   - vp90-2-02-size-34x10.webm
   - vp90-2-02-size-34x16.webm
   - vp90-2-02-size-34x18.webm
   - vp90-2-02-size-34x32.webm
   - vp90-2-02-size-34x34.webm
   - vp90-2-02-size-34x64.webm
   - vp90-2-02-size-34x66.webm
   - vp90-2-02-size-64x08.webm
   - vp90-2-02-size-64x10.webm
   - vp90-2-02-size-64x16.webm
   - vp90-2-02-size-64x18.webm
   - vp90-2-02-size-64x32.webm
   - vp90-2-02-size-64x34.webm
   - vp90-2-02-size-64x64.webm
   - vp90-2-02-size-64x66.webm
   - vp90-2-02-size-66x08.webm
   - vp90-2-02-size-66x10.webm
   - vp90-2-02-size-66x16.webm
   - vp90-2-02-size-66x18.webm
   - vp90-2-02-size-66x32.webm
   - vp90-2-02-size-66x34.webm
   - vp90-2-02-size-66x64.webm
   - vp90-2-02-size-66x66.webm
 - 2 testcases failed due to unsupported format
   - vp91-2-04-yuv422.webm
   - vp91-2-04-yuv444.webm
 - 1 testcase failed with CRC mismatch
   - vp90-2-22-svc_1280x720_3.ivf
   - Bug reported: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
 - 2 testcase failed due to unsupported resolution after sequence change
   - vp90-2-21-resize_inter_320x180_5_1-2.webm
   - vp90-2-21-resize_inter_320x180_7_1-2.webm
 - 1 testcase failed due to unsupported stream
   - vp90-2-16-intra-only.webm

The result of fluster test on SM8250:
 133/147 testcases passed while testing JCT-VC-HEVC_V1 with
 GStreamer-H.265-V4L2-Gst1.0.
 The failing test case:
 - 10 testcases failed due to unsupported 10 bit format.
   - DBLK_A_MAIN10_VIXS_4
   - INITQP_B_Main10_Sony_1
   - TSUNEQBD_A_MAIN10_Technicolor_2
   - WP_A_MAIN10_Toshiba_3
   - WP_MAIN10_B_Toshiba_3
   - WPP_A_ericsson_MAIN10_2
   - WPP_B_ericsson_MAIN10_2
   - WPP_C_ericsson_MAIN10_2
   - WPP_E_ericsson_MAIN10_2
   - WPP_F_ericsson_MAIN10_2
 - 4 testcase failed due to unsupported resolution
   - PICSIZE_A_Bossen_1
   - PICSIZE_B_Bossen_1
   - WPP_D_ericsson_MAIN10_2
   - WPP_D_ericsson_MAIN_2

 232/305 testcases passed while testing VP9-TEST-VECTORS with
 GStreamer-VP9-V4L2-Gst1.0.
 The failing test case:
 - 64 testcases failed due to unsupported resolution
   - vp90-2-02-size-08x08.webm
   - vp90-2-02-size-08x10.webm
   - vp90-2-02-size-08x16.webm
   - vp90-2-02-size-08x18.webm
   - vp90-2-02-size-08x32.webm
   - vp90-2-02-size-08x34.webm
   - vp90-2-02-size-08x64.webm
   - vp90-2-02-size-08x66.webm
   - vp90-2-02-size-10x08.webm
   - vp90-2-02-size-10x10.webm
   - vp90-2-02-size-10x16.webm
   - vp90-2-02-size-10x18.webm
   - vp90-2-02-size-10x32.webm
   - vp90-2-02-size-10x34.webm
   - vp90-2-02-size-10x64.webm
   - vp90-2-02-size-10x66.webm
   - vp90-2-02-size-16x08.webm
   - vp90-2-02-size-16x10.webm
   - vp90-2-02-size-16x16.webm
   - vp90-2-02-size-16x18.webm
   - vp90-2-02-size-16x32.webm
   - vp90-2-02-size-16x34.webm
   - vp90-2-02-size-16x64.webm
   - vp90-2-02-size-16x66.webm
   - vp90-2-02-size-18x08.webm
   - vp90-2-02-size-18x10.webm
   - vp90-2-02-size-18x16.webm
   - vp90-2-02-size-18x18.webm
   - vp90-2-02-size-18x32.webm
   - vp90-2-02-size-18x34.webm
   - vp90-2-02-size-18x64.webm
   - vp90-2-02-size-18x66.webm
   - vp90-2-02-size-32x08.webm
   - vp90-2-02-size-32x10.webm
   - vp90-2-02-size-32x16.webm
   - vp90-2-02-size-32x18.webm
   - vp90-2-02-size-32x32.webm
   - vp90-2-02-size-32x34.webm
   - vp90-2-02-size-32x64.webm
   - vp90-2-02-size-32x66.webm
   - vp90-2-02-size-34x08.webm
   - vp90-2-02-size-34x10.webm
   - vp90-2-02-size-34x16.webm
   - vp90-2-02-size-34x18.webm
   - vp90-2-02-size-34x32.webm
   - vp90-2-02-size-34x34.webm
   - vp90-2-02-size-34x64.webm
   - vp90-2-02-size-34x66.webm
   - vp90-2-02-size-64x08.webm
   - vp90-2-02-size-64x10.webm
   - vp90-2-02-size-64x16.webm
   - vp90-2-02-size-64x18.webm
   - vp90-2-02-size-64x32.webm
   - vp90-2-02-size-64x34.webm
   - vp90-2-02-size-64x64.webm
   - vp90-2-02-size-64x66.webm
   - vp90-2-02-size-66x08.webm
   - vp90-2-02-size-66x10.webm
   - vp90-2-02-size-66x16.webm
   - vp90-2-02-size-66x18.webm
   - vp90-2-02-size-66x32.webm
   - vp90-2-02-size-66x34.webm
   - vp90-2-02-size-66x64.webm
   - vp90-2-02-size-66x66.webm
 - 2 testcases failed due to unsupported format
   - vp91-2-04-yuv422.webm
   - vp91-2-04-yuv444.webm
 - 1 testcase failed with CRC mismatch
   - vp90-2-22-svc_1280x720_3.ivf
   - Bug raised: 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
 - 5 testcase failed due to unsupported resolution after sequence change
   - vp90-2-21-resize_inter_320x180_5_1-2.webm
   - vp90-2-21-resize_inter_320x180_7_1-2.webm
   - vp90-2-21-resize_inter_320x240_5_1-2.webm
   - vp90-2-21-resize_inter_320x240_7_1-2.webm
   - vp90-2-18-resize.ivf
 - 1 testcase failed with CRC mismatch
   - vp90-2-16-intra-only.webm
   Analysis: First few frames are marked by firmware as NO_SHOW frame.
   Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
   Such buffers should be dropped by GST. But instead, the first frame 
   is being displayed and when a valid buffer is sent to client later
   with same timestamp, its dropped, leading to CRC mismatch for first 
   frame.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Dikshita Agarwal (23):
      media: iris: Skip destroying internal buffer if not dequeued
      media: iris: Update CAPTURE format info based on OUTPUT format
      media: iris: Add handling for corrupt and drop frames
      media: iris: Avoid updating frame size to firmware during reconfig
      media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
      media: iris: Drop port check for session property response
      media: iris: Add handling for no show frames
      media: iris: Improve last flag handling
      media: iris: Skip flush on first sequence change
      media: iris: Prevent HFI queue writes when core is in deinit state
      media: iris: Remove redundant buffer count check in stream off
      media: iris: Remove deprecated property setting to firmware
      media: iris: Fix missing function pointer initialization
      media: iris: Fix NULL pointer dereference
      media: iris: Fix typo in depth variable
      media: iris: Add a comment to explain usage of MBPS
      media: iris: Track flush responses to prevent premature completion
      media: iris: Fix buffer preparation failure during resolution change
      media: iris: Add HEVC and VP9 formats for decoder
      media: iris: Add platform capabilities for HEVC and VP9 decoders
      media: iris: Set mandatory properties for HEVC and VP9 decoders.
      media: iris: Add internal buffer calculation for HEVC and VP9 decoders
      media: iris: Add codec specific check for VP9 decoder drain handling

 drivers/media/platform/qcom/iris/iris_buffer.c     |  52 ++-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  39 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  58 ++-
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   8 +
 .../platform/qcom/iris/iris_platform_common.h      |  28 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
 .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 117 +++---
 drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
 22 files changed, 1154 insertions(+), 210 deletions(-)
---
base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
change-id: 20250428-qcom-iris-hevc-vp9-eb31f30c3390
prerequisite-message-id: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
prerequisite-message-id: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
prerequisite-patch-id: 2e72fe4d11d264db3d42fa450427d30171303c6f
prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
prerequisite-patch-id: feda620f147ca14a958c92afdc85a1dc507701ac
prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


