Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC31E2ADD26
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 18:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730853AbgKJRk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 12:40:57 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40835 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730796AbgKJRk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 12:40:57 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 87C83FF80B;
        Tue, 10 Nov 2020 17:40:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, nsaenzjulienne@suse.de,
        mchehab+huawei@kernel.org
Subject: [PATCH v4 5/5] media: bcm2835-unicam: Add TODO file
Date:   Tue, 10 Nov 2020 18:40:36 +0100
Message-Id: <20201110174036.220883-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110174036.220883-1-jacopo@jmondi.org>
References: <20201110174036.220883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bcm2835-unicam driver is currently in staging mainly for
two reasons:
- Handling of CSI-2 embedded data
- Usage of both media controller API and subdev kAPI

Provide a more detailed description of the currently on-going design
discussions in the associated TODO file.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/media/bcm2835-unicam/TODO | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 drivers/staging/media/bcm2835-unicam/TODO

diff --git a/drivers/staging/media/bcm2835-unicam/TODO b/drivers/staging/media/bcm2835-unicam/TODO
new file mode 100644
index 0000000000000..c7840872eea4c
--- /dev/null
+++ b/drivers/staging/media/bcm2835-unicam/TODO
@@ -0,0 +1,37 @@
+BCM2835 Unicam driver TODO list
+===============================
+
+The unicam driver could be considered ready to be moved out of the staging
+directory in terms of code quality and expected functionalities.
+
+However there currently are two design issues that suggest the driver is
+better kept in staging for the time being.
+
+CSI-2 Embedded data support:
+----------------------------
+
+The RaspberryPi camera stack and camera applications rely on the availability of
+the sensor produced CSI-2 embedded data, whose support is currently not
+finalized in mainline Linux.
+
+The driver conditionally registers an additional video device node
+'unicam-embedded' with a single sink pad which connects to the sensor
+sub-device source pad #1 to expose ancillary data.
+
+Currently none of the mainline sensor drivers register more than a single pad,
+and consequentially no embedded data from the sensor are exposed to userspace.
+
+The current implementation is then subject to changes depending on how support
+for CSI-2 embedded data gets finalized in Linux.
+
+Media controller support:
+-------------------------
+
+Due to compatibility reasons with the existing RaspberryPi software ecosystem
+the unicam driver implements the media controller interface to allow the
+enumeration of the connected entities but handles the configuration of the
+sensor sub-device using the v4l2-subdev kAPI instead of delegating that to
+user-space.
+
+Discussions are on-going on how this should be better handled (driver option,
+KConfig option etc etc).
-- 
2.29.1

