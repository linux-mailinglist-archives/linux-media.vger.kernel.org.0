Return-Path: <linux-media+bounces-39089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D620B1E466
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5555189F5D3
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 08:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0E6263C90;
	Fri,  8 Aug 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRfZYJXo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF8825D536
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754641827; cv=none; b=P187MIqwW1FaVWqxJZAY6lJs+/FTxJFdejzFIDtJAcxeEiW33a77tEfSoWF88MMp5syNOWV1SwbkkjOTazZDKZnKl6DdxCcEofL9awTUkx6HjS3Ky3U/GjN55EmFVsVMwR9t02LGpKA27hHw7kgV5OS1DDCuAIOxmc/26pKgVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754641827; c=relaxed/simple;
	bh=MGkir/FgMoW0pSymoEQNYfPbIKlNewTEFJeu0H8AB2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VgCtOuBS6YwrpdzIsrO41vTSB5vM3Q/XxWFlQqJdmCPH9l9SVm+D1JDgYA8cBJt9RXDh9ulkPZgj3TU3w5osBLdL5lFZ3f3z8Xt6aAoSboeckY3yFlepeCvEMHDu+9JCkMMSLVyVeeMa5OuOU2jFh9x1Wsbw6xKXQJYQtullQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRfZYJXo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754641826; x=1786177826;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MGkir/FgMoW0pSymoEQNYfPbIKlNewTEFJeu0H8AB2o=;
  b=YRfZYJXoRvwpjuiX4PBN6EVrI1fFMDFLx7wvoTwn/IzN2tdGZL/2MCiG
   6BV4Jz6yQOgZxlxCboK87q91fVT57P1EhFCKOYrzDFmFxKQVy4qZFB/B9
   KPcTnMQrK+CQU1jfmzcz3y6Vn//F4r0UUcqAERlFjczQ8Qa/AAvtXWL7A
   XvZ3SfZkyeYnpt3VToab8bqUz526aLP8LFHgfJJPH4k8KbZqlrTy84RvD
   nQR/ev0ptHlgEpDJMoPe0daK6moH5GnmkxbAsOWER7/F+zFBvfFDaLMsG
   TWFpgFzln2JVPkKdBPF9tmATYgnW+tH9o/4489mX7eCd31jtIgXYjYuIm
   Q==;
X-CSE-ConnectionGUID: 8TSjAX33SJ+TESqJuw30mA==
X-CSE-MsgGUID: +Cvam2hNQx266AbAJdMoog==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59602077"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="59602077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 01:30:25 -0700
X-CSE-ConnectionGUID: GZsx8GZiRje2CiB8wz15Xw==
X-CSE-MsgGUID: s4VA4IcUQyqmXaTVnnqhYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196105838"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 01:30:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9183111FC45;
	Fri,  8 Aug 2025 11:30:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ukIUX-008rqx-1Q;
	Fri, 08 Aug 2025 11:30:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
Date: Fri,  8 Aug 2025 11:30:21 +0300
Message-Id: <20250808083021.2113627-1-sakari.ailus@linux.intel.com>
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


