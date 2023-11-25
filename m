Return-Path: <linux-media+bounces-1028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874267F8D19
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 19:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0EBA1C20B40
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 18:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9C02E418;
	Sat, 25 Nov 2023 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3szK15e0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467BFD3;
	Sat, 25 Nov 2023 10:25:31 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AP4pIvT029338;
	Sat, 25 Nov 2023 19:24:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=V3Tv5qFFk5ZxQeDUxNUTAAu3mduf0PktUnlTC3Lmm5k=; b=3s
	zK15e0pA/ua5IMLkmESOskXzI7bY6AugncnVL/lxzRJVYmr+HJWEsow6/Jxfeaxk
	Vf1i1oEnGKsbJaMlVSks05cQ2qmBCvz043C1P1OxG7MqZ3sFoDv0gTg0OyLBrzpa
	83qHk40t2qbh+OpwyFvnthrKA9FlINPrEPV8IOnmlAoksnB9KHLCVsHi5Ndlld8/
	GCD21nlyDAZHtc53Nzpw/0SC59MxfgdczGPLTjOEanCaYeIL3sLQqqVCmHVyqUuT
	meWgs3zX+WzB5aIFJDQP7ZpLZlPzzlLzREJeX5uXjTtXgkmsz2zjA6WTUwAESVGo
	8JGb9nqNcKRp5kXnAwIQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pjhw1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Nov 2023 19:24:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D093510002A;
	Sat, 25 Nov 2023 19:24:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8CAB23C6B5;
	Sat, 25 Nov 2023 19:24:51 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 25 Nov
 2023 19:24:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/7] media: i2c: st-mipid02: removal of unused link_frequency variable
Date: Sat, 25 Nov 2023 19:20:54 +0100
Message-ID: <20231125182057.1379357-7-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231125182057.1379357-1-alain.volmat@foss.st.com>
References: <20231125182057.1379357-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-25_18,2023-11-22_01,2023-05-22_02

link_frequency variable within struct mipid02_dev seems to have never
been used hence remove it.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 783c2848c584..ef0d7f8ba17d 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -96,7 +96,6 @@ struct mipid02_dev {
 	struct gpio_desc *reset_gpio;
 	/* endpoints info */
 	struct v4l2_fwnode_endpoint rx;
-	u64 link_frequency;
 	struct v4l2_fwnode_endpoint tx;
 	/* remote source */
 	struct v4l2_async_notifier notifier;
-- 
2.25.1


