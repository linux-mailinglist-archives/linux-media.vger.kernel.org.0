Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8218393EF8
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 10:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhE1IuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 04:50:22 -0400
Received: from m12-17.163.com ([220.181.12.17]:33395 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233054AbhE1IuV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 04:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NPgfd
        6MPtzDIXDJfmmg/h4Y5meuB7xT639mAubjg2cw=; b=i+3w3IEVW0rh2qwNakDEA
        e4CZ2wG+KB7Pv84NBse4y9vcURJ9BUWyL2vCFhrcpovUo7iCUPD4GCSp9GTfjs+G
        wdW5tYToJ355GUT3nRF92OqjofXQytBzeYVXwbaBJK8VW4rvAfn7lgTw4KPkDOUG
        gLfsKJPCUMlibrJj0kagf0=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp13 (Coremail) with SMTP id EcCowAB3oYVprrBgHcF83w--.15570S2;
        Fri, 28 May 2021 16:48:42 +0800 (CST)
From:   lijian_8010a29@163.com
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: via-camera: deleted these redundant semicolons
Date:   Fri, 28 May 2021 16:47:40 +0800
Message-Id: <20210528084740.173201-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowAB3oYVprrBgHcF83w--.15570S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry8Zr4xGr1fJF48JryrWFg_yoWktrcEqr
        nYvFs3X3y8GFZrtFyjkF4rWryFvayYvr48uFnxtFWYyry7t3yUW3WYgry7Xw42va129F98
        GFn09rn7Cr1SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5oxRDUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiHRqfUFSIq6n55gABsI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

Macros should not use a trailing semicolon，and it was used
the semicolon after macro cam_dbg called in viacam_vb2_prepare,
so deleted these redundant semicolons.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/platform/via-camera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
index ed0ad68c5c48..5a6ace37c157 100644
--- a/drivers/media/platform/via-camera.c
+++ b/drivers/media/platform/via-camera.c
@@ -132,11 +132,11 @@ static struct via_camera *via_cam_info;
  * Debugging and related.
  */
 #define cam_err(cam, fmt, arg...) \
-	dev_err(&(cam)->platdev->dev, fmt, ##arg);
+	dev_err(&(cam)->platdev->dev, fmt, ##arg)
 #define cam_warn(cam, fmt, arg...) \
-	dev_warn(&(cam)->platdev->dev, fmt, ##arg);
+	dev_warn(&(cam)->platdev->dev, fmt, ##arg)
 #define cam_dbg(cam, fmt, arg...) \
-	dev_dbg(&(cam)->platdev->dev, fmt, ##arg);
+	dev_dbg(&(cam)->platdev->dev, fmt, ##arg)
 
 /*
  * Format handling.  This is ripped almost directly from Hans's changes
-- 
2.25.1


