Return-Path: <linux-media+bounces-32740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A77ABB5FB
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 09:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49983BA011
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 07:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180F8267F78;
	Mon, 19 May 2025 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fx9orPLA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C12673BF;
	Mon, 19 May 2025 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638810; cv=none; b=V3e/2z0BBOogZviZfrZTZxwG9MZWJXnoqFmPDxLI+gelETsJnQKxDUaByXIUzQSrpp5szVPUI5kGpwfnlcupHFo9ZRQuOaAAgdpW5i+5H2EdPg1RbIDM74cisn1pAYoYnRCVKQQ0yubGdkhuCJqdhtr3tPz8zzkswDb7iao1TZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638810; c=relaxed/simple;
	bh=taaJ6DZBxavlk8sW98fnyAC/zF0N1R0WU9X1b1lZUgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CZjQ9DhNACJSSKRn194t9z3xmYGPHat0B2Je44amxL8vluOXV/PoLdblhiGx9O4tsiluVHHja+y2MqDgm3/aWmR1qoDScqa0xKtic1JaKDffu/Kfqxwon4KgMR7q1nl5ADx86hz8qeZRqr73M30LBgAXNtOtZ4KGVVFIZAD17EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fx9orPLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INFXma020271;
	Mon, 19 May 2025 07:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcbUyRGvjcWhXGrMFrPlkh66cJTyG24s6VXDEa1do4k=; b=fx9orPLADY/FUl+N
	Cg0W7ksagrhyUaSD+6Ph7uYbFf4vk/287UOiYvOWwuEUT9n7GdwqZulO76lt19sD
	eqj0aLdX0FTF3dr521EFDYpT6t/R84ANt/JUs5plBdRfX7S3DR/UkdnVgY3D5DwZ
	7GJcs74L9XZ8IIrZE0RY8q+XXc4RGERz+B+6TPPQU92wtJY3q/cZxCxjUoL/7FpP
	M+jd/V+3tJBOFcEvE6SXY5AMtjBSysPyHp8P02dIEWi1Hl2shwVnBC88bbPYIRTc
	XMzf0HSjWm82aKkS2W+YnKVk+J4V/EhmwRQ2Q0RtSbsxAgcShKNXNtqevMs9INwA
	yyKNlg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9udka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 07:13:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54J7ChvI012064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 07:12:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 May 2025 00:12:40 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 19 May 2025 12:42:21 +0530
Subject: [PATCH v4 1/2] media: venus: Add a check for packet size after
 reading from shared memory
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250519-venus-fixes-v4-1-3ae91d81443d@quicinc.com>
References: <20250519-venus-fixes-v4-0-3ae91d81443d@quicinc.com>
In-Reply-To: <20250519-venus-fixes-v4-0-3ae91d81443d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747638757; l=1651;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=BOFS5fY2FGoFdLOiqBeMjeN6ITuFXL8XEFIhc+6g0Qw=;
 b=zVVAxViKFk+cXoTkxgfe7CQxZXVkDKD5LSOdWzjrAqTVAnbpPfy6UFfPdKGq1WD2j8FtOBQWA
 hWNBXIaT/iDCdayRmKofY9p7Qf1yHL+KsHRcYujDpYBxY9fpUhquwDO
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kCq0ba9QWIbKsnsD5Fv3MRAqHs0Xoz7b
X-Proofpoint-ORIG-GUID: kCq0ba9QWIbKsnsD5Fv3MRAqHs0Xoz7b
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682ada12 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=D245qAF2djvHqEjldSYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA2NiBTYWx0ZWRfXygNqLORhll23
 pAqwXDhRcWjzMQWRL+LesWftyB7Tst5azaS/+pHmIdWny4Tc1cxjtmNk5P18o1dfFtSVvOV7UwG
 v00ayCI9ym/KvuPwd8kBXC7rU16XaFmSqYG+v9qUpbfkhEVWZ/4uLSjlg/i663aJ0jWiUhaEl44
 +ppNEvp2G6VgcG+L9h0Y27Rorqz/Mj+H9k/ieRcU+aDw67CG/GxS+t9CHnvviPRdq+KrySq7l49
 nxKRTK39UJM/QgLzm1tu0gW9OYOxCSoQaQudTtWmv0PbaKNXEVHhtAQ4+9Z8CyUJ3xUsZludwEP
 dEg0BmxRiCwKThZrwLAbUGFip0pq3pprguTn6mepPp962ZGlyU20243DEb9CBqAoYcEQ50g6AGW
 8ID+hhS09MLBqbTSlNxxB16m1P3gtTYM5s4amXNmLbmcmgaOR6SzmpU7EFT2kATBkU7f2h6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=788 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190066

From: Vedang Nagar <quic_vnagar@quicinc.com>

Add a check to ensure that the packet size does not exceed the number of
available words after reading the packet header from shared memory. This
ensures that the size provided by the firmware is safe to process and
prevent potential out-of-bounds memory access.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea8799507f9b83f1529e70061ea89a9cc5c8..c982f4527bb0b9f9ef9715c6c1dc26729f0fc079 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -239,6 +239,7 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
 static int venus_read_queue(struct venus_hfi_device *hdev,
 			    struct iface_queue *queue, void *pkt, u32 *tx_req)
 {
+	struct hfi_pkt_hdr *pkt_hdr = NULL;
 	struct hfi_queue_header *qhdr;
 	u32 dwords, new_rd_idx;
 	u32 rd_idx, wr_idx, type, qsize;
@@ -304,6 +305,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
 			memcpy(pkt, rd_ptr, len);
 			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
 		}
+		pkt_hdr = (struct hfi_pkt_hdr *)(pkt);
+		if ((pkt_hdr->size >> 2) != dwords)
+			return -EINVAL;
 	} else {
 		/* bad packet received, dropping */
 		new_rd_idx = qhdr->write_idx;

-- 
2.34.1


