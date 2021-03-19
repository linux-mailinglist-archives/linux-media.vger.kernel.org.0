Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E4B342240
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhCSQmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:18 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60613 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhCSQlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:41:49 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 399A8C0004;
        Fri, 19 Mar 2021 16:41:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/19] media: v4l2-subdev: De-deprecate init() subdev op
Date:   Fri, 19 Mar 2021 17:41:34 +0100
Message-Id: <20210319164148.199192-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The init() subdev core operation is deemed to be deprecated for new
subdevice drivers. However it could prove useful for complex
architectures to defer operation that require access to the
communication bus if said bus is not available (or fully configured)
at the time when the subdevice probe() function is run.

As an example, the GMSL architecture requires the GMSL configuration
link to be configured on the host side after the remote subdevice
has completed its probe function. After the configuration on the host
side has been performed, the subdevice registers can be accessed through
the communication bus.

In particular:

	HOST			REMOTE

	probe()
	   |
	   ---------------------> |
				  probe() {
				     bus config()
				  }
	   |<--------------------|
	v4l2 async bound {
	    bus config()
	    call subdev init()
	   |-------------------->|
				 init() {
				     access register on the bus()
				}
	   |<-------------------
	}

In the GMSL use case the bus configuration requires the enablement of the
noise immunity threshold on the remote side which ensures reliability
of communications in electrically noisy environments. After the subdevice
has enabled the threshold at the end of its probe() sequence the host
side shall compensate it with an higher signal amplitude. Once this
sequence has completed the bus can be accessed with noise protection
enabled and all the operations that require a considerable number of
transactions on the bus (such as the image sensor configuration
sequence) are run in the subdevice init() operation implementation.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0e9a5bdb08b..3068d9940669 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
  *	each pin being configured.  This function could be called at times
  *	other than just subdevice initialization.
  *
- * @init: initialize the sensor registers to some sort of reasonable default
- *	values. Do not use for new drivers and should be removed in existing
- *	drivers.
+ * @init: initialize the subdevice registers to some sort of reasonable default
+ *	values. Do not use for new drivers (and should be removed in existing
+ *	ones) for regular architectures where the image sensor is connected to
+ *	the host receiver. For more complex architectures where the subdevice
+ *	initialization should be deferred to the completion of the probe
+ *	sequence of some intermediate component, or the communication bus
+ *	requires configurations on the host side that depend on the completion
+ *	of the probe sequence of the remote subdevices, the usage of this
+ *	operation could be considered to allow the devices along the pipeline to
+ *	probe and register in the media graph and to defer any operation that
+ *	require actual access to the communication bus to their init() function
+ *	implementation.
  *
  * @load_fw: load firmware.
  *
-- 
2.30.0

