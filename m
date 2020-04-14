Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168901A7684
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437122AbgDNIv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437109AbgDNIvR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:17 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64DE021835;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=/ifeaDL4BrNJknQlHPAW9qNRsoNoUa9p55HHjDYHVCI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z7PfZSgcaCQAHv/qK3qVgRu0yKS92Ny5Q0WMn7hBVsGs2LpkW5xAUR0SkWQw959jV
         adWo9h8aOLu/RybOsNWy5FJMLp/JGNaFqn/JmwaaLYZAKM454pMl3ZinW2hkN9qFl9
         Rk9I61Lh7pqzGurbRQJ+UfElxgScEShdWWBBA1So=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002x0E-M0; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 19/19] media: docs: add cros-references to the other media guides
Date:   Tue, 14 Apr 2020 10:51:05 +0200
Message-Id: <47cda41623dbb81d65fc22be92266df3efc1c328.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to make easier for people to navigate between the
three media guides, add cross-references between them

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/index.rst   | 12 ++++++++++++
 Documentation/driver-api/media/index.rst    |  8 ++++++++
 Documentation/userspace-api/media/index.rst | 11 +++++++++++
 3 files changed, 31 insertions(+)

diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index eb1d82dffcc9..6e5e6bdb6d4b 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -2,9 +2,21 @@
 
 .. include:: <isonum.txt>
 
+============================
+Media subsystem usage guides
+============================
 
+This section contains usage information about media subsystem and
+its supported drivers.
 
+Please see:
 
+- :doc:`/userspace-api/media/index`
+     for the userspace APIs used on media devices.
+
+- :doc:`/driver-api/media/index`
+     for driver development information and Kernel APIs used by
+     media devices;
 
 .. _uapi-v4l-drivers:
 
diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index 5e9f67f34081..328350924853 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -6,8 +6,16 @@
 Media subsystem kernel internal API
 ===================================
 
+This section contains usage information about media subsystem and
+its supported drivers.
 
+Please see:
 
+- :doc:`/admin-guide/media/index`
+    for usage information about media subsystem and supported drivers;
+
+- :doc:`/userspace-api/media/index`
+     for the userspace APIs used on media devices.
 
 
 .. only:: html
diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
index b20010f414b3..70a3f3d73698 100644
--- a/Documentation/userspace-api/media/index.rst
+++ b/Documentation/userspace-api/media/index.rst
@@ -6,6 +6,17 @@
 Linux Media Infrastructure userspace API
 ########################################
 
+This section contains the  driver development information and Kernel APIs
+used by media devices.
+
+Please see:
+
+- :doc:`/admin-guide/media/index`
+    for usage information about media subsystem and supported drivers;
+
+- :doc:`/driver-api/media/index`
+     for driver development information and Kernel APIs used by
+     media devices;
 
 
 .. only:: html
-- 
2.25.2

