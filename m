Return-Path: <linux-media+bounces-53209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KgUDoynnGksJwQAu9opvQ
	(envelope-from <linux-media+bounces-53209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:16:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A442217C309
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F162315427C
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0060B36BCE3;
	Mon, 23 Feb 2026 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neotoJCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehXR7KQu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEC636BCE0
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873817; cv=none; b=rOYKBhnc6atQSgUNdcZDoVnc/uye9v/qg9G5DFlsvkahsNh8jsglFgWv0CLnyri1wsS+l7DfXhuMz+T/Gb6w5BR5CoGoYcHJ9yyRUNHRNBifjXXpXeNpmu2cVo2ZvduORkebo2Ff+o32uor4Vb66E721Cti7U9zlhlNBej+CKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873817; c=relaxed/simple;
	bh=eflhBKeXg5zwxShiL+GaVvttYv9N4fOm9mLw1I2A+H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHx/1dGN8IVSOni0LphJQi5n14HzkgOnIRJe0eNcTD29OTdWr5U1ItXyXgnR2yo/758Qgdp+g6Qd1N5bWLxQMM2ztPFMi4jc2IyYN4IWOahLOwv4gaCkVCjpcYrpthGhO6qBImI6dcaqwW/ptMoazC+lCBqy+0TK8SzcOCfyWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neotoJCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehXR7KQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIBOTv3409097
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fD0JqupCszokMNr/tteqmbM/hp6vcwvxufewpyUQwKQ=; b=neotoJCgxz1Qc9dM
	Q45RYB0v+pAkJHn//z12naDQwQxnAf7z/aAe939zG5kG6aS1WnjGZopw5NFerlSk
	/rk5qCjcb4dJ9at47aMuc6wekdDCU1fvrKCGfSUrgL8xcdmuVRxZMb6hrWj2cjj2
	jJSI+At3e/oLYB1t0NiL8Bf5G1w5iPZFFJVUoEhKkjdJK9hzewrarM9yZc9niNNj
	y/8N5Zk/eXYlKlVaetNbLoM50ena0zUyON+6R4qdwwhmytvjJ+JoTgZUiuKtMIkP
	0CapXAOBT9pS57mUWZAQxk1OrXGyZIJONvWlBxcol1kyyHubox+bmooXsRZFnaJK
	n8A1uQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tsk4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7d7b87977so49296145ad.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873815; x=1772478615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD0JqupCszokMNr/tteqmbM/hp6vcwvxufewpyUQwKQ=;
        b=ehXR7KQuhvTTBeOXGEjCys91B7s6a0pHIEnfZm+ufZVUajp+ewMEcwdXL6iBXVNPbu
         N3NX9Qq7e0+hpCLhJyrpt/pi2D9SFamuztfk+p4b6L5+mehtM5lMECB6dS2AgbFnbwDv
         JtJhVPYrtyKRFBXg7eDlvPBm2Ax5Dq2Pj+tNz3I6fg8psXoYDrMoQrfIG96lX7hBMkEP
         3P+/Z+71pWaYZUzbcpdN7p6OaNGBa2IBqjTDFiA2IHvd/hqS/vDqV+8S/N6p1lOx25q+
         q1K8ZYMeDKApUt2bB/Q8K7vWuPLWjW1RBK2bcbEILxiQWTsRm8BFuHEeTKcQ0ff4A2MP
         3F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873815; x=1772478615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fD0JqupCszokMNr/tteqmbM/hp6vcwvxufewpyUQwKQ=;
        b=ujjdJmPifTbWSeVKa1oWDkSBKVGgXlmshXh8+PYG8iXcQhn5ekAhx8ZqIFizy06Sbg
         C28x7R3LTJdVLMzgbeXbOw9ZAkBE/GbQneC5f5pujXK1qXp1sRV6r9q/xLiQp68cNikh
         GwE58r/FDa2kNxmBh8Xb0hkurewuaxcqf7L/Uf3AOnF+TF1yhcDVmkJ73uRPZwJkaRyY
         cx3a9ne+O5cZVbwnJz1oN5XdZ4gqI32gbxu+XxSiyebBFUShzAh81GvqBiBwQuERDUKR
         L83kvQCk3uRDe+G53OCkPQ2pMTH0MBu7Mn4W3ieu1+Zj1Mka3IdBLg342tqcG0vbtL3x
         SL4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnF4jKBR1eZ3Gv5j100SeZB7Uy0QqSXWTLPhyjuT2aYfKMq2v/qPHqlPO17AKw15sTUgqCz1nXYCOCcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJGGlIxdzmGov/WRoLzCu5W0UEzE+oNezRFKTs7BiFS9whell
	C3y719ZZHXkFl08oUEopaLzz9umar19f2GtZ9UUPrxPxAXnrjTDNyhvfoIZNhzz2b6vH39T5hX5
	7jQqhtm42RLHHdnYKz2JbZ1AI1yO2s24cIc7JbZp/zQHMPA+V1OLm2ywsabYd5n2dHw==
X-Gm-Gg: ATEYQzwOQlSe++INCgoX1iz91Jed6ErOV4TSRTJrETjS1jKvdJbaY1M15EDXxsmz9ey
	Qy2px38JhXp5/vvbFgJNQKmLgpXio+MSl/LB3J2+A9VJXd8eqUh8XWAhEJIRRgAbkGI6fKurNNY
	xj8YsJ2R2E4iMtOkhwoEdsSAkvk8ZbxFg3cbTWpTakEOHW8fRsLmhzyGqr+w324JcqTLYm6ifyg
	ieLWjJmlGWdwteP2LBolU38P0L80512Zni0iRkAM5qILk1Y4i5lwBt2LYQLPWnXfduNAPepgZlF
	zyA455GAcTgM+tWGYxm0WYl49+G8Mgeo13Kk159ftZ82Z00Km7GJamdi1H0oFxvKZlazYfuLE+7
	WKnRcvG6ysOezXZhFCyFTL0vNgzor0iQ3M1pPzHUW2wKUMjLhRTEN/A==
X-Received: by 2002:a17:902:ce0e:b0:299:e031:173 with SMTP id d9443c01a7336-2ad744e0f75mr96632955ad.35.1771873814483;
        Mon, 23 Feb 2026 11:10:14 -0800 (PST)
X-Received: by 2002:a17:902:ce0e:b0:299:e031:173 with SMTP id d9443c01a7336-2ad744e0f75mr96632635ad.35.1771873813959;
        Mon, 23 Feb 2026 11:10:13 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:10:12 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:01 +0530
Subject: [PATCH RFC 07/18] accel/qda: Add DRM accel device registration for
 QDA driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=8182;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=eflhBKeXg5zwxShiL+GaVvttYv9N4fOm9mLw1I2A+H0=;
 b=BhxckZcN/OtS9rXcw34lRFsN71y8kr2IKGaSslRspRMkvDtNq/DG+ssbzCenfyQVMQMZh6zGt
 y3aGCpGgyOyCJanPJPw7P061BJPRJLydGxTVXmRz2lS2TbdWeizB3TC
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699ca617 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rdCUcgxLdif9O8q6BpAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: yGzJkxcz74xnXuxF_fW8ZrCq9Ht09IIA
X-Proofpoint-GUID: yGzJkxcz74xnXuxF_fW8ZrCq9Ht09IIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX4VUARutC/ZDB
 maBazy8QncvEopYPhfUyDUkQPj/rjHFb9bAVo2P/y5ps5qUrfS7lGWxZyF4yrlQfLrhWCS6VtkM
 YDT5MJA8jg0HDHhEvwmzDy+PP4PRFChT/u7C7d6iak/uR6PV3sFgY4DcyDg2cArr2RLT+yeMjxm
 UV4popeOSBytvpIrT77rhgER7TxZpizbIQBT3YgarBAENhCvLXogrVKU3wOCxQDaEhprCXRVE1R
 ZYzd+uQDkhteO0d1Yj3I3YOSbxwEQRLrG1K9VURBSE4y1fIgn+HqDgt8x7uiUbd51aKaLyRhtaC
 FwiDJEHgDZmp5m8jh3Ol2pqmYohEbhWToxPg9nv9GmFofZwhMKmGJ38Cj6q9myp87gfpGjsGTHL
 5C+z5Txejgipo7aRCeMJxuCM852WgOWOwvl2u9Cvo0kryOdOdc1+xwoRrlp+Ec3yE56j8BqdskR
 o3tUEnua7WvPDlCI4XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53209-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A442217C309
X-Rspamd-Action: no action

Add DRM accel integration for the QDA DSP accelerator driver. A new
qda_drm_priv structure is introduced to hold per-device DRM state,
including a pointer to the memory manager and the parent qda_dev
instance. The driver now allocates a drm_device, initializes
driver-private state, and registers the device via the DRM accel
infrastructure.

qda_register_device() performs allocation and registration of the DRM
device, while qda_unregister_device() handles device teardown and
releases references using drm_dev_unregister() and drm_dev_put().
Initialization and teardown paths are updated so DRM resources are
allocated after IOMMU/memory-manager setup and cleaned during RPMsg
remove.

This patch lays the foundation for adding GEM buffer support and IOCTL
handling in later patches as part of the compute accelerator interface.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c   | 103 ++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_drv.h   |  33 +++++++++++++-
 drivers/accel/qda/qda_rpmsg.c |   8 ++++
 3 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 69132737f964..a9113ec78fa2 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -4,9 +4,31 @@
 #include <linux/kernel.h>
 #include <linux/atomic.h>
 #include <linux/slab.h>
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
 #include "qda_drv.h"
 #include "qda_rpmsg.h"
 
+DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
+
+static struct drm_driver qda_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.fops			= &qda_accel_fops,
+	.name = DRIVER_NAME,
+	.desc = "Qualcomm DSP Accelerator Driver",
+};
+
+static void cleanup_drm_private(struct qda_dev *qdev)
+{
+	if (qdev->drm_priv) {
+		qda_dbg(qdev, "Cleaning up DRM private data\n");
+		kfree(qdev->drm_priv);
+	}
+}
+
 static void cleanup_iommu_manager(struct qda_dev *qdev)
 {
 	if (qdev->iommu_mgr) {
@@ -24,6 +46,7 @@ static void cleanup_device_resources(struct qda_dev *qdev)
 
 void qda_deinit_device(struct qda_dev *qdev)
 {
+	cleanup_drm_private(qdev);
 	cleanup_iommu_manager(qdev);
 	cleanup_device_resources(qdev);
 }
@@ -59,6 +82,18 @@ static int init_memory_manager(struct qda_dev *qdev)
 	return 0;
 }
 
+static int init_drm_private(struct qda_dev *qdev)
+{
+	qda_dbg(qdev, "Initializing DRM private data\n");
+
+	qdev->drm_priv = kzalloc_obj(*qdev->drm_priv, GFP_KERNEL);
+	if (!qdev->drm_priv)
+		return -ENOMEM;
+
+	qda_dbg(qdev, "DRM private data initialized successfully\n");
+	return 0;
+}
+
 int qda_init_device(struct qda_dev *qdev)
 {
 	int ret;
@@ -71,14 +106,82 @@ int qda_init_device(struct qda_dev *qdev)
 		goto err_cleanup_resources;
 	}
 
+	ret = init_drm_private(qdev);
+	if (ret) {
+		qda_err(qdev, "DRM private data initialization failed: %d\n", ret);
+		goto err_cleanup_iommu;
+	}
+
 	qda_dbg(qdev, "QDA device initialized successfully\n");
 	return 0;
 
+err_cleanup_iommu:
+	cleanup_iommu_manager(qdev);
 err_cleanup_resources:
 	cleanup_device_resources(qdev);
 	return ret;
 }
 
+static int setup_and_register_drm_device(struct qda_dev *qdev)
+{
+	struct drm_device *ddev;
+	int ret;
+
+	qda_dbg(qdev, "Setting up and registering DRM device\n");
+
+	ddev = drm_dev_alloc(&qda_drm_driver, qdev->dev);
+	if (IS_ERR(ddev)) {
+		ret = PTR_ERR(ddev);
+		qda_err(qdev, "Failed to allocate DRM device: %d\n", ret);
+		return ret;
+	}
+
+	qdev->drm_priv->drm_dev = ddev;
+	qdev->drm_priv->iommu_mgr = qdev->iommu_mgr;
+	qdev->drm_priv->qdev = qdev;
+
+	ddev->dev_private = qdev->drm_priv;
+	qdev->drm_dev = ddev;
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret) {
+		qda_err(qdev, "Failed to register DRM device: %d\n", ret);
+		drm_dev_put(ddev);
+		return ret;
+	}
+
+	qda_dbg(qdev, "DRM device registered successfully\n");
+	return 0;
+}
+
+int qda_register_device(struct qda_dev *qdev)
+{
+	int ret;
+
+	ret = setup_and_register_drm_device(qdev);
+	if (ret) {
+		qda_err(qdev, "DRM device setup failed: %d\n", ret);
+		return ret;
+	}
+
+	qda_dbg(qdev, "QDA device registered successfully\n");
+	return 0;
+}
+
+void qda_unregister_device(struct qda_dev *qdev)
+{
+	qda_info(qdev, "Unregistering QDA device\n");
+
+	if (qdev->drm_dev) {
+		qda_dbg(qdev, "Unregistering DRM device\n");
+		drm_dev_unregister(qdev->drm_dev);
+		drm_dev_put(qdev->drm_dev);
+		qdev->drm_dev = NULL;
+	}
+
+	qda_dbg(qdev, "QDA device unregistered successfully\n");
+}
+
 static int __init qda_core_init(void)
 {
 	int ret;
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 2cb97e4eafbf..2b80401a3741 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -11,13 +11,35 @@
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/xarray.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_device.h>
+#include <drm/drm_accel.h>
 #include "qda_memory_manager.h"
 
 /* Driver identification */
 #define DRIVER_NAME "qda"
 
+/**
+ * struct qda_drm_priv - DRM device private data for QDA device
+ *
+ * This structure serves as the DRM device private data (stored in dev_private),
+ * bridging the DRM device context with the QDA device and providing access to
+ * shared resources like the memory manager during buffer operations.
+ */
+struct qda_drm_priv {
+	/* DRM device structure */
+	struct drm_device *drm_dev;
+	/* Global memory/IOMMU manager */
+	struct qda_memory_manager *iommu_mgr;
+	/* Back-pointer to qda_dev */
+	struct qda_dev *qdev;
+};
+
 /* struct qda_dev - Main device structure for QDA driver */
 struct qda_dev {
+	/* DRM device for accelerator interface */
+	struct drm_device *drm_dev;
 	/* RPMsg device for communication with remote processor */
 	struct rpmsg_device *rpdev;
 	/* Underlying device structure */
@@ -26,6 +48,8 @@ struct qda_dev {
 	struct mutex lock;
 	/* IOMMU/memory manager */
 	struct qda_memory_manager *iommu_mgr;
+	/* DRM device private data */
+	struct qda_drm_priv *drm_priv;
 	/* Flag indicating device removal in progress */
 	atomic_t removing;
 	/* Name of the DSP (e.g., "cdsp", "adsp") */
@@ -39,8 +63,8 @@ struct qda_dev {
  * @qdev: QDA device structure
  *
  * Returns the most appropriate device structure for logging messages.
- * Prefers qdev->dev, or returns NULL if the device is being removed
- * or invalid.
+ * Prefers qdev->dev, falls back to qdev->drm_dev->dev, or returns NULL
+ * if the device is being removed or invalid.
  */
 static inline struct device *qda_get_log_device(struct qda_dev *qdev)
 {
@@ -50,6 +74,9 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
 	if (qdev->dev)
 		return qdev->dev;
 
+	if (qdev->drm_dev)
+		return qdev->drm_dev->dev;
+
 	return NULL;
 }
 
@@ -93,5 +120,7 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
  */
 int qda_init_device(struct qda_dev *qdev);
 void qda_deinit_device(struct qda_dev *qdev);
+int qda_register_device(struct qda_dev *qdev);
+void qda_unregister_device(struct qda_dev *qdev);
 
 #endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 5a57384de6a2..b2b44b4d3ca8 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -80,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	qdev->rpdev = NULL;
 	mutex_unlock(&qdev->lock);
 
+	qda_unregister_device(qdev);
 	qda_unpopulate_child_devices(qdev);
 	qda_deinit_device(qdev);
 
@@ -123,6 +124,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
+	ret = qda_register_device(qdev);
+	if (ret) {
+		qda_deinit_device(qdev);
+		qda_unpopulate_child_devices(qdev);
+		return ret;
+	}
+
 	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
 	return 0;
 }

-- 
2.34.1


