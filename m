Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3071AE2E7
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgDQQ7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgDQQ7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBE0822246;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=448Uabj2NmDo+JQX3R63OPBJcmwUwHVEj40KUMQ/Rf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mntCvIPwoJHU4/RrG8jnIZ0otktczWcWlKXbWnlQs7DXo8Tb97yZd/t7O5bO4sVx0
         fhgQndSK7Gyr1pwRblhMhoO5dw5OfgdD5htVal04VVW89j8tUGzKLUcnR+Ga0LvUVj
         /EqevTVaKXdH+grq9eIvmTO49NFcOyHj+rleC3r0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wMB-GZ; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 14/15] media: admin-guide: add a card list for the Siano driver
Date:   Fri, 17 Apr 2020 18:58:55 +0200
Message-Id: <9cbfd41b39ff9a49f0ff9674dbe32118696f3ba7.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The siano driver looks like em28xx, except that it cards
are split on 3 drivers.

Add a card list for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  |  2 +
 .../admin-guide/media/siano-cardlist.rst      | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/admin-guide/media/siano-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 860a254d96c8..e9fd26a55384 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -52,7 +52,9 @@ settings for an specific product type.
 	cx231xx-cardlist
 	em28xx-cardlist
 	tm6000-cardlist
+	siano-cardlist
 	usbvision-cardlist
+
 	gspca-cardlist
 
 	dvb-usb-dib0700-cardlist
diff --git a/Documentation/admin-guide/media/siano-cardlist.rst b/Documentation/admin-guide/media/siano-cardlist.rst
new file mode 100644
index 000000000000..d387c04d753c
--- /dev/null
+++ b/Documentation/admin-guide/media/siano-cardlist.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Siano cards list
+================
+
+.. tabularcolumns:: p{13.3cm}|p{4.2cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 17 16
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Hauppauge Catamount
+     - 2040:1700
+   * - Hauppauge Okemo-A
+     - 2040:1800
+   * - Hauppauge Okemo-B
+     - 2040:1801
+   * - Hauppauge WinTV MiniCard
+     - 2040:2000, 2040:200a, 2040:2010, 2040:2011, 2040:2019
+   * - Hauppauge WinTV MiniCard
+     - 2040:2009
+   * - Hauppauge WinTV MiniStick
+     - 2040:5500, 2040:5510, 2040:5520, 2040:5530, 2040:5580, 2040:5590, 2040:b900, 2040:b910, 2040:b980, 2040:b990, 2040:c000, 2040:c010, 2040:c080, 2040:c090, 2040:c0a0, 2040:f5a0
+   * - Hauppauge microStick 77e
+     - 2013:0257
+   * - ONDA Data Card Digital Receiver
+     - 19D2:0078
+   * - Siano Denver (ATSC-M/H) Digital Receiver
+     - 187f:0800
+   * - Siano Denver (TDMB) Digital Receiver
+     - 187f:0700
+   * - Siano Ming Digital Receiver
+     - 187f:0310
+   * - Siano Nice Digital Receiver
+     - 187f:0202, 187f:0202
+   * - Siano Nova A Digital Receiver
+     - 187f:0200
+   * - Siano Nova B Digital Receiver
+     - 187f:0201
+   * - Siano Pele Digital Receiver
+     - 187f:0500
+   * - Siano Rio Digital Receiver
+     - 187f:0600, 3275:0080
+   * - Siano Stellar Digital Receiver
+     - 187f:0100
+   * - Siano Stellar Digital Receiver ROM
+     - 187f:0010
+   * - Siano Vega Digital Receiver
+     - 187f:0300
+   * - Siano Venice Digital Receiver
+     - 187f:0301, 187f:0301, 187f:0302
+   * - ZTE Data Card Digital Receiver
+     - 19D2:0086
-- 
2.25.2

