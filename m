Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38AC57E234
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbiGVNUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbiGVNT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:19:59 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE4AA0B90;
        Fri, 22 Jul 2022 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495998; x=1690031998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G4u1tivvbK5IkZ2oQaHeT7PpCwIMbfiPJFHfYAMie1U=;
  b=DL2c5T+hFCoTl0NXCM0PLvuVulCKegLrvtmqbyD3a6in/RwDOb4I6MdU
   n/RMi+IgYVCCOPUdR1EbuIuupOrjj527lgqqncWOzQXMlEApjbwViLpzn
   tOtIXguWEppgkEqjxpVkrZYNA8uqTfcOlFM15z68RZEVpZ+mpHX51nK7F
   Jq9tieAn8GqE6fBO2R+wE0zTN6GUgT1aMOW+H2AgF4doEMnbL+Wg7gZwX
   jCLzOETSB/xmDyTOnRK7euJ8LPqXc9tkJDqTfVgga+LnU888DG2yki9SQ
   tDFoH6+OfCcSth8lbPunSyb3MOhecHnseDxsh0AE/ExXmFCtvKMtgE5Zl
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212304"
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
  bh=G4u1tivvbK5IkZ2oQaHeT7PpCwIMbfiPJFHfYAMie1U=;
  b=oVeexQxmLRgpZuggtpip9Xpn44ZfDT2/a1FWE75aHXY/X8Hl6GGzfwxo
   LF3z3b7QsC7lulNO2TjRkKQoeIDY5e4wWzoxIogUMOeSrF2sanm/yPuJ6
   nGp2TvPCNdEfBKHJtcMZN5Sh/JpkSfybLm7V4iPBwV5op4y8dHXwuMLCr
   OyLvP9opNMrMbFm3t90Xa3SkHa0ow07la+fykIl6Flcbhq3GI+SSXVCDQ
   oAIi/eAYWpnhBwUxo2Jna/rXugbOUwarrWYP366DBg/GlDHvu/MKeNcWM
   yVdWDN2wrcNIrXV9ASYoYkMLkXEIDD/FOgFBMN3KHPR4W6DqjkYvpb60E
   A==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212303"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 88B76280072;
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
Subject: [PATCH v3 3/7] media: i2c: ov9282: Add ov9281 compatible
Date:   Fri, 22 Jul 2022 15:19:43 +0200
Message-Id: <20220722131947.2456988-4-alexander.stein@ew.tq-group.com>
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

According to product brief they are identical from software point of view.
Differences are a different chief ray angle (CRA) and the package.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/i2c/ov9282.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8a252bf3b59f..c8d83a29f9bb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
 };
 
 static const struct of_device_id ov9282_of_match[] = {
+	{ .compatible = "ovti,ov9281" },
 	{ .compatible = "ovti,ov9282" },
 	{ }
 };
-- 
2.25.1

