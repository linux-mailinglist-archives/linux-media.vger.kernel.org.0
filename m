Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC971AE2F2
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgDQQ7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:46042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726724AbgDQQ7A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:00 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8E6322243;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=lLr7gyHXd6gFqC8jEO3u2GKYh5Ii35IoFVuGyHyunVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wHbJ8NdqPB0YFidjR8HnRmg+QfWaXBr6Cej59GeGrxBr7GmKFe1Ln9/RQCzqjYm5y
         CRVpTdZt9yGqclji8Ti6iNn1qaDm4+e4axEKOY7j78GamYvEehGgXEw8m1f7N8Rmmz
         42wdD50K4Yn/TsEy4Ngg2E08m8x/3QEt+gdNzn4E=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wM1-DR; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 12/15] media: admin-guide: add dibusb-mb and dibusb-mc card lists
Date:   Fri, 17 Apr 2020 18:58:53 +0200
Message-Id: <8699332aee78cdeed3941b36873c44b70708af76.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the supported dib0300 boards.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst  |  2 +
 .../media/dvb-usb-dibusb-mb-cardlist.rst      | 42 +++++++++++++++++++
 .../media/dvb-usb-dibusb-mc-cardlist.rst      | 30 +++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dibusb-mb-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/dvb-usb-dibusb-mc-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index c1c5530331a1..2b8b158b889f 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -56,6 +56,8 @@ settings for an specific product type.
 	gspca-cardlist
 
 	dvb-usb-dib0700-cardlist
+	dvb-usb-dibusb-mb-cardlist
+	dvb-usb-dibusb-mc-cardlist
 
 	dvb-usb-af9015-cardlist
 	dvb-usb-af9035-cardlist
diff --git a/Documentation/admin-guide/media/dvb-usb-dibusb-mb-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dibusb-mb-cardlist.rst
new file mode 100644
index 000000000000..f25a54721f0d
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dibusb-mb-cardlist.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dibusb-mb cards list
+============================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - AVerMedia AverTV DVBT USB1.1
+     - 14aa:0001, 14aa:0002
+   * - Artec T1 USB1.1 TVBOX with AN2135
+     - 05d8:8105, 05d8:8106
+   * - Artec T1 USB1.1 TVBOX with AN2235
+     - 05d8:8107, 05d8:8108
+   * - Artec T1 USB1.1 TVBOX with AN2235 (faulty USB IDs)
+     - 0547:2235
+   * - Artec T1 USB2.0
+     - 05d8:8109, 05d8:810a
+   * - Compro Videomate DVB-U2000 - DVB-T USB1.1 (please confirm to linux-dvb)
+     - 185b:d000, 145f:010c, 185b:d001
+   * - DiBcom USB1.1 DVB-T reference design (MOD3000)
+     - 10b8:0bb8, 10b8:0bb9
+   * - Grandtec USB1.1 DVB-T
+     - 5032:0fa0, 5032:0bb8, 5032:0fa1, 5032:0bb9
+   * - KWorld V-Stream XPERT DTV - DVB-T USB1.1
+     - eb1a:17de, eb1a:17df
+   * - KWorld Xpert DVB-T USB2.0
+     - eb2a:17de
+   * - KWorld/ADSTech Instant DVB-T USB2.0
+     - 06e1:a333, 06e1:a334
+   * - TwinhanDTV USB-Ter USB1.1 / Magic Box I / HAMA USB1.1 DVB-T device
+     - 13d3:3201, 1822:3201, 13d3:3202, 1822:3202
+   * - Unknown USB1.1 DVB-T device ???? please report the name to the author
+     - 1025:005e, 1025:005f
+   * - VideoWalker DVB-T USB
+     - 0458:701e, 0458:701f
diff --git a/Documentation/admin-guide/media/dvb-usb-dibusb-mc-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dibusb-mc-cardlist.rst
new file mode 100644
index 000000000000..8d03bae0e084
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-usb-dibusb-mc-cardlist.rst
@@ -0,0 +1,30 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+dvb-usb-dibusb-mc cards list
+============================
+
+.. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 7 13
+   :stub-columns: 0
+
+   * - Card name
+     - USB IDs
+   * - Artec T1 USB2.0 TVBOX (please check the warm ID)
+     - 05d8:8109, 05d8:810a
+   * - Artec T14 - USB2.0 DVB-T
+     - 05d8:810b, 05d8:810c
+   * - DiBcom USB2.0 DVB-T reference design (MOD3000P)
+     - 10b8:0bc6, 10b8:0bc7
+   * - GRAND - USB2.0 DVB-T adapter
+     - 5032:0bc6, 5032:0bc7
+   * - Humax/Coex DVB-T USB Stick 2.0 High Speed
+     - 10b9:5000, 10b9:5001
+   * - LITE-ON USB2.0 DVB-T Tuner
+     - 04ca:f000, 04ca:f001
+   * - Leadtek - USB2.0 Winfast DTV dongle
+     - 0413:6025, 0413:6026
+   * - MSI Digivox Mini SL
+     - eb1a:e360, eb1a:e361
-- 
2.25.2

