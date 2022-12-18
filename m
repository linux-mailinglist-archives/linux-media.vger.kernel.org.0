Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EA96502B6
	for <lists+linux-media@lfdr.de>; Sun, 18 Dec 2022 17:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbiLRQvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Dec 2022 11:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiLRQvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Dec 2022 11:51:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2120619C07;
        Sun, 18 Dec 2022 08:18:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE08560DCC;
        Sun, 18 Dec 2022 16:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6D3C433D2;
        Sun, 18 Dec 2022 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671380280;
        bh=mvMMLmvxlfsWFgwEr+ZHtBmL6gLBDdJIqM9J7cHhbW0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jOTMx+n2349x/Q6HK64LoDnPm6Z9bKNdvXHCHzkz7aGl0t8dlbfxOT99XeAmhmSqw
         6PUYJnxQ+98+Epb/d16+qZOAPwCY3RBJn0TpNgpItz6HqjYNKVknlO0TAvJmSKsvgr
         nVIRD23tKmuKlnIjiu5elB/I8d1116P5g/7ciVTK3RUpo6Y1Bd8fw3RcZyb+sbAxeT
         2bR6JVJqM1PxFDvsYlIBtlFlpEr0qeFb4OYqk3H0yWpVls9zPbioKIIPCt33vbX44K
         l1tCy0QK2id6Us4zGGM1wH8bB/zb9iaQI8moFLRgOr825BevSGUjmUpmolinKoRgt/
         O9Ky8R2BRTW3Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yan Lei <yan_lei@dahuatech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 30/39] media: dvb-frontends: fix leak of memory fw
Date:   Sun, 18 Dec 2022 11:15:50 -0500
Message-Id: <20221218161559.932604-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161559.932604-1-sashal@kernel.org>
References: <20221218161559.932604-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yan Lei <yan_lei@dahuatech.com>

[ Upstream commit a15fe8d9f1bf460a804bcf18a890bfd2cf0d5caa ]

Link: https://lore.kernel.org/linux-media/20220410061925.4107-1-chinayanlei2002@163.com
Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/dvb-frontends/bcm3510.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index da0ff7b44da4..68b92b4419cf 100644
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -649,6 +649,7 @@ static int bcm3510_download_firmware(struct dvb_frontend* fe)
 		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04zx\n",addr,len,fw->size);
 		if ((ret = bcm3510_write_ram(st,addr,&b[i+4],len)) < 0) {
 			err("firmware download failed: %d\n",ret);
+			release_firmware(fw);
 			return ret;
 		}
 		i += 4 + len;
-- 
2.35.1

