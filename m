Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC93017FF44
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgCJNnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726501AbgCJNnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:17 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0422724649;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=pC9xgZCZWZC3X11cyT+L7+K4urWl9GiLUbC2Phjo8yQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VPijOlBdBUJIDxNqKmcZjD3C2NMcm0J9q/7BqWY8GzkNDt4y4rIW1ULPg8yCDoxr/
         KyrlpaZUb/1slgIjtTh87eyMV36xTG+yw+5sSrCYufPMnllKpHrdEcwT4hexFuD28e
         0IK/Z3I3CU65pM64cX3UfqRItBvBHd5jV60MiLqY=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vd-4X; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 06/22] media: docs: split vimc.rst into devel and admin parts
Date:   Tue, 10 Mar 2020 14:42:57 +0100
Message-Id: <0a312975652f41f2b547cbcda566781d189b7952.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vimc driver has some kerneldoc markups, plus admin info.
Split it into two files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/index.rst      |  2 ++
 Documentation/media/v4l-drivers/vimc-devel.rst | 15 +++++++++++++++
 Documentation/media/v4l-drivers/vimc.rst       | 11 -----------
 3 files changed, 17 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/vimc-devel.rst

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 5a87bd1da9bd..2b8e2cbfff23 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -67,4 +67,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	zr364xx
 
 	cpia2_devel
+	vimc-devel
+
 	meye-uapi
diff --git a/Documentation/media/v4l-drivers/vimc-devel.rst b/Documentation/media/v4l-drivers/vimc-devel.rst
new file mode 100644
index 000000000000..b2aa2ee79205
--- /dev/null
+++ b/Documentation/media/v4l-drivers/vimc-devel.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The Virtual Media Controller Driver (vimc)
+==========================================
+
+Source code documentation
+-------------------------
+
+vimc-streamer
+~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
+   :internal:
+
+.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.c
diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index 8f5d7f8d83bb..211cc8972410 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -88,14 +88,3 @@ Vimc has a module parameter to configure the driver.
         height, so the image size will be ``sca_mult^2`` bigger than the
         original one. Currently, only supports scaling up (the default value
         is 3).
-
-Source code documentation
--------------------------
-
-vimc-streamer
-~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
-   :internal:
-
-.. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.c
-- 
2.24.1

