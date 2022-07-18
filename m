Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B6578173
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 14:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbiGRMCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 08:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGRMCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 08:02:04 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2D6237DA
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658145722; x=1689681722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xNulvs1wv5rnCJpWKZT9mtEE+0O2+IjLAfSUhmXwdQI=;
  b=NwPe8qCNCdIRkTXOIgei7We0dUHnKcVtimRc5T06rymkB0q272NRE85P
   Sd2A5ES9y2n5u42gwTSw4bXX/mxAkdlrohS4g+OECkQF6MWZuUxhhYmOq
   QghCFlfwQ3wHr+JIKruAFOy/A9XRjEvjPPcaPmBBSRkoFoOm/7T7Y1Qgy
   cV8ki1MGgFZxz8iWb4xBnwbNlR32csnttptyj1Z38+80aLuZV+W5/bNFu
   w6zN95DE03sK1M2uJNAghntfkfKqz1Sfr7oJ5hUn95LZ8SziXOfiAZhz3
   KDjXI0V4uwopxv1Gi5r5FWJFV/G+n88Js6L5jZGNx++XqEJQ9u66QuQrV
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650924000"; 
   d="scan'208";a="25107010"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jul 2022 14:01:58 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 18 Jul 2022 14:01:59 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 18 Jul 2022 14:01:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658145719; x=1689681719;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xNulvs1wv5rnCJpWKZT9mtEE+0O2+IjLAfSUhmXwdQI=;
  b=B11WtN2gqGGyb07DC+ZW8KiBhI0h5vWqFrofl8WR99McMj4vFowlAK23
   p+pxJ+1o9M3BKEYq8KXLZJC1GBE5H49I60HG+wzFWvXkXEkJ3D1IaNLei
   +0IJE+G3NLiBL79MlVlW+e52M9BlPWt/C2OHPBZNyVVgZxROB8kycXDOC
   8tZ3jjVpODO+QZEugDYo50PXXCorv1+sERLTFg1etzgDVPJIpaF5050Se
   7wu470DSObTACBKbJV1EXuogZondYJpKtTHSQxD3whJXJNAayB8/uEv4l
   0sEEmg1uIqieSnsa7VMHNsZbQX6kkaKJLS8B/5HVa+YuJljDnuJ/3HxZO
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650924000"; 
   d="scan'208";a="25107005"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jul 2022 14:01:55 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7BAF1280056;
        Mon, 18 Jul 2022 14:01:56 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: v4l2-core: v4l2-i2c: Fix default device name
Date:   Mon, 18 Jul 2022 14:01:51 +0200
Message-Id: <20220718120151.425388-1-alexander.stein@ew.tq-group.com>
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

Documentation to v4l2_i2c_subdev_set_name says I²C device name if
devname parameter is NULL. But instead the I²C driver name is assigned.
Fix this by actually using the i2c_client->name for the subdev name.

Fixes: 0658293012af ("media: v4l: subdev: Add a function to set an I²C sub-device's name")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Having a sensor node in DT with compatible = "ovti,ov9281" the subdev
name is "ov9282" without this patch. With this patch applied it is
"ov9281". The i2c_client->name is "ov9281" in every case.

 drivers/media/v4l2-core/v4l2-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index b4acca75644b..90c3c799317a 100644
--- a/drivers/media/v4l2-core/v4l2-i2c.c
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -33,7 +33,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd,
 			      const char *devname, const char *postfix)
 {
 	if (!devname)
-		devname = client->dev.driver->name;
+		devname = client->name;
 	if (!postfix)
 		postfix = "";
 
-- 
2.25.1

