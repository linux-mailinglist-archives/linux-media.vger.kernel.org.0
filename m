Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7703B2CC4FE
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgLBSYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:24:39 -0500
Received: from retiisi.eu ([95.216.213.190]:33806 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730926AbgLBSYj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 13:24:39 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D0DBB634C87;
        Wed,  2 Dec 2020 20:21:44 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     martinax.krasteva@linux.intel.com
Subject: [PATCH 1/2] Documentation: v4l: Remove reference to video ops
Date:   Wed,  2 Dec 2020 20:19:54 +0200
Message-Id: <20201202181955.18165-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We no longer have format related callbacks in video ops. Remove the
reference to them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index bb5b1a7cdfd9..d4cba0d6c4ca 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -122,10 +122,6 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
 
 	media_entity_cleanup(&sd->entity);
 
-If the subdev driver intends to process video and integrate with the media
-framework, it must implement format related functionality using
-:c:type:`v4l2_subdev_pad_ops` instead of :c:type:`v4l2_subdev_video_ops`.
-
 In that case, the subdev driver may set the link_validate field to provide
 its own link validation function. The link validation function is called for
 every link in the pipeline where both of the ends of the links are V4L2
-- 
2.27.0

