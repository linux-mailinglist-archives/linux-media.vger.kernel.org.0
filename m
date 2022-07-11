Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1003A56D7A4
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiGKIRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiGKIQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6134D1E3F6;
        Mon, 11 Jul 2022 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527411; x=1689063411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y1jhfsmxQKVxIp6rBu6QJpOOgTPsqtvWckn4ApHA2QY=;
  b=gbCnLx6t0BlthS5bNIchaHuWV4nPJJXu+xbpkGmaqJgFhL1xh51X1psc
   TaMt46vOFpZrC2clcuB2DJSgYRUVcfmO0wS61s/R3J5S1DVcL9DCf+WIB
   Ji8NEEmQtCtkmIBjRyWwrvNspSRBGmFIUGP0CHjNt+0oRTI2UCdXUT05D
   yXRpEpJ18htYTvd7Ganqtc8+ZAoJHUi+8utjZr5OjHBTOnpQIWKincZL5
   x/P996xGTgRtA4jyTE2j9CwZ/cGIt58AC8RQDtHjDKYV7kQyBfUPqC+ZU
   l8kqaqAa9sooYFIx619te0MjB6E1OsbmLgkJMA/K2OKgcQsmkmu00kEEx
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967083"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Jul 2022 10:16:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Jul 2022 10:16:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527403; x=1689063403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y1jhfsmxQKVxIp6rBu6QJpOOgTPsqtvWckn4ApHA2QY=;
  b=TYOqv9h3JjDspPKIFY3t5fMQQjwSV6A25pp9vxhbUmRu7XjW7EdYJCey
   /c6E9GFmkjDpe2Y3Nq5qJS9yphuRHLU05D1zknMZjrtYP4WN77bgQ8iHs
   upMWquS49ADKndvPZHno0CRBtzBjfEfnCFmdIo5P70d9ZnOUZR2suNzcS
   T4308nDypjQZ3K+Yc6ITa57WVm9wwQnW1TF/KCIjDmWV8QJ7PkSMmQxkA
   LwtBWmTi0yrzKHP2G5AUPR4iP5+lngV1KZzoIvO9m1ueDw+OorKlwH7vf
   DG40QSECNce8Mbj+E+W/Ji/92iI8w7BkHiqstmTEdxHy7G/+AmIfKKCki
   g==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967081"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 92E5928007C;
        Mon, 11 Jul 2022 10:16:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/6] media: i2c: ov9282: Fix device detection
Date:   Mon, 11 Jul 2022 10:16:39 +0200
Message-Id: <20220711081639.150153-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
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
Instead two a 1 byte reads to combine the result.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/ov9282.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c3faf11a99b5..c507d9d4531a 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -761,11 +761,16 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov9282_detect(struct ov9282 *ov9282)
 {
 	int ret;
+	u32 id[2];
 	u32 val;
 
-	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
-	if (ret)
-		return ret;
+	ret = ov9282_read_reg(ov9282, OV9282_REG_ID + 1,
+			      1, &id[1]);
+	if (!ret)
+		ret = ov9282_read_reg(ov9282, OV9282_REG_ID,
+				      1, &id[0]);
+	val = id[1];
+	val |= (id[0] << 8);
 
 	if (val != OV9282_ID) {
 		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
-- 
2.25.1

