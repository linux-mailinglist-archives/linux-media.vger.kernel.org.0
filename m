Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA378152209
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 22:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbgBDVpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 16:45:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44028 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgBDVpV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 16:45:21 -0500
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:ad1c:28d4:5c9b:1c04:c661])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 004E6294286;
        Tue,  4 Feb 2020 21:45:19 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH] media: staging: rkisp1: fix test of return value of media_entity_get_fwnode_pad
Date:   Tue,  4 Feb 2020 22:44:45 +0100
Message-Id: <20200204214446.20381-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
References: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media_entity_get_fwnode_pad returns negative value on error
and the pad numeber on success. Therefore change the error test
from 'if (ret)' to 'if (ret < 0)' .

Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 21837d4dc9e1..9d866396a5de 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -128,7 +128,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 
 		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
 						  MEDIA_PAD_FL_SOURCE);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(sd->dev, "failed to find src pad for %s\n",
 				sd->name);
 			return ret;
-- 
2.17.1

