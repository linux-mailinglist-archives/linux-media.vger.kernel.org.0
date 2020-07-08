Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8751217F82
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 08:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgGHGYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 02:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbgGHGYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 02:24:34 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EDFC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 23:24:34 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 79405BC06E;
        Wed,  8 Jul 2020 06:24:26 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     maintainers@bluecherrydvr.com, anton@corp.bluecherry.net,
        andrey.utkin@corp.bluecherry.net, ismael@iodev.co.uk,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: SOFTLOGIC 6x10 MPEG CODEC
Date:   Wed,  8 Jul 2020 08:24:20 +0200
Message-Id: <20200708062420.12047-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/media/pci/solo6x10/solo6x10-core.c     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-disp.c     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-eeprom.c   | 2 +-
 drivers/media/pci/solo6x10/solo6x10-enc.c      | 2 +-
 drivers/media/pci/solo6x10/solo6x10-g723.c     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-gpio.c     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c      | 2 +-
 drivers/media/pci/solo6x10/solo6x10-jpeg.h     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-offsets.h  | 2 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c      | 2 +-
 drivers/media/pci/solo6x10/solo6x10-regs.h     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.c     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.h     | 2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c     | 2 +-
 drivers/media/pci/solo6x10/solo6x10.h          | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index 6e1ba4846ea4..c6e0090f27e8 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-disp.c b/drivers/media/pci/solo6x10/solo6x10-disp.c
index 4e28bf927de5..ad98ca7fb98b 100644
--- a/drivers/media/pci/solo6x10/solo6x10-disp.c
+++ b/drivers/media/pci/solo6x10/solo6x10-disp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-eeprom.c b/drivers/media/pci/solo6x10/solo6x10-eeprom.c
index 9aba64395a6b..0d864b8ca0ab 100644
--- a/drivers/media/pci/solo6x10/solo6x10-eeprom.c
+++ b/drivers/media/pci/solo6x10/solo6x10-eeprom.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-enc.c b/drivers/media/pci/solo6x10/solo6x10-enc.c
index a9c56897f7bc..14a1d51cfad4 100644
--- a/drivers/media/pci/solo6x10/solo6x10-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-enc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index d6d16e8fd997..906ce86437ae 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-gpio.c b/drivers/media/pci/solo6x10/solo6x10-gpio.c
index 526d67cf9942..084c30760e45 100644
--- a/drivers/media/pci/solo6x10/solo6x10-gpio.c
+++ b/drivers/media/pci/solo6x10/solo6x10-gpio.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-i2c.c b/drivers/media/pci/solo6x10/solo6x10-i2c.c
index df1e3f2e9c05..f86f12fa6350 100644
--- a/drivers/media/pci/solo6x10/solo6x10-i2c.c
+++ b/drivers/media/pci/solo6x10/solo6x10-i2c.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-jpeg.h b/drivers/media/pci/solo6x10/solo6x10-jpeg.h
index e35aad16ad33..e212f4828c09 100644
--- a/drivers/media/pci/solo6x10/solo6x10-jpeg.h
+++ b/drivers/media/pci/solo6x10/solo6x10-jpeg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-offsets.h b/drivers/media/pci/solo6x10/solo6x10-offsets.h
index e3ae6a02dbb9..f414ee1316f2 100644
--- a/drivers/media/pci/solo6x10/solo6x10-offsets.h
+++ b/drivers/media/pci/solo6x10/solo6x10-offsets.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-p2m.c b/drivers/media/pci/solo6x10/solo6x10-p2m.c
index e2816e2629f8..db2afc6a5fcb 100644
--- a/drivers/media/pci/solo6x10/solo6x10-p2m.c
+++ b/drivers/media/pci/solo6x10/solo6x10-p2m.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-regs.h b/drivers/media/pci/solo6x10/solo6x10-regs.h
index 804505d01b25..12e0ac190416 100644
--- a/drivers/media/pci/solo6x10/solo6x10-regs.h
+++ b/drivers/media/pci/solo6x10/solo6x10-regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.c b/drivers/media/pci/solo6x10/solo6x10-tw28.c
index 126cd1b01266..1b7c22a9bc94 100644
--- a/drivers/media/pci/solo6x10/solo6x10-tw28.c
+++ b/drivers/media/pci/solo6x10/solo6x10-tw28.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.h b/drivers/media/pci/solo6x10/solo6x10-tw28.h
index edbad194d31e..4a8ede3139a8 100644
--- a/drivers/media/pci/solo6x10/solo6x10-tw28.h
+++ b/drivers/media/pci/solo6x10/solo6x10-tw28.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index cbf85231b708..3cf7bd6186aa 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 54434f3c428d..24ef0c446bef 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
diff --git a/drivers/media/pci/solo6x10/solo6x10.h b/drivers/media/pci/solo6x10/solo6x10.h
index 9f2314688cec..126f6fb7b755 100644
--- a/drivers/media/pci/solo6x10/solo6x10.h
+++ b/drivers/media/pci/solo6x10/solo6x10.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Copyright (C) 2010-2013 Bluecherry, LLC <http://www.bluecherrydvr.com>
+ * Copyright (C) 2010-2013 Bluecherry, LLC <https://www.bluecherrydvr.com>
  *
  * Original author:
  * Ben Collins <bcollins@ubuntu.com>
-- 
2.27.0

