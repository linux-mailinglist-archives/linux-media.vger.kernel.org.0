Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3282756D799
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiGKIQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiGKIQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74981E3E9;
        Mon, 11 Jul 2022 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527410; x=1689063410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5sXjuleYa2Wf1ygagT2cNefKIkNKtXeK00Li8tFYqJ8=;
  b=SBuJBGA7yd0IcM6xaBwIFoqvHwjissZdpNlkEBBKNuUrUj54WBYFa+X8
   OR0XNPrKDoxPK8JHx2GcXrIPP7bUqCET21eUpYA5BK8vXtCZNzudexxX1
   s6oQyiRybz6mcxBGaCwQ0qfbr6NIM1cTQT+UA73ukPSBD2ebkgWfb/u8p
   5x/Xua3qVcGY4SlyDg66xa6HQK4LJQzIbrlu7XJjfq1LjeR6qxkycan6+
   LTg+HLK/IxgM2dDP9rpFQaH4e+eL0Rz6RVDVYOdZwF7ZkRfPFIXDoA/Ri
   fuH7umxu16u4/Lh1w6sqFlUDyELpyYwH3r0syow6qMwSqCTeB2PK8kFDf
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967075"
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
  bh=5sXjuleYa2Wf1ygagT2cNefKIkNKtXeK00Li8tFYqJ8=;
  b=AvBEZP/m79nbPYH+kASFcZW5b+zSVRDzBOZ52J6/ci275Lh2LWc9bem6
   R8nHSCk8tNgX44Z5M4joOGPNFfpHSg0zo0AkDN4THuAulXLyTr+FFopFC
   xciaXtx2UzhJlwWfeV/5tWt5n/dydK63u/Q+9w7Z75ixmRvrDcLUqYDcZ
   c98UqQP1NAZX5oodLxWWI7gN0wF7tEOURGJgap0LPWPGF+jikwc3d9k1u
   u6v5i3dMo2GMaewTaH0xtPEEiqnPhzi0881F60/yTzENHqLIkd4c++Zp9
   8yTOvDLmug2sZ6PZ+DhkoJmWMDNroGUBo3tqOTj8nId3t3IKc1xjXGzIW
   A==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967074"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0D3DC28007F;
        Mon, 11 Jul 2022 10:16:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/6] media: i2c: ov9282: Add ov9281 compatible
Date:   Mon, 11 Jul 2022 10:16:36 +0200
Message-Id: <20220711081639.150153-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to product brief they are identical from software point of view.
Differences are a different chief ray angle (CRA) and the package.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/ov9282.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 3269c1983bd5..04fda8222e07 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1114,6 +1114,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
 };
 
 static const struct of_device_id ov9282_of_match[] = {
+	{ .compatible = "ovti,ov9281" },
 	{ .compatible = "ovti,ov9282" },
 	{ }
 };
-- 
2.25.1

