Return-Path: <linux-media+bounces-31665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0160AA85D6
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E72A57A572C
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A571A2547;
	Sun,  4 May 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmrYRJyg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A0193436
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353641; cv=none; b=Cgg3CjnaJ8Jker8eHU7A+DLRR2HvSoUxRmPeYTS3DsUVWwUTYwD3UqefQQ1hs15ARN3HXp0GjmQv7DBY77kxWUvE1LMIrykUEIP176khf42oxBZtmtMWl0OzI+6IrUXQciCjaSPg+p8tyfU/ViumlK1orslQfNqsB4fOflMM7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353641; c=relaxed/simple;
	bh=4Y79PE0JFjjJbxb4lrmXV+o7yKBiFz8YohY53HWyrw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMkrlKX+HnlssXAQUbjtUmccJCp2AoxaQLjsAZHVe5oviUN8lZf2jOXWaAfED7/ErBl1HIq2VPSLqM9RhF2+XvzGr9NONOi6HOkoy1A723v2BMPfymQTsSvhMDbDj6gt1XPM5O0drbbLzd3PYTJYuew59Re3EKQg0pPx/8/fTGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmrYRJyg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0ZVcxe9/Eypp4v81yAFIOwAv3pNr7JlKMRhZ+tOG6Y=;
	b=ZmrYRJygTH0KEEAWwNkBdpv+7X4Spmu8XWcvOrToFJO/I5bX39eXRY373BrJNSnCqidmvl
	nGieKQGWaiveIAD/JpMx2Wmkg07DxrWkrHoWtP+YyQnTpHodIDUrDrJK85wYIxRHcQ1qid
	pOT6a43OYMoGriAhuWCOe1i3ZOYvKSk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-oreQk6jjPo24IeXvXwDCKw-1; Sun,
 04 May 2025 06:13:55 -0400
X-MC-Unique: oreQk6jjPo24IeXvXwDCKw-1
X-Mimecast-MFC-AGG-ID: oreQk6jjPo24IeXvXwDCKw_1746353634
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE69518004A7;
	Sun,  4 May 2025 10:13:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7BC5C1800352;
	Sun,  4 May 2025 10:13:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 05/13] media: mt9m114: Fix default hblank and vblank values
Date: Sun,  4 May 2025 12:13:26 +0200
Message-ID: <20250504101336.18748-6-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The old default hblank and vblank values were based on reaching 30 fps
with the pixel-array outputting 1280x960, but the default format for
the pixel-array source pad and the isp sink pad is 1296x976, correct
the default hblank and vblank values to take this into account.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index b40142aed3e8..52337c719e22 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -327,12 +327,12 @@
  * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
- * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
+ * Set the default to achieve 1296x976 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				323
-#define MT9M114_DEF_VBLANK				39
+#define MT9M114_DEF_HBLANK				307
+#define MT9M114_DEF_VBLANK				23
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
-- 
2.49.0


