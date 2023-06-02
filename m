Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62AE72031A
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbjFBNU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbjFBNU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:20:28 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6C399
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685712027; x=1717248027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ScYXZEztbqZPoKmtCB9kK5Onetw9ugQv/lJUHQ22iJE=;
  b=d5pkMZMwL83NTNbyRqTLt6OiO5CIFdUgjp5JoJ1ZKy1mIs2nyFcs29WC
   qGjUzeLsfpJtfxTT/AC5kciSqafiuJMS9hmZXvJLDFHNFLD3NzN2W821P
   ZzoJ8xExHfDwNTFn6oXbgxwc55KhrpQKXSoh/s9fXZd0vJKGq5sY9RLAr
   0cfLMq9/fj+0FRHq1Sc6qQIicvtX5TeZeEKvhnk2B22rioz0cAFaxEupW
   r356EvaNapTeiB0T0lCn0hCsLOyuKAdHgW6f4is4xFJjsctlnKkfg1x4Z
   B19yE9ekVYqA3qGHtIsRkcu0M4i7MaVNipqVg0G+9Mq15v2i8McNkWfMT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419396496"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="419396496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 06:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="954493536"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="954493536"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 06:20:09 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id F1160120C62;
        Fri,  2 Jun 2023 16:20:06 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q54gk-00E72V-18; Fri, 02 Jun 2023 16:19:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH 1/1] Revert "media: uvcvideo: Limit power line control for Acer EasyCamera"
Date:   Fri,  2 Jun 2023 16:19:19 +0300
Message-Id: <20230602131919.3363606-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 5dd0eab84ae9a4b292baf1ad02e1a273c475cd04.

Revert this patch as it has been merged twice. The earlier merged commit
is 81e78a6fc320 ("media: uvcvideo: Limit power line control for Acer
EasyCamera").

Reported-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7aefa76a42b31..42ff9795f7000 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2997,15 +2997,6 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Acer EasyCamera */
-	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
-				| USB_DEVICE_ID_MATCH_INT_INFO,
-	  .idVendor		= 0x5986,
-	  .idProduct		= 0x1180,
-	  .bInterfaceClass	= USB_CLASS_VIDEO,
-	  .bInterfaceSubClass	= 1,
-	  .bInterfaceProtocol	= 0,
-	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
-	/* Acer EasyCamera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x5986,
-- 
2.30.2

