Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C952CC4FD
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389072AbgLBSYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:24:39 -0500
Received: from retiisi.eu ([95.216.213.190]:33808 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727454AbgLBSYj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:24:39 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E3832634C89;
        Wed,  2 Dec 2020 20:21:44 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     martinax.krasteva@linux.intel.com
Subject: [PATCH 2/2] Documentation: v4l: Document that link_validate op is valid for sink only
Date:   Wed,  2 Dec 2020 20:19:55 +0200
Message-Id: <20201202181955.18165-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The link_validate pad op will only be called on sink pads. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index d4cba0d6c4ca..6d5c799c49fe 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -122,11 +122,12 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
 
 	media_entity_cleanup(&sd->entity);
 
-In that case, the subdev driver may set the link_validate field to provide
-its own link validation function. The link validation function is called for
-every link in the pipeline where both of the ends of the links are V4L2
-sub-devices. The driver is still responsible for validating the correctness
-of the format configuration between sub-devices and video nodes.
+If a sub-device driver implements sink pads, the subdev driver may set the
+link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
+validation function. For every link in the pipeline, the link_validate pad
+operation of the sink end of the link is called. In both cases the driver is
+still responsible for validating the correctness of the format configuration
+between sub-devices and video nodes.
 
 If link_validate op is not set, the default function
 :c:func:`v4l2_subdev_link_validate_default` is used instead. This function
-- 
2.27.0

