Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314AC38790C
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 14:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349327AbhERMmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 08:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349309AbhERMmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 08:42:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75818C061573
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:24 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a4so10099796wrr.2
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eI4NCY1wQwQq8OfRG+T0AfeGqGVQTSTyL0bsuhMZB8=;
        b=yu5pawqC8M2REqbBEFuwQZL8cBrGJyxAieUo13G6RU8vAl1SoLrla5oPrYV0mChnkx
         dascTGzxh7OrTU1IeB3GqPqHrA0q662WPAiiJyxfJ80/a67A0K54S78j41h+gualFQD+
         vsJFynoIAGViRx5tkMS8n87BVLJOO8mMR8bAqPXqY+253iD7WNE5EcwpQ3oFVUCf5fma
         +ikjj8YZsqSxvveVO7bSyOnpxfpjIVqfSXK+3BDuRwHmgndy0sDFkg7Y6J+TlAUT2Rv6
         HYTRlHyymmI4qIc0q+9yREz5t62hGCnkPb8pQqffrFDu9HX2R34FeAXz3/udPF4Xmeeq
         dqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eI4NCY1wQwQq8OfRG+T0AfeGqGVQTSTyL0bsuhMZB8=;
        b=Y6DfkzCr5I9cOZlDfx6GYjAOYlRX0cILp88dJcq8ZsIt7seLFNXUA88yaULtEQ0yl4
         llcV+vvg6B7jcXFk96ZuDi2oEvjUj6myLFdlrVgk1mBa02zeygR26M4TCkbR11Pjm891
         jsb3VKWJaxFdHyMXKjNSuFhAl5YTnqu5+kk812qt6U06QCuaMXP49UXTjruvlSviYc6o
         QxD579nHdxT/wgHeGhszJjf4pyHntISDPHfZcOGyZE+Vf3hX+kcnTdJZL4r00247hT7V
         ixvKE/huNH845cylEw7tK7ZHqWhbSL7hlV0JPnOWEUSazs+CVK3NjKgyIxT3FDE7aGr6
         LwBg==
X-Gm-Message-State: AOAM530++a6QdBHpnlIt+zxg9vOXlsQx1scFPkRcnAlJY8jy6FXA5ipc
        Gel+2dX80WgZ3LN+eeLvuDizvA==
X-Google-Smtp-Source: ABdhPJxZX83kJ5tUhAZjMNRQvqz0QsKGh6CTOjOc/hTJv/kQUreJ7t63expdHC0sS5c3Gneo8ypwzQ==
X-Received: by 2002:adf:e781:: with SMTP id n1mr6624991wrm.136.1621341683298;
        Tue, 18 May 2021 05:41:23 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:22 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/5] staging: media: zoran: fix kzalloc style
Date:   Tue, 18 May 2021 12:41:12 +0000
Message-Id: <20210518124113.1823055-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prefer kzalloc(sizeof(*prt)...) over kzalloc(sizeof(struct.../

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zr36016.c | 2 +-
 drivers/staging/media/zoran/zr36050.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 82702a13b05f..9b350a885879 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -361,7 +361,7 @@ static int zr36016_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	ptr = kzalloc(sizeof(struct zr36016), GFP_KERNEL);
+	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index a78862852a47..8bb101fa18bc 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -754,7 +754,7 @@ static int zr36050_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	ptr = kzalloc(sizeof(struct zr36050), GFP_KERNEL);
+	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
-- 
2.26.3

