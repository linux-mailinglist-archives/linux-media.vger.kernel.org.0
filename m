Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E810264B6CE
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 15:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbiLMOHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 09:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235311AbiLMOHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 09:07:39 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A356AA47D
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 06:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670940455; x=1702476455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oC3Ksikt5vAf8s4ZGCjTauJgtTnUtb129cwT9cD2DSY=;
  b=Ugw2jtNuPcH7b1WRrk0ew7dBlxaXhtZjcYeRBggeWeIQSJuwxkbajkS1
   IdKELtj4P42LAnpdHCzl5UJrE5zpsqh8VU6bc+QbTg2hF2el+krBnTPDV
   wG+Qj6ZiCY0vFjUI1a5TxLY66XVj5pwI7T4as1mFjly03wJoWI+/Hbx6u
   Q/hGHUDEMwfNlooZ1DGnSf3JhmBudCuVXyJm+vpqGjQv5pNEb1AbMntCU
   4Hhy+wHo2iAWutSX1K7eZ3mqPwRNgHrf3y5W9nc2AebTipeDOLduDoHC7
   yFnbxQTwB7O1kABZO9aXNJhGPnGmoGYBixB4S78dFOpfvZMxTJsJroP7Y
   w==;
X-IronPort-AV: E=Sophos;i="5.96,241,1665439200"; 
   d="scan'208";a="27925180"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2022 15:07:33 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 13 Dec 2022 15:07:33 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 13 Dec 2022 15:07:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670940453; x=1702476453;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oC3Ksikt5vAf8s4ZGCjTauJgtTnUtb129cwT9cD2DSY=;
  b=eV4023/xK1/r9iB8m9RKxPFXXuH1F1tUTIwO1VSlGJnH5pxXXV0ROE1F
   KsjP6E51koi01o2fdNUqEYrqjQwtzYjk9dGLRLeDyKCJoQ785Q5dRb8Ci
   iBwY9BVhooh+2dUTFDAqFhin69589qbaqnnb6gPi2Gk5uYw41AbDfG+f0
   MzW8Ri9ghKMHwykLVq8yp9kOCL03EvPQXYQofYRgivdd2lCuJ+rYACkZa
   mPVzXwZTxZQu0va3OJocexiT9g80G2ZCXBAbSzhbPI7jUf8Pyyfr8Uvf0
   tBZaPI2uqSqU8LKAAdvs31TRMwBQEsn2GgArXuvDxeMpdV5X/bB9mOt0i
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,241,1665439200"; 
   d="scan'208";a="27925179"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Dec 2022 15:07:33 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9EAB6280071;
        Tue, 13 Dec 2022 15:07:33 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov9282: remove unused and unset i2c_client member
Date:   Tue, 13 Dec 2022 15:07:26 +0100
Message-Id: <20221213140727.414976-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is not need anyway as the i2c_client is stored in v4l2_subdev.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/i2c/ov9282.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 37a55d53af56..8216644494bb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -148,7 +148,6 @@ struct ov9282_mode {
 /**
  * struct ov9282 - ov9282 sensor device structure
  * @dev: Pointer to generic device
- * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
@@ -170,7 +169,6 @@ struct ov9282_mode {
  */
 struct ov9282 {
 	struct device *dev;
-	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
-- 
2.34.1

