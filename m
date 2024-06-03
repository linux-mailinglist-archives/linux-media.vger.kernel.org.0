Return-Path: <linux-media+bounces-12462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95AB8D83C1
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CCBC1C217B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBFA12C484;
	Mon,  3 Jun 2024 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ui+0Xgwn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6B59B4A
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420867; cv=none; b=Lv0IwS0hYf85IG0j7h/sfi4tb26fiytCBdtHCk/FUYlJ9qzvgZKGU7CC/iqwRE/pqQN9IQcYSCyiDRhwQB0IlToP9NfyB7SsnQXQFBmLu71y6sysdzVokBMgUnHczDZonOr5w1TdNrnw3USJFoPJd19Mb2fGpEOWIVqfPd1My5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420867; c=relaxed/simple;
	bh=jP5ej5l+hMKGJQK6oh4gl1y4j0LRWz9qqoZqhZzqjC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rh6W+CC2uzNw+zyTB2Mv66bl7EIPiQU4Pdgrofiokeix2uWf9GdZ2p0oXo2c9NBeT2V5idJuFeRaEHVhHTv7XKy9UiNQfOFfVrgSIcl+rDBo8X3FT5/hhyCy06RXbvIjMWBBd1N56gn9nTScbYiXWUdJKttaR9EF1JQw9UMdhOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ui+0Xgwn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717420864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NR5aHCY6LvX2oUEnfZEQGVwrAtpYXD7cOZ6ZSLuvutU=;
	b=Ui+0Xgwn4eeAnleBIGK7Ugro8oDvPQWOdRfQzN/pgnQCDcDCGFtEbiSGvar/yMIiMKFrOf
	7l81pXw00sfqE8s6Pq0oO40eK29w6P5GfwkEyA7is+3yAS7MhQYY29jrzCD+c1l0m4X549
	ZOthbwaWiaso1uNg2S6A09bvPHbcV4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-3rnrNLgENCe3al5f7gXXUg-1; Mon, 03 Jun 2024 09:21:02 -0400
X-MC-Unique: 3rnrNLgENCe3al5f7gXXUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25CB68037A6;
	Mon,  3 Jun 2024 13:21:00 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABAB41552;
	Mon,  3 Jun 2024 13:20:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/5] media: atomisp: Remove unused mipicsi_flag module parameter
Date: Mon,  3 Jun 2024 15:20:53 +0200
Message-ID: <20240603132057.255917-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

The mipicsi_flag int is completely unused, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 1 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index 9d23a6ccfc33..2d0a77df6c88 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -33,7 +33,6 @@
 
 extern int dbg_level;
 extern int dbg_func;
-extern int mipicsi_flag;
 extern int pad_w;
 extern int pad_h;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 9df0eb7044b7..8b522baf2e66 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -66,10 +66,6 @@ module_param(dbg_func, int, 0644);
 MODULE_PARM_DESC(dbg_func,
 		 "log function switch non/printk (default:printk)");
 
-int mipicsi_flag;
-module_param(mipicsi_flag, int, 0644);
-MODULE_PARM_DESC(mipicsi_flag, "mipi csi compression predictor algorithm");
-
 static char firmware_name[256];
 module_param_string(firmware_name, firmware_name, sizeof(firmware_name), 0);
 MODULE_PARM_DESC(firmware_name, "Firmware file name. Allows overriding the default firmware name.");
-- 
2.45.1


