Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8563D17FF26
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgCJNon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:44:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727231AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DE5C246B4;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=OPGYmieXKETcyEj5QfTyd0VUv6QXCI4OfGbmwHtuc8g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CLlCgW1Q8yWm9KWqJYC58YsnWKUiBdlfHL1hbcGw/RVrU4qf5e7t+1/IM/DtD+x9w
         2OUXVxZvCX/FLVVZTdQXndK7UQZh1am2knD5GytB+l0XSUUjstz6I9BDypM5Y5c1G4
         YDD1uUUjfS0VP5ecwdq1+zeSy0BuUkIx2eoB1LG8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wt-PU; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 22/22] media: docs: get rid of Documentation/media/
Date:   Tue, 10 Mar 2020 14:43:13 +0100
Message-Id: <50b933ab1f2e42e6905c72be6bd53dc1c30621d3.1583847557.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that everything got moved, we can get rid of the
old media directory.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/index.rst    |  1 +
 Documentation/index.rst               |  1 -
 Documentation/media/index.rst         | 23 -----------------------
 Documentation/userspace-api/index.rst |  1 +
 4 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/media/index.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 0ebe205efd0c..92c2570277ac 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -62,6 +62,7 @@ available subsections can be seen below.
    pinctl
    gpio/index
    md/index
+   media/index
    misc_devices
    nfc/index
    dmaengine/index
diff --git a/Documentation/index.rst b/Documentation/index.rst
index e99d0bd2589d..7139190f1c01 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -108,7 +108,6 @@ needed).
    isdn/index
    infiniband/index
    leds/index
-   media/index
    netlabel/index
    networking/index
    pcmcia/index
diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
deleted file mode 100644
index e93fd88881af..000000000000
--- a/Documentation/media/index.rst
+++ /dev/null
@@ -1,23 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Linux Media Subsystem Documentation
-===================================
-
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
-.. toctree::
-   :maxdepth: 2
-
-   ../userspace-api/media/index
-   ../driver-api/media/index
-
-.. only:: html and subproject
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index e983488b48b1..69fc5167e648 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -22,6 +22,7 @@ place where this information is gathered.
    spec_ctrl
    accelerators/ocxl
    ioctl/index
+   media/index
 
 .. only::  subproject and html
 
-- 
2.24.1

