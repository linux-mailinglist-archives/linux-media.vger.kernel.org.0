Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13C4F5058
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfKHP6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:58:02 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:51235 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfKHP6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:58:02 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id DA6B5100012;
        Fri,  8 Nov 2019 15:57:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), devicetree@vger.kernel.org
Subject: [PATCH v5 03/11] dt-bindings: video-interface: Expand rotation description
Date:   Fri,  8 Nov 2019 16:59:36 +0100
Message-Id: <20191108155944.1040883-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expand the 'rotation' property description to define the direction and
orientation of the axis around which the device mounting rotation is
expressed.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 1211bdf80722..58b87a3f1fa4 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -85,9 +85,11 @@ Optional properties

 - lens-focus: A phandle to the node of the focus lens controller.

-- rotation: The device, typically an image sensor, is not mounted upright,
-  but a number of degrees counter clockwise. Typical values are 0 and 180
-  (upside down).
+- rotation: The mount rotation of the device (typically an image sensor)
+  expressed as counterclockwise rotation degrees along the axis perpendicular to
+  the device mounting surface directed away from it. Typical values are 0
+  degrees for upright mounted devices and 180 degrees for devices mounted upside
+  down.

 - location: The mount location of a device (typically an image sensor or a flash
   LED) expressed as a position relative to the usage orientation of the system
--
2.23.0

