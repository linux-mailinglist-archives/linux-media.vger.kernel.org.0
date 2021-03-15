Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC8233BE63
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 15:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhCOOqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 10:46:04 -0400
Received: from aibo.runbox.com ([91.220.196.211]:60172 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239030AbhCOOps (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 10:45:48 -0400
X-Greylist: delayed 2639 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Mar 2021 10:45:47 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbx.email;
         s=selector2; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
        Message-Id:Date:Subject:To:From;
        bh=3PR2r5ZvgnJe7tAC1N2GXrqbrl5IXjHqQVhXewN/7aA=; b=0sWhx4VABXDmZ9CxbTqUYyd+zG
        6yydX42nbXOHnR3/F0i3jKh0BBAE1bV02SO8YwEkHHC+bwMJUbMoF5ps46A4HgGJygrSwd99b7+sb
        Tnk5NafEGdO/mp8Lmb4LROjIHcAxV7V0Fg7jWxBZw1reCCeZG7E5iHqRYCe2FReJ+EW+PPLWBFtwp
        Rhs88hszol2bUf80iyHqU2rPmXyfMWNM53iKjQlAyT1Zj6PmHoN5ZoRDnx4EB4JeV90bXrjg1iRMw
        JmlaTXX+mR86MOC6lBKjhrNZGUlj2/Pm7aAE7CgnDsAKk5VB1dC3YltYAkW9KLpaZEG7C73E/a8el
        8KyHoREA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <detegr@rbx.email>)
        id 1lLnmh-00006C-Ux; Mon, 15 Mar 2021 15:01:35 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated alias (932193)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1lLnkR-0004Hn-5v; Mon, 15 Mar 2021 14:59:07 +0100
From:   =?UTF-8?q?Antti=20Ker=C3=A4nen?= <detegr@rbx.email>
To:     trivial@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        =?UTF-8?q?Antti=20Ker=C3=A4nen?= <detegr@rbx.email>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: v4l2-mc: fix a warning message
Date:   Mon, 15 Mar 2021 15:58:54 +0200
Message-Id: <20210315135856.2794233-1-detegr@rbx.email>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The message erroneously told that the pad wasn't found from a tuner
when in reality it wasn't found from a decoder.

Signed-off-by: Antti Keränen <detegr@rbx.email>
---
 drivers/media/v4l2-core/v4l2-mc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index cba3d8e0bc4a..b01474717dca 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -246,7 +246,7 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 			pad_sink = media_get_pad_index(decoder, true,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_sink < 0) {
-				dev_warn(mdev->dev, "couldn't get tuner analog pad sink\n");
+				dev_warn(mdev->dev, "couldn't get decoder analog pad sink\n");
 				return -EINVAL;
 			}
 			ret = media_create_pad_link(entity, 0, decoder,
-- 
2.30.2

