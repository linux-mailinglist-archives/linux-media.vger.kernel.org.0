Return-Path: <linux-media+bounces-14194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D68D9189EC
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 19:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9111C22CB8
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 17:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4F918FDDC;
	Wed, 26 Jun 2024 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UoYJ4F5v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945E16F0DC;
	Wed, 26 Jun 2024 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422154; cv=none; b=WvM/0RTZeIS97PFCukqOjT6OLQeKqnNX5cRVOcElD6zxBTZ3MYrhUuujHr0lTsocgrJeVMgywnJa3f6zMB++UV7s/G0BsXcLhvQnyhyH8i9+dFzNNBXjiOonRAoi+eKMrY8lCZD3dGB0Uv4dDSCEar9TIkS0DApJ2ffQrNpnBHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422154; c=relaxed/simple;
	bh=KFeMYf0yXCblwTWoR2tyu0Q3uNiNDyWPSL3bCRQW11c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mHp6/W5vonrnUJiCtvrJ9sVC7fADqdJcsx/O4rLye+irGDzGBBWToF/mXfNpgN5RIiX539ihlLc1J1iFrSreuCdz9P/U5lnxXU1RlXKo19ZVdQDqhIc6SpVCPr/QktN+Kn0OkxFfI2TEklqu2S1k2K8PmpvMrZYFHWJSA2tKTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UoYJ4F5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAg4LC025153;
	Wed, 26 Jun 2024 17:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fzDlqpudN0m8ccLoLjmKvZ
	jR/yGpFYqoSRyzyV4xtvM=; b=UoYJ4F5vN0yd4wqXHBOFqZfX+1Rhj84Yhjs8rU
	M5yhD2Du176QZyMMHbB4IiNfJZReGnSZqji48gu4JFtf9VEjaujpwvMnx2pjmKQv
	evs1WvlmUy/f7WG837Fk0Z+iUYXqriqjQaQ47PTTk+sC72kUdvGRXZgnI5zUgfJY
	xhMhSQX/V/nnkWV0gVa/QHZ1pc6dUf40QcTDG7YfwdvtaBSmorH8Mujlo/1KSoPa
	bvDbk3degHnR7gAPU++uM5YDMcuj30CkoC+4kCPFFbtWVQn/mKEWg9xaCLjIJR/C
	uarFHUX39GevrTZSUFIeLTsMZIaAYfBnTa4w+VDGbJb5vzug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yt7b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 17:15:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QHFiWl009815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 17:15:44 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 10:15:44 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 26 Jun 2024 10:15:43 -0700
Subject: [PATCH v2] media: videobuf2: add missing MODULE_DESCRIPTION()
 macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240626-md-drivers-media-common-videobuf2-v2-1-6b2ea3d07353@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAL5MfGYC/5WOSw6CMBRFt0I69hla+Ygj92EY9POQl9hWW2gwh
 L1b2IHDk9x77l1ZxEAY2a1YWcBEkbzLIE4F06N0TwQymZkoRVU2XIA1YAIlDBEsGpKgvbXeQSK
 DXs2DALwMqr42bVN2gmXPO+BAy7Hx6DMrGRFUkE6Pu/lFbl7Ayjhh2OMjxcmH7/Eo8b30z3jiw
 KFqRC0Vb8VguvtnJk1On3OU9du2/QDlppqp8wAAAA==
To: Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski
	<m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zCwOKPLLEKjmBbMlzoY8rEj7KcKrM8JI
X-Proofpoint-ORIG-GUID: zCwOKPLLEKjmBbMlzoY8rEj7KcKrM8JI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260127

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Acked-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
While doing these cleanups, in most cases I've taken the descriptions
directly from code comments, Kconfig descriptions, or git logs, but in
this case I didn't see a nice concise description so I invented this
one. Please suggest a replacement if this isn't an appropriate
description.
---
Changes in v2:
- Updated description per Tomasz and added the Acked-by tag
- Link to v1: https://lore.kernel.org/r/20240612-md-drivers-media-common-videobuf2-v1-1-4625ab172fd9@quicinc.com
---
 drivers/media/common/videobuf2/videobuf2-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dvb.c b/drivers/media/common/videobuf2/videobuf2-dvb.c
index 8c15bcd07eef..a5d69bc75769 100644
--- a/drivers/media/common/videobuf2/videobuf2-dvb.c
+++ b/drivers/media/common/videobuf2/videobuf2-dvb.c
@@ -19,6 +19,7 @@
 /* ------------------------------------------------------------------ */
 
 MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
+MODULE_DESCRIPTION("Videobuf2 helpers library for simple DVB cards");
 MODULE_LICENSE("GPL");
 
 /* ------------------------------------------------------------------ */

---
base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
change-id: 20240612-md-drivers-media-common-videobuf2-e3fb58676092


