Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185983B2013
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 20:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhFWSPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 14:15:23 -0400
Received: from retiisi.eu ([95.216.213.190]:44442 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhFWSPX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 14:15:23 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CAE63634C89;
        Wed, 23 Jun 2021 21:12:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/3] Documentation: v4l: Rework LP-11 documentation, add callbacks
Date:   Wed, 23 Jun 2021 21:13:00 +0300
Message-Id: <20210623181302.14660-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
References: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework LP-11 and LP-111 mode documentation to make it more understandable
and useful. This involves adding pre_streamon and post_streamon callbacks
that make it possible to explicitly transition the transmitter to either
mode.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 40 +++++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 4ba274713a61..706e839e8cec 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -93,18 +93,34 @@ where
 LP-11 and LP-111 modes
 ^^^^^^^^^^^^^^^^^^^^^^
 
-The transmitter drivers must, if possible, configure the CSI-2 transmitter to
-*LP-11 or LP-111 mode* whenever the transmitter is powered on but not active,
-and maintain *LP-11 or LP-111 mode* until stream on. Only at stream on time
-should the transmitter activate the clock on the clock lane and transition to
-*HS mode*.
-
-Some transmitters do this automatically but some have to be explicitly
-programmed to do so, and some are unable to do so altogether due to
-hardware constraints.
-
-The receiver thus need to be configured to expect LP-11 or LP-111 mode from the
-transmitter before the transmitter driver's ``.s_stream()`` op is called.
+As part of transitioning to high speed mode, a CSI-2 transmitter typically
+briefly sets the bus to LP-11 or LP-111 state, depending on the PHY. This period
+may be as short as 100 µs, during which the receiver observes this state and
+proceeds its own part of high speed mode transition.
+
+Most receivers are capable of autonomously handling this once the software has
+configured them to do so, but there are receivers which require software
+involvement in observing LP-11 or LP-111 state. 100 µs is a brief period to hit
+in software, especially when there is no interrupt telling something is
+happening.
+
+One way to address this is to configure the transmitter side explicitly to LP-11
+or LP-111 mode, which requires support from the transmitter hardware. This is
+not universally available. Many devices return to this state once streaming is
+stopped while the state after power-on is LP-00 or LP-000.
+
+The ``.pre_streamon()`` callback may be used to prepare a transmitter for
+transitioning to streaming state, but not yet start streaming. Similarly, the
+``.post_streamoff()`` callback is used to undo what was done by the
+``.pre_streamon()`` callback. The caller of ``.pre_streamon()`` is thus required
+to call ``.post_streamoff()`` for each successful call of ``.pre_streamon()``.
+
+In the context of CSI-2, the ``.pre_streamon()`` callback is used to transition
+the transmitter to the LP-11 or LP-111 mode. This also requires powering on the
+device, so this should be only done when it is needed.
+
+Receiver drivers that do not need explicit LP-11 or LP-111 mode setup are waived
+from calling the two callbacks.
 
 Stopping the transmitter
 ^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.30.2

