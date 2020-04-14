Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA761A7682
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437125AbgDNIv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437111AbgDNIvR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:17 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 524F82173E;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=0O7EuouMBNaUibBD2/q3Xj6UeiHijaPvwbCPgphKh0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ah1Ai1MPiFInDFVHyMDpfz3DvLf84YDUXAqZLuIlqg7d6QeePmtLe7gADuRUQUfXB
         1tj49YKYQAY41EzIfl71FWvxBG+BlaXKwDxY9mpGj3ZCdn+0I0V6433vYL5Wj6cFzj
         xa9Nj1tkFktnz/IMPseJBJYIrEuMrrQivjoWwNb8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzL-4H; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 08/19] media: docs: add a cardlist for cx18 boards
Date:   Tue, 14 Apr 2020 10:50:54 +0200
Message-Id: <06e5f2fec58c4aeed758a6a15580382ffaee6004.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There aren't many boards supported by this driver. So, add
a list for it manually generated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst    |  1 +
 .../admin-guide/media/cx18-cardlist.rst         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 Documentation/admin-guide/media/cx18-cardlist.rst

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 14249f47fbc2..5c9c3c97bcb2 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -8,6 +8,7 @@ Cards List
 
 	au0828-cardlist
 	bttv-cardlist
+	cx18-cardlist
 	cx23885-cardlist
 	cx88-cardlist
 	em28xx-cardlist
diff --git a/Documentation/admin-guide/media/cx18-cardlist.rst b/Documentation/admin-guide/media/cx18-cardlist.rst
new file mode 100644
index 000000000000..26f2da9aa542
--- /dev/null
+++ b/Documentation/admin-guide/media/cx18-cardlist.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+CX18 cards list
+===============
+
+Those cards are supported by cx18 driver:
+
+- Hauppauge HVR-1600 (ESMT memory)
+- Hauppauge HVR-1600 (Samsung memory)
+- Compro VideoMate H900
+- Yuan MPC718 MiniPCI DVB-T/Analog
+- Conexant Raptor PAL/SECAM
+- Toshiba Qosmio DVB-T/Analog
+- Leadtek WinFast PVR2100
+- Leadtek WinFast DVR3100
+- GoTView PCI DVD3 Hybrid
+- Hauppauge HVR-1600 (s5h1411/tda18271)
-- 
2.25.2

