Return-Path: <linux-media+bounces-39151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E758BB1EF7F
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2985A50A8
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 20:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90916234984;
	Fri,  8 Aug 2025 20:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSZkMsO+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C1198A2F
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754684916; cv=none; b=o4eFydYJCPhjjEt0DFC/BjpADkzYlV5aMhNxtLXLOkntKneGbMW0P4ieKXHZkR9UrA9VsibVBaWUWJ7r9Qn+8dmw9SBOpBJbKdH4kn55EfSbBlDMrGA3fTAenCnPk7g9ulBYfwGYmYIEXoqNmfGGTxEndGq23uxLPaIrLGArLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754684916; c=relaxed/simple;
	bh=wnmK1It3BBsZtEm9sIFhpkKZN7oVKyBcLPT3L2J6gMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aSafr9ojVVl8UQI90CKLFT9GBrBNej10clb2/q2lyxEnlN2XN8QoOoHgX1cMFuS5WjeML6SXsWmq2Kwx9y3Alt7PgNQm0vLFoT2D1kKxKDajyaOTdH/X8PxfWxuHLzhn/wce/n1XyVjTpQyPwLwsPRxWAdepWEQmoZySxui7Dyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSZkMsO+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754684915; x=1786220915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wnmK1It3BBsZtEm9sIFhpkKZN7oVKyBcLPT3L2J6gMI=;
  b=hSZkMsO+CkjI3mM50+9eDjE5rs3H2l6Dvw6YKq8BNpgaGmvL8dTNX+gs
   2yfkBrdEFsHOtm4UuIfz3scX8LDiuFpo/88POcFcyX8ceUdrbbiJWlclh
   dlpG9EQyzsGTcXXqeGylOyJ7ldAyNUOrFLn7zEjOFw11Z2dG5fNtFyr3y
   2+AwoWnE2AKNL18ZKPxCfT4I83n81Q6um1d21tcPzoo6zuHYp+Um21MIs
   n1Vts5w/X8W2sj2mIL49lUICrZiZ6B3S+MM0UVR8cX/J1bNpL/TlSVQOY
   UGzQ7Yvkka50e0cRK1G0GbJim3gS38lfeNjf5mQhXsjiSDZq17gD80gC/
   Q==;
X-CSE-ConnectionGUID: QUtrD0ttT0uD78T9HAS5vw==
X-CSE-MsgGUID: Cg97jESFRXu4t7VtUZAhng==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="59650693"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="59650693"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 13:28:34 -0700
X-CSE-ConnectionGUID: 6MrYt6A3Q7OKzPPJTwIhCg==
X-CSE-MsgGUID: H2j6xe21TnecA7cXVLSAnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169530507"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.17])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 13:28:32 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BD74911FC4F;
	Fri,  8 Aug 2025 23:28:29 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ukThV-008sPf-2E;
	Fri, 08 Aug 2025 23:28:29 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Valentine Barshak <valentine.barshak@cogentembedded.com>,
	Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
Subject: [RESEND PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
Date: Fri,  8 Aug 2025 23:28:29 +0300
Message-Id: <20250808202829.2115779-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mikhail's e-mail is bouncing:

===========8<-----------
The following message to <mikhail.ulyanov@cogentembedded.com> was undeliverable.
The reason for the problem:
5.1.0 - Unknown address error 550-"5.1.1 The email account that you tried to
reach does not exist. Please try\n5.1.1 double-checking the recipient's email
address for typos or\n5.1.1 unnecessary spaces. For more information, go
to\n5.1.1  https://support.google.com/mail/?p=NoSuchUser
d75a77b69052e-4b07f8ba752si46048731cf.823 - gsmtp"
===========8<-----------

Assign the driver to Laurent with "Odd Fixes" status.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Cc'ing others from Cogent Embedded.

 MAINTAINERS                               | 4 ++--
 drivers/media/platform/renesas/rcar_jpu.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fad6cb025a19..674f00159011 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12944,10 +12944,10 @@ F:	fs/jbd2/
 F:	include/linux/jbd2.h
 
 JPU V4L2 MEM2MEM DRIVER FOR RENESAS
-M:	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
+M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
-S:	Maintained
+S:	Odd Fixes
 F:	drivers/media/platform/renesas/rcar_jpu.c
 
 JSM Neo PCI based serial card
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


