Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4F471165D
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 21:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243309AbjEYS4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 14:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243376AbjEYSzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 14:55:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DB246B1;
        Thu, 25 May 2023 11:46:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5561864984;
        Thu, 25 May 2023 18:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E475C433D2;
        Thu, 25 May 2023 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685040272;
        bh=ZkvU5hdkKNo/JRI0K7PSraH3Ns56rSaCQAKgMTRCbEY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kzyvTNImHqARrKKp34IsWii8WnhcvBY8HHtMsdYU+aTsZCSpI0c+6cQT49ecbXEcG
         BYU8H2ONCmAgYANa921zQlknIoUv77bVHyQwZF2MgjZ2ba6l0hq1altSTLFrj4mZ5s
         JHcYAt0jcqHGUj7M4f7pXiB192vmISXLYPEWhLq4C6/LCjqw5MNu0OHsq0h7GrDTvV
         oWY5Vq1ast1ZbQ2wDqYF3UeBTV6CShZOGRvDhRNQD+hgTqtAM1YDuIyWvf+YN3i+9Z
         LvnimsMxkuIbDxYwaFwpLOEKUpqJfeZMwkCmY62mv8CLdbmCWJgEE25p5Nj9HgJ9IS
         QqnI1o8xcq97Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hyunwoo Kim <imv4bel@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/27] media: ttusb-dec: fix memory leak in ttusb_dec_exit_dvb()
Date:   Thu, 25 May 2023 14:43:39 -0400
Message-Id: <20230525184356.1974216-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525184356.1974216-1-sashal@kernel.org>
References: <20230525184356.1974216-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyunwoo Kim <imv4bel@gmail.com>

[ Upstream commit 517a281338322ff8293f988771c98aaa7205e457 ]

Since dvb_frontend_detach() is not called in ttusb_dec_exit_dvb(),
which is called when the device is disconnected, dvb_frontend_free()
is not finally called.

This causes a memory leak just by repeatedly plugging and
unplugging the device.

Fix this issue by adding dvb_frontend_detach() to ttusb_dec_exit_dvb().

Link: https://lore.kernel.org/linux-media/20221117045925.14297-5-imv4bel@gmail.com
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index f34efa7c61b40..c915e555897ba 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1561,8 +1561,7 @@ static void ttusb_dec_exit_dvb(struct ttusb_dec *dec)
 	dvb_dmx_release(&dec->demux);
 	if (dec->fe) {
 		dvb_unregister_frontend(dec->fe);
-		if (dec->fe->ops.release)
-			dec->fe->ops.release(dec->fe);
+		dvb_frontend_detach(dec->fe);
 	}
 	dvb_unregister_adapter(&dec->adapter);
 }
-- 
2.39.2

