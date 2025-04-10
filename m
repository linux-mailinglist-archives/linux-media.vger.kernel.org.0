Return-Path: <linux-media+bounces-29969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5538A84A50
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C58137A4DF9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D771EE008;
	Thu, 10 Apr 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JswmepL3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C41E885A
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303402; cv=none; b=WbZJcorK9sQustxs7agtTtQggbYKoCXExdULsdV5E3ZCBN0s4OQaHmpinsAhQGlOeioruHaBKPlfq3N5UltD9GiS3DlI2GqqzgTJ8i06MlwxjQ3Rr8jM0oHozSTH+QOVXLWujdwcsmn1QqT4oh2M99RUjez5UNQJBlgfKwiTkw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303402; c=relaxed/simple;
	bh=9hpzvDueTqKP9t1gQLgiJVOmCy43BiMVkMMUzK2gooo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHh9Vva4YVhjb0BfjFcS0tLix6C8iFXd0be9akc9inNxIipzkr3GC/VlfOnASYmglyWgJbGKZxXM5PnTU4vd+8xxQtPXz+t5n6qGuJNhFRFo/PCPW0zo7kziF5f2m6LJvuoO2CMBnHH52dBlixSNRfjdnQdjCrKiaNQ/QLA+5oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JswmepL3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30951129;
	Thu, 10 Apr 2025 18:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744303279;
	bh=9hpzvDueTqKP9t1gQLgiJVOmCy43BiMVkMMUzK2gooo=;
	h=From:To:Cc:Subject:Date:From;
	b=JswmepL3Ov0e5bkvP5AFfE2Uztr9KB6+l79BPbJ5yHbuwEAMQthSfA/O80AqEFXmH
	 Iabp9bH754yqqOdhUG2v27Qypq95M/nNQZuF6CvErgazH7lK8LRwDd8VWfbgeqCWaN
	 ZuYsbLoBJH5nXvFFd3bQpEVk1H9TYsBH5XzBpzYA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] Use key_value to handle V4L2 field names
Date: Thu, 10 Apr 2025 19:42:51 +0300
Message-ID: <20250410164251.15352-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Extend the key_value helper with a function to retrieve the key
corresponding to a value, and use it to replace the manual
implementation of V4L2 field name lookup.

The name comparison needs to be made case-insensitive to avoid breaking
users, as yavta handles V4L2 field names in a case-insensitive way.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 yavta.c | 50 +++++++++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/yavta.c b/yavta.c
index b463f5841100..49f10c371aa6 100644
--- a/yavta.c
+++ b/yavta.c
@@ -199,7 +199,7 @@ static int __key_value_get(const struct key_value *values,
 	unsigned int i;
 
 	for (i = 0; i < count; ++i) {
-		if (!strcmp(values[i].name, name))
+		if (!strcasecmp(values[i].name, name))
 			return values[i].value;
 	}
 
@@ -235,12 +235,29 @@ static void __key_value_list(const struct key_value *values,
 	printf("\n");
 }
 
+static const char *__key_value_name(const struct key_value *values,
+				    unsigned int count, unsigned int value,
+				    const char *def_value)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; ++i) {
+		if (values[i].value == value)
+			return values[i].name;
+	}
+
+	return def_value;
+}
+
 #define key_value_get(values, name) \
 	__key_value_get(values, ARRAY_SIZE(values), name)
 
 #define key_value_list(values, type) \
 	__key_value_list(values, ARRAY_SIZE(values), type)
 
+#define key_value_name(values, value, def_value) \
+	__key_value_name(values, ARRAY_SIZE(values), value, def_value)
+
 /* -----------------------------------------------------------------------------
  * Format handling
  */
@@ -466,10 +483,7 @@ static const char *v4l2_format_name(unsigned int fourcc)
 	return name;
 }
 
-static const struct {
-	const char *name;
-	enum v4l2_field field;
-} fields[] = {
+static const struct key_value v4l2_fields[] = {
 	{ "any", V4L2_FIELD_ANY },
 	{ "none", V4L2_FIELD_NONE },
 	{ "top", V4L2_FIELD_TOP },
@@ -482,29 +496,11 @@ static const struct {
 	{ "interlaced-bt", V4L2_FIELD_INTERLACED_BT },
 };
 
-static enum v4l2_field v4l2_field_from_string(const char *name)
-{
-	unsigned int i;
+#define v4l2_field_from_string(name) \
+	key_value_get(v4l2_fields, name)
 
-	for (i = 0; i < ARRAY_SIZE(fields); ++i) {
-		if (strcasecmp(fields[i].name, name) == 0)
-			return fields[i].field;
-	}
-
-	return -1;
-}
-
-static const char *v4l2_field_name(enum v4l2_field field)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(fields); ++i) {
-		if (fields[i].field == field)
-			return fields[i].name;
-	}
-
-	return "unknown";
-}
+#define v4l2_field_name(field) \
+	key_value_name(v4l2_fields, field, "unknown")
 
 static const struct key_value v4l2_colorspaces[] = {
 	{ "DEFAULT", V4L2_COLORSPACE_DEFAULT },

base-commit: 3e445c7855f8240d1f8473d127307dd967be2d25
-- 
Regards,

Laurent Pinchart


