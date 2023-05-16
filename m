Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B36E7049C7
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbjEPJ4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjEPJ4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC0A3A9A
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230968; x=1715766968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fitF0OE2reffd1zg4bv7IWDlVqhJmA9YDWbTx3hcc8M=;
  b=ILzBIUSdJoyGyDyyr7IBrpRkmyAIpaoFEKQ9Ugw+GC84/xZCSnndUIlT
   1/o7azMCrJQwvkj5sf2Inf1o8Odjc0M86pJiUPhytfosPjNDpx6dpanlE
   4oQlqcuTfaF0dHyf5cJb9dfl33eWpg8RzAq2NC3LqzC1v/WERVKvkmMkE
   TPVhz5EzPHmqXAkQMG8r7Oczx9Lg3B0zi+Yb5kNKyzIGakQJ13I0dvlsY
   SvrBLGB4E3aZVnok1xkj4WswJ/O/f20kwkq9he5dYTkR0+akpjIiOwYNx
   m4D8XtNVWTM1e1nU5lsJA683ByjMJ4DGfpTF/klcp+YRqiJyo5JacBb96
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353715217"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="353715217"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678791319"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="678791319"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:38 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DB705120D7C;
        Tue, 16 May 2023 12:55:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOx-002Z9g-Sq; Tue, 16 May 2023 12:55:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 02/31] media: Documentation: v4l: Document missing async subdev function
Date:   Tue, 16 May 2023 12:54:48 +0300
Message-Id: <20230516095517.611711-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also v4l2_async_nf_add_fwnode() may be used to add an async sub-device
descriptor to a notifier. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 602dadaa81d86..ce8e9d0a332bc 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -204,9 +204,9 @@ that the bridge device needs for its operation. Several functions are available
 to add subdevice descriptors to a notifier, depending on the type of device and
 the needs of the driver.
 
-:c:func:`v4l2_async_nf_add_fwnode_remote` and
-:c:func:`v4l2_async_nf_add_i2c` are for bridge and ISP drivers for
-registering their async sub-devices with the notifier.
+:c:func:`v4l2_async_nf_add_fwnode`, :c:func:`v4l2_async_nf_add_fwnode_remote`
+:c:and func:`v4l2_async_nf_add_i2c` are for registering their async sub-devices
+:c:with the notifier.
 
 :c:func:`v4l2_async_register_subdev_sensor` is a helper function for
 sensor drivers registering their own async sub-device, but it also registers a
-- 
2.30.2

