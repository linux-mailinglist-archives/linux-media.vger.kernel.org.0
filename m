Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91491537FDC
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 16:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbiE3OMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 10:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239645AbiE3OJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 10:09:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5165CD412C;
        Mon, 30 May 2022 06:42:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1127960FCE;
        Mon, 30 May 2022 13:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B093C341C7;
        Mon, 30 May 2022 13:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653918151;
        bh=oaBZL2hyxhd+UZS2DfdlG+V550ec/cUrVqckFsJQhfk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LxG/UiuPB4HmXiu8d65JcPcgoC9d045mRkHNYY+JByW8wO+YzRxJgJBoIlC5X6tuT
         mkzoOoDBL/uC1WlAwrgzEspi5HcXEmJ7Tc3pTal5sTGzcb9vmdN2Iz4SLhoKX8n+Q7
         7pCCs8G+O+ovcvGFh2TXqolyCddAAZBKmKPH2tOPbD9kE2FpzZ6mtVdPH7Dm5sVFwH
         sikIYOcZkxM/zuPbpECp6sv0gX93GHs5jpjYhjl7uHV3f+OcAVTV6Suvu+miyVfxuF
         mZ7IfLsb4Fpifcc27QmkSm/iYtHRFC8vZkzjQ7QfJnkstxzTUZx0ygy4dn/IIXGVTi
         snGxgOwUIGMlg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 079/109] media: ccs-core.c: fix failure to call clk_disable_unprepare
Date:   Mon, 30 May 2022 09:37:55 -0400
Message-Id: <20220530133825.1933431-79-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit eca89cf60b040ee2cae693ea72a0364284f3084c ]

Fixes smatch warning:

drivers/media/i2c/ccs/ccs-core.c:1676 ccs_power_on() warn: 'sensor->ext_clk' from clk_prepare_enable() not released on lines: 1606.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5363f3bcafe3..67bb770ed63f 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1603,8 +1603,11 @@ static int ccs_power_on(struct device *dev)
 			usleep_range(1000, 2000);
 		} while (--retry);
 
-		if (!reset)
-			return -EIO;
+		if (!reset) {
+			dev_err(dev, "software reset failed\n");
+			rval = -EIO;
+			goto out_cci_addr_fail;
+		}
 	}
 
 	if (sensor->hwcfg.i2c_addr_alt) {
-- 
2.35.1

