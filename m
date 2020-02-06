Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0DE154EA8
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 23:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgBFWH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 17:07:26 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45024 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgBFWH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 17:07:26 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 8F313294421
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] media: staging: rkisp1: use consistent bus_info string for media_dev
Date:   Thu,  6 Feb 2020 19:07:08 -0300
Message-Id: <20200206220712.1243438-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Media device is using a slightly different bus_info string
"platform: rkisp1" (with a space) instead of "platform:rkisp1" used by
the rest of rkisp1 code.
This causes errors when using v4l2-util tools that uses the bus_info
string to identify the device.

Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 558126e66465..9b47f41b36e9 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -502,8 +502,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
 		sizeof(rkisp1->media_dev.model));
 	rkisp1->media_dev.dev = &pdev->dev;
-	strscpy(rkisp1->media_dev.bus_info,
-		"platform: " RKISP1_DRIVER_NAME,
+	strscpy(rkisp1->media_dev.bus_info, RKISP1_BUS_INFO,
 		sizeof(rkisp1->media_dev.bus_info));
 	media_device_init(&rkisp1->media_dev);
 
-- 
2.24.0

