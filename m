Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FE7B1527
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfILUJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:09:41 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47151 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfILUJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:09:40 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B043B20002;
        Thu, 12 Sep 2019 20:09:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), devicetree@vger.kernel.org
Subject: [PATCH v3 01/11] dt-bindings: video-interfaces: Document 'location' property
Date:   Thu, 12 Sep 2019 22:10:45 +0200
Message-Id: <20190912201055.13964-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
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
index f884ada0bffc..e71b90a29d7a 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,17 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).

+- location: The device, typically an image sensor or a flash LED, mounting
+  location expressed as a position relative to the usage orientation of the
+  system where the device is installed on.
+  Possible values are:
+  0 - Front. The device is mounted on the front facing side of the system For
+  mobile devices such as smartphones, tablets and laptops the front side is the
+  user facing side.
+  1 - Back. The device is mounted on the back side of the system, which is
+  defined as the opposite side of the front facing one.
+  2 - External. The device is not attached directly to the system, or is
+  attached in a way that allows it to move freely.

 Optional endpoint properties
 ----------------------------
--
2.23.0

