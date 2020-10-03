Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A432628228D
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 10:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgJCImI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 04:42:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgJCImB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 04:42:01 -0400
Received: from mail.kernel.org (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84B26206F8;
        Sat,  3 Oct 2020 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601714520;
        bh=Xz3zy2dXElvF+XevVT0akZbUlgV68hR1omZNbxnjuWw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fR2sBx1JHbtRCECL8CCfjXWXnQ3kph0MQu8S3Fhnz++EekDOd+1rcUpJ9zrXlgIxU
         Vw+IvGGaKCyjjr1Zn20+Sc0PRkQQ0ZhAB+0L+THWH0SY+oDR6+i9mPUMv8ZIjmuTfj
         haGDxNKZuBuSFqf0Avsp5sx8UFiRU70jYb6gfqcg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kOd78-0002Iz-1L; Sat, 03 Oct 2020 10:41:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: add Zoran cardlist
Date:   Sat,  3 Oct 2020 10:41:57 +0200
Message-Id: <7c9df3ec493e353166527f56ad1540d052b92cd4.1601714147.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
References: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that Zoran was re-added, we need to add its cardlist
to the admin guide.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../admin-guide/media/pci-cardlist.rst        |  2 +
 .../admin-guide/media/zoran-cardlist.rst      | 51 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/admin-guide/media/zoran-cardlist.rst

diff --git a/Documentation/admin-guide/media/pci-cardlist.rst b/Documentation/admin-guide/media/pci-cardlist.rst
index 434fe996b541..f4d670e632f8 100644
--- a/Documentation/admin-guide/media/pci-cardlist.rst
+++ b/Documentation/admin-guide/media/pci-cardlist.rst
@@ -90,6 +90,7 @@ sta2x11_vip       STA2X11 VIP Video For Linux
 tw5864            Techwell TW5864 video/audio grabber and encoder
 tw686x            Intersil/Techwell TW686x
 tw68              Techwell tw68x Video For Linux
+zoran             Zoran-36057/36067 JPEG codec
 ================  ========================================================
 
 Some of those drivers support multiple devices, as shown at the card
@@ -105,3 +106,4 @@ lists below:
 	ivtv-cardlist
 	saa7134-cardlist
 	saa7164-cardlist
+	zoran-cardlist
diff --git a/Documentation/admin-guide/media/zoran-cardlist.rst b/Documentation/admin-guide/media/zoran-cardlist.rst
new file mode 100644
index 000000000000..d7fc8bed62ff
--- /dev/null
+++ b/Documentation/admin-guide/media/zoran-cardlist.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Zoran cards list
+================
+
+.. tabularcolumns:: |p{1.4cm}|p{11.1cm}|p{4.2cm}|
+
+.. flat-table::
+   :header-rows: 1
+   :widths: 2 19 18
+   :stub-columns: 0
+
+   * - Card number
+     - Card name
+     - PCI subsystem IDs
+
+   * - 0
+     - DC10(old)
+     - <any>
+
+   * - 1
+     - DC10(new)
+     - <any>
+
+   * - 2
+     - DC10_PLUS
+     - 1031:7efe
+
+   * - 3
+     - DC30
+     - <any>
+
+   * - 4
+     - DC30_PLUS
+     - 1031:d801
+
+   * - 5
+     - LML33
+     - <any>
+
+   * - 6
+     - LML33R10
+     - 12f8:8a02
+
+   * - 7
+     - Buz
+     - 13ca:4231
+
+   * - 8
+     - 6-Eyes
+     - <any>
-- 
2.26.2

