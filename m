Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D986575CB1
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbiGOHtS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiGOHtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:11 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7DB26109;
        Fri, 15 Jul 2022 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871350; x=1689407350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/YwaUnYvtErt4hvGUG8S2dvqzopMiwsOQ51LI01u30=;
  b=EQmBjnCwodid8pP04xL4WupZN/pe8DI3/sOGoJX1x6O2UxfIKfM9zvHP
   E0xOPzkb0aWR5XQUxEVtc7yzUUP05ZQ8+tAErvGKuLqPzYdnH0AN1HPch
   E0/rx5spWomCITmGwAo/PjHsd5ZxU+HXSY91coVzX5w4W0/9CUJd/HgAt
   PZvJEXRL1pe+H43MFLPZBKdpNtaPb0YazG/7AgBSZWrg6sLwBrGBvqDEF
   TM7wdSjh1ysIxt+gmIp7p26gQvSA0IZPsfnN3YOeRX5Xm74bIagO85sps
   810J4ziohV4w2p5kPlM2ddyEUf6Hfsg+k9XiQkDpCMjF+lriHEnhGSt/2
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069093"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:49:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:49:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:49:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871345; x=1689407345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/YwaUnYvtErt4hvGUG8S2dvqzopMiwsOQ51LI01u30=;
  b=DhkAnUjmOOjcepAeVCGiV2H8oEMemHVpWqpFCr6i9B38l76zLLCVNtht
   OS/wVLIw9fDcAxbWk5g5eqZ00eb3faWV2n/qoyAyRSCuM3CgPQysPjmlH
   aOuWWRekMYCT1bf/gcNrhCv0IiBGPlZbLDII0Jvuo/rUp7h5XE8NlGsTL
   UaqW69pwiVFSeMeqJxHIhPnAZbE64RHVwYWO+/VD/x6PsKymKfkrYGYfy
   kDU+Wgy64awQq7P84aTcf/AG06dPnM8d1EdbTvIKc1sJ9Y3ihJCzZyex4
   D127Jxfg0Pmhnau+wrDaZyfmPl5FXzmneIOGRtUt69flWklz9QBBRv9E6
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069092"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:05 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F247A280056;
        Fri, 15 Jul 2022 09:49:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] media: i2c: ov9282: Fix device detection
Date:   Fri, 15 Jul 2022 09:48:58 +0200
Message-Id: <20220715074858.875808-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Apparently the Vision Components model (VC MIPI OV9281) does not support
address auto-increment, so probe fails with:
ov9282 2-0060: chip id mismatch: 9281!=92ff
Instead do two 1 byte reads and combine the result.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Fix commit message
* Add comment about prevented auto-increment
* Return early if reading ID register failed
* Reorder ID registers, smaller register number first

 drivers/media/i2c/ov9282.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 263cdffc558f..532791304c3d 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -761,11 +761,24 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov9282_detect(struct ov9282 *ov9282)
 {
 	int ret;
+	u32 id[2];
 	u32 val;
 
-	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
+	/*
+	 * Some vendors prevent auto-increment, so each register has to
+	 * be read separately
+	 */
+	ret = ov9282_read_reg(ov9282, OV9282_REG_ID,
+			      1, &id[0]);
 	if (ret)
 		return ret;
+	ret = ov9282_read_reg(ov9282, OV9282_REG_ID + 1,
+			      1, &id[1]);
+	if (ret)
+		return ret;
+
+	val = id[1];
+	val |= (id[0] << 8);
 
 	if (val != OV9282_ID) {
 		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
-- 
2.25.1

