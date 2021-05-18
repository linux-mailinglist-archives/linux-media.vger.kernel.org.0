Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624E4387907
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 14:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242984AbhERMml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 08:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349294AbhERMml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 08:42:41 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD82C06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:23 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso1428875wmh.4
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WjRHSWLwcQME27BIqP7xhnH4Ry5mnwpaQ96JB5epsUo=;
        b=aEOs2pqTM7bgFZWltKS5/yTJ5nc0SPOS0E8G71ozYxMUL3X4o1FIS+4lmw8v3jPOkH
         /YqkTuO9MSu9hMtUzlsJEfPbCApqWDRnOvMUtjXZbhIkG9+Kd7hcOd9NvPGDzbjXgXkM
         qynSwrKCf5w8Lgh+gNBnX1ikcKw2SzoL+z+9uYoJBweHs3uLp4wc2S9YuhUQ9ytE5MTh
         E/Ep/Li/rIZpxsk9ldLjIvdw64yp5OY89RQ9x00NCGdyzDlYmaeCIghjw2UOnPr/GGMc
         /3ijhHABMHEDEmf+7V2rNqSgnXm3Mkx7w/RwsEfPP3cGO54V1p/z2HAfOL/yA7bIo0ZX
         ZKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjRHSWLwcQME27BIqP7xhnH4Ry5mnwpaQ96JB5epsUo=;
        b=UvZjJLPlTZ6xup01/eOy0sOXjxJxIDVkX24FR2EkSsGm7FigSEAYUjYqu7PhhOrwMu
         +zrwt8ljExcoz2chWEm6HmiJZM7vCWWO1JzD6R7CybBIp0D4pqa5oBKzmxk4uK7da860
         iuOCHZqOcCfGagqdETgInAuDo0AwQLnVooCXgCfT6bl/w4d0QtHm4jPL4WgTn9E02DtD
         cC45SIbRWxpcJZflIeRlRejZUzS7zQ6KPMppLC4TCMJvmNeRAzUQY1xn7evjzz1eYx73
         F6oPdn/AIwwuJTmawJR0CkYVGcIgih2mHwVeYLsHgAc/ozqbGzKEi2d5092RUSR5+8LO
         Bk7g==
X-Gm-Message-State: AOAM5320zui3U9sw993/yLe4vbCyYB3pAvqdgwYLYJbOvX9vxEhGvPPc
        qH7Zo0EG6oob6V8QhaydRupUqQ==
X-Google-Smtp-Source: ABdhPJzB0CCRFlZQVb49HxHbUpFADNosNUydFeMQcfZfN6BewWshxLe7tXdzO7i5EwCH5Swmw0HlVQ==
X-Received: by 2002:a1c:1bcc:: with SMTP id b195mr5341668wmb.51.1621341681841;
        Tue, 18 May 2021 05:41:21 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:21 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] staging: media: zoran: multiple assignments should be avoided
Date:   Tue, 18 May 2021 12:41:10 +0000
Message-Id: <20210518124113.1823055-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove all multiple assignments.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 6 ++++--
 drivers/staging/media/zoran/zr36016.c      | 3 ++-
 drivers/staging/media/zoran/zr36050.c      | 3 ++-
 drivers/staging/media/zoran/zr36060.c      | 3 ++-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index e8902f824d6c..46382e43f1bf 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -678,12 +678,14 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
 		sel->r.height = zr->jpg_settings.img_height;
 		break;
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		sel->r.top = sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.left = 0;
 		sel->r.width = BUZ_MIN_WIDTH;
 		sel->r.height = BUZ_MIN_HEIGHT;
 		break;
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.left = 0;
 		sel->r.width = BUZ_MAX_WIDTH;
 		sel->r.height = BUZ_MAX_HEIGHT;
 		break;
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 2d7dc7abde79..82702a13b05f 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -361,7 +361,8 @@ static int zr36016_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	codec->data = ptr = kzalloc(sizeof(struct zr36016), GFP_KERNEL);
+	ptr = kzalloc(sizeof(struct zr36016), GFP_KERNEL);
+	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
 
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 2826f4e5d37b..a78862852a47 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -754,7 +754,8 @@ static int zr36050_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	codec->data = ptr = kzalloc(sizeof(struct zr36050), GFP_KERNEL);
+	ptr = kzalloc(sizeof(struct zr36050), GFP_KERNEL);
+	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
 
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 4f9eb9ff2c42..1c3af11b5f24 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -790,7 +790,8 @@ static int zr36060_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	codec->data = ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
+	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
+	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
 
-- 
2.26.3

