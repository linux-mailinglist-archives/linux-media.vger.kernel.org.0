Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487A05BD70E
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 00:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiISWPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 18:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiISWPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 18:15:45 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1083240E07
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663625737; x=1695161737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tVWil91x3bf+V/A/4liifEaa3cpR46wCk52rIRWOWrk=;
  b=lQXKzaYRvLyayg1sZWzStKKADUr34vWTtEoG78HCNPXibjNBGCK2jLZq
   Zf0DF48y4pknokXDzwhXFfVM/Y/EXOtEmLbYPyfr7tpq85uibB4jxbnMH
   o5FRLmYKZNfls4xR02IJqZ5Hxy8fke74LJ8IVPQQR9cOre9FTSNqPEugx
   RnVbgcBxWsPF3BPcpjNiy1jf3vNJCzMjfCwuDMrcGc7gLVzk65JyiU63L
   jBhcyoCIUBw87U7w4tHLbpkUuutV2r1CDBDYV8N43k3vovJCjnQ1VrJH0
   0j/THvbtNNYJm5flApLwBpB1kaSBwWLCLo0HcLD7SHpj2NX9UWe93O2D8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286582709"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="286582709"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 15:15:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="681031125"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 15:15:34 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id DC25C20078;
        Tue, 20 Sep 2022 01:15:31 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oaP4D-00Fwqz-QT; Tue, 20 Sep 2022 01:16:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/1] media: v4l: subdev: Document s_power() callback is deprecated
Date:   Tue, 20 Sep 2022 01:16:41 +0300
Message-Id: <20220919221641.3801108-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Runtime PM has been around for a decade or more, there's hardly a need to
use the V4L2 specific s_power() callback in drivers anymore. Document this
in s_power() callback documentation as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f80c9c818ed0..54566d139da79 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -176,7 +176,10 @@ struct v4l2_subdev_io_pin_config {
  * @s_register: callback for VIDIOC_DBG_S_REGISTER() ioctl handler code.
  *
  * @s_power: puts subdevice in power saving mode (on == 0) or normal operation
- *	mode (on == 1).
+ *	mode (on == 1). DEPRECATED. See
+ *	Documentation/driver-api/media/camera-sensor.rst . pre_streamon and
+ *	post_streamoff callbacks can be used for e.g. setting the bus to LP-11
+ *	mode before s_stream is called.
  *
  * @interrupt_service_routine: Called by the bridge chip's interrupt service
  *	handler, when an interrupt status has be raised due to this subdev,
-- 
2.30.2

