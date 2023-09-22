Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B267AB277
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 14:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbjIVM6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 08:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjIVM6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 08:58:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B778CE
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 05:58:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19DAC433C7;
        Fri, 22 Sep 2023 12:58:42 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/6] media: zoran: increase name size
Date:   Fri, 22 Sep 2023 14:58:34 +0200
Message-Id: <20230922125837.3290073-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
References: <20230922125837.3290073-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/pci/zoran/zoran.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
index efbb1466595f..1cd990468d3d 100644
--- a/drivers/media/pci/zoran/zoran.h
+++ b/drivers/media/pci/zoran/zoran.h
@@ -173,7 +173,7 @@ struct card_info {
 	int inputs;		/* number of video inputs */
 	struct input {
 		int muxsel;
-		char name[42];
+		char name[32];
 	} input[BUZ_MAX_INPUT];
 
 	v4l2_std_id norms;
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

