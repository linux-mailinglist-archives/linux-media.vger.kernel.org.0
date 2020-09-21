Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9425D2733AD
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 22:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgIUUi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 16:38:56 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:41642 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727294AbgIUUi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 16:38:56 -0400
Received: from [78.134.51.148] (port=50434 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kKSJq-0009Ai-Fi; Mon, 21 Sep 2020 22:21:50 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 3/4] media: docs: v4l2-subdev: move "Subdev registration" to a subsection
Date:   Mon, 21 Sep 2020 22:21:33 +0200
Message-Id: <20200921202134.9792-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921202134.9792-1-luca@lucaceresoli.net>
References: <20200921202134.9792-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev registration topic is pretty lengthy, and takes more than
half of the "V4L2 sub-devices" section. Help readers in finding their
way through the document by dedicating a subsection to
"Subdev registration".

Each of the two registration methods takes many paragraphs, but since
adding a subsubsection would be overkill, just emphasize them in bold.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes in v2: none
---
 Documentation/driver-api/media/v4l2-subdev.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 9ea16a8c3bde..3adcd881cae5 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -138,6 +138,9 @@ ensures that width, height and the media bus pixel code are equal on both source
 and sink of the link. Subdev drivers are also free to use this function to
 perform the checks mentioned above in addition to their own checks.
 
+Subdev registration
+~~~~~~~~~~~~~~~~~~~
+
 There are currently two ways to register subdevices with the V4L2 core. The
 first (traditional) possibility is to have subdevices registered by bridge
 drivers. This can be done when the bridge driver has the complete information
@@ -157,7 +160,7 @@ below.
 Using one or the other registration method only affects the probing process, the
 run-time bridge-subdevice interaction is in both cases the same.
 
-In the synchronous case a device (bridge) driver needs to register the
+In the **synchronous** case a device (bridge) driver needs to register the
 :c:type:`v4l2_subdev` with the v4l2_device:
 
 	:c:func:`v4l2_device_register_subdev <v4l2_device_register_subdev>`
@@ -238,9 +241,9 @@ contain several subdevs that use an I2C bus, but also a subdev that is
 controlled through GPIO pins. This distinction is only relevant when setting
 up the device, but once the subdev is registered it is completely transparent.
 
-In the asynchronous case subdevice probing can be invoked independently of the
-bridge driver availability. The subdevice driver then has to verify whether all
-the requirements for a successful probing are satisfied. This can include a
+In the **asynchronous** case subdevice probing can be invoked independently of
+the bridge driver availability. The subdevice driver then has to verify whether
+all the requirements for a successful probing are satisfied. This can include a
 check for a master clock availability. If any of the conditions aren't satisfied
 the driver might decide to return ``-EPROBE_DEFER`` to request further reprobing
 attempts. Once all conditions are met the subdevice shall be registered using
-- 
2.28.0

