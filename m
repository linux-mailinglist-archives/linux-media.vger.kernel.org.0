Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCEA9687095
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjBAVp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjBAVpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:54 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9AA68125
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287951; x=1706823951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2xDNdTCMUoHegNKMckUQwqDHHiguGCguDjb+JObCnlM=;
  b=A6RrZIaG1jWK6VCVTdHYdOweDFZXiUnR3GDjCla/ieW/olGvr58Oexat
   DVkkSwbRlGXw3ldBk7VSzynjLC8x3/MMnd/h2LJtGsgUpAx+woHqiwY62
   D5CvgmdAny8URVeMNUb5rJDScClDfJT13AkACPnd6zi71+JN705Evc2i3
   R0KBrQ6392N9+a/5JWwIlTpg8/bcpJ+jnMKlNnGI5c5+W5p4RxuQeq572
   +qXJGyaPdw6PeCy5ommMrWtITkCGMdQ6GQ/Y+CePMy4UMQivmgX11/YzL
   Dtx80uVIkxwZgs4/Gu9Wu7lXfuyQMA0hicq72IeLqki5Qq//H67itefDD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415636"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415636"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527305"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527305"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:46 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AA41F122774;
        Wed,  1 Feb 2023 23:45:43 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 09/26] media: Do not call cdev_device_del() if cdev_device_add() fails
Date:   Wed,  1 Feb 2023 23:45:18 +0200
Message-Id: <20230201214535.347075-10-sakari.ailus@linux.intel.com>
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

cdev_device_del() is the right function to remove a device when
cdev_device_add() succeeds. If it does not, however, put_device() needs to
be used instead. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index ce93ab9be676..7e22938dfd81 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -254,7 +254,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
-	cdev_device_del(&devnode->cdev, &devnode->dev);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
 
-- 
2.30.2

