Return-Path: <linux-media+bounces-39495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F41B21DE7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A98190405E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CBA2DEA60;
	Tue, 12 Aug 2025 06:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtirKP8v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80122D239A
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978782; cv=none; b=FkdJytt0yMQA092DH86xkQwy+AaYr1QXrs6dTt6QT3Nj3eT9OpAbi4VIpKVQr9mfGTnH2FlaILyYIWxtCmikgKOX69QFJkS+TEERsnmRI0wNHkUZNefK64vUENox9KkqkU117oSKtURGA2OhQOmawW88rxuGhCAqAVyblEGVg0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978782; c=relaxed/simple;
	bh=76tSm83gCwBuT15SPasidQuO3TOuUiDDGZBeYlMBFC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qidBk+VZZOaqAy7vIkpgyHoOTyCASE/VbUITDAPL3fNB6AfLcP5sounw6I32b20/23gAZduqLsw+FAzGfIrBTF4dhGQASELVn8jpvXyjKNE4UET+8Q8Uq47CQYg11wwcLBWFnR40jH/nqXgkyJeO+C6vcNad7OIvNEYXK4tQDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtirKP8v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754978781; x=1786514781;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=76tSm83gCwBuT15SPasidQuO3TOuUiDDGZBeYlMBFC8=;
  b=CtirKP8vcYdJyYqxciSDB3RmXpGYgNYNn7Kww4q8ApRG/u7YveYqzfgo
   rkfGGntAnidhSN5wrt+aN7PNIhiUgxbVwKVKI3p31+O6ImHkue+9lJK2n
   m8jD8GzQDyYTTdU5l8pkvM3K+mh8TxXNb/32stuxlpiS8KIcCvhsHk1uU
   J9G3/JUqiBvK0ikKsed9NoOcuWXqItUQ2rKum0/iOLLpEXNeRj64wGtXs
   TWHgwUwZun4OBJY+jxB1sTvbpoGa74pzrOntzRQS5gFpVUJw1o8DvpdTD
   BXglKWUYvnrEjMAwfi5ha6qS/KMa+vg2xI+v9m7LFFWR+2TM6lb4YF6//
   Q==;
X-CSE-ConnectionGUID: ExFCIeBrTr+cii40k6zjpg==
X-CSE-MsgGUID: x9Xu30i8T7+GMf1eIcSpww==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56455056"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56455056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:06:17 -0700
X-CSE-ConnectionGUID: zjrRCY14TrG7vuoN7Pt83A==
X-CSE-MsgGUID: yTa8+M2aS+umG5wlzgy+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="203298492"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:06:15 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 94E4311F831;
	Tue, 12 Aug 2025 09:06:11 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uli9E-008tbE-1q;
	Tue, 12 Aug 2025 09:06:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Valentine Barshak <valentine.barshak@cogentembedded.com>,
	Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
Subject: [PATCH v2 1/1] media: MAINTAINERS: Change rcar-jpu maintainer
Date: Tue, 12 Aug 2025 09:06:12 +0300
Message-Id: <20250812060612.2120340-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign the driver to Nikita as discussed on LMML.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS                               | 2 +-
 drivers/media/platform/renesas/rcar_jpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2bc83b96496..ae89671c70a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13129,7 +13129,7 @@ F:	fs/jbd2/
 F:	include/linux/jbd2.h
 
 JPU V4L2 MEM2MEM DRIVER FOR RENESAS
-M:	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
+M:	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
 L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 81038df71bb5..6cf1fef42617 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -1745,6 +1745,6 @@ static struct platform_driver jpu_driver = {
 module_platform_driver(jpu_driver);
 
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_AUTHOR("Mikhail Ulianov <mikhail.ulyanov@cogentembedded.com>");
+MODULE_AUTHOR("Mikhail Ulianov");
 MODULE_DESCRIPTION("Renesas R-Car JPEG processing unit driver");
 MODULE_LICENSE("GPL v2");
-- 
2.39.5


