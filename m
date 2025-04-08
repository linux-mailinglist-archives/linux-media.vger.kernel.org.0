Return-Path: <linux-media+bounces-29636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F37A810F6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 17:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B33467EFE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B620022C35E;
	Tue,  8 Apr 2025 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZkcLl1Yy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66531DD526;
	Tue,  8 Apr 2025 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127691; cv=none; b=sarrTJGd5uSZ84dN8cl63beEDsC4va8t0f5ZYSslFhdnpQ82ceeKm5koDk5Da1rkV6y5h6K/Eq5tJL7oGwFodq8rUSiyw45nvlt6nSpsMKlSVnKjoW/lYt7KPKqtIs50gGsSc0mYaNcu6Rk23JY8VYBgFzj3dAykIhf/77+fsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127691; c=relaxed/simple;
	bh=oOxjNS00ZWqjAr+dtsfy9ZnfPRyOsN3BysvAqftcrXU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GdkBEJ2PpaTDyauoQwKJO2YgWvyVl2BVLK0pPCXq6FA74Rvi5n772fqk4iWlKv9mW4g1AwUFVRHM/dIAilxUEwTUF5TruTUnTWMT9hzQlzsp3CZfwDqSa1NXaDiR0CvvNKrW5moAiBd0jO+mXfzAsvYpYetShj42rfgO2a/7AEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZkcLl1Yy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B8Af0019572;
	Tue, 8 Apr 2025 15:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3QByyE2Q2l0GzSV21lCBOL
	ejE/T6A2b8VmJ3sdydB0I=; b=ZkcLl1YyH61OYSyQjdVU6gVW/+FwgoG7UhNCpe
	yLYHmzWDuZVnE5zPmRV8f7UbNGaaNrueNdxjctPMWN39tib10YICx6PbwQQAo4e+
	vjbRea0mZr8xnEJfhR1qRoBqBYKjdcHHJmxT0Ty09o292w5lDa5rWd/c5hqNdUWn
	q/Bn9QLGQkl4PZKW2/tW2KQfsA6WM+2RwrSMMT6B2+1w69thjmv4ufnjMwmwCHVx
	o5MuTDXSaegKG/6iaKqwpNOFm+BcPDjIv+FC8/Xyr11LrBBmwRdbGHXjolq2pLx8
	4LIcUaPHW2wm/tkJ+PdwkINuHnDByOYTn3GUOujkeNO4pOPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3g9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:54:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538FseSx001415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 15:54:40 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 08:54:34 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
Date: Tue, 8 Apr 2025 21:24:14 +0530
Message-ID: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdG9WcC/x3MQQqAIBBA0avIrBtQ0aCuEi1Cx5yNiYIE4t2Tl
 m/xf4dKhanCLjoUalz5SRNqEeDilW5C9tOgpbbSSI1cuKInh5Gaw5Y31Ks1lwrOeOlhdrlQ4Pd
 /HucYH2rApUljAAAA
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
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Dikshita
 Agarwal" <quic_dikshita@quicinc.com>,
        <stable@vger.kernel.org>, Dan Carpenter
	<dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744127674; l=12934;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=oOxjNS00ZWqjAr+dtsfy9ZnfPRyOsN3BysvAqftcrXU=;
 b=Y/rNW6XGtBKAfMPbxPLEysG8S/viqzjekgBMjdLmj+VCiJTBKDOjBNJ78NyYhXkFiSm+fV4eh
 o9i7r5avxHJCx52K1rxmLpq/7VWijqWUmY1jGWa5mJ6WrsM/wxGafMJ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: COtKa8pGS8m5BOr3ESQnTVVYkd5pQyoH
X-Proofpoint-ORIG-GUID: COtKa8pGS8m5BOr3ESQnTVVYkd5pQyoH
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f546c1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=89rxFu5Tegq3oecSyV0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080110

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
- RFC: https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/

These patches are tested on SM8250 and SM8550 with v4l2-ctl and 
Gstreamer for HEVC and VP9 decoders, at the same time ensured that 
the existing H264 decoder functionality remains uneffected.

Note: 1 of the fluster compliance test is fixed with firmware [1]
[1]: https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u 

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
 - 1 testcase failed as bitstream is invalid (this fails with reference 
   as well)
   - RAP_B_Bossen_2
 - 1 testcase failed due to CRC mismatch
   - RAP_A_docomo_6
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
 - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
   - vp90-2-22-svc_1280x720_3.ivf
 - 2 testcase failed due to unsupported resolution after sequence change
   - vp90-2-21-resize_inter_320x180_5_1-2.webm
   - vp90-2-21-resize_inter_320x180_7_1-2.webm
 - 1 testcase failed due to unsupported stream
   - vp90-2-16-intra-only.webm
 Note: There is a timing issue with the clips having multiple resolution 
 change. Where firmware returned all the buffers with previous sequence 
 and has no buffer left to attach the LAST flag to. At the same time, 
 client is not queueing any further buffers, so there is deadlock where 
 client is waiting for LAST flag, while firmware doesn't have any 
 capture buffer to attach LAST flag to.
 Ideally client should keep queueing the buffers on capture queue untill
 the LAST flag is received.

The result of fluster test on SM8250:
 132/147 testcases passed while testing JCT-VC-HEVC_V1 with
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
 - 1 testcase failed as bitstream is invalid (this fails with reference
   as well)
   - RAP_B_Bossen_2

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
 - 1 testcase failed with CRC mismatch (fails with ref decoder as well)
   - vp90-2-22-svc_1280x720_3.ivf
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
 Note: Same timing issue as observed on SM8550 is seen on SM8250 as 
 well.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Dikshita Agarwal (20):
      media: iris: Skip destroying internal buffer if not dequeued
      media: iris: Update CAPTURE format info based on OUTPUT format
      media: iris: Add handling for corrupt and drop frames
      media: iris: Avoid updating frame size to firmware during reconfig
      media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
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
      media: iris: Add HEVC and VP9 formats for decoder
      media: iris: Add platform capabilities for HEVC and VP9 decoders
      media: iris: Set mandatory properties for HEVC and VP9 decoders.
      media: iris: Add internal buffer calculation for HEVC and VP9 decoders
      media: iris: Add codec specific check for VP9 decoder drain handling

 drivers/media/platform/qcom/iris/iris_buffer.c     |  22 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  44 ++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  22 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
 .../platform/qcom/iris/iris_platform_common.h      |  28 +-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
 .../platform/qcom/iris/iris_platform_sm8550.c      | 143 +++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 113 +++---
 drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
 20 files changed, 948 insertions(+), 153 deletions(-)
---
base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


