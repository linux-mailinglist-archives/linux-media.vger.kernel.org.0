Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5072790A0
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbgIYSd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgIYSd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:33:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B55C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g29so3329174pgl.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xR6EMaCnGVufYq99NXULxv+YlatOQC8lYjKs2v1Lyho=;
        b=rAgmu4pHNqZ+1cKh/avPUCHuk5OAhQXuq+sWTvqh3t3Jjz3diyv58LFpWHBvvraGtI
         ctdq/YWWzvbYEZ0kUhwULgZKS4Jdhf4oynyHmP46aJ9t+rdJ3Xo2bhb87ZE58snCcAdp
         CPmMxfizpIi9qQc1J2y16VQjtZd19onywe2o8Rmtks++r/+IDvoZygcwfQw0481oIi0A
         +r1i6YKor9nysChq69Gu6TtYDKwTpJqi48TQLSl0YjHFeTVBh0q5dosXicnRkI3VQ8G5
         WefZh8S8NzQWsF60HCSiG0CYaxJDbZ+hbUsI7S0S9G7RIC2ieYFDfYna1wPTTlDxvroa
         ew5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xR6EMaCnGVufYq99NXULxv+YlatOQC8lYjKs2v1Lyho=;
        b=o9h3AIaN4Zx2weAozmeAXXZSgjLuZd2aBXMJjb+KppSU/N3JNWQzIv841H3ruyAt9+
         lPH2xQppESIoyZMwZ1WNP99xf2AT/kQm1XLTAiT/QSdvKK7dhGF7Z5g9ALp8RELo4Z7r
         G6E8nBHk/PkTjp4f86jaUrTesiZf0Ev9o6brAOISLL57GmGwSnQElkIs4547zc9mdo52
         vzUC0mXXO0tAIkoI+eQ22HU8uxWyhIP1pUYh/Ej33G0NuGfd/77RUcrrmzaYk91KVT7U
         mUvrjbafbixknUp07KZeqGoUXID6RxU7pbAHyki2DnhSZzsfZwl7H/LcwkcvSGxedv/c
         aB2w==
X-Gm-Message-State: AOAM530bcVZozfseTj0Vsx8NDHm08HYxmA+W5G4vk27khc5kem63TVES
        r7btufmqR/nSKzbwuTZcsHtT4g==
X-Google-Smtp-Source: ABdhPJxDP6bhJHcTflXKJSNrLvLPtFybrGDdwIdvlW1c1OEuQkae8BtoII0afWUs+wwfbquOE/2u1Q==
X-Received: by 2002:a63:e813:: with SMTP id s19mr233034pgh.33.1601058836989;
        Fri, 25 Sep 2020 11:33:56 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:33:56 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 27/47] staging: media: zoran: convert zoran alloc to devm
Date:   Fri, 25 Sep 2020 18:30:37 +0000
Message-Id: <1601058657-14042-28-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allocate the zoran structure with devm_ functions permit to simplify
code.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 706b040f5baa..fe0c5a7c967c 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1024,7 +1024,6 @@ static void zoran_remove(struct pci_dev *pdev)
 exit_free:
 	v4l2_ctrl_handler_free(&zr->hdl);
 	v4l2_device_unregister(&zr->v4l2_dev);
-	kfree(zr);
 }
 
 void zoran_vdev_release(struct video_device *vdev)
@@ -1109,7 +1108,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENOENT;
 	}
 
-	zr = kzalloc(sizeof(*zr), GFP_KERNEL);
+	zr = devm_kzalloc(&pdev->dev, sizeof(*zr), GFP_KERNEL);
 	if (!zr)
 		return -ENOMEM;
 
@@ -1298,7 +1297,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	v4l2_ctrl_handler_free(&zr->hdl);
 	v4l2_device_unregister(&zr->v4l2_dev);
 zr_free_mem:
-	kfree(zr);
 
 	return -ENODEV;
 }
-- 
2.26.2

