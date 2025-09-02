Return-Path: <linux-media+bounces-41597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92677B408D6
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 17:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32ED2188F128
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FBE31CA61;
	Tue,  2 Sep 2025 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NlSVzfoO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1342DA751
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826590; cv=none; b=W841LyQEEftHBFIwqw+H0XX3y6dQXOxB05CHH8pwUroe1T2IMntCzJlHBro9IB1Yoz8bl1IwB9RY5Eb5IkC0Lta00HmCULSx+cNexxzoWUxHHOmiBIgdbMFsfSDqCkJAAKg2u44xJNyIl/z2Ch73Cf6tmAR+BPg/jZtHJT4iHEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826590; c=relaxed/simple;
	bh=Li8I41ntHVJO9WS0E5hU1A2KOzoVF+E330VAkYEgUdI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rTVgKjUEZiqGALlMCytyXzRJX02vUUt3qzYrPDwMUAMTGBRALsHgboHqWWp2YMvJBEJhAien95W2ID+2qlz54hNFp38DdEALfayI3FuWCwfKnnKtZhqmsjwWtPmEcCpqH7GG7KDvQoI2okVTlfZ5CK6RF+jNg/f71sEcp2Vp6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NlSVzfoO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqAte023408
	for <linux-media@vger.kernel.org>; Tue, 2 Sep 2025 15:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XzRZlqncIr3/5g8m0Qd+XG
	OK4ERP541o3tvuiC5REYg=; b=NlSVzfoOm8M0e35g9iYgkR3hGJ/wdHR9No5MSb
	GYPAz/3aV3t3yadmSIdlrqqP53TZiMghEFTlduG230bBa4j+ilqlgCGLFeM2h7Rt
	Py5Er2vp6AqM5s/yEFAG0G+IK5y3e5uXp9woKglWrp0srQKjfk40QyNGA/eHzJRX
	JOisbm/PiyFEUHzRwvW1igQ8kw07rVbxmBwUJwMRiOMHkdduviuuneSKQxcgA+Ms
	xSxcAOUBRZsuDDVjHjw5rTaNNE8XATjpSNVTJo3j1CFxUXia708T82/8LbRqvW+o
	ga+p4Z+Hy4SK3BS9Ou33Srloidz8adphzJXYe3HsNtbRxiMw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8e76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 15:23:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582FN6ID025171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 2 Sep 2025 15:23:06 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 2 Sep 2025 08:23:04 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
To: <linux-media@vger.kernel.org>
CC: <vikash.garodia@oss.qualcomm.com>, <quic_vgarodia@quicinc.com>
Subject: [PATCH] .mailmap: update Vikash Garodia's email addresses
Date: Tue, 2 Sep 2025 20:52:24 +0530
Message-ID: <20250902152224.1150300-1-quic_vgarodia@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IyNtBGuJD35svBX1BL1da3GYg-82OkT_
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b70bdb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=20KFwNOVAAAA:8 a=7CQSdrXTAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=59_03uvpzj3tGl5N8mkA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=pioyyrs4ZptJ924tMmac:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: IyNtBGuJD35svBX1BL1da3GYg-82OkT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1Z0Qrmg8QN96
 msiJDApxxvx4w1K/SCBs256FBBUUu/S5zg2bHtc95Og4RB2rrOpm0C+Y3DmB6TiSmPG1hDLgjT2
 MK4xkFjHKrdIQIUjKGmYSpJ9FKUZURagZIcaHBVGv1vyeWGrysvcO6GgvR9lKKD6q1Lr1OJb89r
 WdNEJt5vQnGiSolOPbwBEeW9B/9+Z6seWUQjToHBe8XbOPclZDGX+UqGFjCOLyF+plxMU0Nsi+1
 uUjR+j7OFAzxrPIwn4dXrKZSFCFLXqwyuC9cQAWS1wwRzSJ+eYSlH7o9dMgCB+/1IMfuOsuLI1z
 mYrRzsaMU7DCeh4Ys8NnMFwuxyqBXghWsEkcoFc9/sKT28YFMWbqtCCpRJQYxcyo+Vkg610icNf
 2sz636DW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Add vikash.garodia@oss.qualcomm.com as the main address for upstream
work.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a124aeed52a2..c3935bcf6473 100644
--- a/.mailmap
+++ b/.mailmap
@@ -814,7 +814,8 @@ Valentin Schneider <vschneid@redhat.com> <valentin.schneider@arm.com>
 Veera Sundaram Sankaran <quic_veeras@quicinc.com> <veeras@codeaurora.org>
 Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com> <vbadigan@codeaurora.org>
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com> <vnaralas@codeaurora.org>
-Vikash Garodia <quic_vgarodia@quicinc.com> <vgarodia@codeaurora.org>
+Vikash Garodia <vikash.garodia@oss.qualcomm.com> <vgarodia@codeaurora.org>
+Vikash Garodia <vikash.garodia@oss.qualcomm.com> <quic_vgarodia@quicinc.com>
 Vinod Koul <vkoul@kernel.org> <vinod.koul@intel.com>
 Vinod Koul <vkoul@kernel.org> <vinod.koul@linux.intel.com>
 Vinod Koul <vkoul@kernel.org> <vkoul@infradead.org>
-- 
2.34.1


