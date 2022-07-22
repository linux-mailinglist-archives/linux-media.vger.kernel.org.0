Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B5357DAA5
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 09:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbiGVHLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 03:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiGVHLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 03:11:42 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B40D8E6CA
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658473901; x=1690009901;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7zCtWE10+1Xk0BjCdjGMhD01jHcSjnxHEQ7JJEkUn4Q=;
  b=Z4my6Ocz45zqM65D1Jggfm2u1C4wL+QjrKzhF6QvMPQXe0YfQGpGZ5Kj
   ZcOnrDRN+RQx/J6hmv+zQWguMbafV0jCFwFf0rYa7jSyPWgZvDY5EYYqM
   Cjmxpv63Ilc0qvOjOTnwI+Lm+IfVCBgvt6IdwYOlGlyBe0gPv57OD15Mg
   iFBdzt1CfbCosI0nZN6ZF8I4gAYBAkunlAJOpFkPavEXSAQD+k++1vS7z
   VjNZL2W5MamS30amxATr+wuz3T5j4sJRQMsZFo6p//Jze7r09AYSfs50l
   69oq0F8E2RoPP44pV7ijQu/q+t6XSaOc3/ugwYcfuxoqUah82gttM+X5U
   w==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25201455"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 09:11:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 09:11:39 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 09:11:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658473899; x=1690009899;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7zCtWE10+1Xk0BjCdjGMhD01jHcSjnxHEQ7JJEkUn4Q=;
  b=G05oUu6Kc6IIVKFoBPh5dock0BU0l1ChdOAATH4dnlvXAScjhaOtrSlJ
   hqIgXi9fAh2Uc7zvly8mxZOEaHaatuZSrEaSd2xVCH6ow3srME9uzr7Tf
   dmTfWFXUQu+agFCYVKK+Jn2k6cVvLSKJKMHkpyNstfYLkEoUhM02aDim/
   J5cmSVDKN5UGpLuVB+qKRBw8kRAhX8ELvn8BgsIax94NrYCpvpHqKfrZ1
   2LA9JMHdUHX1sxLq0bLmbwJJDXP4tYrTyO2BTdlGpAcwm5le6zG6wDdZT
   CLxosQ5fy7ZQxWkE5MPCLK13oOp7NRn3CUSkEjYyKG0s1tbFZnFRIXNi1
   w==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25201453"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 09:11:38 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AFFB6280056;
        Fri, 22 Jul 2022 09:11:38 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: v4l2: Fix v4l2_i2c_subdev_set_name function documentation
Date:   Fri, 22 Jul 2022 09:11:31 +0200
Message-Id: <20220722071131.2022212-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The doc says the I²C device's name is used if devname is NULL, but
actually the I²C device driver's name is used.

Fixes commit 0658293012af ("media: v4l: subdev: Add a function to set an I²C sub-device's name")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Apparently you can't provide a proper device name in ACPI (see [1]), so
using the driver's name is reasonable. Adjust function documentation
accordingly.

[1] https://lore.kernel.org/all/YtpDp3ahpabQ1ubY@paasikivi.fi.intel.com/

 include/media/v4l2-common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index b708d63995f4..2ae2be4c87e5 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -175,7 +175,8 @@ struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
  *
  * @sd: pointer to &struct v4l2_subdev
  * @client: pointer to struct i2c_client
- * @devname: the name of the device; if NULL, the I²C device's name will be used
+ * @devname: the name of the device; if NULL, the I²C device drivers's name
+ *           will be used
  * @postfix: sub-device specific string to put right after the I²C device name;
  *	     may be NULL
  */
-- 
2.25.1

