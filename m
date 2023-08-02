Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC97E76D9ED
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 23:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjHBVrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 17:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbjHBVqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 17:46:43 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B0A4224
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691012768; x=1722548768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCvzY1zp5KE9yonAiKuUCTNHerxKkvy7vnFRprLXYAI=;
  b=JJXHXpobkCXcjkQdVSWyh7DzxV//QumugI1x5qBXhD7W8peiZvI6ZEoV
   zV3BURgOEwluJ/MKRzmZ59bviwbdgu3JfX5jGiU35145OuQHKgUrrpqcg
   ENEWkwD1yjdXQ0mxLOQc0b0m1gn7B0vlHUgvSwomQb1js0KBq9isomHZa
   sspirj9IbG5/bDc8FZr+uzW6lKwwncqWi1B2HjtRGFI066mHtn74z20YB
   oKGNjIqKKMMPCHOOKVT7lCN3oRec5XANJz5VfVBkaDTGc6uERjZe+4glV
   gRXduGwxT8SggLGo2cVR2zNwBdQBKRgGPLBZyI8tfuXXmXksQE2Bt4ghq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372442044"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372442044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853009277"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="853009277"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DB2D8120AB8;
        Thu,  3 Aug 2023 00:45:57 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v2 1/9] media: Documentation: Align numbered list
Date:   Thu,  3 Aug 2023 00:45:48 +0300
Message-Id: <20230802214556.180589-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Align lines for numbered list so that Sphinx produces an uniform output
for all list entries.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a4f1df7093e8..d737c9530dbd 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -579,20 +579,19 @@ is started.
 
 There are three steps in configuring the streams:
 
-1) Set up links. Connect the pads between sub-devices using the :ref:`Media
-Controller API <media_controller>`
-
-2) Streams. Streams are declared and their routing is configured by
-setting the routing table for the sub-device using
-:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that
-setting the routing table will reset formats and selections in the
-sub-device to default values.
-
-3) Configure formats and selections. Formats and selections of each stream
-are configured separately as documented for plain sub-devices in
-:ref:`format-propagation`. The stream ID is set to the same stream ID
-associated with either sink or source pads of routes configured using the
-:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
+1) Set up links. Connect the pads between sub-devices using the
+   :ref:`Media Controller API <media_controller>`
+
+2) Streams. Streams are declared and their routing is configured by setting the
+   routing table for the sub-device using :ref:`VIDIOC_SUBDEV_S_ROUTING
+   <VIDIOC_SUBDEV_G_ROUTING>` ioctl. Note that setting the routing table will
+   reset formats and selections in the sub-device to default values.
+
+3) Configure formats and selections. Formats and selections of each stream are
+   configured separately as documented for plain sub-devices in
+   :ref:`format-propagation`. The stream ID is set to the same stream ID
+   associated with either sink or source pads of routes configured using the
+   :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.
 
 Multiplexed streams setup example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- 
2.39.2

