Return-Path: <linux-media+bounces-38535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633EB1383E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7093B486A
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD922676F4;
	Mon, 28 Jul 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Og+5u5Qx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0925BEF1
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695862; cv=none; b=Awn02FknU/Tr5n22Ejm+ILy/TnJckgpQryqfJKZJ83eMQoq9EdezwQb5QCvQEYG9YLio9xXK/2b9sy0Y1QoengkgqRCiMi2vDxlPLhBdEf303Y1Wo9T+qTSXrH4o0RpFT80dpQKa492FGEef40ek7wmwfqwdEX6YRALY2EPTS60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695862; c=relaxed/simple;
	bh=+caXNXJPvRhmQkPWkMxxzlWxGaTjEAOEzBzAjBfyjKE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ybngaxedy7EsFDQC6sZWgRuRVqMjtJ6nMsCRVFpxGEjR1BR3VjlP1QwcVInDjpzPb8J2O6C3yHFzSh3PjiBrSrffJatWP+B1cJXhYastZj34KjD5SuOQrdv/kDszHTtXUgddaCbfqO8hmWL3dzrrSUpqQLwapAogrLfTClmsMfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Og+5u5Qx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rWsK023338
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cdxIevWgM55CiXrXFTknvC
	Y7urddp/1OK5J0AVTDMfs=; b=Og+5u5QxfQoS/rcaIaLqg1SEWHTfbjTzT6zoRp
	6Y/aiGDUls4KGkK2IHd8+G+cNoQ7xPQbsS0HI5TZzCeiS6s8QtAC54LNKLoJqrPJ
	6lVvp7vGtRsZ1xPInYixV4ibTEPPJY/1x22UMEy+rs8E90J4XSgTaeqBSmA8DUsY
	qHlbGHIRnns6OSut7hjQa9MMfr/PLvv76i2n8qo9rZhPuUlzXVQdLvFPElTcss5n
	CvVpx7udMdGgFD6TnnvtcYz57slfekw99eLhxHPuTSAsVTvuNyGfnUCqObxC5zrA
	aeKVAqt93it/dFBoItin4BP/hm9e8Vz+0aYhx6+vHdYT18jw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1x9dw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56S9iJga023715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:19 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 28 Jul 2025 02:44:17 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <linux-media@vger.kernel.org>
CC: <dikshita.agarwal@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
Subject: [PATCH] .mailmap: update Dikshita Agarwal's email addresses
Date: Mon, 28 Jul 2025 15:13:44 +0530
Message-ID: <20250728094344.3691258-1-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2OSBTYWx0ZWRfX2RJPqkWw9Tb0
 laYxwkEqzhyBkPRi9rr0a0CMkZyectiLpWzs2lVCXDelG9XVx7neB3jQWfcmSSIq6GZJRXS3s1s
 c0t+T79ydnT5oNSjBtolAfoK0iZ0dV2t1EhVQhUb9lZNQlIRtk1mf4WausU/lH7td//Osdx0O+V
 zwvomcLx+vI6hsJpGOkc8yLi4pA1nXP+dI6JIuO8X95UVSrJSvv7qFhvjb/l1t5tHBhmoeXnA3l
 GMXgD0jSf8WA2TY9aLyDPxQW2BS1MRaobKYXBDoyZo7PcNBLYfdFZRWtdI+e4NwsFvjWsglokVX
 Cd3ge4r8erlfbTo23Pm6IYs2Tq+pLuK1Fvx1tZ71akRV1mTuLf4enAsqJmWky990WahQvlz+O2e
 y5/wcow9Bble7VqVRr0XsuFkmbLWlCVWi77CqCnSFJB709ZRIDPGZ12wYVBnW0rNFH8AO4lf
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=68874674 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=FyogFE7hAAAA:8 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8 a=gPJu0pBYAAAA:8
 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8 a=9Wbp7B8dAAAA:8 a=40BibAkj_d6-nIhsxdEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=p2WyBLmlf5vdw_nX_QRo:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=AlIIF0cMT2hfDT4axODj:22 a=pioyyrs4ZptJ924tMmac:22 a=BESxJfN36ujmTJQqZ0Zq:22
X-Proofpoint-ORIG-GUID: iF2AP3EhNHzNvL3xphYC5Vg0pCT91OqJ
X-Proofpoint-GUID: iF2AP3EhNHzNvL3xphYC5Vg0pCT91OqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=525 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280069

Add dikshita.agarwal@oss.qualcomm.com as the main address for upstream
work.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 928fad83a7a4..c0e947ac66f5 100644
--- a/.mailmap
+++ b/.mailmap
@@ -211,7 +211,8 @@ Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@gmail.com>
 Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@imgtec.com>
 Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@mips.com>
 <dev.kurt@vandijck-laurijssen.be> <kurt.van.dijck@eia.be>
-Dikshita Agarwal <quic_dikshita@quicinc.com> <dikshita@codeaurora.org>
+Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> <dikshita@codeaurora.org>
+Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> <quic_dikshita@quicinc.com>
 Dmitry Baryshkov <lumag@kernel.org> <dbaryshkov@gmail.com>
 Dmitry Baryshkov <lumag@kernel.org> <[dbaryshkov@gmail.com]>
 Dmitry Baryshkov <lumag@kernel.org> <dmitry_baryshkov@mentor.com>
-- 
2.34.1


