Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1ED39C866
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 15:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFENU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 09:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229933AbhFENUZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68150613FE;
        Sat,  5 Jun 2021 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899117;
        bh=MZn/b+egYgV5T6zhO3wdcAfr9Ty9nBtYJvlFIpjsCtk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZtTd0YOfBUHABR/O/32+9rYjnBDSW92uYfVfgrr2hYM2onLNcbYxnvx5WfU2iOe4x
         L8XCRSRTVQiRrhgXH1rrq8bfIkU0y/3DX2qsb08nLcpWkabcKr0nCAYmKdafSOarrF
         qGzfhKUTbyzD8NYLJ9pmB41uXoMf9w1xZw6UVzOXIr5ZjyVC1iuYzWCRFIX/IPDg9r
         K5Yq0m672UCJYBgVH87ZY+ybDz4lnxq3MmRjkX6FHFdFAqmWlJqttsesoTmLDawo/K
         8Kj5ceITiSortfZuiCfHETvulqXiqdIDf0VsSMK1q56C0HNhBOyKv5/d33vEHZ3RX+
         Txg3frZMECNjA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCB-008GEe-Bz; Sat, 05 Jun 2021 15:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 03/34] media: docs: */media/index.rst: don't use ReST doc:`foo`
Date:   Sat,  5 Jun 2021 15:18:02 +0200
Message-Id: <4c55f89ee17c762581610036acf2e8a4408b00a6.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
    So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/index.rst   | 12 +++++++-----
 Documentation/driver-api/media/index.rst    | 10 ++++++----
 Documentation/userspace-api/media/index.rst | 12 +++++++-----
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 6e0d2bae7154..c676af665111 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -11,12 +11,14 @@ its supported drivers.
 
 Please see:
 
-- :doc:`/userspace-api/media/index`
-     for the userspace APIs used on media devices.
+Documentation/userspace-api/media/index.rst
 
-- :doc:`/driver-api/media/index`
-     for driver development information and Kernel APIs used by
-     media devices;
+  - for the userspace APIs used on media devices.
+
+Documentation/driver-api/media/index.rst
+
+  - for driver development information and Kernel APIs used by
+    media devices;
 
 The media subsystem
 ===================
diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index 2ad71dfa8828..813d7db59da7 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -11,11 +11,13 @@ its supported drivers.
 
 Please see:
 
-- :doc:`/admin-guide/media/index`
-    for usage information about media subsystem and supported drivers;
+Documentation/admin-guide/media/index.rst
 
-- :doc:`/userspace-api/media/index`
-     for the userspace APIs used on media devices.
+  - for usage information about media subsystem and supported drivers;
+
+Documentation/userspace-api/media/index.rst
+
+  - for the userspace APIs used on media devices.
 
 
 .. only:: html
diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
index 7f42f83b9f59..d839904be085 100644
--- a/Documentation/userspace-api/media/index.rst
+++ b/Documentation/userspace-api/media/index.rst
@@ -11,12 +11,14 @@ used by media devices.
 
 Please see:
 
-- :doc:`/admin-guide/media/index`
-    for usage information about media subsystem and supported drivers;
+Documentation/admin-guide/media/index.rst
 
-- :doc:`/driver-api/media/index`
-     for driver development information and Kernel APIs used by
-     media devices;
+  - for usage information about media subsystem and supported drivers;
+
+Documentation/driver-api/media/index.rst
+
+  - for driver development information and Kernel APIs used by
+    media devices;
 
 
 .. only:: html
-- 
2.31.1

