Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534F65BC611
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 12:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiISKJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 06:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiISKJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 06:09:03 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865CF626C
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663582142; x=1695118142;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BePy/oT/R4Y9L2fTfuSUNp8grIxmPwZy19c5B5JXi/I=;
  b=Xg0gE6+3XVLUn04mG2J4U9W4WWuLIr8Re+ngxvo6AZHzZ/kjY0w1kWR1
   l9BRsGs2u2GpVbxa31orYEKUkahdyJnRRtQKS5owdzPRbVq4n0O8GCm54
   pulOF18Hfvs7IOzU+8z2Hd3bgGGvtNLptAsgI/oy8QDnr7QDqPoeOALoP
   5vw1KPGpYO1JiJhsMT+XIpvQ8Fn/QHrGO6uEYOFsCCjmse9s+VIt4UdqY
   1Jgq8/dY1gsNtPR7anvReqEtl4zNvo3ZtbSRMlIDHSULn+a/f8febyuEm
   cvCN4Tt5/IqHE803biJ9vI2zr1bVjWgdulzURXfSuqNSCWWZ7Lcpgujsx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="300731838"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="300731838"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 03:08:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="620799352"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 03:08:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0980A202D2;
        Mon, 19 Sep 2022 13:08:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oaDj2-00FwXZ-RA; Mon, 19 Sep 2022 13:10:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: v4l: subdev: Document s_power() callback is deprecated
Date:   Mon, 19 Sep 2022 13:10:04 +0300
Message-Id: <20220919101004.3799904-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Runtime PM has been around for a decade or more, there's hardly a need to
use the V4L2 specific s_power() callback in drivers anymore. Document this
in s_power() callback documentation as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 2f80c9c818ed0..ed14ce5864cac 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -176,7 +176,8 @@ struct v4l2_subdev_io_pin_config {
  * @s_register: callback for VIDIOC_DBG_S_REGISTER() ioctl handler code.
  *
  * @s_power: puts subdevice in power saving mode (on == 0) or normal operation
- *	mode (on == 1).
+ *	mode (on == 1). DEPRECATED. See
+ *	Documentation/driver-api/media/camera-sensor.rst .
  *
  * @interrupt_service_routine: Called by the bridge chip's interrupt service
  *	handler, when an interrupt status has be raised due to this subdev,
-- 
2.30.2

