Return-Path: <linux-media+bounces-48181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE5CA0A29
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 18:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393AD3317A15
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 17:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502AB34A78F;
	Wed,  3 Dec 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWKM9Sb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ak9V+Nek"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD335341069
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764780220; cv=none; b=rDArqt66dsCg7m9AqdB114h9WwOoNM/QJ7WZYEI4ryCkYHYQK6xsYZWyGjoR4PgUTn+dEG7qKbthXGxKTNvBHtIcl4OnoDuoTzAGKNIeD0MtisTKPqRpSRA7qfZdWKp6urT3JcsMKoblP+GT97Txy8sQ2mdV1ZY095sD/8hCD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764780220; c=relaxed/simple;
	bh=lGY+bwFWa0G7uMZdE3/NlDOuH6eTpB50wtnppYa70kw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TSRdCYZLpoeiiSvMqE7qwl+wrkB0IQxZrpbVHo6cCZfVHxIyVdUEDGvZwoIUrHnLWX/qVEDGXcL5KU2XvrfHTo6/zk+SwPQsmssF6xpQDNiUuaINt+ZRc0PqfM2ZJ7BcDKySZe/vjfIebb0umBkpWKIzqyhtN2eHdEWRHGjZexM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWKM9Sb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ak9V+Nek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B4tZY2627210
	for <linux-media@vger.kernel.org>; Wed, 3 Dec 2025 16:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OkP3IkZdmqRrIqFEguV664dO01uM95ibM60
	hwSK6r+U=; b=QWKM9Sb93aDcNwf+t/3AB7i+bAeFtIgJBuljpb/YFH6CmHTSfGM
	A+Mh7EGpvtFo659xF2SSUbXtI6BdkfG39CV8DLJRnEeyMVLXn6FFoqD9IzJfzjGV
	vfN9b0ZiVNOpw54Glq2/BhPBckCoMsBTjYU2SpqCfIqaHFL/TYCYAjxzNckK6Qak
	iILPlh68gfMjjF/wcdQk/q49d+25Y5wJjjlDO/NPKRYLBLfaH9f0LM06C3DLbLg+
	3gfMFhV4Pg5J6SHtp9xYIQ49Zumr+BWXTWctPxn+bfGSqbEKBhNqi5x5ZSBFUfUg
	rX7QLe/WpBG2XQtO1Fhf+8MgxRVQaE4Cr7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm128xx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 16:43:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b225760181so847810085a.2
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 08:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764780214; x=1765385014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkP3IkZdmqRrIqFEguV664dO01uM95ibM60hwSK6r+U=;
        b=Ak9V+NekRtQGHzHqOzdhknmHv1+S2zE+37L+d47fWw607ltge9fMiYD7m9MWIYpzU/
         FnMB5Y6+veLCBDBTe4D072nNFUdYPMyuGNOSpD2NrjjNJgWlLOTW5EeeZ9fGE/o+CKqF
         gsfb6aQjacUP5aDj8cdXoTQjQOstyWJfkc2JIODy1x8oLUulDFd/nYyzHAtavBYG1mAZ
         l/6og2wYCDx32GXae6C3maP7IEmFNsTedtdkhWnslFrBM/ofMglUs777+c/f0wthCKW5
         GGGD9RqqHd1Xd03M0E0hS5d/AMVP48RuWsc3dQ6q8x5Sjgw5OmNrlbaJH/qNnSPXUQQQ
         gWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764780214; x=1765385014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkP3IkZdmqRrIqFEguV664dO01uM95ibM60hwSK6r+U=;
        b=jCud4l2WXcO3IzRTRQ5UK4MMXch40/qumAWE6QKSLZ+evztgyOIHIMLTP+Cpi+UOOS
         QGI3hYZ/vOAb0Ie6FmBI+nJTRmXEGdO0ZdGlIoWlf0z49lxnXNo+EGXlFbr8H5/a6DrN
         0eRLM8vE7TnxT09RihfjoS8mpuM8GpIG85YUxA9KgH5mToooK0HXEfMtskyn1wb3lHBs
         ANmE9PUrA/EmGjPlZ1oGFgEAXNlU3d6H/P4marBx+T3w7Z1o31l1OyKOmLgPD13IEQY1
         gFvt6R2eyMuVy4yERQlR+ZN9k70joeLe6IJaueJGsAlpbUEE3u4za5UJcwY67m2zhcZN
         CDRA==
X-Gm-Message-State: AOJu0YyZmlZOd3jpvRAoTaMaLzD5LAIdOXG178nhuTDMiTVsH8K9Gzs7
	LsuUjZYrj1Q/urfpyNtrxtI1MUve92zizNL8THmBfl7F4GCnpM8n12VpIMWU35kbRFFikFTAEwU
	PynNbz/+Sjw+3J7K3jB9nGy1F0dCxMY4tes0mg+iOQyZxQeRHhDLeNkeB8m6HLaNV5Q==
X-Gm-Gg: ASbGncts6ok/d0KuxrUn6BvFG3uH9ijTg1voiCegj4H1IwFolvUZm6reXLCWcUXMt0p
	wFprHOwppgvhpp9Ox1ENEto6MIC1B6P7iMVj8Kze67oPeKHi6+d4ENSTVhTmLhqaFFe6iTOWIRm
	7CJdEQIAiXdZ8f9gKKdiHcyPtk1MhaYkGrYaFG7tb45vTa12fj5+Avbr42iJAW50Yt3yl8nN0bz
	DELGBCZ/v+9xtEbWDScRKSf7pBMgB/1Rs+kqel7bw29b5y5ro9hJJCwpFrVN5EC/M+nqq2NSLEu
	FIJICWt1zDat8WtfMlp8f2y8EebgCa9FPSfo0u2LvWXZ+ahL6YGBcX9LiDEnkkM6i0mkOpXoLtc
	ZkhJUJoKpIF/0sPDYGR6pwj0DFLPzt2KlZ5DYAbbtEChv977wFbKvF9h8M+1/3CtHPRutj3Cc2w
	1Z
X-Received: by 2002:a05:620a:448e:b0:8b2:ec5c:20bf with SMTP id af79cd13be357-8b5e554d9c0mr420084585a.29.1764780214475;
        Wed, 03 Dec 2025 08:43:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFATH5kDP0Nx3exJ0qGFEUjnnvN1Lsj89A4uDXXXVILJP1mG6NI8ske0cJlYlmyePqgjlfvqQ==
X-Received: by 2002:a05:620a:448e:b0:8b2:ec5c:20bf with SMTP id af79cd13be357-8b5e554d9c0mr420080585a.29.1764780213992;
        Wed, 03 Dec 2025 08:43:33 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:f840:4916:e7c3:a857])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccbf3sm61195835e9.12.2025.12.03.08.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 08:43:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: csid-340: Fix unused variables
Date: Wed,  3 Dec 2025 17:43:30 +0100
Message-Id: <20251203164330.1552-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEzMiBTYWx0ZWRfX+GmyM6tBYhQ0
 m7Y63lyZPU1p6Y1QBuc02vzdfr+1PYslT1qA4t3B0e4nIL8XbLvRrZLUJQokQU2a9qf/ymI5tfp
 qBJQtSnSLo2Fsgs/vbWPGstIbAa7bHdAx5lHH4MXG+BhIHZh0BHZwEa5pUSlu/WlfRh+ONlfJT6
 rzjMfLEQY0GR4o3ed9KfgHccMIdoeqG343chI28Q+s33B6cjJxz4qNcC6S6HJePxiN9fHIapT9V
 6LafQJMzKy0rQBbWMdoOcOU1V/9jAD0Rk3Qmn5wfJnjbyIG0bVUXQzJJ23WfPjd6MEQW2bFiiH7
 DZxfRkqRWPorV23fIjHWb0uP757tTINC3gle5Zxsre+zvPGyN1BeH1ePINGt43Zm95IreJQOOaC
 Jz7S5nd4fV4Z2Dyz8aW909x+IHgfTQ==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=693068b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=d6NsCnqxkaT3_V1LjFAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: giKENwbbuZHPjVzjLxMScINMiDjWHryr
X-Proofpoint-ORIG-GUID: giKENwbbuZHPjVzjLxMScINMiDjWHryr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030132

The CSID driver has some unused variables and function parameters
that are no longer needed (due to refactoring). This patch cleans
up those unused elements:

- Removing the `vc` parameter from `__csid_configure_rx()`.
- Dropping the unused `lane_cnt` variable.
- Adjusting calls to `__csid_configure_rx()` accordingly.

Fixes: fb1c6b86d8ff ("media: qcom: camss: Add CSID 340 support")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 22a30510fb79..2b50f9b96a34 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -55,8 +55,7 @@
 #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
-static void __csid_configure_rx(struct csid_device *csid,
-				struct csid_phy_config *phy, int vc)
+static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
 	u32 val;
 
@@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
-	u8 lane_cnt = csid->phy.lane_cnt;
 	u8 dt_id;
 	u32 val;
 
-	if (!lane_cnt)
-		lane_cnt = 4;
-
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
 	 * the four least significant bits of the five bit VC
@@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
+	__csid_configure_rx(csid, &csid->phy);
+
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
-- 
2.34.1


