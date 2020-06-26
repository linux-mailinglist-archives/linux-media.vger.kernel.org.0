Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CDF20B225
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 15:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgFZNHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 09:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgFZNHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 09:07:17 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3417DC08C5DC
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 06:07:16 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cv18so1576648pjb.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=Pn92yGRD/fxcPJIDYHH4rJLJdcosXAk1QbwpVThtFtWZA4uRvJigz+72Ve5FH6LZSB
         2+cGYSK6eQ3URdV5czn6UhOHA+HB5RmBSmX/sdQulJQL8BXiZTVGHfREsUXbr1RnMthP
         3fv840ufMK+0//ndQNbGhRnt74b9omCVgn8IVF8YDSqAzmhCYmzLYXq2+Rc6EDrJTPBZ
         WA6q9JiVY7Jj8VFlzWSCitwbYenH0JTtxIIa2R7oZKIjyExzryBP1D3sZzfIQt8kUpOY
         YhFv28eExbP3BQkfFFGn3a8bVojqOjJXZ/07B9dRqsSuqy7+JUXAHH+4l2i93vdWCPC2
         6eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=uAKvhcXYR4t05GPrz5RgYXCZQ1L5ZmH6+XFOGiH0+wsYLF96mUfuqA7wSjyE9bsxEp
         qIYbNzMmyYuHO/DsFiP8WaCHHFIVrFcjs2w6rxFn64Yxyp1joZYd0EG3KqV8nnn5dWKN
         Xcz9fq0A0RN61pOWTaceuJCKABW/Sc0oF6IjSsY14+7Ee9SBTE8sokHA1Pe2q3dO2Ftv
         g1kRwWI+xrmMjVs6Dl4DpXHAhnUabW1t61/lsxat7A7MDdCEjA8OZaL8atRqtPZ6MF4D
         tuEz2ea09sEMrbJ1vq5QJ5bLPb+/11ZZKl2RTqAtUFolzOo6qqi+iL9cDiDcoPW0R7FS
         3PFQ==
X-Gm-Message-State: AOAM530bGFJewZzquHwTpwTZpnVbn9l0ixU4H4ZVBJhE53lJgxm44QKZ
        eGBovw7xBwqn62/fEBYOkMaZtg==
X-Google-Smtp-Source: ABdhPJyxpU3cjLnT+Va5zw0B6S0cJHZYQEkRKkqEvucXTfYhswBUroZYJV5gADP8AEnWiDTJ80+U9A==
X-Received: by 2002:a17:90a:8b09:: with SMTP id y9mr3403487pjn.90.1593176835483;
        Fri, 26 Jun 2020 06:07:15 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id p5sm27715127pfg.162.2020.06.26.06.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 06:07:15 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v7 1/3] media: tpg: change char argument to const char
Date:   Fri, 26 Jun 2020 18:36:58 +0530
Message-Id: <20200626130700.2453-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626130700.2453-1-kgupta@es.iitr.ac.in>
References: <20200626130700.2453-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the argument of type char * to const char * for function
tpg_gen_text().

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 10 +++++-----
 include/media/tpg/v4l2-tpg.h                  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 50f1e0b28b25..dde22a4cbd6c 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -1927,34 +1927,34 @@ typedef struct { u16 __; u8 _; } __packed x24;
 
 static noinline void tpg_print_str_2(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 			unsigned p, unsigned first, unsigned div, unsigned step,
-			int y, int x, char *text, unsigned len)
+			int y, int x, const char *text, unsigned len)
 {
 	PRINTSTR(u8);
 }
 
 static noinline void tpg_print_str_4(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 			unsigned p, unsigned first, unsigned div, unsigned step,
-			int y, int x, char *text, unsigned len)
+			int y, int x, const char *text, unsigned len)
 {
 	PRINTSTR(u16);
 }
 
 static noinline void tpg_print_str_6(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 			unsigned p, unsigned first, unsigned div, unsigned step,
-			int y, int x, char *text, unsigned len)
+			int y, int x, const char *text, unsigned len)
 {
 	PRINTSTR(x24);
 }
 
 static noinline void tpg_print_str_8(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
 			unsigned p, unsigned first, unsigned div, unsigned step,
-			int y, int x, char *text, unsigned len)
+			int y, int x, const char *text, unsigned len)
 {
 	PRINTSTR(u32);
 }
 
 void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
-		  int y, int x, char *text)
+		  int y, int x, const char *text)
 {
 	unsigned step = V4L2_FIELD_HAS_T_OR_B(tpg->field) ? 2 : 1;
 	unsigned div = step;
diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index eb191e85d363..9749ed409856 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -241,7 +241,7 @@ void tpg_log_status(struct tpg_data *tpg);
 
 void tpg_set_font(const u8 *f);
 void tpg_gen_text(const struct tpg_data *tpg,
-		u8 *basep[TPG_MAX_PLANES][2], int y, int x, char *text);
+		u8 *basep[TPG_MAX_PLANES][2], int y, int x, const char *text);
 void tpg_calc_text_basep(struct tpg_data *tpg,
 		u8 *basep[TPG_MAX_PLANES][2], unsigned p, u8 *vbuf);
 unsigned tpg_g_interleaved_plane(const struct tpg_data *tpg, unsigned buf_line);
-- 
2.17.1

