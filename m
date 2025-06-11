Return-Path: <linux-media+bounces-34494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEAAD4ED6
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 10:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8261BC1695
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 08:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3B124291B;
	Wed, 11 Jun 2025 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6SetRcbr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F223ED68;
	Wed, 11 Jun 2025 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631790; cv=none; b=eIOxLXriPPhWAPZvZpkGdny43rjW7z4XJdC4F5dXEeTbNUeWmSke6vgPb/hiBYWQvXD0OVh90d+pc7GYRiqev7jIwj1C8LUzyGT7uRcqgEzVSrgdtLfSRBledy6BRDvr3J70CfvvBANIQgIdBynS2xFmtLtVmz61/BrpcdDYZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631790; c=relaxed/simple;
	bh=QcyXPFcPfN14Q5mVuC3lAt6POPZJpQWvb+wyX6TiII8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VYGR72+KSybR1XrG3pFxzlOXH8uj7KZb3P760Z5h6T6u2o20bJMuRU33Pf9S+96WlYrmmYnQYi10jhB42aZpsmhoEzUZ95ozt4QmAonSCeIq3EL0cDxTnYR5pYxHkPwF/FhNeYs8TSXrpYsBMZqBN5Igp16n2LFA9skEGcSxvag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6SetRcbr; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B6maDR020329;
	Wed, 11 Jun 2025 10:49:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mpLBdpH7Q64UGulCvUH0/TRi7b8UYxTI3kawUDO4Z6Y=; b=6SetRcbrz6+zMLw6
	LUG1latKt0nN7VxwJi6/OxNrHWF1tkAK2A8RSxBJIW4YklGZDWx6GG+txlI6ay5t
	ONQgnaCZwGX05tStuTvRp8+wxAitb0os0S67OEYiMCmMsklvRjBFH6jeluFYmAVA
	h1xk7C4q/hbVnFunhkxv0d47aoscLh55jX9b8PTvENqt7GVcLevH8UtVsa8iqU64
	O9K7iw8Ch4ioIof8GMz/dgVOgKck+T1IN5x6dPGVkWrqirDr/x6okRHXdy9HhlQ+
	uTX021dF5LFk1JhGEZuIEW/pzASNzBOnIhk69VLzJG/jS9hTON+tcjSt2c2EeRZz
	r8n26g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aja8n4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:49:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C584F4005C;
	Wed, 11 Jun 2025 10:48:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70C4EAFF5E5;
	Wed, 11 Jun 2025 10:48:38 +0200 (CEST)
Received: from localhost (10.252.5.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:48:38 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 11 Jun 2025 10:48:30 +0200
Subject: [PATCH v3 1/4] media: i2c: vd55g1: Fix RATE macros not being
 expressed in bps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-fix_vd55g1-v3-1-ef4ecf15ddbc@foss.st.com>
References: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
In-Reply-To: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01

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


