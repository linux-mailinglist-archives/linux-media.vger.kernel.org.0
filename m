Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27852196451
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 08:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgC1HxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 03:53:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40964 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgC1HxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 03:53:04 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C20E52971F8;
        Sat, 28 Mar 2020 07:53:02 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/5] media: vimc: remove the function vimc_unregister
Date:   Sat, 28 Mar 2020 08:52:50 +0100
Message-Id: <20200328075254.4616-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
References: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function vimc_unregister is called only from
one place in the code and has only 3 lines so it
has no justification.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 339126e565dc..1f8498837646 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -268,13 +268,6 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	return ret;
 }
 
-static void vimc_unregister(struct vimc_device *vimc)
-{
-	vimc_unregister_subdevs(vimc);
-	media_device_unregister(&vimc->mdev);
-	v4l2_device_unregister(&vimc->v4l2_dev);
-}
-
 static int vimc_probe(struct platform_device *pdev)
 {
 	struct vimc_device *vimc;
@@ -321,7 +314,9 @@ static int vimc_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "remove");
 
-	vimc_unregister(vimc);
+	vimc_unregister_subdevs(vimc);
+	media_device_unregister(&vimc->mdev);
+	v4l2_device_unregister(&vimc->v4l2_dev);
 	v4l2_device_put(&vimc->v4l2_dev);
 
 	return 0;
-- 
2.17.1

