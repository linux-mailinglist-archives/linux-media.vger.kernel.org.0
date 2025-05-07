Return-Path: <linux-media+bounces-31895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B24AAD866
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4CD7176177
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423D1215068;
	Wed,  7 May 2025 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kGtod7jX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554CE21FF58;
	Wed,  7 May 2025 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603628; cv=none; b=cT0F8dhmZ0btjcNtZSLJbRUba1n4gxwo/rwKkUkj1B0uoiZ5ti2j8LIt4TwS07LUbyii5E6vdyxSbxMjyHPF3O0KiO+DK4jBXY10NSmR+cAHjTRCN3TCy4M+KseOfTpr+OVLeR9VD9RtMA1iFuQtf3SWavZP/U+PyKnU2YTJQ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603628; c=relaxed/simple;
	bh=IRKLgBXMrhpMbudVVURlCyow1mJ1V3L+7WmwPL/VrQY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IXNay1adpAL+8Imfv4iIiExxW66mJz9S5Dw7xLdDqoM5RjLlVcYHxUu+zLH1fdCATZPJlyWRDaoFQxUCpXbo/xNugYC5cf4V5+pEOcgUnsYCnXNLLH9dtAxOpfgtX3RhCAZ/audn+jPE6XBuTNnVPE9t1mKqcc1rYm6O9oKX9b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kGtod7jX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HmH6017086;
	Wed, 7 May 2025 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=32996GvTRJbAt5BhN46XF9
	sLjIVfqHgE8trkXmno+K8=; b=kGtod7jXKBXfSTB+WVfCw9V1ySnhj0wdIv2GYL
	0f4fuZ7WnA0Dfm8KfHbSPy8dPZQStyts/c/zvrUp8B2eaPdFVwQkiCm6RvS8MHx1
	m4zvlvaxiO+AF/qfNA5ZIpU2zqIK0H/FJrvVjFmA1tDdsxzRalhy+PPB+mIc/Tcp
	yTD9ypC8FzX5knLV4kNxNShiz13vrj5Zct4LveWGz/OhO0ap5XvxJPimyUxZlTY/
	xTkfoXa6+cX43HmMQbPsEpVdES5KcQUM2iI+upRJscg4lBhaCBNa+HpndtUxpziV
	IHKIfHQRqTbz+IYTJaRw2lIv2karCASDMbHCi2B5XvyaZZfg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u44wax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:40:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5477eGJ1018411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 07:40:16 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 00:40:11 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v4 00/25] Add support for HEVC and VP9 codecs in decoder
Date: Wed, 7 May 2025 13:09:31 +0530
Message-ID: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQOG2gC/2XO0W7DIAwF0F+JeJ4rA6EJ0TT1P6ZqAmJapCakk
 KFKVf99NHnc47Wuj/1kmVKgzIbmyRKVkEOca2g/GuauZr4QhLFmJlAoVNhBCSNFCClkuFJxUBY
 NSqM+Wt7r2mB1c0nkw2NTv897TnT/rfi6D9lEOZsNH5rPzW55B2tcgoM89Q+F+4nCEUoHCB4FO
 stHJN2fbmE2KR5iuny9z/3HFHK4u9xLxJ/deRtWCD0q2XZa46m+48LsDi5OG2JNJqhhCuvQSN0
 bbqX0vJaNl8oZzZVT5J22iONRYOt7b9j59foD4Jh8YUMBAAA=
X-Change-ID: 20250507-video-iris-hevc-vp9-59096b189050
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746603611; l=15912;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=IRKLgBXMrhpMbudVVURlCyow1mJ1V3L+7WmwPL/VrQY=;
 b=zfRxQ/pfvJV7XTJDMzmf1D/X+8LYVZFkOpaJbYMrAScon7E8rwBrUDParI+fmuWR0KgbABmPC
 aTYE93HX/uqB3p9TlWzYkVWG5S8FvG2Qf5pA54Qtm59SLC6n52G8qYk
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681b0e61 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=xOd6jRPJAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=amt3jojHy74hAd8yjOMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: G4qsUanqFVhCESYr6xpH6u79_9-SJ8Sf
X-Proofpoint-ORIG-GUID: G4qsUanqFVhCESYr6xpH6u79_9-SJ8Sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX/OUAvTmTbJzY
 BCmvcdaUEPNWq5+Mw/SVFKynVxJQbmvnGuMIatpUSuGxH99TkO0GAeNYYnmUwOhV7J/l9+jVRD1
 Gssu9C96ba0rK/JMUErzTpLw3rwvKo/SU6ayQQR8U4/ulAp2OvgNI+8+8iAaAMeKrFExjkzTs/p
 eGpT0nmDn/6gpr/BC7GgJ+VUPG4jTD+9gcnfsrrDjRy6TmHZf2rVLc/Aa6GjbcSqKyfRuReZOwr
 5aaL5Kt4iydyN+1P5rfHZGukO4B4Mi9Wwm6nr57kOLOMC9eZkN+63Pn+AwCCoFiJQGNSEsWXy6j
 xHchJLxUTdYbUL3y3/KAtDuyZHHskNSbxxnUIfRbMafy0YzHITdokcxLkdmuRWSUBwZDMIBzGFO
 lxcPFh6rkxwkxlFJFXVySfkoIRF6tdAXRUuFpjh9hBu7yHe5lIt586oyp9A8bvCUg0Fh5uco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

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

Changes in v4:
- Splitted patch patch 06/23 in two patches (Bryan)
- Simplified the conditional logic in patch 13/23 (Bryan)
- Improved commit description for patch patch 13/23 (Nicolas)
- Fix the value of H265_NUM_TILE_ROW macro (Neil)
- Link to v3: https://lore.kernel.org/r/20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com

Changes in v3:
- Introduced two wrappers with explicit names to handle destroy internal 
buffers (Nicolas)
- Used sub state check instead of introducing new boolean (Vikash)
- Addressed other comments (Vikash)
- Reorderd patches to have all fixes patches first (Dmitry)
- Link to v2: 
https://lore.kernel.org/r/20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com

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
[1] 
https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org/
[2] 
https://lore.kernel.org/linux-media/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com/

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
   - BUG reported: 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
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
   - Bug reported: 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
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

To: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
To: Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Dikshita Agarwal (25):
      media: iris: Skip destroying internal buffer if not dequeued
      media: iris: Update CAPTURE format info based on OUTPUT format
      media: iris: Avoid updating frame size to firmware during reconfig
      media: iris: Drop port check for session property response
      media: iris: Prevent HFI queue writes when core is in deinit state
      media: iris: Remove error check for non-zero v4l2 controls
      media: iris: Remove deprecated property setting to firmware
      media: iris: Fix missing function pointer initialization
      media: iris: Fix NULL pointer dereference
      media: iris: Fix typo in depth variable
      media: iris: Track flush responses to prevent premature completion
      media: iris: Fix buffer preparation failure during resolution change
      media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length
      media: iris: Skip flush on first sequence change
      media: iris: Remove unnecessary re-initialization of flush completion
      media: iris: Add handling for corrupt and drop frames
      media: iris: Add handling for no show frames
      media: iris: Improve last flag handling
      media: iris: Remove redundant buffer count check in stream off
      media: iris: Add a comment to explain usage of MBPS
      media: iris: Add HEVC and VP9 formats for decoder
      media: iris: Add platform capabilities for HEVC and VP9 decoders
      media: iris: Set mandatory properties for HEVC and VP9 decoders.
      media: iris: Add internal buffer calculation for HEVC and VP9 decoders
      media: iris: Add codec specific check for VP9 decoder drain handling

 drivers/media/platform/qcom/iris/iris_buffer.c     |  35 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  37 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  56 ++-
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
 .../platform/qcom/iris/iris_platform_common.h      |  28 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
 .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_state.h      |   1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 116 +++---
 drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
 24 files changed, 1159 insertions(+), 211 deletions(-)
---
base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
change-id: 20250507-video-iris-hevc-vp9-59096b189050
prerequisite-message-id: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
prerequisite-message-id: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea
prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
prerequisite-patch-id: 500bc3b8391940d3ebca222d2098b737414b2af4
prerequisite-patch-id: 2e72fe4d11d264db3d42fa450427d30171303c6f

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


