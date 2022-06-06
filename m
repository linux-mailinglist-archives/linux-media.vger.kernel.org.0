Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96CB653F246
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 00:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbiFFWwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 18:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbiFFWwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 18:52:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2934A5F8F0
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 15:52:00 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q7so21693630wrg.5
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 15:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zfe+pXty6RTzLaEKRYWTgvl29MEGKbzeB22SrM+AQs0=;
        b=DKH3w2KV1xkDBggRuQqpD8H75hUn6HQcxLtb6f4OirtcxAAJoWM6sr4dAfGAw9KdEj
         ssHyHai+/rbQnulksUf0hIngR3PwtDdwUfNANiYzDgkrQcNLqG3Jj74q80gh6OHNvCvo
         UkyQ757WdYKuyx6teC4C6NZRHsIfiv6mF8NkvqKNCzOJ6YPpWF9MI/huEvdSbYa7lrFD
         933fxopZlc6DTgubHQIgeZfYm/oejm28vxtjvz/nAudL/VeLV2GsoGUxbWcB196fkTqC
         OYHgL0sh3iezYUdjux2Rglbuz7a1vXCGZUSmzz/wBADjEPM8/72FG8Z4N44pBWF9xQWq
         Xypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zfe+pXty6RTzLaEKRYWTgvl29MEGKbzeB22SrM+AQs0=;
        b=Zh8mLcpGkt3tpKPyaruBi4DVfRy5n2mUvtj/2n513Zmcv2oTiHjZ/eVQoxjxyk/DSi
         2vQbFREKZG2WmsAfIeLGL3wkNpL0XGDm6ld6hgu/bp3xuuRbm+5qnj2pUoLf3vdcNoVV
         SHx5imdeWRWuwbQ+5vaPmP6n3n4B7u6LmDcA6gNK7Eph0563ngX5pakIXRstcZSK+XCA
         NMbCfP9MV+EiissMFbxqqDmptiaR8xYBWztsn9xQzEcp/hgKx62HIgrcVfpR7PqJCB8+
         Icw2F0xa0bYe7yJ63Mt1XvpxE7RA3k5xJfNoCBD7FNPRy6FboeqTGnA6xAljUjDV/9+w
         MAJA==
X-Gm-Message-State: AOAM531xRrzeQSn73q32M2eSmpR+6FWUT245XqzayrLu+C/NSvB/Y/Jq
        YSH3LT/sLPpTXKozXq0+WlSIB7evEyU=
X-Google-Smtp-Source: ABdhPJxlLHbYVHf0nxaF6yCPrPUUR2FYJs06wVWUrDX1cMVFanyflGD6edEqNtXOx2oUV7mEMBjOHw==
X-Received: by 2002:adf:a3d3:0:b0:213:baff:7654 with SMTP id m19-20020adfa3d3000000b00213baff7654mr19285145wrb.158.1654555918561;
        Mon, 06 Jun 2022 15:51:58 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l9-20020a7bc349000000b0039746638d6esm18282139wmj.33.2022.06.06.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:51:58 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     dafna@fastmail.com, heiko@sntech.de, foss+kernel@0leil.net
Subject: [PATCH] media: rkisp1: Don't create data links for non-sensor subdevs
Date:   Mon,  6 Jun 2022 23:51:49 +0100
Message-Id: <20220606225149.2941160-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the introduction of ancillary links, not all subdevs linked to
the ISP's v4l2_dev necessarily represent sensors / bridges. Check the
function for the subdevs and skip any that represent lens or flash
controllers before creating data links.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

This should fix the issues that have been noticed, but perhaps a new flag like
MEDIA_ENT_FL_HAS_SOURCE or something would be a better way to denote subdevs
that need data links?

 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 3f5cfa7eb937..e90f0216cb06 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -134,6 +134,10 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
 			continue;
 
+		if (sd->entity.function == MEDIA_ENT_F_LENS ||
+		    sd->entity.function == MEDIA_ENT_F_FLASH)
+			continue;
+
 		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
 						  MEDIA_PAD_FL_SOURCE);
 		if (ret < 0) {
-- 
2.25.1

