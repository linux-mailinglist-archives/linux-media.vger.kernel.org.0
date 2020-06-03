Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617401ECF20
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 13:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgFCL4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 07:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgFCL4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 07:56:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCAAC08C5C0;
        Wed,  3 Jun 2020 04:56:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o8so1596690pgm.7;
        Wed, 03 Jun 2020 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHDcmRjNocazVkgdUDkx6Jpsy/JdQaJOhrSUM3bjraE=;
        b=iAWKQ6V+9v3z6K11H8Jbca7CaNsVUSl+WwmMra5KYSeeaJKNl7LumaaS9qUkbDTEEn
         WVtf9VOdRQR622e98UFsCo4/NprsRk5kISHdV2Tl3SGLFsNpNx1O/QwzFzsiAAaL7hxu
         RDUxRY63mUtEJhqYjI7vmLNLjMUK9fVZ4YGa3ai/PnOGCEy9P5PCgKuLrnMi6JANnKjl
         ItqAZSbl5L/LDs/+qLzEUdnOYrTGHS6JJgLVKi5ipVwfD5bUh5+VQUcXn2as7EXSOb5Z
         6W2lZIpyY8VXecyq/h1c2yaQINJNU0dL9xJv7xTd1FjYIS0jXjkLbsmZLulj9rxPZaO2
         5fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHDcmRjNocazVkgdUDkx6Jpsy/JdQaJOhrSUM3bjraE=;
        b=Lfa/D5zEaabMTzwENr+DeW5uIJZB9CS6yzMHt7VyuCHILluegM6CDpHuDhOCyWBwLi
         DnOEdxfToxXu+imP+QHoF00eQYNp5/d/m1E8qlJy7v9Y2Suk7U9jc+rfc8A4Fe/sBwC1
         1OcenOxY6hrlBdDYqb2zQ4hYiHwsPPlzbeKxriEjNI2uT7dip+kvfNFJoi6cxyxl4w1c
         VX/y4RtwdrpYSoGWVAQbKVtXbI/etmVa+Xfy9RuIYzX7PtCP7hC/NBosYUUNZyhdH2Vv
         hyHCVvnfYsBdL4uqPXTGDBdhm2/kVumCoVHySZQlhpNftNV8/sC4FKwONMLeoY9xNDyI
         sooQ==
X-Gm-Message-State: AOAM530UqiQP5frFe4H9j/Tr1OVHpwME5bXpYNBj0syTnG+mtljX2noO
        JA6JjBiQpZvE2+oot4+nHJs=
X-Google-Smtp-Source: ABdhPJzNry235yZPE1DFOyv33hlDDzApQ1EYFoD4Mu7aWqPRuqnXyqYCZs1dqBxeZP/yVLeVk1axgg==
X-Received: by 2002:a17:90a:dd42:: with SMTP id u2mr5421952pjv.65.1591185392770;
        Wed, 03 Jun 2020 04:56:32 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id j186sm1786461pfb.220.2020.06.03.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 04:56:32 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pallavi Kulkarni <p-kulkarni@ti.com>,
        Nayden Kanchev <nkanchev@mm-sol.com>,
        Phil Carmody <ext-phil.2.carmody@nokia.com>,
        RaniSuneela <r-m@ti.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: omap3isp: Add missed v4l2_ctrl_handler_free() for preview_init_entities()
Date:   Wed,  3 Jun 2020 19:56:23 +0800
Message-Id: <20200603115623.1428692-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

preview_init_entities() does not call v4l2_ctrl_handler_free() when
it fails.
Add the missed function to fix it.

Fixes: de1135d44f4f ("[media] omap3isp: CCDC, preview engine and resizer]")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/omap3isp/isppreview.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/media/platform/omap3isp/isppreview.c
index 4dbdf3180d10..38b93ec60536 100644
--- a/drivers/media/platform/omap3isp/isppreview.c
+++ b/drivers/media/platform/omap3isp/isppreview.c
@@ -2287,7 +2287,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	me->ops = &preview_media_ops;
 	ret = media_entity_pads_init(me, PREV_PADS_NUM, pads);
 	if (ret < 0)
-		return ret;
+		goto err_handler_free;
 
 	preview_init_formats(sd, NULL);
 
@@ -2320,6 +2320,8 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	omap3isp_video_cleanup(&prev->video_in);
 error_video_in:
 	media_entity_cleanup(&prev->subdev.entity);
+error_handler_free:
+	v4l2_ctrl_handler_free(&prev->ctrls);
 	return ret;
 }
 
-- 
2.26.2

