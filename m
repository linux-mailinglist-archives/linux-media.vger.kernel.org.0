Return-Path: <linux-media+bounces-48621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D30CB56AD
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 10:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25DC03017F26
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 09:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0961520F08D;
	Thu, 11 Dec 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FubxAGEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KahKCkhT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A31F5851
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446672; cv=none; b=K87HfFfKh54Cs4timoFTQoLi9ATgVcF0Nh23vNABMdXsZH8TuUxcU5Qtm6oOkLC9eLghTxaUA5pnNwAxs5RfXxI1Bvmd4r3CFzO/UJjcQr5ozotJKH9SNBRxuyNEc73UIZKSDkznf1RiKua8C99cMyxigvpUEamMRmdfugBm1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446672; c=relaxed/simple;
	bh=Cyr9yX44wGLSvSvCE4NwC+GFqktTTSRroUEpxQNxMSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PwkLiI3aQ1EbvkZJUlC2zyp+5eLkNgATlCXO+SQG5jXmpvv/5TG+8xru4YZ/TrmMhqIN7CtbGE+v53IRflPoPT1oqgz3W3aeBvrKhQy7ErnSJ6f+vzm7Zmv9Vxjd+OTfo7za2aJ4InBI6RzwT6RCt6vDXb1aobx2chNCfOb/+9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FubxAGEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KahKCkhT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZTbW1760394
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D737rmLvyrPEw/1cTMLYY3
	h+bX71102iMZlqNuH3bF4=; b=FubxAGErzSqT8zJ0vh+3plJDF79a9pwzZjRth4
	t/a5mWW67v7tB789y+uYELPc6eAVSp0xVTGeYw29het+kB3iHHsrkK2Vp8FJsA8H
	5woyU5XY1ThgRbjTQADst7dEIYzB/Ejqs1TFUmwIGki+TYZ0iQs0gyXNqMRDCKg9
	JYH/uHZpzXHx689bL4enfqq5t1chJ7+dVu6ybKxbO5qmo+NLFBMaOZGQUxmbA5Wi
	QT62IQfA0RENwZoO0Xn6/Y5qeFzCX3zeKuLeoO1PZxrkQFmMBhYZNfZ7WaCysx+1
	BfmbQZQBfW4qSLwk0OOHNUWCNoBe4IxDobLCXImbcElSadFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr89vuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 09:51:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343e262230eso952247a91.2
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765446668; x=1766051468; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D737rmLvyrPEw/1cTMLYY3h+bX71102iMZlqNuH3bF4=;
        b=KahKCkhT1sanwzOedg7fH09kjc+LtNkeoihEli1rx0U/y1WHG6/xik2cV5gsoHzx6h
         Vn1I7quso7xUbRtQXDZBDeNitTK24HuDb/EDSMuCNMY73sZbMT7KvUKfJjp2e1+m2qkT
         7tYrX+gdsA6nV2jp5aLVxRGzOxKlKtqm0ZnXwWYH+NZg2C1cD6fWUALEQZKspK4zZTvW
         Fv9MVwDVng+95pKix4ZGpTmTpY8W85SMlNLxFegpyMnkQ32VZBCVFDACnY3qlUSi8l9U
         wq9M3naXXrBnbT2ZsbG26zsYPGM+WdBOIiHZUYHrzdV5k9k6zO/MYBqzpRvzcoQVB3UO
         RqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765446668; x=1766051468;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D737rmLvyrPEw/1cTMLYY3h+bX71102iMZlqNuH3bF4=;
        b=QTWUZLBuU0U+D3ZTE2ieGJCcXMrzKOY6EEgQ+8WCquchRW3v3hJSeXhbq6DUXWamqN
         tSp1TPJPY0ycQuGHVvDS1Yr9Oh+yXajbsiGbGVylviWvJHWmwoMN4fx3vz3dSga/OTPw
         +xC0hDbHczZprOlD29U8Xc2z1jRX0h1SncOdVimL5YS6UTMqNpdTlH4srk+eqsbSmVRa
         e43mNfU1qszV+hUy9HOQDm1EpselKeioDrAyu3Zlk2V1bLh5sbEMIk4oUZOxuItxBGMh
         me3mmaD784LjwnvgX3aKiSwC+V5rLH/AMTYBNQ/LidDUR67ZARzakTzze3DBaltLpH/g
         iZqg==
X-Gm-Message-State: AOJu0YzcidCjtv3Yi1uIE5s4MfMHX32k+eUMgG+kSyuCRMBN1Bf/RO8Z
	2dnEd6yCMlVUCFkD2+85t3lvM0OZk1GPflabxkL31xgXf01sLLPdDCv3Ti+9B+vLsNbYs36a+k9
	qH9+HnDhK0ZtxSpXl3Aa4UlWmOhIpmvPqhe31v1II2vs7xempqIt5/d1xarvCxBZBQh++AKip82
	3k
X-Gm-Gg: AY/fxX7R9eXwOL531aEfv5/OoUg2B8D356a790yBJOtaqWEQmFUWPwA0DYGECMLERkC
	hUu5Kw507mdpXkN0eu8PphViiGM7soi0CZXAYptFh8WVoSXm467Mw0DYcNWDIGLKDj+FKtfZzcO
	Qyy7IyKIuDRKMWr7LMpNGHla2PfBL7FIvF/6N8UTldyN8FzyFdmRVrBu8GSWTsp7rlZ2f2AAI4h
	8HqggomhosMGI1W3mEYcRVc2me8MbCymaBCbhJ6XDVuWAq+vjUiDOQqok9aX3fG6u4GmlWmot8F
	Gye23HXsv0Faq/gQQyv0JJpPnG0DLpfarw7SmQA6qP8UZVfs/uqiYWFB2GPHvI/tbFhwSXlNF9p
	OgJKGJkIHTr7aXZER7avDj96cCPn3nolEcaT23jfh8kf0lyDC07aupFBMqjWptUCKTOrCz7s+IH
	OyeLfOLTE=
X-Received: by 2002:a05:6a20:918f:b0:366:5d1a:c738 with SMTP id adf61e73a8af0-366e2999d45mr6085650637.57.1765446668502;
        Thu, 11 Dec 2025 01:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9EjSjJCje3+4SsLuYny8cEuSC1KPnptVacLLagytwJhbAUHyHsgrXRrF7tYD3/2uEw2vxlw==
X-Received: by 2002:a05:6a20:918f:b0:366:5d1a:c738 with SMTP id adf61e73a8af0-366e2999d45mr6085623637.57.1765446667905;
        Thu, 11 Dec 2025 01:51:07 -0800 (PST)
Received: from hu-renjiang-sha.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c55sm19639485ad.58.2025.12.11.01.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:51:07 -0800 (PST)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:20:39 +0530
Subject: [PATCH v3] media: venus: vdec: fix error state assignment for zero
 bytesused
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO6TOmkC/3XOTU4DMQwF4KuMsibV2PmbdsU9EAtn4tBItKFJO
 gJVc3fS6YIFsIn0Ivvzu4nKJXEVh+EmCi+ppnzuQT0NYj7S+Y1lCj0LHNEAoJUxfUouJRdZGzW
 WqGFSNBk1zUH0rY/CfWQTX14fufDl2uH2+BSeKss5n06pHQZrVRgDUFSROLJ1aiYftbd+dA70n
 iZHwUEUd+uYasvlayu7wIb922sBCVLpuNe9nQdrnnOtu8uV3u+nd/3ZyAV/GByn3wx2Bo3xFpm
 Rvf2DWdf1G+ajc0FIAQAA
X-Change-ID: 20251126-fix-error-state-24183a8538cd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765446665; l=2217;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=Cyr9yX44wGLSvSvCE4NwC+GFqktTTSRroUEpxQNxMSU=;
 b=D5ucobgnlEvBYxQEiF09fDWs1wj3XGB8fZiMrGSjdaCHl6PxOOfKHGYAXqlJYHvc+QXQBgTFS
 gYAnj9ynS9FDm7YlG7f6TAA3IkxL7FHrtPKg6Z3V5r7Wi8J/YOxJYFD
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a940d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5Ms28dyX6PlKRWIk_uMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NSBTYWx0ZWRfXwTP1aeKcMOEZ
 XIvurkt6FY1EjzfWX0+jn9zjNTiULaL7ScxhlRaAqP0ojo1Np74bL+6595o3nHtE9r8rsspRXmH
 fzAXShzPB/tzM0kAvgy6LxjgdIKZP4lfR0Qf+kXTHRriRtVfrfXH4ZNcCiaNUYnAVcJCPVwLGZ4
 xQplFuRkROuPMi8TcySfjPImkuEkJib2bTigbPBLMp7QapLGQZ5eP/QbX/iY7G+qVzEoU0E5G4C
 61it2qKWxrZpObwn5CfWs4TMkCq4Xs18UvTpXwyn9I6fruFhQhh8zA1WCdzIrRc9Sbdgb+qv4ig
 Udd4E/MpD2i8bPRuRtk2KlO4M3Gy09t+sriModWWCxcKMDrqRgABs0MbO+G3JlFjbl1yUVlGkfq
 08UCHqwD4Pp2scaAd1INLe/Fz3+ANQ==
X-Proofpoint-ORIG-GUID: qMPa2r0T0JE8YajCP1AjsiAOHoJ8pm5d
X-Proofpoint-GUID: qMPa2r0T0JE8YajCP1AjsiAOHoJ8pm5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110075

When hfi_session_flush is issued, all queued buffers are returned to
the V4L2 driver. Some of these buffers are not processed and have
bytesused = 0. Currently, the driver marks such buffers as error even
during drain operations, which can incorrectly flag EOS buffers.

Only capture buffers with zero payload (and not EOS) should be marked
with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
branch to ensure correct handling.

Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
The error state assignment in the Venus vdec driver for Qualcomm
platforms is updated to ensure that VB2_BUF_STATE_ERROR is applied
only to non-EOS capture buffers with zero bytesused. Ensures false
error reports do not occur during drain operations.
---
Changes in v3:
- 1, Update commit message.
- 2, Move empty line between tags.
- 3, Update cover letter message.
- Link to v2: https://lore.kernel.org/r/20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com

Changes in v2:
- 1. Update commit message.
- 2. Add a Fixes tag.
- Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-fix-error-state-24183a8538cd

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>


