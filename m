Return-Path: <linux-media+bounces-32679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224CABA9DB
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 940E51B62074
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560D81FBC91;
	Sat, 17 May 2025 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPLWz4vN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0871F8725
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482197; cv=none; b=JCsv8I1ofafJt3UshQMbDs3JXuJLz79soNn2WacvNoIVYLAthBICxsblXn5TfrEFuf9bAPhzvSfQzAAwsuOBvTBXJvHmOZoAQGFFQBLFOLUHhSutYqYWCqgvkJ7kDMhxj64P+Qmm30JlvKRkxEifQfB5TStVLm2zXq7rarnNoA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482197; c=relaxed/simple;
	bh=ZJGL0muPWqnauXLIPFAYVtvlCCUe4QZI+RbxavIbA7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piIfRCVRKL7jBybWo9Csijv9KjLvfxenWC4pF01EU92ApL100LramOc/3d9exFHIcbPOB+Wl3x7tyOlY2f8rt9ETLOGw9TVBuynSi+e30dGTousP3HBiHRElzSWxsDvkOfR1YIp47peuIbZS4V4t2F8O+xTNS2RKsI7uv2Qf/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPLWz4vN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mDO/TmKNQR3jCwP33V3psrrzDK+VkoWi4epaJB4JJ9c=;
	b=BPLWz4vN/SsCZXQrFl3jc52axQly5b8M+DD/mPfNz9ybnw/trovqHIz/vVsQYX+1YaNmIp
	fcJRySiXsZeipOGqqR0IIiQT/gOD1TAbHpbNvhcj74W6Yimgc8wNnUOvPq1q314rAHCdfD
	/Fo16kI807HXerHwhi7zwniV2XUm4pQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-CwEWZjifNNO2yJ973AkXgw-1; Sat,
 17 May 2025 07:43:12 -0400
X-MC-Unique: CwEWZjifNNO2yJ973AkXgw-1
X-Mimecast-MFC-AGG-ID: CwEWZjifNNO2yJ973AkXgw_1747482191
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4368B195608E;
	Sat, 17 May 2025 11:43:11 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C3AD18003FC;
	Sat, 17 May 2025 11:43:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 21/23] media: atomisp: gc0310: Drop gc0310_get_frame_interval()
Date: Sat, 17 May 2025 13:41:04 +0200
Message-ID: <20250517114106.43494-22-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On raw camera sensors the framerate is controlled through vblank
(and optional) hblank controls.

Having a get_frame_interval makes no sense in this case, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/i2c/atomisp-gc0310.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 152835fa4226..73779c20ca68 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -513,23 +513,6 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int gc0310_get_frame_interval(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_state *sd_state,
-				     struct v4l2_subdev_frame_interval *interval)
-{
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
-
-	interval->interval.numerator = 1;
-	interval->interval.denominator = GC0310_FPS;
-
-	return 0;
-}
-
 static int gc0310_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -579,7 +562,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_set_selection,
-	.get_frame_interval = gc0310_get_frame_interval,
 	.enable_streams = gc0310_enable_streams,
 	.disable_streams = gc0310_disable_streams,
 };
-- 
2.49.0


