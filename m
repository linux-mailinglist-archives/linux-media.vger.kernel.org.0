Return-Path: <linux-media+bounces-9385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982F8A50F0
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A41D1F20FD7
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35349128812;
	Mon, 15 Apr 2024 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TNLFDFfy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90262128386
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186221; cv=none; b=C30vq/uZf3qOXk0e+fc/62TM2tB3o0fUC/iHj76Xx4/brAcNM+Th0tMZsrdlA52iUlfTEKn1dKvKPKvtpnnQyU9HCCeAekMWFPY50jUIWbg8Iw8HoD/P43n/HFOQskhqFOm8Bb0EsL2qESWEPRLlmX0X0OyypcEIFPNO+J/cU88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186221; c=relaxed/simple;
	bh=Tdu6OBH5DJtj6de6x7md59ZW+6g0lUQEhSHmlok/Ahs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrE9Ad337mWf041L++nTOIM8LBBmPMB3r2MmpZ24l2H1sXAOfUiAKZh2n9CfewlInMbdgXDLJsLOH1l7V+dUcM1AJUjfoSB1ltnsd4usZD+KflKbz3XmXVpJszieqF7i2WQxeB3S4L1ytNCmASWZpglxAhnPpBrFRlkerspYuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TNLFDFfy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BeH60ThU8MRnDZbjttDVNCJKnlAoPaM/0kQfoJ+lgec=;
	b=TNLFDFfyPWZu72ct3h/1vmcTDpSXEyHjB0a1VCI+oT7j3p+o640bBO8U2eOUu5RqytqUSs
	Usv5awx4YW4x/l4w6VZifYD5sf5tVlJoEFk48IBkMzeI9n2kwi14MTZ30gnlp4Xgf6UPby
	PW/QtKqXHELLHGfG5/4UJdlkkjz4tTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-rv-2z3xONTu79x8nMT914Q-1; Mon, 15 Apr 2024 09:03:34 -0400
X-MC-Unique: rv-2z3xONTu79x8nMT914Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F339C881E66;
	Mon, 15 Apr 2024 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB1E21121312;
	Mon, 15 Apr 2024 13:03:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/5] media: ov2680: Drop hts, vts ov2680_mode struct members
Date: Mon, 15 Apr 2024 15:03:15 +0200
Message-ID: <20240415130318.234222-3-hdegoede@redhat.com>
In-Reply-To: <20240415130318.234222-1-hdegoede@redhat.com>
References: <20240415130318.234222-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

The hts, vts ov2680_mode struct members always contain
OV2680_PIXELS_PER_LINE resp. OV2680_LINES_PER_FRAME,
drop them and simply use these values directly.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 4429b569ded0..6c3d7862b2aa 100644
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
2.44.0


