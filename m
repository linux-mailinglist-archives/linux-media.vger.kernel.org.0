Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DEB2C545E
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389779AbgKZNBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:01:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:44550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389545AbgKZNBE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:01:04 -0500
Received: from mail.kernel.org (ip5f5ad5d3.dynamic.kabel-deutschland.de [95.90.213.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E023F221E9;
        Thu, 26 Nov 2020 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606395662;
        bh=fNAXA3PJPWKHQpcXMf7eTIv3890JCYo1FPaI93mX5Ww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IDfXMUfttRd5RQvK3WMg4cCy9EpMpT2SdqHSm2Hrpp5R3eOMs1wIyOKvyj6gEP3Pa
         /bZ21PV8WHTqoXu3uJZcZIfQNxXQR8wI+Li6jkqZDW+2I1WRwB4naPLGOmGQihlmrB
         ZQDFOcZ50e2LSEaCoVjESr6qyeQyyqSu91fx8mSM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kiGtN-005rbM-Rm; Thu, 26 Nov 2020 14:00:57 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: docs: uAPI: rc: dual-license the docs with GPL v2
Date:   Thu, 26 Nov 2020 14:00:55 +0100
Message-Id: <0d23d15d1d8b6f33bc198f334ef148d982469653.1606395586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606395586.git.mchehab+huawei@kernel.org>
References: <cover.1606395586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the license for those documents also compatible with GPLv2.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/rc/keytable.c.rst             | 2 +-
 Documentation/userspace-api/media/rc/lirc-dev-intro.rst         | 2 +-
 Documentation/userspace-api/media/rc/lirc-dev.rst               | 2 +-
 Documentation/userspace-api/media/rc/lirc-func.rst              | 2 +-
 Documentation/userspace-api/media/rc/lirc-get-features.rst      | 2 +-
 Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst      | 2 +-
 .../userspace-api/media/rc/lirc-get-rec-resolution.rst          | 2 +-
 Documentation/userspace-api/media/rc/lirc-get-send-mode.rst     | 2 +-
 Documentation/userspace-api/media/rc/lirc-get-timeout.rst       | 2 +-
 Documentation/userspace-api/media/rc/lirc-header.rst            | 2 +-
 Documentation/userspace-api/media/rc/lirc-read.rst              | 2 +-
 .../userspace-api/media/rc/lirc-set-measure-carrier-mode.rst    | 2 +-
 .../userspace-api/media/rc/lirc-set-rec-carrier-range.rst       | 2 +-
 Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst   | 2 +-
 .../userspace-api/media/rc/lirc-set-rec-timeout-reports.rst     | 2 +-
 Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst   | 2 +-
 Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst  | 2 +-
 .../userspace-api/media/rc/lirc-set-send-duty-cycle.rst         | 2 +-
 .../userspace-api/media/rc/lirc-set-transmitter-mask.rst        | 2 +-
 .../userspace-api/media/rc/lirc-set-wideband-receiver.rst       | 2 +-
 Documentation/userspace-api/media/rc/lirc-write.rst             | 2 +-
 Documentation/userspace-api/media/rc/rc-intro.rst               | 2 +-
 Documentation/userspace-api/media/rc/rc-protos.rst              | 2 +-
 Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst         | 2 +-
 Documentation/userspace-api/media/rc/rc-table-change.rst        | 2 +-
 Documentation/userspace-api/media/rc/rc-tables.rst              | 2 +-
 Documentation/userspace-api/media/rc/remote_controllers.rst     | 2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/userspace-api/media/rc/keytable.c.rst b/Documentation/userspace-api/media/rc/keytable.c.rst
index 0b50cfaf2d86..243e02d2611f 100644
--- a/Documentation/userspace-api/media/rc/keytable.c.rst
+++ b/Documentation/userspace-api/media/rc/keytable.c.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 file: uapi/v4l/keytable.c
 =========================
diff --git a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
index 167b354bf051..266b646d584e 100644
--- a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _lirc_dev_intro:
 
diff --git a/Documentation/userspace-api/media/rc/lirc-dev.rst b/Documentation/userspace-api/media/rc/lirc-dev.rst
index 5510dc02a822..978f86d30fae 100644
--- a/Documentation/userspace-api/media/rc/lirc-dev.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _lirc_dev:
 
diff --git a/Documentation/userspace-api/media/rc/lirc-func.rst b/Documentation/userspace-api/media/rc/lirc-func.rst
index 420a3dbf0d6b..793f295d3ac9 100644
--- a/Documentation/userspace-api/media/rc/lirc-func.rst
+++ b/Documentation/userspace-api/media/rc/lirc-func.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _lirc_func:
 
diff --git a/Documentation/userspace-api/media/rc/lirc-get-features.rst b/Documentation/userspace-api/media/rc/lirc-get-features.rst
index 66a243dbd437..4bf25860f932 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-features.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-features.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_get_features:
diff --git a/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst b/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
index 188478ed1233..628fe31792b2 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_get_rec_mode:
diff --git a/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst b/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
index e29445c5ce16..4dfa9c23634b 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_get_rec_resolution:
diff --git a/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst b/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
index 77472fb5608a..637871805be6 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_get_send_mode:
diff --git a/Documentation/userspace-api/media/rc/lirc-get-timeout.rst b/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
index f5f3e06d6206..597c3282ae12 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_get_min_timeout:
diff --git a/Documentation/userspace-api/media/rc/lirc-header.rst b/Documentation/userspace-api/media/rc/lirc-header.rst
index 8bd0acc9913a..54cb40b8a065 100644
--- a/Documentation/userspace-api/media/rc/lirc-header.rst
+++ b/Documentation/userspace-api/media/rc/lirc-header.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _lirc_header:
 
diff --git a/Documentation/userspace-api/media/rc/lirc-read.rst b/Documentation/userspace-api/media/rc/lirc-read.rst
index d589560214f4..ce34318698b7 100644
--- a/Documentation/userspace-api/media/rc/lirc-read.rst
+++ b/Documentation/userspace-api/media/rc/lirc-read.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc-read:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst b/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
index 9bf9811a905a..04ced1aa664b 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_measure_carrier_mode:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
index 530bc223930a..7512dc86b03a 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_rec_carrier_range:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
index 28c928f1cc14..60e321446ea7 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_rec_carrier:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
index 83e7155c5796..aebe81012939 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_rec_timeout_reports:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
index 8f3f9adf54ab..bf9fb2cc61c3 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_rec_timeout:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst b/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
index e3810ba58746..a003f9447553 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_send_carrier:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
index 52a072529af9..2979752acbcd 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_send_duty_cycle:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst b/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
index 68f4cc2e3ae3..38acbcd6e91c 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_transmitter_mask:
diff --git a/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst b/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
index be5321c4a91f..c9d578e291b8 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc_set_wideband_receiver:
diff --git a/Documentation/userspace-api/media/rc/lirc-write.rst b/Documentation/userspace-api/media/rc/lirc-write.rst
index c1c3230d4fd6..970a8b3fa1ca 100644
--- a/Documentation/userspace-api/media/rc/lirc-write.rst
+++ b/Documentation/userspace-api/media/rc/lirc-write.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. c:namespace:: RC
 
 .. _lirc-write:
diff --git a/Documentation/userspace-api/media/rc/rc-intro.rst b/Documentation/userspace-api/media/rc/rc-intro.rst
index 1338478e2bd4..2ba62cde2369 100644
--- a/Documentation/userspace-api/media/rc/rc-intro.rst
+++ b/Documentation/userspace-api/media/rc/rc-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _Remote_controllers_Intro:
 
diff --git a/Documentation/userspace-api/media/rc/rc-protos.rst b/Documentation/userspace-api/media/rc/rc-protos.rst
index 2e290584a210..a2eab3b45647 100644
--- a/Documentation/userspace-api/media/rc/rc-protos.rst
+++ b/Documentation/userspace-api/media/rc/rc-protos.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _Remote_controllers_Protocols:
 
diff --git a/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst b/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
index 43c442696438..34d6a0a1f4d3 100644
--- a/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
+++ b/Documentation/userspace-api/media/rc/rc-sysfs-nodes.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _remote_controllers_sysfs_nodes:
 
diff --git a/Documentation/userspace-api/media/rc/rc-table-change.rst b/Documentation/userspace-api/media/rc/rc-table-change.rst
index 61c77b080ae8..d7de8a56ddfe 100644
--- a/Documentation/userspace-api/media/rc/rc-table-change.rst
+++ b/Documentation/userspace-api/media/rc/rc-table-change.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _Remote_controllers_table_change:
 
diff --git a/Documentation/userspace-api/media/rc/rc-tables.rst b/Documentation/userspace-api/media/rc/rc-tables.rst
index 8dc11657fc23..aafbfda1f401 100644
--- a/Documentation/userspace-api/media/rc/rc-tables.rst
+++ b/Documentation/userspace-api/media/rc/rc-tables.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 
 .. _Remote_controllers_tables:
 
diff --git a/Documentation/userspace-api/media/rc/remote_controllers.rst b/Documentation/userspace-api/media/rc/remote_controllers.rst
index 2d9078accb35..f89291838637 100644
--- a/Documentation/userspace-api/media/rc/remote_controllers.rst
+++ b/Documentation/userspace-api/media/rc/remote_controllers.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
 .. include:: <isonum.txt>
 
 .. _remote_controllers:
-- 
2.28.0

