Return-Path: <linux-media+bounces-20899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854079BC872
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A20E282D99
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46371D222A;
	Tue,  5 Nov 2024 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f9WIva65"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D11D1E99;
	Tue,  5 Nov 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796954; cv=none; b=naTQvQMZbiyO2RrsXUckvcgxXaMq7kwA8FXD6R29BSmyrwOtIyraOyEQd6T4ek5qsSoOz4ATUZKYONVeEJZaUQutZYbo1o67EJ1WWyolgRrkhlh/Wqhbx4B32aPfKK23B8Js6keIM0cltnM+xnwMVbN9PuyWwizvEJnyqXQ0y6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796954; c=relaxed/simple;
	bh=iGPouEmRZkxRAybaw+1alorRqCjGkzNm0yXj2nsE44M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YofQ5F6GTY4jIer72HdU8Xn9jt6P3hWdGb78q0FVPMHKt9ODtZmCyLujc4qsEmoD8xOW0TQ09EKe5tEOpkDLlTCePDJiHKuFppp+pu4dopGD151y3e9dnSMjGYt1SPQ2fRBJ0/fZfrpcCXNwKPnbmcmbmQw5aBRc7CM76ax1aNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f9WIva65; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIiad012119;
	Tue, 5 Nov 2024 08:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DIlIQ93Yx7bC1OfENFyyT9yNN8jknFcjVFrhZxojJSs=; b=f9WIva65JBvh9V6+
	9EsiYyGWDnNCFtzEriDg2bmrViMSOnSxMLlFK7MfPX2NQyAYTB27pXYkNqwKuic4
	qSMdJGT+H1mVN51N2dZ123iwXElrfRn5zToxK/ScnXE4mFYK/5IEcVW5fOqw+tmt
	n8DeN7UmDMuoWrGov1bsMReKaVY7hE3jPwrWeDKjmWcwh+7k8zwdky6kDZ3pJx1U
	QsOQeSxcSKqEjk09aKoK4S2e96WCyycBHwhdycY9mhjsjhGsjV0Miqh9CFoSLRRa
	ZS/1pMkgK0zb05lb4na2xA5ZAOCXhSwEPlOFnzxkVsPzdSG/C2qp6EDclsSqPZaB
	vANRyQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11y08e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:55:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A58tlU1029707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:55:47 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 00:55:45 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 5 Nov 2024 14:24:57 +0530
Subject: [PATCH 4/4] media: venus: hfi: add a check to handle OOB in sfr
 region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-venus_oob-v1-4-8d4feedfe2bb@quicinc.com>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
In-Reply-To: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730796934; l=1440;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=iGPouEmRZkxRAybaw+1alorRqCjGkzNm0yXj2nsE44M=;
 b=rLbc6Bfe3C74h4smkOpubA7BtYi2kaq5os4+rs0TiJWGM8MMkseIBgcRdyRqXTK/6qns2ab7L
 nWheDsumLi1Dxoo1CMX2n00VGojrfrt0+OTPvnFItm5yMqrnTJD5SLV
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3S6C3G7qV9mkRoP5yUzZ8KFy-QCtXGNX
X-Proofpoint-ORIG-GUID: 3S6C3G7qV9mkRoP5yUzZ8KFy-QCtXGNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=760
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050063

sfr->buf_size is in shared memory and can be modified by malicious user.
OOB write is possible when the size is made higher than actual sfr data
buffer.

Cc: stable@vger.kernel.org
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 50d92214190d88eff273a5ba3f95486f758bcc05..c19d6bf686d0f31c6a2f551de3f7eb08031bde85 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	struct hfi_sfr *sfr = hdev->sfr.kva;
+	u32 size;
 	void *p;
 
 	if (!sfr)
 		return;
 
-	p = memchr(sfr->data, '\0', sfr->buf_size);
+	size = sfr->buf_size;
+	if (size > ALIGNED_SFR_SIZE)
+		return;
+
+	p = memchr(sfr->data, '\0', size);
 	/*
 	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
 	 * that Venus is in the process of crashing.
 	 */
 	if (!p)
-		sfr->data[sfr->buf_size - 1] = '\0';
+		sfr->data[size - 1] = '\0';
 
 	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
 }

-- 
2.34.1


