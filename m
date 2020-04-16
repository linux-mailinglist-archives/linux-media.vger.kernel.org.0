Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5575E1ABF87
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633627AbgDPLhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:37:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:38618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506443AbgDPLhB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:37:01 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FC89221EA;
        Thu, 16 Apr 2020 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587037017;
        bh=lQO3kAMKr6AtQl0ZqTBoTW4VtHP9KHJ74hhT0K7cqcE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R9Sj+PPyTtf057DlkfHzcg8OPhAHDw3jRU9HTGZDVUe1Yt7zn2PFDsiAvJg3AjWbN
         Dhe+bSl+3HBXSEvS3D/kRwEajMJKenWhlvB5XuO5IZSfyy+UvfNsGvKPgIRVaiWwnp
         Kxjar2SELgu/ciQuu/wROVkYHnGtz0ofjYb9j96U=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jP2pD-007SZJ-3q; Thu, 16 Apr 2020 13:36:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/4] media: admin-guide: Add an introduction chapter
Date:   Thu, 16 Apr 2020 13:36:52 +0200
Message-Id: <73542a4587ad416b973bebc555fd6b93d40e5139.1587036920.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587036920.git.mchehab+huawei@kernel.org>
References: <cover.1587036920.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media's admin guide is currently just a group of
not-connected docs.

Add an introduction chapter for it to start making sense
to a random reader.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/index.rst |  2 ++
 Documentation/admin-guide/media/intro.rst | 25 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/admin-guide/media/intro.rst

diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 6e5e6bdb6d4b..f79d4f1e05ba 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -34,6 +34,8 @@ Video4Linux (V4L)  driver-specific documentation
 	:maxdepth: 5
 	:numbered:
 
+	intro
+
 	cardlist
 
 	v4l-with-ir
diff --git a/Documentation/admin-guide/media/intro.rst b/Documentation/admin-guide/media/intro.rst
new file mode 100644
index 000000000000..9b6399fd904f
--- /dev/null
+++ b/Documentation/admin-guide/media/intro.rst
@@ -0,0 +1,25 @@
+============
+Introduction
+============
+
+The media subsystem consists on Linux support for several different types
+of devices:
+
+- Audio and video grabbers;
+- PC and Laptop Cameras;
+- Complex cameras found on Embedded hardware;
+- Analog and digital TV;
+- HDMI Customer Electronics Control (CEC);
+- Multi-touch input devices;
+- Remote Controllers;
+- Media encoders and decoders.
+
+Due to the diversity of devices, the subsystem provides several different
+APIs:
+
+- Remote Controller API;
+- HDMI CEC API;
+- Video4Linux API;
+- Media controller API;
+- Video4Linux Request API (experimental);
+- Digital TV API (also known as DVB API).
-- 
2.25.2

