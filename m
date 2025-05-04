Return-Path: <linux-media+bounces-31666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E0AA85D7
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A11973BC9A3
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AB61A08AF;
	Sun,  4 May 2025 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pyn90OoU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89192193436
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353645; cv=none; b=lT3ssBueG471y3LpZHFYLZhbwFO0Nbn+4J3eOkPKg88bxyZXLBFT8qxQsuorKDGkkmqoXEuDrx0PXIkKqSDFJbOCtIAJAaJGdw6apMUDIuws4750srHoYlK5NB1cT9HvMkzntED2lakPA2AKhqdjR75G6YJDMvrmwwkEms181ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353645; c=relaxed/simple;
	bh=vyn+DDC7SkIx5eEVofgyHS6mFvGswWa+sCfodU3Nq3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O1y8fsQAs7+/Fi+z+PpOKNMIDKCVSeLNv8xhWXJsNrIACI3aCYuvpf7oTO7KlJR5zl64OyfQak+2fWIU9wkaS/FMz65BMQv9u+3N7A085AQSMaO9mX4WCWPaF9ii0j1XpWfZDCYunLFWmk08oCVbak2jb00ERzBPXbaewelxgP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pyn90OoU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgoKdbjwnhfhBfLTf3YreY3wtiPcWI+0JOVcMIXy7HI=;
	b=Pyn90OoU2jskQDBj6ZRaWmbGmfqoxZBb77Q3iYKB7D+Hem41rzP6saPjwtEetskD2YElhB
	rHKAHp20GYVzED6ljtaxUjTj+Xm3dNigpPpJjwmlEAjc5nplzcs4tu7c0PFJZqEIeM+eWE
	BypQML64A/0US2mmQ4JblYNWzcn45ss=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-8q2IXuqlNGyoRoAMf4Hqpw-1; Sun,
 04 May 2025 06:13:59 -0400
X-MC-Unique: 8q2IXuqlNGyoRoAMf4Hqpw-1
X-Mimecast-MFC-AGG-ID: 8q2IXuqlNGyoRoAMf4Hqpw_1746353638
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAE2F1800446;
	Sun,  4 May 2025 10:13:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 46DFD1800352;
	Sun,  4 May 2025 10:13:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 06/13] media: mt9m114: Tweak default hblank and vblank for more accurate fps
Date: Sun,  4 May 2025 12:13:27 +0200
Message-ID: <20250504101336.18748-7-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The PLL gets programmed to achieve a 48 MHz pixelclock, with the original
vblank + hblank defaults this results in a fps of:

48000000 / ((1296 + 307) * (976 + 23) = 29.974 fps

Tweak the defaults to get closer to 30 fps:

48000000 / ((1296 + 308) * (976 + 21) = 30.015 fps

This improves things from being 0.026 fps too low to 0.015 fps too high.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 52337c719e22..ba8b7660f88a 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -331,8 +331,8 @@
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				307
-#define MT9M114_DEF_VBLANK				23
+#define MT9M114_DEF_HBLANK				308
+#define MT9M114_DEF_VBLANK				21
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
-- 
2.49.0


