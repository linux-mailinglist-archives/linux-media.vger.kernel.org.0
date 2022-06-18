Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5D955074E
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbiFRWXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbiFRWXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:23:04 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83591127;
        Sat, 18 Jun 2022 15:23:03 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 84862802F2;
        Sun, 19 Jun 2022 00:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655590981;
        bh=2f/Vy8H8KrRMFojNWJEwbK4z4F9L0HVx73rd5ObdoLA=;
        h=From:To:Cc:Subject:Date:From;
        b=Pk0ElU8ldru0aNe7O+zYYS6m9k/D76XKaHkwEs4MhCgrlzYtK5mSd9RSLXtyJZCmL
         zg1d87I2uCi+kcovpMFhggOi51nTxP3S6y3SCvhGL/m5fHhMz5UZEGNrgIIkcPTJgI
         fwxKw5cibgzdH1pcDkvdBHYz/RA5axyqa7fSS7Xl1GKd4PFytB956Zbt1NOmZTuxZH
         I16DpfiIpPzNZAKc98S3zxgIFcmv1YFTvw5u2Nw6jGGdFnTndPubrwrpJT1qLIh9n+
         Or7nBiRFjF8SVkJnLhjQRp6345/DsF+0xjRbWG0LsT4lTNJ8iG6JckG0tGLjtz7d1K
         kZSr2BNrYvuUQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] media: dt-bindings: mt9p031: Add MT9P006 compatible string
Date:   Sun, 19 Jun 2022 00:22:54 +0200
Message-Id: <20220618222255.478165-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatible for MT9P006 sensor, which is older variant of MT9P031
and compatible with this driver.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
index c2ba78116dbbd..1d6af1bf9a6b6 100644
--- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - aptina,mt9p006
       - aptina,mt9p031
       - aptina,mt9p031m
 
-- 
2.35.1

