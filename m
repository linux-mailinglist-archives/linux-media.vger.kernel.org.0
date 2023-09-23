Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A88B7AC325
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjIWPVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbjIWPVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC09192
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7903DC433C8;
        Sat, 23 Sep 2023 15:21:23 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCHv2 10/23] media: zoran: increase name size
Date:   Sat, 23 Sep 2023 17:20:54 +0200
Message-Id: <20230923152107.283289-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this compiler warning:

drivers/media/pci/zoran/zoran_card.c: In function 'zoran_probe':
drivers/media/pci/zoran/zoran_card.c:1316:62: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 0 and 31 [-Wformat-truncation=]
 1316 |         snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]",
      |                                                              ^~
drivers/media/pci/zoran/zoran_card.c:1316:58: note: directive argument in the range [0, 65535]
 1316 |         snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]",
      |                                                          ^~~~~~~~
drivers/media/pci/zoran/zoran_card.c:1316:9: note: 'snprintf' output between 4 and 39 bytes into a destination of size 32
 1316 |         snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1317 |                  zr->card.name, zr->id);
      |                  ~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/media/pci/zoran/zoran.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
index 56340553b282..1cd990468d3d 100644
--- a/drivers/media/pci/zoran/zoran.h
+++ b/drivers/media/pci/zoran/zoran.h
@@ -219,7 +219,7 @@ struct zoran {
 	const struct tvnorm *timing;
 
 	unsigned short id;	/* number of this device */
-	char name[32];		/* name of this device */
+	char name[40];		/* name of this device */
 	struct pci_dev *pci_dev;	/* PCI device */
 	unsigned char revision;	/* revision of zr36057 */
 	unsigned char __iomem *zr36057_mem;/* pointer to mapped IO memory */
-- 
2.40.1

