Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BA927909D
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbgIYSdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgIYSdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:33:46 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7BAC0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:45 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t7so2239924pjd.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z3aAxPMl4vXGO6SQG5uOhkRvPzoZ7Ff2bs8SM/RvFA4=;
        b=gpDRDw5C0YiK25MSEqsXxy3no9XMDsRhptDJTUFc6XaXxK0+tJIYoIIhzlBjQNARQa
         m78mhqSgDjB8zPTFTQ8ivqNprTMg8hb/iJwy6BWdj+fCi+kGQ01r4HjiaIhoOA+GKZqy
         y2OA5c1fkAnYt/avmNUHA3DmWRlKLK/HvmsCVZGKf2xE7C4pwKRpaEt85EKRkYQNaJqh
         LR4faHgXxTiDHHx5dWcUf08EuKteVEE9inINjKKP8MOBC0C4Saf7NqAhjGKy+FuOI7f9
         zIaHOMYb43uml+OSfJKlBmstylb5voz44T8Qtv7B8RKapmtJ59tNcxKOejv7Q/x0RjPe
         GWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z3aAxPMl4vXGO6SQG5uOhkRvPzoZ7Ff2bs8SM/RvFA4=;
        b=uj4SOURSnHpWSQSrjsO6WYYkJS9kSWyz8xttrSM9OgXVu7jBoAsWZLWSw2xC+MFEEi
         qIA5ISE62P8att98zu857JbnNpa1N2GsEpZyFQ4WL8bWslkgPTyYQlahEh3bva3fX0KE
         6dP1FwTIQfQyQYVY3lzrcG1uJb/n47vZCiS6ReWMhC2EH6+e4BJNt1w5q5XP/LIq2gzh
         Vy2WPiTIM+wpyI/jATqcsU7Nyg+RhvVVKhR9W+GN1PP+SodWXT+Kg/Nago0lhSvYO0eK
         UZi6afnzvK/LoTW4Bo0niRceKynkNgh1MoOrYqe9LWz/OS8AUIYc1qCVp6npqgJLqdmJ
         TI9g==
X-Gm-Message-State: AOAM531ljDw1CDYA44S0hfD46wAhYGfGooE4ELTDICsI83HL9WlSE1nk
        BSHYA88D+WINRYZzpIdzJ/iEFA==
X-Google-Smtp-Source: ABdhPJxSiNc6igRsZSi+sSwsmRMZbrWk5a0Qvj/50ImCNIuOapDp8w29AOIdNNMtiXNgMT0gPV7h7A==
X-Received: by 2002:a17:90a:6741:: with SMTP id c1mr824105pjm.6.1601058825347;
        Fri, 25 Sep 2020 11:33:45 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.33.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:33:44 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 25/47] staging: media: zoran: zoran does not support STD_ALL
Date:   Fri, 25 Sep 2020 18:30:35 +0000
Message-Id: <1601058657-14042-26-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In fact, zoran does not support V4L2_STD_ALL, so let's enumerate what we
support.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 858e0910884c..60bbc8235cff 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1765,7 +1765,7 @@ static int zoran_enum_input(struct file *file, void *__fh,
 
 	strscpy(inp->name, zr->card.input[inp->index].name, sizeof(inp->name));
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
-	inp->std = V4L2_STD_ALL;
+	inp->std = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
 
 	/* Get status of video decoder */
 	decoder_call(zr, video, g_input_status, &inp->status);
-- 
2.26.2

