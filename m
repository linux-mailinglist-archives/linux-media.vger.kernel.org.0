Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3AA2D76C0
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 14:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393143AbgLKNjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 08:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbgLKNiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 08:38:51 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A823C0613D3
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 05:38:10 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id 31e9240094C55Sk011e9iK; Fri, 11 Dec 2020 14:38:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knica-009iH8-TV; Fri, 11 Dec 2020 14:38:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knica-00CSir-Dw; Fri, 11 Dec 2020 14:38:08 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: sh_vou: Drop bogus __refdata annotation
Date:   Fri, 11 Dec 2020 14:38:06 +0100
Message-Id: <20201211133806.2970300-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 4c62e9764ab403d4 ("Drivers: media: remove __dev*
attributes.") in v3.8, the SuperH Video Output Unit driver no longer has
any code or data located in initmem, hence there is no need to annotate
the sh_vou structure with __refdata.  Drop the annotation, to avoid
suppressing future section warnings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/sh_vou.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
index b22dc1d725276f61..4ac48441f22c44a3 100644
--- a/drivers/media/platform/sh_vou.c
+++ b/drivers/media/platform/sh_vou.c
@@ -1355,7 +1355,7 @@ static int sh_vou_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver __refdata sh_vou = {
+static struct platform_driver sh_vou = {
 	.remove  = sh_vou_remove,
 	.driver  = {
 		.name	= "sh-vou",
-- 
2.25.1

