Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508511CA7A4
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEHJ7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:59:02 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45049 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgEHJ7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 05:59:01 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 61164FF805;
        Fri,  8 May 2020 09:58:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz,
        devicetree@vger.kernel.org
Subject: [PATCH v10 01/13] dt-bindings: video-interfaces: Document 'orientation' property
Date:   Fri,  8 May 2020 12:01:46 +0200
Message-Id: <20200508100158.3437161-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200508100158.3437161-1-jacopo@jmondi.org>
References: <20200508100158.3437161-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the 'orientation' device property, used to specify the device mounting
position. The property is particularly meaningful for mobile devices
with a well defined usage orientation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc8..b1ff492c7da7a 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -89,6 +89,17 @@ Optional properties
   but a number of degrees counter clockwise. Typical values are 0 and 180
   (upside down).

+- orientation: The orientation of a device (typically an image sensor or a flash
+  LED) describing its mounting position relative to the usage orientation of the
+  system where the device is installed on.
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
2.26.1

