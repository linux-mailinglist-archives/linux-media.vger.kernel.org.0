Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F228131E0E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 04:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgAGDnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 22:43:45 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46902 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGDno (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 22:43:44 -0500
Received: by mail-pg1-f194.google.com with SMTP id z124so27805946pgb.13;
        Mon, 06 Jan 2020 19:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VltYEuA+2PApmtgRMm5FF8qb9zrgm0zOyAmewmF0puQ=;
        b=l47vIneSa/hFEkETx/SuB1kevgPx1rLNRqSo/Ms503wbbhPZFWpn6Y0VH+ml5EHGwX
         Z8MjxcYNwT4QKu/bgCwxC94ge6v6noxf6kblwdoLuKYJzUnNf6ep3t2LcQ7Czo44V3na
         ND6a6HAxw5KsTlN1SUyixzT0GcTyWZKfJtJDBuSDRhgGJ+/PMyNmgxh6yj2JvgHYnwNU
         oLPyCwpEGojBiLYLM7HzVbfQsrg7Yr/r+Cu1ckFmHqt4XMyCSs2rEBSPc65TTyqGE7hq
         LAHD+t0sNtfO1GjTa3XVo+ZHcsyfByJaSi7PcK321b5zbAh0huZvRVJ2noP54Xdgyz2B
         sjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VltYEuA+2PApmtgRMm5FF8qb9zrgm0zOyAmewmF0puQ=;
        b=YaPR6s7tKdPMNt3Fo6QSYDmeUI+kPm31JhT+3NSp64UhRe3nsxc9wbAlIbB6/HkQFo
         71fFtQaYO4Lw0m90PJasTQUMEXWsEKn+hlzuKz2Qn7gIug2gPTSE97S/dQwalI/5yCcl
         n7C5bTX60CdTTopUKl8A9ushdM/PCPthFi7q0IkhOO8nBAX+g1iv0bQ2zJRm8Wwqs3y4
         MIBrbiAg05rULJtQ44mYfYv935TlQM+J4kniIRTzyjHgusmS9QDR7YGAU45jiWfqyewH
         j955QsyElLpkv9+M6U6izCfVv+aiTr4aEseR5lSpr6A3UHOTmGW36jG/rjpF96e4WXdo
         kADQ==
X-Gm-Message-State: APjAAAUnYNO6ouhNUleGoqBQAhfOjTzNcr5bkiBww8doPIeqiu0o8XcL
        UZNs3ditZKRNxhmZaOQKVyA=
X-Google-Smtp-Source: APXvYqzZw/5ojo17tCaUt9PV7komeSIywJmrYJhVJN67fb/Rxn2Dvbo59Qfw2xEZ5of4zJw5FPOBDA==
X-Received: by 2002:a62:1d52:: with SMTP id d79mr112174863pfd.144.1578368624291;
        Mon, 06 Jan 2020 19:43:44 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id g10sm73455929pgh.35.2020.01.06.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 19:43:43 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: aspeed: Rework memory mapping in probe
Date:   Tue,  7 Jan 2020 14:13:22 +1030
Message-Id: <20200107034324.38073-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107034324.38073-1-joel@jms.id.au>
References: <20200107034324.38073-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the recently introduced function devm_platform_ioremap_resource to
save a few lines of code. This makes the driver match common platform
device probe patterns.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/media/platform/aspeed-video.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d8593cb2ae84..8f849d9866af 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1655,14 +1655,17 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 static int aspeed_video_probe(struct platform_device *pdev)
 {
+	struct aspeed_video *video;
 	int rc;
-	struct resource *res;
-	struct aspeed_video *video =
-		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
 
+	video = devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
 	if (!video)
 		return -ENOMEM;
 
+	video->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(video->base))
+		return PTR_ERR(video->base);
+
 	video->frame_rate = 30;
 	video->dev = &pdev->dev;
 	spin_lock_init(&video->lock);
@@ -1671,13 +1674,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&video->res_work, aspeed_video_resolution_work);
 	INIT_LIST_HEAD(&video->buffers);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	video->base = devm_ioremap_resource(video->dev, res);
-
-	if (IS_ERR(video->base))
-		return PTR_ERR(video->base);
-
 	rc = aspeed_video_init(video);
 	if (rc)
 		return rc;
-- 
2.24.1

