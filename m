Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E533CE92B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 18:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfJGQ1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 12:27:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33923 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728429AbfJGQ1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 12:27:41 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3B2C4240007;
        Mon,  7 Oct 2019 16:27:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v4 01/11] dt-bindings: video-interfaces: Document 'location' property
Date:   Mon,  7 Oct 2019 18:29:03 +0200
Message-Id: <20191007162913.250743-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007162913.250743-1-jacopo@jmondi.org>
References: <20191007162913.250743-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the 'location' device property, used to specify a device mounting
position. The property is particularly meaningful for mobile devices
with a well defined usage orientation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..1211bdf80722 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,17 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).
 
+- location: The mount location of a device (typically an image sensor or a flash
+  LED) expressed as a position relative to the usage orientation of the system
+  where the device is installed on.
+  Possible values are:
+  0 - Front. The device is mounted on the front facing side of the system.
+  For mobile devices such as smartphones, tablets and laptops the front side is
+  the user facing side.
+  1 - Back. The device is mounted on the back side of the system, which is
+  defined as the opposite side of the front facing one.
+  2 - External. The device is not attached directly to the system but is
+  attached in a way that allows it to move freely.
 
 Optional endpoint properties
 ----------------------------
-- 
2.23.0

