Return-Path: <linux-media+bounces-13055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EA90559F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A1F41C219A9
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 14:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C5617F502;
	Wed, 12 Jun 2024 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lOO4c99V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440B17F36D;
	Wed, 12 Jun 2024 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203600; cv=none; b=kzoJolJhMzTmU17CRn2nte1O2+PFI5/Kt2Ft0NBwX9Z9GhWC9b3RBuZshUnddlCTrGaAIDYzBEAd9Bv3bPO2sxKzPgeoMxgvd4x25EjSlyQB3/mDYKWh5xpD4x3Sga/T2Nww9GLystmDlHNNcZhTANueq4OiVwpaRrSk+uOoLfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203600; c=relaxed/simple;
	bh=a4USTPMVf9sHbKEMgkVx+fvDI3fnm6l5LxNGdngwNto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=PpfSs+YVgp3yImvBpsddLqMm8aaRe7YELCO2KCrssspY9Lt8U+ZwUxUtS2oZAayAgaSz1RkuQEf3OQY+Ag2peRdZ76cB7ujWCTMzJcqCGE0luoL//c7UM9Fh5F6bNxiyJuNZBRL4cBk/qIyuqvnHnAh8FKHCBDc7aBlXymxSAsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lOO4c99V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CA1X6I032442;
	Wed, 12 Jun 2024 14:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ekX2Gw2ZRDFR6Doc/SoVvy
	y4GVmslzkIqvdh+4BwNx4=; b=lOO4c99V3dks+xgWRSEKUtK6N6sHAX5XiEhuJW
	oFOazlg3tIwsz8M/qE4xNV2UpwWzy1A/f3RSKDzBdd5HRMZAPC5LYuvecfzCHPj/
	40gB7urpPR2A6541pxOGnAHvzEId5AcD0jqDy44/QL0mRaYwXzh0VZRFVAif37zl
	LKzfGXb4EnnVlC6hloeuZD/sxSuuxM1UpIZ86CyO2LpCTJIJSjJ7MWYrFCOrw71d
	Q5hJAezm0Xj/SPfabZkcoN520BaNfWeJW1RsyG05Wo6u+j5scXgg34fwhwjs/MS1
	dfXZkq3OCtx9+IS8Ty8bgZOIzwkh+JEOs+iv4ueVQxLyfx5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypp87uk2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:46:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CEkVOD001578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 14:46:31 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 07:46:30 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 07:46:28 -0700
Subject: [PATCH] media: videobuf2: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMO0aWYC/x3NywrCMBBA0V8ps3YgjRofv1Jc5DGxAyaRiQ2F0
 n83ujybezeoJEwV7sMGQo0rl9wxHgbws81PQg7doJU+KTNqTAGDcCOpmCiwRV9SKhkbBypuiRr
 pGN35ai5G3TT0zlso8vp/TI9uZyuhE5v9/Cu/OC8rJls/JLDvX7W1JtOSAAAA
To: Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski
	<m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T34xx6uQmWIb7MZAW7isFKEiNQ3FsyvW
X-Proofpoint-ORIG-GUID: T34xx6uQmWIb7MZAW7isFKEiNQ3FsyvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=855 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120105

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
While doing these cleanups, in most cases I've taken the descriptions
directly from code comments, Kconfig descriptions, or git logs, but in
this case I didn't see a nice concise description so I invented this
one. Please suggest a replacement if this isn't an appropriate
description.
---
 drivers/media/common/videobuf2/videobuf2-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dvb.c b/drivers/media/common/videobuf2/videobuf2-dvb.c
index 8c15bcd07eef..6f6650183184 100644
--- a/drivers/media/common/videobuf2/videobuf2-dvb.c
+++ b/drivers/media/common/videobuf2/videobuf2-dvb.c
@@ -19,6 +19,7 @@
 /* ------------------------------------------------------------------ */
 
 MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
+MODULE_DESCRIPTION("Simple DVB helper framework for videobuf2");
 MODULE_LICENSE("GPL");
 
 /* ------------------------------------------------------------------ */

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-media-common-videobuf2-e3fb58676092


