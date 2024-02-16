Return-Path: <linux-media+bounces-5318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A888588B5
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 23:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493631C21CDF
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 22:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF6B14C5A5;
	Fri, 16 Feb 2024 22:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4me6mjX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE71DFFD
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122777; cv=none; b=KZ8nwAEZDFOVRpDRXhQv3peXSzxMdUYdpAsrL9BJvLv9W2C6vo97Csa1o2JDmjb3GnCDALAcQJErajTSvRCFlGGNtZNHq9zZVNlbX7a7paql9TNmSZvnod3wKZQvoNWhIn3ut1FO+ZOwf7IxcWlVaZMSeG3HYt3V/EqoCaSeJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122777; c=relaxed/simple;
	bh=W11xflpd66YspATmFibYd1oUNv/gqmozNkAYzM7jey8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/rj0omVEsOSXRucak+fLONjB0ge4GDxjren0v9r32Dj1sGu9B+7eydEFoJIGjc934tB4+oXgX2vOWJ9hn4QNVHkshue1+Yd5qeWkhQoL1zGpZ8juabRs4tM6QvTJyotDnGuk7ZC6JTpEF+Rtct8PZmfhCqfz56f0D7+h8uCP4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4me6mjX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708122772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4ALrPxnEtWn2IFQyCdtOkhGX7pNHIk2b1SwblGmOX4=;
	b=D4me6mjXL2+wLfbf3BSVDRceBB41m3RzAnMKyFHM+SOGaZvm99K0Obq/9xrN/BBGFmkqL1
	CdZTP2rBNLxMoAHM4TZs8w5oAfP0cJV8qQGet3DdohIXmvjUMTBMdkc95Pa4aznLxqCkmn
	1a/cROPqNJJFi8tfu31Dr27AOxdCltA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-TCea4XN-PhCMXf_iOBVBFw-1; Fri, 16 Feb 2024 17:32:49 -0500
X-MC-Unique: TCea4XN-PhCMXf_iOBVBFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BE32185A781;
	Fri, 16 Feb 2024 22:32:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 441E0C0335E;
	Fri, 16 Feb 2024 22:32:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/5] media: ov2680: Drop hts, vts ov2680_mode struct members
Date: Fri, 16 Feb 2024 23:32:34 +0100
Message-ID: <20240216223237.326523-3-hdegoede@redhat.com>
In-Reply-To: <20240216223237.326523-1-hdegoede@redhat.com>
References: <20240216223237.326523-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

The hts, vts ov2680_mode struct members always contain
OV2680_PIXELS_PER_LINE resp. OV2680_LINES_PER_FRAME,
drop them and simply use these values directly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 5b04c6c0554a..b4d5936dcd02 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -140,8 +140,6 @@ struct ov2680_mode {
 	u16				v_end;
 	u16				h_output_size;
 	u16				v_output_size;
-	u16				hts;
-	u16				vts;
 };
 
 struct ov2680_dev {
@@ -361,8 +359,6 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 		min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIGHT - 1);
 	sensor->mode.h_output_size = orig_width;
 	sensor->mode.v_output_size = orig_height;
-	sensor->mode.hts = OV2680_PIXELS_PER_LINE;
-	sensor->mode.vts = OV2680_LINES_PER_FRAME;
 }
 
 static int ov2680_set_mode(struct ov2680_dev *sensor)
@@ -397,9 +393,9 @@ static int ov2680_set_mode(struct ov2680_dev *sensor)
 	cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
 		  sensor->mode.v_output_size, &ret);
 	cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
-		  sensor->mode.hts, &ret);
+		  OV2680_PIXELS_PER_LINE, &ret);
 	cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
-		  sensor->mode.vts, &ret);
+		  OV2680_LINES_PER_FRAME, &ret);
 	cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
 	cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
 	cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
-- 
2.43.0


