Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF45E58A0
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 06:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfJZEZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 00:25:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39816 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJZEZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 00:25:33 -0400
Received: by mail-io1-f66.google.com with SMTP id y12so4733425ioa.6;
        Fri, 25 Oct 2019 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rHeRkxrHD5GX5EWDlQ98vXy+a783uwWXtM2tQKGXdug=;
        b=gZRJSPMGxM1UPw1FdEvVFtbG4SqDkm9JN/GP92+GDY/bQVm73xFX5T2lkdkRAXJ9uw
         4K927+DEPOjX0v2NhbOsDZjCOyTgg/PgzXqgwivEM6QeBnGHV0CLxMfG1XeHJninS6Jn
         d3HUaWWFRPVWG+u/urTqRNtrGbQyLiZdTXq6MhvYlWjtoC7vQBAz3Rn6Mb3cxkdt1/Po
         nUZHC0Eiw1kMMsF1PkX5MSMnY53N8J0Q3vB8vM9pSuefryXU7vr8bduXoiI452R8NKud
         SwAzjj4yI/LFANHdC8I/m+7ITtp+iUIKP8EtGIgHjMBdZ+gFerdXZYr/VS+jNVHKs/wb
         4H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rHeRkxrHD5GX5EWDlQ98vXy+a783uwWXtM2tQKGXdug=;
        b=rmvfTdm1a2c7VtsnYWtlwVg0qyEMQfFGHxiXqosXXhCvs4pG3viSHpDl/L7hO5D8vW
         dQcGRdXbXp09DBNImH0+Ka1jb9NMFWI/qHIkPGpS7KSGSDdwU8QeUNYgIX0noYfPKcA7
         TZ/+5A1bq71UiD0TxzkFzz0Sf1YyV0062kXTqODma012h0JsRZJWXAqnIZMWPBYhc0XT
         wq8nEpHrSbsVnsZ4J7uepehiKit4cZBeO3b/+C8pM7oenKxUCinlsc0k6S7dg91U23Pt
         YT4o2uwqULKJg5PDsgM/av2rF2TEIKK0v5wF9bSxxZSJG/Pi9kVk7IIemdGfUuLWUgeb
         nSVA==
X-Gm-Message-State: APjAAAVbugq37hNXtDg5c6BJsnstHz6WGtZnDGYbutbq4CY9H6uzu1h2
        j4qJrTldkr7FLixWGHJoECA=
X-Google-Smtp-Source: APXvYqwyjakLVT85RTryWMHfy6AKHouMUXRj6cegqSHqrg9AmKKAZBYTX2iEX2LdU+HgQdpe1I/m7g==
X-Received: by 2002:a5d:980a:: with SMTP id a10mr7426699iol.225.1572063932870;
        Fri, 25 Oct 2019 21:25:32 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id n123sm452068iod.62.2019.10.25.21.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 21:25:32 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: aspeed-video: Fix memory leaks in aspeed_video_probe
Date:   Fri, 25 Oct 2019 23:25:18 -0500
Message-Id: <20191026042519.29446-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the implementation of aspeed_video_probe() the allocated memory for
video should be released in case of failure. Release video if either
devm_ioremap_resource() or aspeed_video_init() or
aspeed_video_setup_video() fails.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/media/platform/aspeed-video.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..8c473356132d 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
 
 	video->base = devm_ioremap_resource(video->dev, res);
 
-	if (IS_ERR(video->base))
-		return PTR_ERR(video->base);
+	if (IS_ERR(video->base)) {
+		rc = PTR_ERR(video->base);
+		goto free_video;
+	}
 
 	rc = aspeed_video_init(video);
 	if (rc)
-		return rc;
+		goto free_video;
 
 	rc = aspeed_video_setup_video(video);
 	if (rc)
-		return rc;
+		goto free_video;
 
 	return 0;
+
+free_video:
+	kfree(video);
+	return rc;
 }
 
 static int aspeed_video_remove(struct platform_device *pdev)
-- 
2.17.1

