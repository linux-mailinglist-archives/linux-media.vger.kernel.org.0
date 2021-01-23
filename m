Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BB13012D8
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 04:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbhAWDrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 22:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbhAWDpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 22:45:54 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21074C0617A7
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:44:34 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d4so4393481plh.5
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 19:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dJGIvDbFer174uYIU3S/UHlxuD0C4SN9Ba2a5uW/TjI=;
        b=OifXzFWywulgTYIb9jiyHpcD9JRWqdvQpqyIxxU2D6tsvuICK7UAWAuNdhwL9zUrAR
         K+Nk1PB3vJuukAby67BHb75dLenU9dJldjAEfwR/2+8xvD7W58qyqrNjKfvj0OLfm/Vm
         zbEeseMkg52zIyx68ryB6lk3sZbv2Q8yvg+zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJGIvDbFer174uYIU3S/UHlxuD0C4SN9Ba2a5uW/TjI=;
        b=CQvpb7jju3G6eMCYVd5YtyK3NQA5GtBC0hGIbYPIaP9SOFJQBMwSR/1XrVfdUh977k
         eacd3L0onjpAG25tWXyMWRaOTVfrXJ9Lrx9qwpHuHl3lwu6QAbvVuJZyA77q+uv27+gU
         rx4l122vjRIsfrZyue+leOcNV0/Oc8CUmIbCsn1cvUsZswCBfrRNbqCmEiAHiZ/OJr6B
         IywA1fLyXh0sCzNYV2OI8VVl4DlQUQeIQRLM9l82xEsQRo4ThpAdhctk+AkUMW6qjprw
         jds3ZR167VIkIy3qNdJRVhlc8AYXHt+B4fdazzD/W6BBudXuB0x6bjsaddwsKOwrB1+o
         5NmA==
X-Gm-Message-State: AOAM532iqt4dhOZ/Xv3pRjCqqvgwka6wDRrPzXTL+OJOb2zsFgcYJ6r2
        FMLnSQfqhwHc2he7Chu4ZaBLBQ==
X-Google-Smtp-Source: ABdhPJwOaNd8kn+wXdYuJVArrzuHdGMUINcUY27IXOlFKIQTp/Yvg53oR2Q8FrPD6gGeNitPo2TNQw==
X-Received: by 2002:a17:90b:3792:: with SMTP id mz18mr8968978pjb.23.1611373473763;
        Fri, 22 Jan 2021 19:44:33 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id gf23sm10480343pjb.42.2021.01.22.19.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:44:33 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/6] media: renesas-ceu: Use of_device_get_match_data()
Date:   Fri, 22 Jan 2021 19:44:23 -0800
Message-Id: <20210123034428.2841052-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210123034428.2841052-1-swboyd@chromium.org>
References: <20210123034428.2841052-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver can use the replacement API instead of calling
of_match_device() and then dereferencing the pointer that is returned.
This nicely avoids referencing the match table when it is undefined with
configurations where CONFIG_OF=n.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-media@vger.kernel.org>
Cc: <linux-renesas-soc@vger.kernel.org>
---

Please ack so Rob can apply.

 drivers/media/platform/renesas-ceu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 4a633ad0e8fa..352e7c84d5ba 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -1679,7 +1679,7 @@ static int ceu_probe(struct platform_device *pdev)
 	v4l2_async_notifier_init(&ceudev->notifier);
 
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
-		ceu_data = of_match_device(ceu_of_match, dev)->data;
+		ceu_data = of_device_get_match_data(dev);
 		num_subdevs = ceu_parse_dt(ceudev);
 	} else if (dev->platform_data) {
 		/* Assume SH4 if booting with platform data. */
-- 
https://chromeos.dev

