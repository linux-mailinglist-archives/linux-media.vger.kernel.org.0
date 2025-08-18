Return-Path: <linux-media+bounces-40159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B4B2A87C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A79E4682F9B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54158335BD3;
	Mon, 18 Aug 2025 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DsfDAcTj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2559B335BA7;
	Mon, 18 Aug 2025 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525135; cv=none; b=EALiIDWVMQ8wlMGWFElgX0PxnmC9rulpxLASlaQ4u+xq3niBGoGteEE7TDud48kOyu5h5XkqZZbR8VQBdZf2IyJR9PhagkincqB7PZa1ow0ITA2IOVnS7Kow8cGKATKYhb7BAidXPBfrpf3Q0WPeomjoytMKIh8E3FJapSoBQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525135; c=relaxed/simple;
	bh=wi+0QNkPOugT6JOMfzYD2wc4/e8/bx0qT57TNE32Q0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=Yq8FlGVd+FRBUZ82zutUxP1i0cKiYbmaSJ1ZdxjwOU30VHdB2p+5Lck8nx7fi9CQNpGYvUngnfe4twNkGC9SGHV/E4Cmvb1JGe70W8qI2k+r+Q94fpI7D86zLFMNZU649HrZoif4pkl5TLMe1scd2XQ8LRloe6J72QzhqH9balQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DsfDAcTj; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ID1Ust028333;
	Mon, 18 Aug 2025 15:52:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=lQsWtz3kZhHMqlwF/9KrdB
	DL9HK4g/FK7O7sXljKnFY=; b=DsfDAcTjIfc38z2hOzkkQjZttx8JeyYf3fQdvK
	zD6LG8ACaKNPyKZFR5TnvkgNdNW85+wX0f6KUgveqIxe6PO9rMMJXQ4X8kvlNBaJ
	iRSXXgy/RCA2/X19YArGnVGxi7K3apq5AKqOdHYAmut7RrtNqUfF+NNiVV6x33/1
	tqa2twIm398/1jYTL13SAFOaEq4OLVkrPfqOdlciHckp7Pa6JIkQHvdDFD4bgvZB
	xi3NU5EtRY5K2ky2F3R6S8w/L5GyTEXoMKjDuR76QTk1WPr8WhZpJyaVhE3/44bf
	JRysP1DGg+zxYFFuw4xbjjMOQ84Ak0a5bU5kXM6U5+toWDsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmmd2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 15:52:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EB09F40046;
	Mon, 18 Aug 2025 15:51:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0AB3734218;
	Mon, 18 Aug 2025 15:51:04 +0200 (CEST)
Received: from localhost (10.130.78.67) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 15:51:04 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 18 Aug 2025 15:50:58 +0200
Subject: [PATCH] media: i2c: vd55g1: Fix duster register address
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250818-vd55g1_fix_duster-v1-1-1b9d115dee87@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAMEvo2gC/x2MQQqAIBAAvyJ7TlBJs74SIZVb7aVCSwLp70nHY
 ZjJEDEQRuhYhoCJIh17AVkxmLdxX5GTLwxKKC2stDx5rVfpFnqcv+OFgZvJtE2rrFC1hdKdAYv
 9n/3wvh+QFBdFYwAAAA==
X-Change-ID: 20250818-vd55g1_fix_duster-6b6979280248
To: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01

The duster register needs to be disabled on test patterns. While the
code is correctly doing so, the register address contained a typo, thus
not disabling the duster correctly. Fix the typo.

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index b89fff7e11f891dea04a0085a9e7aac841b6643d..cf35f73fdd1086c6d4d76f67c2b6e4cf66eadff8 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -66,7 +66,7 @@
 #define VD55G1_REG_READOUT_CTRL				CCI_REG8(0x052e)
 #define VD55G1_READOUT_CTRL_BIN_MODE_NORMAL		0
 #define VD55G1_READOUT_CTRL_BIN_MODE_DIGITAL_X2		1
-#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ea)
+#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ae)
 #define VD55G1_DUSTER_ENABLE				BIT(0)
 #define VD55G1_DUSTER_DISABLE				0
 #define VD55G1_DUSTER_DYN_ENABLE			BIT(1)

---
base-commit: 2412f16c9afa7710778fc032139a6df38b68fd7c
change-id: 20250818-vd55g1_fix_duster-6b6979280248

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


