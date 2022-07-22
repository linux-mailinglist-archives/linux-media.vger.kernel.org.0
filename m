Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0DA57E239
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbiGVNUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234763AbiGVNUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:20:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B01A0B90;
        Fri, 22 Jul 2022 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495999; x=1690031999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mo4CG3rrxyUa5AtMRikbley8JX0pQHZDQRhOhS6nJfI=;
  b=PjbgtDO+k5Y+2UEnZhO/kdiDYkY74rhO/FQq1CHOcJNQTuotz8XsMvfl
   z2C7NDCeVSG6Dq3qpGvXR0OmT5/Ilb3e6/46fNXfbcQDXXRl6rLPcsOW0
   V3wLhetyMJjU5/BTM7rPuZwnNHpecg4Njy9IfiYtNpypmJwZmpItqa90k
   maR1y16Aqz6uL9QajD2knIzrN1RNkN3SYV4tUYRqiVKvf/fKeVYQEsRyB
   AVHknoFrledzCxAmc796NtKO8iI0F/wNvd+HqEXsOS4iQzffBqyc+Vs3t
   xlyB0H86hF+/51Te1gllCwVBsUJdp9LQgegdMG5tH/GS2NxPn1PmT0uAD
   w==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212310"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 15:19:53 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 15:19:53 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 15:19:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495993; x=1690031993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mo4CG3rrxyUa5AtMRikbley8JX0pQHZDQRhOhS6nJfI=;
  b=BGfY63xFf5eoPLoq7w3Kj/ac9oycBMH9XdGrrHYRlldT0+c53tIigO1M
   JkD3RKnwst1pQ9ngZgvvZDIl9j4nvKgkqa9zi/TVaRaX7klpmEuslXy+y
   gG9y8C0mRhJiWiBFBrc0zkPqSYB2sQkE53N2cbYNxKd4UgwBXssf4ouhI
   s+9twrKSaaC9T6kuLztyBEJGU+28TxdWBRGbPU1C+eTu2GpHfvC4MCq12
   tRdgZ766B/ui0i2FsP5hxKPAfoGMMzuOBon1ZSC+/xVKjs/wpm2w+yoaR
   hvBJCBsxXbHX5ElmrVFG5/t0TieRG/xKIeesrGP5ou4uWn/mX8GXRsaoJ
   A==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212309"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 15:19:53 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1FB60280056;
        Fri, 22 Jul 2022 15:19:53 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v3 6/7] media: i2c: ov9282: Set v4l2 subdev name according to sensor model
Date:   Fri, 22 Jul 2022 15:19:46 +0200
Message-Id: <20220722131947.2456988-7-alexander.stein@ew.tq-group.com>
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

To distinguish ov9281 & ov9282 the name has to be explicitly set.
i2c_client already has the name parsed from the compatible.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/ov9282.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 352dbe21a902..dbc0a4cd060f 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1047,6 +1047,7 @@ static int ov9282_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
+	v4l2_i2c_subdev_set_name(&ov9282->sd, client, client->name, NULL);
 
 	ret = ov9282_parse_hw_config(ov9282);
 	if (ret) {
-- 
2.25.1

