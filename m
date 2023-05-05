Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5054C6F8BA6
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 23:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbjEEVxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 17:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjEEVxG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 17:53:06 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C467A4C20
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683323585; x=1714859585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EcSyvEaM+tWi+Tf3yEYgO9K5CPFL7iyJCMdJ029ORDM=;
  b=g8cOhOqxnCwTqpPDYXBkTlW69eXkOrFsVO4uX0YVNMyFD7w3Pd9EkmQm
   VXQEjN+N05rW5zfRUITNV/lIfJ1R916F7MiryI/n02Hi05X4G7IaXVnFs
   5s+T7yiYqgwDi6rU4g3poC0Dtgii8eHLgxido+OUjiJvKTITe1mioCgRC
   6WdcQp5Rsxk00mq3xG7QsjqZSb6gKH92JGc1yr5dcKkmqNgtBUtnSH1Qs
   xYouIl/5nMrSK+XddP8r0WUoPaRjGqgO4VPqwoIVHuLVEXoCc6bz1cRs1
   eF9ZbZB/YCoRF0yaP9Zt0JNAgRlcVjmD23ZoEYgcC1qG23cKoZSMqRnwj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328925839"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="328925839"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700626137"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700626137"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 818311224B5;
        Sat,  6 May 2023 00:53:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [RFC 3/7] media: uapi: v4l: Document source routes
Date:   Sat,  6 May 2023 00:52:53 +0300
Message-Id: <20230505215257.60704-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how internal pads are used on source routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst     | 18 ++++++++++++++++++
 .../media/v4l/vidioc-subdev-g-routing.rst      |  5 +++++
 include/uapi/linux/v4l2-subdev.h               |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a4f1df7093e8..395e06d2f0f2 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -551,6 +551,24 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+.. _v4l2-subdev-source-routes:
+
+Source routes
+^^^^^^^^^^^^^
+
+Cases where a single sub-device pad is a source of multiple streams are special
+as there is no sink pad for such a route. In those cases, an internal pad is
+used as the sink pad. Such pads have the :ref:`MEDIA_PAD_FL_INTERNAL_SOURCE
+<MEDIA-PAD-FL-INTERNAL-SOURCE>` flag set.
+
+Internal pads have all the properties of a sink pad in such case, including
+formats and selections. The format in this case is the source format of the
+stream. An internal pad always has a single stream only (0).
+
+Generally source routes are not modifiable but they can be activated and
+inactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
+<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
+
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 68ca343c3b44..e00622071b64 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -94,6 +94,11 @@ for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
     * - __u32
       - ``sink_pad``
       - Sink pad number.
+    * - __u32
+      - ``internal_source_pad``
+      - Internal source pad number. For pads with :ref:`internal source pad flag
+	<MEDIA-PAD-FL-INTERNAL-SOURCE>`, for use with :ref:`source routes
+	<v4l2-subdev-source-routes>`.
     * - __u32
       - ``sink_stream``
       - Sink pad stream number.
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..703e3a1f199b 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -203,6 +203,7 @@ struct v4l2_subdev_capability {
  * struct v4l2_subdev_route - A route inside a subdev
  *
  * @sink_pad: the sink pad index
+ * @internal_source_pad: the internal source pad
  * @sink_stream: the sink stream identifier
  * @source_pad: the source pad index
  * @source_stream: the source stream identifier
@@ -210,7 +211,10 @@ struct v4l2_subdev_capability {
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_route {
-	__u32 sink_pad;
+	union {
+		__u32 sink_pad;
+		__u32 internal_source_pad;
+	};
 	__u32 sink_stream;
 	__u32 source_pad;
 	__u32 source_stream;
-- 
2.30.2

