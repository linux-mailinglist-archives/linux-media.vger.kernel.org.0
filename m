Return-Path: <linux-media+bounces-40416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D7B2DD2E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9AC7B8FF1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AE5320CD7;
	Wed, 20 Aug 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e1BukG0t"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF27320CCB;
	Wed, 20 Aug 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755694720; cv=none; b=WfrPWlrHdebyQbWzuQBgbFyoqUlxoRriUFsDxzunr+QOYL6P5lA0zDdGVN4uz5alyPC0FlZOgVcJSNSJsP0O13weGB7IHw2h3KZxSlqZD2uZiQPOmKdvLORZySuQSr7I4nkck7Df2G8dY8FCXpuJKqlrhllcmZ6Mdiv1kiaA2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755694720; c=relaxed/simple;
	bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWkCVWbscugjln6pPOR09PaJSe6vMISA3lSwQ7eOGARC6bhmqrYjwsISqfzWMqaZaxwF7zCR5OY4hCJVcrl6+V9tKeHBOdooyO+4A5OrwLkfdUY29ELh8GR13J3h32jTff13mRZSi33vG0zWkXeRdet3SpaAGVNaLsyOETiSMRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e1BukG0t; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-62-213.net.vodafone.it [5.90.62.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8F373026;
	Wed, 20 Aug 2025 14:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755694650;
	bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e1BukG0tYfkM3lRLUHrDsbCTSahvEvBtyBbU7mckS7GIkXfx3ZQlcFBLUD3J+A6PC
	 jkJDVCsU/k0Dd7F89H7jS0AJXFgyBGEIgOZ146LQEsiLvmLKui0pgVWhlyVcF9yYX0
	 n4pcBUeGp4KgeYSX3geAX/0+WXOy9y2ENE8+1MQU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 20 Aug 2025 14:58:16 +0200
Subject: [PATCH v4 8/8] media: Documentation: kapi: Add v4l2 extensible
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-extensible-parameters-validation-v4-8-30fe5a99cb1f@ideasonboard.com>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
In-Reply-To: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=iH2fNzQ3ZFHpzPlJuJdqflptF90hlToFOvzIGy7xjpo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopcZskzivZR+rstQ6ZEBhq5EPSPtUaFVxobfis
 8Qf+PkD/oWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKXGbAAKCRByNAaPFqFW
 PAZ9D/4kVXCo8Hv5ncIvy3/X087jo4tqzDhadOx79YQEIaCoVBJ2iJxdtBTlAAIPNozNZX/pu7f
 eIHC7bg31mHF5a5fuS0TW1j3ErTIbBi0Q3nqe262wheNOyl/ddTF0s5iO5t23lx/m4kYRMrQ9AZ
 eaxy7Xcqy72cFd2G4SC/CRO7bQise+UDRzZLeaK7phcd6gSHxymgaDz2etI5v6HGXmr2ajuQxOf
 7x1NAMI/0zakOccNSO2NBIFw1kOoyAdYha/SU6NK8zEiiT2XCfIxN0s4UZiDiMgkHck70JmCO8z
 aa5qzzPL6lNidsrxa1w+Mzv6EeU5o1HlgjWSh29eXLBo0nyxheBNK6pw6fNKWowtZFbVqff/PYN
 uCLBYYgFmIjWkNwjB6FnsnIl9HAVQI9JpzzJjky+h30TVUtgf0rPaC6Ont3zn+/dURZ3JH4AaU8
 P2eX1M4icOReKSSj6k0OkVa7eZ3gme9nfAUPegKQwf5FBUbT4Sz2OBDSsMtUpw5fktVBU9Ueest
 o+uV6rvaJp2JAuQ51Cs2PtlMV9gUuS5XnxFpbShxmys9ExYDC5Uu42VJg2ese6xqwNrgQ9yyTcX
 dhbfPphYVCM8IWaMvPGN11jWrkFSIYfJBnUizezc7zKuSPBJYqruS12JLl86pO0KYAhcc9QBqJ1
 T/j1r5lA0PoI7RA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add to the driver-api documentation the v4l2-params.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst   | 1 +
 Documentation/driver-api/media/v4l2-params.rst | 5 +++++
 MAINTAINERS                                    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..2d7793298c6a2046bdd59b185a411e092b659d52 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-params
diff --git a/Documentation/driver-api/media/v4l2-params.rst b/Documentation/driver-api/media/v4l2-params.rst
new file mode 100644
index 0000000000000000000000000000000000000000..8d2a5f004d21dfc3a81255cabbc6b7cce588db71
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-params.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 extensible parameters kAPI
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+.. kernel-doc:: include/media/v4l2-params.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 008f984c0769691f6ddec8d8f0f461fde056ddb3..44598a823f084e98a9b2d2e21881665d1ab64908 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26384,6 +26384,7 @@ V4L2 EXTENSIBLE PARAMETERS FORMAT
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-params.rst
 F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	drivers/media/v4l2-core/v4l2-params.c
 F:	include/media/v4l2-params.h

-- 
2.50.1


