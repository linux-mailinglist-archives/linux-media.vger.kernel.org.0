Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A09545CCDC
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351049AbhKXTQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:52506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350956AbhKXTQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 829E761039;
        Wed, 24 Nov 2021 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781206;
        bh=zNh74PHZNRpkApXERz6a/nbbu/u11mAhtg08mS2Lb+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ROselUXsmhTKBs4jHllOxwbPDtGt1cY8PmM0bRMLogAO0KdGzzq3RTz5EJIUQ7jn+
         48POq8k9ZpHkNssBC9arWp8lSRFtcjt3bJvEwu0uco+12XQMG80HdskBX13tYMjp17
         o4QcL9K1vaSTpBEXJPBDxO1QllLmNHVb3uGWvbcLNPZXX0OMX3ivEGIirXcPEwpn3C
         2tjzXyd9AKqo3GzzXzFXRWkzu1BZ4JsPQH5rQi21cdJVEaKUHXeo+xFiXN2Go57Z82
         dWH+3TacB6wZv0DsTnrtsgKgv4vZJr1oyZfz3dm53YdkJ32QhzYETGyLcqPMgl2Z3v
         8K542RTdP4Z9A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q56-Fn; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 02/20] media: saa7134-go7007: get rid of to_state() function
Date:   Wed, 24 Nov 2021 20:13:05 +0100
Message-Id: <0de4ecd59028848b24cfb57fcf0ac0480d6c7029.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is just an alias for container_of() and it is used only
on a commented code. The commented code actually is an issue that
require fixes, so, move the container_of() call to the commented
code, and drop the unused function.

This way, a fix for the function could be added later without
needing to re-add to_state() function.

This fixes a clang W=1 warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/pci/saa7134/saa7134-go7007.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-go7007.c b/drivers/media/pci/saa7134/saa7134-go7007.c
index f319edb39c0e..da83893ffee9 100644
--- a/drivers/media/pci/saa7134/saa7134-go7007.c
+++ b/drivers/media/pci/saa7134/saa7134-go7007.c
@@ -56,11 +56,6 @@ struct saa7134_go7007 {
 	dma_addr_t bottom_dma;
 };
 
-static inline struct saa7134_go7007 *to_state(struct v4l2_subdev *sd)
-{
-	return container_of(sd, struct saa7134_go7007, sd);
-}
-
 static const struct go7007_board_info board_voyager = {
 	.flags		 = 0,
 	.sensor_flags	 = GO7007_SENSOR_656 |
@@ -385,7 +380,7 @@ MODULE_FIRMWARE("go7007/go7007tv.bin");
 static int saa7134_go7007_s_std(struct v4l2_subdev *sd, v4l2_std_id norm)
 {
 #if 0
-	struct saa7134_go7007 *saa = to_state(sd);
+	struct saa7134_go7007 *saa = container_of(sd, struct saa7134_go7007, sd);
 	struct saa7134_dev *dev = saa->dev;
 
 	return saa7134_s_std_internal(dev, NULL, norm);
-- 
2.33.1

