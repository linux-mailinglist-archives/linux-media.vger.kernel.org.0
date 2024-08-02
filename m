Return-Path: <linux-media+bounces-15726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3A946072
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 17:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 758F91C228AE
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 15:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C4D136330;
	Fri,  2 Aug 2024 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="djhxSie+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3C175D29;
	Fri,  2 Aug 2024 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.48.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612282; cv=none; b=EhY33XNTICnD77dVgt2ADqL/v9Uhz1ExTIUXUm94SYhX+GjTVptj8t4pdZoKVapUBYzoCQJ+g9+j8Ee/iM8+iOqXlQfL3SYiCOqCN9XFuy/7+yn8Dq1mqtdxeuBxEF9fGXHjrwjaEK6h4bknYxqDpJU8CsnTcx5N/oeIAF0jMHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612282; c=relaxed/simple;
	bh=91p870/rRanZasdHLOWguMt8ptE+GmphjiT9JCKHqHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nRIIB/ArJBct1IC6aoLQdlCCd9RPtuHP46OLjUdS1jRnEVx7sA6RYki99+30VIOoCKbPndLA5LKz8UjIJbYIg4P9XV5VH1L4s/izVRgi6uF5DPtfeqTuJrEL0XvwXHuj7H5SlqiN5czmTnGwoPFDwOxvTRFI4tO6WuZH1ePK+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=djhxSie+; arc=none smtp.client-ip=52.95.48.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1722612281; x=1754148281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PrydxDt7pTISVpngrNccUM25MlZxuE5DczCA48XlqC4=;
  b=djhxSie+CyGO8d0W6I1WDlKweqW/QhNWqFx1o+ggKdf7Uh0ivGclTNNF
   edvipLLDMaEsoTprqY3jBfYn6xeRQ+cfRXMvwMqKX7LCQoUf8CNG95aik
   MfGxnSz3uVV+Vzo3PpXMUaK8ChFqKKPpQ6PsIdfncO7cCUj88sPXQm/Pq
   M=;
X-IronPort-AV: E=Sophos;i="6.09,258,1716249600"; 
   d="scan'208";a="414879172"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 15:24:40 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.29.78:27313]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.60.140:2525] with esmtp (Farcaster)
 id c8f62a25-5850-4be2-8b21-c56fe4454c4c; Fri, 2 Aug 2024 15:24:39 +0000 (UTC)
X-Farcaster-Flow-ID: c8f62a25-5850-4be2-8b21-c56fe4454c4c
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.108) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 2 Aug 2024 15:24:35 +0000
Received: from dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com
 (10.189.195.130) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server id 15.2.1258.34 via Frontend Transport; Fri, 2 Aug 2024 15:24:35 +0000
Received: by dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com (Postfix, from userid 14178300)
	id 3B1A8A79E; Fri,  2 Aug 2024 15:24:35 +0000 (UTC)
From: Jordan Crouse <jorcrous@amazon.com>
To: <linux-media@vger.kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] media: camss: Increase the maximum frame size
Date: Fri, 2 Aug 2024 15:24:33 +0000
Message-ID: <20240802152435.35796-2-jorcrous@amazon.com>
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

Commit 35493d653a2d
("media: camss: add support for vidioc_enum_framesizes ioctl") added a
maximum frame width and height but the values selected seemed to have
been arbitrary. In reality the cam hardware doesn't seem to have a maximum
size restriction so double up the maximum reported width and height to
allow for larger frames.

Also increase the maximum size checks at each point in the pipeline so
the increased sizes are allowed all the way down to the sensor.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

 drivers/media/platform/qcom/camss/camss-csid.c   | 8 ++++----
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-ispif.c  | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c    | 4 ++--
 drivers/media/platform/qcom/camss/camss-video.c  | 6 +++---
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..886c42c82612 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -752,8 +752,8 @@ static void csid_try_format(struct csid_device *csid,
 		if (i >= csid->res->formats->nformats)
 			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
-		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
-		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
+		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
+		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
 
 		fmt->field = V4L2_FIELD_NONE;
 		fmt->colorspace = V4L2_COLORSPACE_SRGB;
@@ -781,8 +781,8 @@ static void csid_try_format(struct csid_device *csid,
 			if (i >= csid->res->formats->nformats)
 				fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
-			fmt->width = clamp_t(u32, fmt->width, 1, 8191);
-			fmt->height = clamp_t(u32, fmt->height, 1, 8191);
+			fmt->width = clamp_t(u32, fmt->width, 1, 16383);
+			fmt->height = clamp_t(u32, fmt->height, 1, 16383);
 
 			fmt->field = V4L2_FIELD_NONE;
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2f7361dfd461..43c35ad6ac84 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -368,8 +368,8 @@ static void csiphy_try_format(struct csiphy_device *csiphy,
 		if (i >= csiphy->res->formats->nformats)
 			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
-		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
-		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
+		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
+		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
 
 		fmt->field = V4L2_FIELD_NONE;
 		fmt->colorspace = V4L2_COLORSPACE_SRGB;
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index a12dcc7ff438..01e2ded8da0b 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -912,8 +912,8 @@ static void ispif_try_format(struct ispif_line *line,
 		if (i >= line->nformats)
 			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
-		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
-		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
+		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
+		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
 
 		fmt->field = V4L2_FIELD_NONE;
 		fmt->colorspace = V4L2_COLORSPACE_SRGB;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..826c0fb31785 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1049,8 +1049,8 @@ static void vfe_try_format(struct vfe_line *line,
 		if (i >= line->nformats)
 			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
-		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
-		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
+		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
+		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
 
 		fmt->field = V4L2_FIELD_NONE;
 		fmt->colorspace = V4L2_COLORSPACE_SRGB;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index cd72feca618c..5fee3733da8e 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -19,10 +19,10 @@
 #include "camss.h"
 
 #define CAMSS_FRAME_MIN_WIDTH		1
-#define CAMSS_FRAME_MAX_WIDTH		8191
+#define CAMSS_FRAME_MAX_WIDTH		16833
 #define CAMSS_FRAME_MIN_HEIGHT		1
-#define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
-#define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
+#define CAMSS_FRAME_MAX_HEIGHT_RDI	16833
+#define CAMSS_FRAME_MAX_HEIGHT_PIX	8192
 
 /* -----------------------------------------------------------------------------
  * Helper functions
-- 
2.40.1


