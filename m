Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1400457E22F
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiGVNT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiGVNT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:19:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9373AA0B90;
        Fri, 22 Jul 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495996; x=1690031996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jHGCy+LY2xn86PxwDOHDZMu5ODeZxv+Kr+sz0BLuCiI=;
  b=LztSgfjlje+c/MwBn01HdGchgDuLnzMzI0NQIu0/c6AAnnhJQuk+ZF9f
   5h17qs1TGo5Htqty6PNpUk313ydOntiDKzvKRazyD9CHJU7HRMh01weHu
   x6pCVRS1Fuda4uqm6eEwI3yOQQxXFgoJYbix2mYlIF5v2cpK4fcClrSI9
   uNrJhX5/4EqWJr/kvkKEjCaMcgSta2T+mfWH2BcoU94cks/ts135G02M8
   F0bXu03nMiTRXsLOKwqrPTd1CR7AD3w/ZRF6q68/b7bJtQ6L7lzx4C2hm
   o+48zFC7qkRXcAfYVSa6TA8C2WexK48rXviy45cuooqEGcVlFSdYagKhf
   w==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212300"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 15:19:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 15:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495992; x=1690031992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jHGCy+LY2xn86PxwDOHDZMu5ODeZxv+Kr+sz0BLuCiI=;
  b=AtfbV9b7E7p4u1IBRnQnQi2MnluNE7YV6UV+6HDLPOxaX3hU8n0cSzN5
   pY41mG33l4L+0299+9iXzJCK/ftG4rn9uet9DQqay4cSAQvBIjig7eA8t
   exYcTcVa7Vu8aOFaWNLrHt2txSU3z53C/OmlfBHOB0qEN4Jy2aIGxZXFl
   qBIHv1S4DsdxGeHbWJYLtezcfUs3Mqd0Pp2w0ZkG1968NI1FWMkWjLj6L
   VJn7RmkcHm65pbRdCxyqTlyUm8J6KE4S6RM01wi5n558cR0s43sjWWgNi
   iCsKkMDRG78KxWzLbZRDS9KE9MMThhgMJel7CxUQu+k2IO7IdAr7b9oye
   g==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212298"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2B970280072;
        Fri, 22 Jul 2022 15:19:52 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v3 1/7] media: i2c: ov9282: remove unused and unset i2c_client member
Date:   Fri, 22 Jul 2022 15:19:41 +0200
Message-Id: <20220722131947.2456988-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
References: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
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
index 2e0b315801e5..8a252bf3b59f 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -104,7 +104,6 @@ struct ov9282_mode {
 /**
  * struct ov9282 - ov9282 sensor device structure
  * @dev: Pointer to generic device
- * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
@@ -123,7 +122,6 @@ struct ov9282_mode {
  */
 struct ov9282 {
 	struct device *dev;
-	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
-- 
2.25.1

