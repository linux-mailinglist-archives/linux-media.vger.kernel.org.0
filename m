Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2377CE92D
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 18:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbfJGQ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 12:27:45 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41289 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbfJGQ1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 12:27:44 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6644E24000C;
        Mon,  7 Oct 2019 16:27:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v4 03/11] dt-bindings: video-interface: Expand rotation description
Date:   Mon,  7 Oct 2019 18:29:05 +0200
Message-Id: <20191007162913.250743-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007162913.250743-1-jacopo@jmondi.org>
References: <20191007162913.250743-1-jacopo@jmondi.org>
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

