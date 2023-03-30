Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6226D042D
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjC3L7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjC3L73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:29 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3DBA27B
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177568; x=1711713568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5PZz4x0/t0TTrQFim4mSqKxe4HexonFojrkjAmIVT4w=;
  b=Kp3hDwI010DH5hkhQR5bFOywzgAYSWlVhwI7rFsLPe9ZfkBTZ7ZimvlU
   1gmL4yZ1aJDzqE4CY+K+/lcDOFJ+gE587eHnzoxCwkwUnFfs3PHAQvNmC
   5fa7hHunvVMyprDVU18TDHVyrj7U0mRZ7TYmLp0RXQ6KyWF3EiOeeiwnB
   rCLCbJSOLA3/ng1BYmJBLchIecEyyu95r5kwwUxvKsPLXMFbNFqNi2OqS
   Tp/sZMWUe33qvIg0cF8d27q3qkrmE8N21B6M0mrsJd3ZlIDeajELbzghh
   uZQ40xiMxHnXFGJptvD8fJRvXIYrZbyouOgT+IDMji6mr/jWbM0Cd74L4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111537"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111537"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952939"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952939"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:21 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A1D841224D9;
        Thu, 30 Mar 2023 14:59:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 18/18] Documentation: media: Document sub-device notifiers
Date:   Thu, 30 Mar 2023 14:58:53 +0300
Message-Id: <20230330115853.1628216-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that sub-device notifiers are now registered using
v4l2_async_subdev_nf_init(). No documentation is changed as it seems that
sub-device notifiers were not documented apart from kernel-doc comments.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 1c5cb1a637ab..b034c35000f8 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -204,6 +204,12 @@ that the bridge device needs for its operation. Several functions are available
 to add subdevice descriptors to a notifier, depending on the type of device and
 the needs of the driver.
 
+For a sub-device driver to register a notifier, the process is otherwise similar
+to that of a bridge driver, apart from that the notifier is initialised using
+:c:func:`v4l2_async_subdev_nf_init` instead. A sub-device notifier may complete
+only after the V4L2 device becomes available, i.e. there's a path via async
+sub-devices and notifiers to that root notifier.
+
 :c:func:`v4l2_async_nf_add_fwnode_remote` and
 :c:func:`v4l2_async_nf_add_i2c` are for bridge and ISP drivers for
 registering their async sub-devices with the notifier.
-- 
2.30.2

