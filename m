Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4BDE308E05
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 21:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhA2UDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jan 2021 15:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbhA2UCl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jan 2021 15:02:41 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A92C061756
        for <linux-media@vger.kernel.org>; Fri, 29 Jan 2021 12:02:01 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id r77so9920830qka.12
        for <linux-media@vger.kernel.org>; Fri, 29 Jan 2021 12:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yaerobi-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NnmLK0QuYK5q1OECi1UZh+ESlr4Q56eYy5OG4YOB2mc=;
        b=ruPtmf70+Wnc1fDId6zF7H0AVczBl7ht4P6pxI6F2R65F+ax3UTM59zz06WrgiZJiG
         guQO5GqCQqCluBwwLcGI2+7CSRR+wlpok4/W9/rOrPkJHKm1aGSwXVSseNHcleQr/s2n
         qndH5Q2mZLRaG/718TD1vuCkPYWBerOtAfo5vI1EJzJRjv9DpTvJw6suQXzdaBX1CJFs
         1s9J7+4AQmsFw4vVz5oN9M5Ml1Kqc2R3QunVSzHc4q5UfYy7LXwDHySU14tKTpmDedeH
         vNp5af3Q4l5jkFrDsFcKwLQciEvqRJPLUs5CSUqN/MTKjEGvlCErx4CExykZVljuX0m/
         VZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NnmLK0QuYK5q1OECi1UZh+ESlr4Q56eYy5OG4YOB2mc=;
        b=NE4EbFGTbPRyNPeJS4yWy5Agu+WUkT+XPs2u9doOFARIZa5n8jhamD1db6OA5008jm
         FMplBTfs0PoPBcgym/vqRZc8O3PbzjPVWZua4sFNYXdD1RBDM+lu5/qJSjcBJwXQsNk+
         yf5hkxamKMWAKVJQKA4zYzjR0M5Kxm5iAPFywuvTQI6DhMBlMeSRZ/SvAdkSvFJuJ6Dx
         Q2P6CsLkmUwU+Vq3U72+9HoBc1mUoukDK7G1wgsflEDBRTUfmGHZQBMA9ct0+jihSUsz
         wT1CAVqxhF59haKnKR6zxq0zXepzvv5uRxAsEGrtFJiDXcWnHcAFK9NVEfIa0NuVvAq+
         9hIQ==
X-Gm-Message-State: AOAM5310iLjIovloVVXRrQSQ1nvmq1761t6LTGglNtewmVXzV3a1EGoV
        4lpG/tJ7mIOy+WXbnUkq/F+nwA==
X-Google-Smtp-Source: ABdhPJxXwVBULwXtR+LUfGxqk26ZRE2SqzkeI4itlU4ZtUJvtmiPPbeicq+RbGwkrVH5kIjB4uAgrw==
X-Received: by 2002:a37:688e:: with SMTP id d136mr5362234qkc.213.1611950520577;
        Fri, 29 Jan 2021 12:02:00 -0800 (PST)
Received: from debian (host15.190-136-155.telecom.net.ar. [190.136.155.15])
        by smtp.gmail.com with ESMTPSA id p22sm6710082qkk.128.2021.01.29.12.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 12:02:00 -0800 (PST)
Date:   Fri, 29 Jan 2021 17:01:54 -0300
From:   Emmanuel Arias <eamanu@yaerobi.com>
To:     m.tretter@pengutronix.de, kernel@pengutronix.de, mchehab@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: allegro-dvt: Use __packed sentence
Message-ID: <YBRpstkOi685uHef@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix coding style using __packed sentece instead of
__attribute__((__packed__)).

Signed-off-by: Emmanuel Arias <eamanu@yaerobi.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 9f718f43282b..cee624dac61a 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -670,7 +670,7 @@ static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
 	struct {
 		u16 length;
 		u16 type;
-	} __attribute__ ((__packed__)) *header;
+	} __packed *header;
 	struct regmap *sram = mbox->dev->sram;
 	unsigned int head;
 	ssize_t size;
-- 
2.29.2

