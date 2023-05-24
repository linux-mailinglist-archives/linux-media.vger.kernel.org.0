Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE2BE70F5F5
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjEXMMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbjEXMMD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:12:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB57795
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:12:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 47DA063C96
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3447C4339E;
        Wed, 24 May 2023 12:11:59 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 7/8] media: pci: tw686x: no need to check 'next'
Date:   Wed, 24 May 2023 14:11:49 +0200
Message-Id: <20230524121150.435736-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If 'done' is not NULL, then next can never be NULL, so just drop
the 'next' check.

This fixes this smatch warning:

drivers/media/pci/tw686x/tw686x-audio.c:62 tw686x_audio_irq() warn: can 'next' even be NULL?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/pci/tw686x/tw686x-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/tw686x/tw686x-audio.c b/drivers/media/pci/tw686x/tw686x-audio.c
index 74cba1368cfa..1ae3845b6743 100644
--- a/drivers/media/pci/tw686x/tw686x-audio.c
+++ b/drivers/media/pci/tw686x/tw686x-audio.c
@@ -59,7 +59,7 @@ void tw686x_audio_irq(struct tw686x_dev *dev, unsigned long requests,
 		}
 		spin_unlock_irqrestore(&ac->lock, flags);
 
-		if (!done || !next)
+		if (!done)
 			continue;
 		/*
 		 * Checking for a non-nil dma_desc[pb]->virt buffer is
-- 
2.39.2

