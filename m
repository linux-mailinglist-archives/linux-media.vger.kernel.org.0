Return-Path: <linux-media+bounces-31664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B6AA85D5
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CAB5189ACB5
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CCC1A23B6;
	Sun,  4 May 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hu/u+Jnd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21417A2EA
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353641; cv=none; b=uvY/iGh3mZy4wwJcca53p9lYhCIsmVPVZwdqnX8Lp6/7oHL5sSh6RfzG2QTk9OzEZ9IMFKR2ZbSxF/ADWYY2a26Ea5Q/RCXxhqyx0J27glgVBhCYp/iNVYUao96511CuvujfnOoiiCGRri2ZZ5O86mfgS5nX5dROebSKH+Y05kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353641; c=relaxed/simple;
	bh=LqxEWSMgWq2atOABy0fD7H/XlYIKdrcxXHJQWkvwjrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sarbCH2yHU0ROaHRfptTB7/SS/MnRmIyDbOXjR4eMNVtTqcbO0bx6O/gZOrd1IMfwu6AjWU/QVyIDNc3KNtrWM967W8mvg2juGxJyJguooqt4Eo4I5PXo6jhuwfjWc9qkWYoE4MjOkkEjOXDqKb7vf4S2sNluZXASrSPcixADGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hu/u+Jnd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6Jc8Z4iBsA3hp0G3zs6iyupsxApdijj1MByUrqAJh4=;
	b=hu/u+JndsO8wkOJQo7aCJVNvnh9J+avDvDIdqPdt+CRT3cnjdjOlYGhvrLa2dr5Zcfpwgg
	B433TbVBAVXMb3IDSNDtmkZPx61hljrQsdfXxq+fCvCa2XWP+95CNks8BIZjplntRLu+6E
	BywXmjN7uZb6B9NrTfRGhBZVZEpz2x4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-kjTbCInTO02oc_xlgjK6Qg-1; Sun,
 04 May 2025 06:13:53 -0400
X-MC-Unique: kjTbCInTO02oc_xlgjK6Qg-1
X-Mimecast-MFC-AGG-ID: kjTbCInTO02oc_xlgjK6Qg_1746353632
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3FD618004A7;
	Sun,  4 May 2025 10:13:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CAB2A18001D5;
	Sun,  4 May 2025 10:13:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 04/13] media: mt9m114: Lower minimum vblank value
Date: Sun,  4 May 2025 12:13:25 +0200
Message-ID: <20250504101336.18748-5-hdegoede@redhat.com>
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

As the comment above the defines says, the minimum values are undocumented
so the lowest values seen in register lists are used.

The version of the mt9m114 driver shipped together with the atomisp code
uses 21 for vblank in its register lists, lower MT9M114_MIN_VBLANK
accordingly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9fdfd90afc22..b40142aed3e8 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -324,13 +324,13 @@
 
 /*
  * The minimum amount of horizontal and vertical blanking is undocumented. The
- * minimum values that have been seen in register lists are 303 and 38, use
+ * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
  * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
-#define MT9M114_MIN_VBLANK				38
+#define MT9M114_MIN_VBLANK				21
 #define MT9M114_DEF_HBLANK				323
 #define MT9M114_DEF_VBLANK				39
 
-- 
2.49.0


