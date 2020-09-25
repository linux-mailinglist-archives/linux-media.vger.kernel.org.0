Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB5F279094
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbgIYSdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbgIYSdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:33:22 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ED3C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:22 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k13so4027546pfg.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lKdrItijlZnmGeseIFi2VkKxHr1iShcVRw2+QbxzHmw=;
        b=gOvfZcx12dq41X1Rm1set4/1fqU/R/no1spPF14GnvJn/Em2ZGHjAQEksNrfx47rd1
         p5ELKy9GLseLoBi2GhcC3MwO2kRH3Kd5bk9p037F2ARKlaphxz1fDLO+CAAH225VfsxW
         84kmBVsUO2f6+4N7Glq2I1FhxUkq9kbeLMQcL4KykolqR2YMS5hd06yAOWInBYnI7w3u
         Ijq5q1VJC0ynOHaumO5FE+Db4aoOeJEZfBzX/EgEzaZ/usovIql38kkWXb5kC25ZCljk
         HdA8RvSEe+BdJ8uHCcT8LLb3FgHJdliSaCSLIDExE+9k5SYJYiLLirls705GX67hARLq
         RqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lKdrItijlZnmGeseIFi2VkKxHr1iShcVRw2+QbxzHmw=;
        b=Zmt9ycox8eP3Ne0aGpZlgNaWdd1mQvH4ixjGjcY8I7fbM7R7NvweGUsfNg6qTsTBKd
         o/9AWkhVlTkJAFCvwUmNSCy3D4q8Pyxbk/l6ukyj8H+9pmNhjl4SUtCPb2jHiGWMt5TA
         9YcvS8rDHu5dqdD6HVuYYvVtAV+5byl0Up0gKKg2UOyeuK+hiiINy3mN35eTlVkRkPml
         L5Nm7ZWKvZBE6DPU+qDyo7Sz50YrSaa7pIZlD87SnHstdVjj6GBsbyrJjEZ9k054TsrY
         t5OIHPRBJ93GfGqf59Wkun3s4gTmvMK+uVr4D1uz9Ezzsd+nZIFwDMO38Ll1DN7w0yPM
         2ltQ==
X-Gm-Message-State: AOAM533ner7xZxxvb68u4ixHCe65r2hOwxa2d2Bn6Kovrtf53euW1LRn
        dCtT6KJPsJPajUFqleY+KIsGcA==
X-Google-Smtp-Source: ABdhPJzpAN76YvWnZ5z1/F/5gwsjI/ni6RnJnTr8rUTsp+CuErYBZQfwWtgeTTWUdV/TYZXaudzjzQ==
X-Received: by 2002:a17:902:1:b029:d2:5631:d975 with SMTP id 1-20020a1709020001b02900d25631d975mr746279pla.20.1601058801734;
        Fri, 25 Sep 2020 11:33:21 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:33:21 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 21/47] staging: media: zoran: Change zoran_v4l_set_format parameter from zoran_fh to zoran
Date:   Fri, 25 Sep 2020 18:30:31 +0000
Message-Id: <1601058657-14042-22-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to get rid of zoran_fh, so let's change function arguments.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 518ba19e1e0a..db85978a2893 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -401,11 +401,9 @@ static void jpg_fbuffer_free(struct zoran_fh *fh)
 /*
  *   V4L Buffer grabbing
  */
-
-static int zoran_v4l_set_format(struct zoran_fh *fh, int width, int height,
+static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 				const struct zoran_format *format)
 {
-	struct zoran *zr = fh->zr;
 	int bpp;
 
 	/* Check size and format of the grab wanted */
@@ -1671,7 +1669,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 
 	map_mode_raw(fh);
 
-	res = zoran_v4l_set_format(fh, fmt->fmt.pix.width, fmt->fmt.pix.height,
+	res = zoran_v4l_set_format(zr, fmt->fmt.pix.width, fmt->fmt.pix.height,
 				   &zoran_formats[i]);
 	if (res)
 		return res;
-- 
2.26.2

