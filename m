Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53B56870A6
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjBAVqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjBAVqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:17 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D46E68AC5
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287974; x=1706823974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lqsi/rnDTFrzfU792UxAlQWXSue9htTmfWVjdK5fprM=;
  b=UOAvqopeRDq/HxwyfNcaoCMdev04SP3ISSq+b17Ggr8+ydQDILU01cql
   ypjRy6vt2D2EKxr6ZOM+hPoLUgibNRQods5HOPdkohCifqRuloi6mHsuz
   2ouU0WiV5BMh7nuFQJ7Az3XozPv3CJPWns3JNcV+ka101vV8HoG/DqFqX
   SVjDBudXgSZ/EorSCOqntMSIupLU829ATah3geqLzhcMyDNUjcyXwSt4n
   TMkikOY3b09qC5dw2RPrYkHm0aNYImhAtwODOsXXGHYog+ucdXav8HTNm
   AxWc/lqVOWBRs5eeCiFHW6RDpauxpu8dSAY2NaXuk9GVa+wxsSOLGtGwn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415709"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415709"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527337"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527337"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:58 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 07B7A12276E;
        Wed,  1 Feb 2023 23:45:55 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 26/26] media: Document how Media device resources are released
Date:   Wed,  1 Feb 2023 23:45:35 +0200
Message-Id: <20230201214535.347075-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that after unregistering, Media device memory resources are
released by the release() callback rather than by calling
media_device_cleanup().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/mc-core.rst | 12 ++++++++++--
 include/media/media-device.h               |  6 ++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 400b8ca29367..b5bebef40e56 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -46,8 +46,16 @@ Drivers initialise media device instances by calling
 :c:func:`media_device_init()`. After initialising a media device instance, it is
 registered by calling :c:func:`__media_device_register()` via the macro
 ``media_device_register()`` and unregistered by calling
-:c:func:`media_device_unregister()`. An initialised media device must be
-eventually cleaned up by calling :c:func:`media_device_cleanup()`.
+:c:func:`media_device_unregister()`. The resources of an unregistered media
+device will be released by the ``release()`` callback of :c:type:`media_device`
+ops, which will be called when the last user of the media device has released it
+calling :c:func:`media_device_put()`.
+
+The ``release()`` callback is the way all the resources of the media device are
+released once :c:func:`media_device_init()` has been called. This is also
+relevant during device driver's probe function as the ``release()`` callback
+will also have to be able to safely release the resources related to a partially
+initialised media device.
 
 Note that it is not allowed to unregister a media device instance that was not
 previously registered, or clean up a media device instance that was not
diff --git a/include/media/media-device.h b/include/media/media-device.h
index e363b4f3b01d..ca9a4d7272c0 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -257,8 +257,10 @@ void media_device_init(struct media_device *mdev);
  *
  * @mdev:	pointer to struct &media_device
  *
- * This function that will destroy the graph_mutex that is
- * initialized in media_device_init().
+ * This function that will destroy the graph_mutex that is initialized in
+ * media_device_init(). Note that *only* drivers that do not manage releasing
+ * the memory of th media device itself call this function. This function is
+ * thus effectively DEPRECATED.
  */
 void media_device_cleanup(struct media_device *mdev);
 
-- 
2.30.2

