Return-Path: <linux-media+bounces-34381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ABBAD2E58
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE93170CFE
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0EC27EC74;
	Tue, 10 Jun 2025 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qxNwjfzC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B714279782;
	Tue, 10 Jun 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539326; cv=none; b=S0LtLksnqeILVb2odHBPg9w/JyeDrkcYc4samnMnDBvc7vxhtzdE2rif5Ua5hkl1NMXBqYMJ8ERGMFRPYO6Po5c8uACHc46NsDeBkJE2QeBc0CFH+CW8xWUI0B3iimefoUqgqrXpG56C6xalEt6numx17Tmy/x/rhbww7MYmhQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539326; c=relaxed/simple;
	bh=QcyXPFcPfN14Q5mVuC3lAt6POPZJpQWvb+wyX6TiII8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=u+1a2jkCYjahgifpTyCupFZTCWB7ACDpytdiBSrZsF0z8nWtwaVesjT88xyz5KIjxwOFuOSb6fXwPI0ZjE8QVhJRRowM0mcrvxqQHF1PTSYMA0q3D2qKzrj1KL60CfDDXNkk2gStPIh8jL8yce5PnIeggFrxgqg9kQGhRZSUd3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qxNwjfzC; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2bxrF004177;
	Tue, 10 Jun 2025 09:08:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mpLBdpH7Q64UGulCvUH0/TRi7b8UYxTI3kawUDO4Z6Y=; b=qxNwjfzC8mQFG39q
	861Vt723blDlKoApvlZKj8j+00dSOy2h+H2iT2KE90MjBBYIj9gQ6tp46WFOrsYk
	QejggceI63Sqv0QYcax/+uYnkw2NRapS85/F0SSVC91Ve46A/m5zlIkJKyDiEZjq
	RkcT/20a7Db24v4WTCGnf8oj+CXZlKmAQPyjIVJFlx93hyM4lpdZ7WnDYPaUTKPO
	nO8PSXGndWf4jci8U0zytEoiKYjbcgSvnLAgOw8P4OQYfRsEgl04AFXGjKF1yFlN
	DvDq7nfCT7UTJpJzsXmzRFa0q5ZJUbqcZm1Ki6oKlR3sVsxeWpHeASAIvwdLADmh
	hkMxYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2k6sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:08:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 688ED40049;
	Tue, 10 Jun 2025 09:07:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE7E9B9DCE2;
	Tue, 10 Jun 2025 09:07:42 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:07:42 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 10 Jun 2025 09:07:41 +0200
Subject: [PATCH v2 1/4] media: i2c: vd55g1: Fix RATE macros not being
 expressed in bps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-fix_vd55g1-v2-1-328305748417@foss.st.com>
References: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
In-Reply-To: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01

As a bit rate is expressed in bps, use MEGA instead of HZ_PER_MHZ.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 25e2fc88a0367bf6a28bb22d209323ace99299f2..78dd22d9cab03edf4ff3e5a301f8d045e930c997 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -129,8 +129,8 @@
 #define VD55G1_FWPATCH_REVISION_MINOR			9
 #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
 #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
-#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
-#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
+#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
+#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
 
 static const u8 patch_array[] = {
 	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,

-- 
2.25.1


