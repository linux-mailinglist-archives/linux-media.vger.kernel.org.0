Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775047AC32C
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjIWPVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbjIWPVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443B7196
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F03C433CA;
        Sat, 23 Sep 2023 15:21:32 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCHv2 17/23] media: rcar_drif: use explicit name for bus_info
Date:   Sat, 23 Sep 2023 17:21:01 +0200
Message-Id: <20230923152107.283289-18-hverkuil-cisco@xs4all.nl>
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

drivers/media/platform/renesas/rcar_drif.c: In function 'rcar_drif_querycap':
drivers/media/platform/renesas/rcar_drif.c:874:66: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 23 [-Wformat-truncation=]
  874 |         snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
      |                                                                  ^~
drivers/media/platform/renesas/rcar_drif.c:874:9: note: 'snprintf' output between 10 and 73 bytes into a destination of size 32
  874 |         snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  875 |                  sdr->vdev->name);
      |                  ~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 163a4ba61c17..292c5bf9e50c 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -871,8 +871,7 @@ static int rcar_drif_querycap(struct file *file, void *fh,
 
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, sdr->vdev->name, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
-		 sdr->vdev->name);
+	strscpy(cap->bus_info, "platform:R-Car DRIF", sizeof(cap->bus_info));
 
 	return 0;
 }
-- 
2.40.1

