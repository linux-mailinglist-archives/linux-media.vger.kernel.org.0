Return-Path: <linux-media+bounces-15728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A58946079
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 17:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 825EEB24157
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 15:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6581537D4;
	Fri,  2 Aug 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="gl0fMV/y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE1175D29;
	Fri,  2 Aug 2024 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612290; cv=none; b=B1IaB+xfm8fKTLECLyB677vGGzFdKyDCYltB8PiY7FajmbzOaRe+/v7dgC2fPk0j49WjEuuRiEGtTVsHFubY239qnCxG/eWHKXT3m/mHFCf2EVgNYI9IBFqf/KFIjtsB7P03kiCFEWcybTJjsE282bYUD7hf55dVAPy4Kv4ooo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612290; c=relaxed/simple;
	bh=M8qcfFelmeMZAh8kqX7LJJxJpym2qszDCS9w9IsDnLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/eY/MM85wej4rjjB+CqYXnE/l+z5NCQcQyegPhcK1oFhY5uwZjHPNhw2LI1YllllNuP4E501kE5kixRiu/5iLGcVZQi/MROIQA7ZBgPfGsUCi1IOcz5hpTHB33z/HVmtDDn0tMgH9T2gXqEQJ6766V1IFEyVciPdU66pZAiTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=gl0fMV/y; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1722612289; x=1754148289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HlTLf6rMFLh/z3VvfgmI3bnbMSeXF59wzmGFsXVVC5k=;
  b=gl0fMV/y+waoLRFUMr0mBjcaD1LzCTo433XGVdWMzcot12yIWSO8HvwE
   CyYH2cHBamxy4+DbqOaSSFRnZ3iDpZywxt3vkjLjg1zZ3Qs8J6le1QU2d
   i6rZk21HQNM64Ro8zgiC0dcops42urPdAshpHiv7yFAniMxofDpVpBjLu
   k=;
X-IronPort-AV: E=Sophos;i="6.09,258,1716249600"; 
   d="scan'208";a="746702857"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 15:24:47 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:26186]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.27.192:2525] with esmtp (Farcaster)
 id 2c37182a-10f2-45eb-8eda-90c6ae2bc19a; Fri, 2 Aug 2024 15:24:46 +0000 (UTC)
X-Farcaster-Flow-ID: 2c37182a-10f2-45eb-8eda-90c6ae2bc19a
Received: from EX19EXOUWC002.ant.amazon.com (10.250.64.172) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 2 Aug 2024 15:24:38 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19EXOUWC002.ant.amazon.com (10.250.64.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 2 Aug 2024 15:24:35 +0000
Received: from dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com
 (10.189.195.130) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server id 15.2.1258.34 via Frontend Transport; Fri, 2 Aug 2024 15:24:35 +0000
Received: by dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com (Postfix, from userid 14178300)
	id 68F76A79F; Fri,  2 Aug 2024 15:24:35 +0000 (UTC)
From: Jordan Crouse <jorcrous@amazon.com>
To: <linux-media@vger.kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] media: camss: Avoid overwriting vfe clock rates for 8250
Date: Fri, 2 Aug 2024 15:24:34 +0000
Message-ID: <20240802152435.35796-3-jorcrous@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240802152435.35796-1-jorcrous@amazon.com>
References: <20240802152435.35796-1-jorcrous@amazon.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On sm8250 targets both the csid and vfe subsystems share a number of
clocks. Commit b4436a18eedb ("media: camss: add support for SM8250 camss")
reorganized the initialization sequence so that VFE gets initialized first
but a side effect of that was that the CSID subsystem came in after and
overwrites the set frequencies on the shared clocks.

Empty the frequency tables for the shared clocks in the CSID resources so
they won't overwrite the clock rates that the VFE has already set.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

 drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..d78644c3ebe9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -915,6 +915,15 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	}
 };
 
+/*
+ * Both CSID and VFE use some of the same vfe clocks and both
+ * should prepare/enable them but only the VFE subsystem should be in charge
+ * of setting the clock rates.
+ *
+ * Set the frequency tables for those clocks in the CSID resources to
+ * be empty so the csid subsystem doesn't overwrite the clock rates that the
+ * VFE already set.
+ */
 static const struct camss_subdev_resources csid_res_8250[] = {
 	/* CSID0 */
 	{
@@ -922,8 +931,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -939,8 +948,8 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
@@ -956,7 +965,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -973,7 +982,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.40.1


