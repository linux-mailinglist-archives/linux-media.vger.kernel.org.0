Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9473F3E31C9
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 00:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245550AbhHFWa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 18:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245547AbhHFWaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 18:30:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1DFC0613CF;
        Fri,  6 Aug 2021 15:30:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:1a9:2434:b693:c9:5cb6:b688])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F25A51F44DDF;
        Fri,  6 Aug 2021 23:30:35 +0100 (BST)
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH] media: ipu3.rst: Improve header formatting on tables
Date:   Fri,  6 Aug 2021 19:30:22 -0300
Message-Id: <20210806223022.2012984-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the header-rows option of the flat-table directive in order to have
the first row displayed as a header. Also capitalize these headers.
These changes make the tables easier to read.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/admin-guide/media/ipu3.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 52c1c04173da..83b3cd03b35c 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -51,10 +51,11 @@ to userspace as a V4L2 sub-device node and has two pads:
 .. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|
 
 .. flat-table::
+    :header-rows: 1
 
-    * - pad
-      - direction
-      - purpose
+    * - Pad
+      - Direction
+      - Purpose
 
     * - 0
       - sink
@@ -148,10 +149,11 @@ Each pipe has two sink pads and three source pads for the following purpose:
 .. tabularcolumns:: |p{0.8cm}|p{4.0cm}|p{4.0cm}|
 
 .. flat-table::
+    :header-rows: 1
 
-    * - pad
-      - direction
-      - purpose
+    * - Pad
+      - Direction
+      - Purpose
 
     * - 0
       - sink
-- 
2.32.0

