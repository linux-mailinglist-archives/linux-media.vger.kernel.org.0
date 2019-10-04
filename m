Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AB2CC513
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 23:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbfJDVnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 17:43:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35609 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfJDVnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 17:43:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id p30so2404517pgl.2
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ubsbJVfyaxxi8UEKJtUs1pHXgsPvFxblh2S9JiFfFEQ=;
        b=UFkwlLQnUNyI5WNntdW9sbZ+MOSMgf2+fOLF8RG0Idqq0BiDJ31IThtlWGL76sEsh8
         ZOXjRMMhS2+jDESxPJYaF23djnnmvObforQfo9Lci5kCDyLYBF8PRkwvnwVf8Yl/9q4/
         sLymgqNYk/o0RadXVPMTvlSeFll8zoJ8X+f5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ubsbJVfyaxxi8UEKJtUs1pHXgsPvFxblh2S9JiFfFEQ=;
        b=Zurn/muifAuWicp6pyI+iMNp4kwthjOb1Aa5s3SZGVX8NfVwA7oONgUyDy/0YBMybB
         LtdDI8VNvnN4f5UD4Rda0KOaKotyJGsjNJQOFBCg6SW7nxwynlXaAYBbUymIZq3ORHFl
         r7LuCy4TkZiasASAeop9S5BVowFSqGzmCkpr8QWDwFBzGysbASZZx0tI/oVDn73+29sd
         fIV28PrB1DbL0oIsI4TreBph4sjvICSns5/KSHXv81eKsEWIsiBZGQ2dUXMc7CBNnOE8
         dHvfZIKxVEZEaN2ObbfBVZqEzGudeccFLCCyPPDI94OOOKNOyQf7GWogG+bZvkvAHJFa
         GGGg==
X-Gm-Message-State: APjAAAW2NS7wsh1lTCafoEvfnQnJo9AveKzvc0JaXoELBrlGTQupeh0h
        gK2nlo9bhlQuDckcPsvLbuMKMQ==
X-Google-Smtp-Source: APXvYqxWNvMZbZVIHoPzbXHXqx4rR45wvPydpGvMiAUC+AaI6mlLIv/J0XRSrindMPfHhhURSHgsxQ==
X-Received: by 2002:a17:90a:77c7:: with SMTP id e7mr19330232pjs.59.1570225418345;
        Fri, 04 Oct 2019 14:43:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a11sm10446799pfg.94.2019.10.04.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 14:43:37 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/10] media: renesas-ceu: Use of_device_get_match_data()
Date:   Fri,  4 Oct 2019 14:43:26 -0700
Message-Id: <20191004214334.149976-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191004214334.149976-1-swboyd@chromium.org>
References: <20191004214334.149976-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver can use the replacement API instead of calling
of_match_device() and then dereferencing the pointer that is returned.
This nicely avoids referencing the match table when it is undefined with
configurations where CONFIG_OF=n.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-media@vger.kernel.org>
Cc: <linux-renesas-soc@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please ack or pick for immediate merge so the last patch can be merged.

 drivers/media/platform/renesas-ceu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 197b3991330d..60518bbc2cd5 100644
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
Sent by a computer through tubes

