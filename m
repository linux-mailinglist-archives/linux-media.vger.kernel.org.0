Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7475E14BC74
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 15:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgA1O6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 09:58:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:13288 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbgA1O6s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 09:58:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 06:58:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; 
   d="scan'208";a="309998346"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 06:58:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 77BB213F; Tue, 28 Jan 2020 16:58:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Sort entries in database for TI VPE/CAL
Date:   Tue, 28 Jan 2020 16:58:28 +0200
Message-Id: <20200128145828.74161-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Run parse-maintainers.pl and choose TI VPE/CAL record. Fix it accordingly.

Note, this is urgent fix, without which parse-maintainers.pl throws
an exception:

Odd non-pattern line '  Documentation/devicetree/bindings/media/ti,cal.yaml
' for 'TI VPE/CAL DRIVERS' at scripts/parse-maintainers.pl line 147, <$file> line 16770.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fbe2a19b8a3..f04b1c6508fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16761,12 +16761,12 @@ F:	sound/soc/codecs/twl4030*
 TI VPE/CAL DRIVERS
 M:	Benoit Parrot <bparrot@ti.com>
 L:	linux-media@vger.kernel.org
+S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
-S:	Maintained
-F:	drivers/media/platform/ti-vpe/
+F:	Documentation/devicetree/bindings/media/ti,cal.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
-	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	drivers/media/platform/ti-vpe/
 
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
-- 
2.24.1

