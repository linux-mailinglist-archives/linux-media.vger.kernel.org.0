Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A848B152A
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbfILUJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:09:45 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56645 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfILUJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:09:45 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C8A532000A;
        Thu, 12 Sep 2019 20:09:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), devicetree@vger.kernel.org
Subject: [PATCH v3 03/11] dt-bindings: video-interfaces: Expand rotation description
Date:   Thu, 12 Sep 2019 22:10:47 +0200
Message-Id: <20190912201055.13964-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
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
index e71b90a29d7a..8ab51e0bb63e 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -85,9 +85,11 @@ Optional properties

 - lens-focus: A phandle to the node of the focus lens controller.

-- rotation: The device, typically an image sensor, is not mounted upright,
-  but a number of degrees counter clockwise. Typical values are 0 and 180
-  (upside down).
+- rotation: The device, typically an image sensor, mounting rotation expressed
+  as counterclockwise rotation degrees along the axis perpendicular to
+  the device mounting surface directed away from it. Typical values are
+  0 degrees for upright mounted devices and 180 degrees for devices mounted
+  upside down.

 - location: The device, typically an image sensor or a flash LED, mounting
   location expressed as a position relative to the usage orientation of the
--
2.23.0

