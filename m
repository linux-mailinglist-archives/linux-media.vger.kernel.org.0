Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A1574436C
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbjF3Unz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjF3Unw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:52 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0466EA2
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157831; x=1719693831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NTFlhRtgV9s619y/uGT6ElayJF4/jK9alQChh5RF9dI=;
  b=QVdGfE2vAX0lUVmmmbc8jFZfPlMxZdeWokxonWyk9x05JicMkQ9MsuVW
   Q2zAvSnX1I7NZp1dX1hgNpywbnu7diAXeunLpK/GQfhQsA3DDK5esIrE+
   f/9oCovmRd5SuN4X7CeAZqr8Mhna8iGi++kgmYfNUVEehy2rqjFLTccma
   jn/u3cxMl/sHXxJ2S7+VuFP1K+ShXTgUFistjcqQ8kog3/RIdQswVhJ0F
   6b9hfdDVXln6BLR5Fk0hRysmNgyUT73oVFdszF0JT7WNfaU0aKZC/Xk3q
   +1WFASaXG5sM88yXRrTftLR1Y/R4FAZ6lI7yqKYot++3ClGLtDKXKVtGb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866702"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987191"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987191"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E67B1203D3;
        Fri, 30 Jun 2023 23:43:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 4/7] media: uapi: v4l: Document source routes
Date:   Fri, 30 Jun 2023 23:43:35 +0300
Message-Id: <20230630204338.126583-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document how internal pads are used on source routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index a4f1df7093e8..5a46c9a9d352 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -551,6 +551,26 @@ A stream at a specific point in the media pipeline is identified by the
 sub-device and a (pad, stream) pair. For sub-devices that do not support
 multiplexed streams the 'stream' field is always 0.
 
+.. _v4l2-subdev-source-routes:
+
+Source routes
+^^^^^^^^^^^^^
+
+Cases where a single sub-device pad is a source of multiple streams are special
+as there is no external sink pad for such a route. In those cases, the sources
+of the streams are indicated by source routes that have an internal source pad
+as the sink pad of such a route. Internal source pads have the
+:ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` and ``MEDIA_PAD_FL_SINK``
+pad flags set.
+
+Internal source pads have all the properties of a sink pad in such case,
+including formats and selections. The format in this case is the source format
+of the stream. An internal pad always has a single stream only (0).
+
+Generally source routes are not modifiable but they can be activated and
+deactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
+<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
+
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2

