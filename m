Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B054A745E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfICUNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:11 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36613 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfICUNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id x80so2842064lff.3;
        Tue, 03 Sep 2019 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bh968WKzvOHUV69AW7moq22N2w8QalvqKBJ2DHbuK8s=;
        b=KC6b25HRW5azF/IKLGdHId4dmVFA1YCHZiaC1ZYftVAh+ibv+BbzZQE30HiR5izHsn
         ILIbhYKbzw6UM04XBAybmkkFickeZzVut8tLR/ROteJOs69WW3PzYhC/DoX9fzo9/t6b
         OEt67JEW9vFBJEHrRJkU84dPeVsnjJ/3KIpHNU/jHjGkB0IQGD+1NAsInboRxhsAGCia
         orPyRoM8CKDap/qSXSSPEWKcxwl3kLdjMk2IZgNPowYtRrHqPxUVKgSwlijmt5VjWzpi
         faqCb21fso44HXhOgOje/Fu9tEFTn/fDdg1sVsMnuEDCb8R7s3B0s6Q+sNjk2qYYJzTz
         dyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bh968WKzvOHUV69AW7moq22N2w8QalvqKBJ2DHbuK8s=;
        b=RUKaDPQ3DGeTUL2r/sN+xMs8Ep//ErDLYTTDV8N+qsZqT2tcxHHiVhFQYiNvilv+d2
         ivORf27kAF/Xlv3eexii/pUnuGg//6oXqGEMpWaZ8Jot+VodHCyKfO4dFo42lptY7KoG
         //ewPqaOXGeJBjErumuTnhhJmhNxvLkcNvxWf5oL6zd0Eh+37YIyDwcZoOg++Qy/7ZDC
         XBSpYU4GtSDp1DTzHg4h8pz6Pwg/NT5jH0dRK0MWwW0eS1gj1KwqZ1jFHXztGVTueiQL
         Ngo1DIXe2ys35MEHu/jPWQ8mNoH3o+OXJShyUKXh4QvXpDLPrCV7tMj6vEh7TGf6cVtr
         2yMQ==
X-Gm-Message-State: APjAAAXLrOrHveX90cMZQa0nhmqFxCg7XlvQ5MyNUAedIlxSzbfBondL
        wOinKd/eKtN09X2igVpmutI=
X-Google-Smtp-Source: APXvYqwuB8kjOVtfMK+e2kzyfbEgyUdFvzqDVSa7iYNs1FYee9HRA9v5XJjr4xo+yM3UWokmXAHEeg==
X-Received: by 2002:a19:e204:: with SMTP id z4mr21572361lfg.157.1567541587445;
        Tue, 03 Sep 2019 13:13:07 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:06 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 7/9] media: ov6650: Fix default format not applied on device probe
Date:   Tue,  3 Sep 2019 22:11:42 +0200
Message-Id: <20190903201144.13219-8-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is not clear what pixel format is actually configured in hardware on
reset.  MEDIA_BUS_FMT_YUYV8_2X8, assumed on device probe since the
driver was intiially submitted, is for sure not the one.

Fix it by explicitly applying a known, driver default frame format just
after initial device reset.

Fixes: 2f6e2404799a ("[media] SoC Camera: add driver for OV6650 sensor")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index b62a238a83d0..4fd8ac8e3994 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -873,6 +873,11 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	ret = ov6650_reset(client);
 	if (!ret)
 		ret = ov6650_prog_dflt(client);
+	if (!ret) {
+		struct v4l2_mbus_framefmt mf = ov6650_def_fmt;
+
+		ret = ov6650_s_fmt(sd, &mf);
+	}
 	if (!ret)
 		ret = v4l2_ctrl_handler_setup(&priv->hdl);
 
@@ -1027,8 +1032,6 @@ static int ov6650_probe(struct i2c_client *client,
 	priv->rect.top	  = DEF_VSTRT << 1;
 	priv->rect.width  = W_CIF;
 	priv->rect.height = H_CIF;
-	priv->half_scale  = false;
-	priv->code	  = MEDIA_BUS_FMT_YUYV8_2X8;
 
 	priv->subdev.internal_ops = &ov6650_internal_ops;
 
-- 
2.21.0

