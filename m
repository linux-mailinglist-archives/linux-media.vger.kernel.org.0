Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCEC768709E
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjBAVqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjBAVqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:06 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E62568126
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287964; x=1706823964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C7ojklwdsw9pyjTRpLRjwb/ybwVkxHASBuJm5fS+J7Y=;
  b=iuL6okoDCnhBNNhpqne4n5tQMfYZLSFL8Vxn9JDmsuRyyJh2Mw3ItSl7
   VkfWsaqVRBeKS6gKmw6eCkjxZ4XAAdUCaViXMbR3W+kd09PbUsW0iaaIz
   5lfCmwuJXlTaM6bkgITmLHwqZ8fMcZQuauPBFc6GbV4LFImSMKO9Nt48D
   Oi5S8oFeqhkunQmQTTMJs8FU6Q9axe7iA23hJjRDXPWGNDyg9aHazAL+P
   WwMczKXax1HbDnCZIWbTicK5kbQPb1cbfJ12UuNoUeD4Zgmr6COe2pCjC
   Wyqhdxp8qhe6uimw9xbhpIokod18PV2jt/Ym7rathpEf9dmloW7RwM81q
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415675"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415675"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527321"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527321"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:53 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D14A2120339;
        Wed,  1 Feb 2023 23:45:50 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 19/26] media: Add nop implementations of media_device_{init,cleanup}
Date:   Wed,  1 Feb 2023 23:45:28 +0200
Message-Id: <20230201214535.347075-20-sakari.ailus@linux.intel.com>
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

To support compliation with Media controller disabled, drivers were
required to conditionally call media_device_init and media_device_cleanup.
Add nop implementations of both so drivers don't need to care (or at least
care less).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/media-device.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/media/media-device.h b/include/media/media-device.h
index 7e8bca6756ba..780440bbb39d 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -460,6 +460,11 @@ void __media_device_usb_init(struct media_device *mdev,
 #else
 #define media_device_get(mdev) do { } while (0)
 #define media_device_put(mdev) do { } while (0)
+
+static inline void media_device_init(struct media_device *mdev)
+{
+}
+
 static inline int media_device_register(struct media_device *mdev)
 {
 	return 0;
@@ -467,6 +472,11 @@ static inline int media_device_register(struct media_device *mdev)
 static inline void media_device_unregister(struct media_device *mdev)
 {
 }
+
+static inline void media_device_cleanup(struct media_device *mdev)
+{
+}
+
 static inline int media_device_register_entity(struct media_device *mdev,
 						struct media_entity *entity)
 {
-- 
2.30.2

