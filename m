Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7FE60F1C3
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 10:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbiJ0ICz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 04:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbiJ0ICj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 04:02:39 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4268EE52C0
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 01:02:33 -0700 (PDT)
Received: from localhost.localdomain (user-5-173-210-98.play-internet.pl [5.173.210.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FBF466028B1;
        Thu, 27 Oct 2022 09:02:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666857752;
        bh=KWD1Fnlb9uRjgL3h0/EH8ZSvpkejRsdIerwN16+4xyE=;
        h=From:To:Cc:Subject:Date:From;
        b=hpcvyo9e+8lsYMSceyD60mQKXwsMF65yh2Nq0ulnRnw3oyIOFWBkwIsax5oRwfuNz
         WdG3fQhxW+omST83kFGoOzcZfD+aDyx788BWBe6QWFATfnHsBzv2JgxvFV7bBiKM50
         IS3ETPPgA+FE+T/AdmRDXT087QgGrygR7AaCASJxz28Ix+i7Vp7iZ8j4PsBoVUNWl+
         kfQN5ssQGNEVKJ5ViSfsLpZFgTaT9qUzj4iK9lY04YXKkYTbTzTY6tMwKuJgHHFzxG
         UqXjunbN9a+He7rjlM38pjLqt0DYePPqhs0D+l3nz6LZc9OB9UDOdkSfqZ2wLTphNX
         F3kRKxptrjQjA==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [PATCH] media: rkvdec: Add required padding
Date:   Thu, 27 Oct 2022 10:02:17 +0200
Message-Id: <20221027080217.6290-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The addresses of two elements of the segmap[][] member are passed to the
hardware which expects 128-bit aligned addresses. However, without this
patch offsetof(struct rkvdec_vp9_priv_tbl, segmap[0]) is an odd number
(2421) but the hardware just ignores the 5 least significant bits of the
address. As a result, the hardware writes the segmentation map to incorrect
locations.

Inserting 11 bytes of padding corrects this situation by making the said
addresses divisible by 16 (i.e. aligned on a 128-bit boundary).

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-vp9.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/staging/media/rkvdec/rkvdec-vp9.c
index d8c1c0db15c7..cfae99b40ccb 100644
--- a/drivers/staging/media/rkvdec/rkvdec-vp9.c
+++ b/drivers/staging/media/rkvdec/rkvdec-vp9.c
@@ -84,6 +84,8 @@ struct rkvdec_vp9_probs {
 		struct rkvdec_vp9_inter_frame_probs inter;
 		struct rkvdec_vp9_intra_only_frame_probs intra_only;
 	};
+	/* 128 bit alignment */
+	u8 padding1[11];
 };
 
 /* Data structure describing auxiliary buffer format. */
@@ -1006,6 +1008,7 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 
 	ctx->priv = vp9_ctx;
 
+	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
 	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
 				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
 	if (!priv_tbl) {
-- 
2.25.1

