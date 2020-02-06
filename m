Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBD1154EA6
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 23:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbgBFWH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 17:07:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45034 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgBFWH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 17:07:28 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 36CFB2946A4
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH] media: staging: rkisp1: stats: use consistent bus_info string
Date:   Thu,  6 Feb 2020 19:07:09 -0300
Message-Id: <20200206220712.1243438-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200206220712.1243438-1-helen.koike@collabora.com>
References: <20200206220712.1243438-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stats entity is using a slightly different bus_info string
"platform: rkisp1" (with a space) instead of "platform:rkisp1" used by
the rest of rkisp1 code.
This causes errors when using v4l2-util tools that uses the bus_info
string to identify the device.

Fixes: 9a28dbd65a88 ("media: staging: rkisp1: add capture device for statistics")

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-stats.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index d98ea15837de..7f461477497a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -70,8 +70,7 @@ static int rkisp1_stats_querycap(struct file *file,
 
 	strscpy(cap->driver, RKISP1_DRIVER_NAME, sizeof(cap->driver));
 	strscpy(cap->card, vdev->name, sizeof(cap->card));
-	strscpy(cap->bus_info, "platform: " RKISP1_DRIVER_NAME,
-		sizeof(cap->bus_info));
+	strscpy(cap->bus_info, RKISP1_BUS_INFO, sizeof(cap->bus_info));
 
 	return 0;
 }
-- 
2.24.0

