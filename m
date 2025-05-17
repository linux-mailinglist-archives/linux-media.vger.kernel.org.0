Return-Path: <linux-media+bounces-32660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9917CABA9C7
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39E2417F76A
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4314A1F6694;
	Sat, 17 May 2025 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iPDCoZOz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301431DE8B2
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482091; cv=none; b=JrDjfOiiwVtsRtskS6zgNOObQrFTAvEXpFg4yOj1EZIsH8v1kHd7vtKqq6IkpsA7DJobf/gZEMCSc8MGj31LTiRX8O3LRKTs0yXjSfx2ytN8nLUFdBNITkVQWk7LYfqOI84CFgqAF8hmLzhvDHzwv0v9sK/XUQODgypXPXDCDGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482091; c=relaxed/simple;
	bh=9Pj1cNvK2/6YWdgoqhckiCB/OJHE3ISIFjL8Da/JVzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g91xHFEMRZlR9IIgva62Ki1CveAwFMZgHQZM/lyJByB36s0XJpyjyMNf5lhHyj2gqYV2LKkQM+cpIpPuteu2iyhaRDe+Lx0UcOJCHn+2yWTKS/4RrpeK69BnrNCNW8gwYSQUyhOktmA8aYaT1nHmdouEy95frerJ0SAgdqLp654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iPDCoZOz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8IGgsINMJnP5gn973MJ/HmcY46cKzb7GO8eNfgg5Rs=;
	b=iPDCoZOzurcurZJjCcHgOIBnIKQhsWCFkOsLZJyEbTRojydby+nTiMoeunZFnagoXyjS/O
	Q05XDIX2ijbDQ5kRy7lqz+tUcSZxQakk9I3rwUjIqO25A26dBFD7cH0InAzdP4V6tAh5DE
	t4hoKZKe9a/WcRBU22a0SyDBgmTfKf8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-486-6jGJTPtYN3-RHBFAgEVOxQ-1; Sat,
 17 May 2025 07:41:25 -0400
X-MC-Unique: 6jGJTPtYN3-RHBFAgEVOxQ-1
X-Mimecast-MFC-AGG-ID: 6jGJTPtYN3-RHBFAgEVOxQ_1747482084
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F4951956086;
	Sat, 17 May 2025 11:41:24 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0015F18003FC;
	Sat, 17 May 2025 11:41:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 02/23] media: atomisp: gc0310: Drop unused GC0310_FOCAL_LENGTH_NUM define
Date: Sat, 17 May 2025 13:40:45 +0200
Message-ID: <20250517114106.43494-3-hdegoede@redhat.com>
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

Drop the unused GC0310_FOCAL_LENGTH_NUM define, the focal-length
is a property of the sensor-module, not of the raw sensor itself.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index cc74e90a1457..f253b4b494f2 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -25,8 +25,6 @@
 #define GC0310_FPS				30
 #define GC0310_SKIP_FRAMES			3
 
-#define GC0310_FOCAL_LENGTH_NUM			278 /* 2.78mm */
-
 #define GC0310_ID				0xa310
 
 #define GC0310_RESET_RELATED			0xFE
-- 
2.49.0


