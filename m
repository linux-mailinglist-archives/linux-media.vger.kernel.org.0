Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13DB214CD7
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2020 15:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgGENxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jul 2020 09:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgGENxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Jul 2020 09:53:33 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05259C08C5DE
        for <linux-media@vger.kernel.org>; Sun,  5 Jul 2020 06:53:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u185so13856571pfu.1
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2020 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o5iFRkrCIo6DiUdwVs+/iA+6+88UWJnG9yA214oBxik=;
        b=PhvEqgFljQfscqFDtcVnFBkOhTeGHmnaj6rhcekXRv4uTcRtks0jMOdQt+crhW+xAw
         AEqga/SbkPMj5MrZl21FdeV3LVRB0weZA+GItv+SbpEfKB6DIVGJ72yiBI1+Y4zbcrtu
         TZq5JOcDQTXt2cHqCurFCr4GHKRp1hPwRBtzNll2Nv9/ZElOV8E/4/GzjdQUzfszUK/D
         0qf/Ibl3w0ftg8DGpI9sXxKeYH/0/r8KBPgdgearrBrXVzkn+1e7hfrpPCqT3QYodIwj
         s2raIrbn1rmrfQLiADew1yLqZtU8mpgoMweza0ZRvQVbVtR+6WurspJITfOu810ZV3ux
         s9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o5iFRkrCIo6DiUdwVs+/iA+6+88UWJnG9yA214oBxik=;
        b=p323drZtc2olNnErVcSJUvHsDd/LMZuoCc6Qz0hfbajBifsSDt/v8W5KCFbo5EXIMe
         0dOo60HgVa27eP3VtzOl+C/l+Ui12E8rV6l5+zX4l6fHlcYHZ68BZ0rGQYb48I3oD22y
         MTHCZJGXKSHUUIBcfeZfDNGUBlIGjN1I0uN5Mc6l6zLVVmmAJJmU8s+Akd+y+rT4Woyb
         VzOHHvztG67J7t9i9YpULLB9+VJPzHbCTCeX0KqLSaQZ/NyZz1QaGJnJGbY6zyFOvKB8
         pH2xiqtf7PPv7hzuPeL8rxnjkG4vyw6UVn6XClAv9P5UlJStZvRtU0AjA71VKEx3iiQ6
         MWHA==
X-Gm-Message-State: AOAM533kVlOw4cST+ZRK0qkIt7+3PA5CwvlIj6pP3Ms1Equ1utGGMX6M
        1ZUR8SwxPAwBwFUJgl2sR0gQBA==
X-Google-Smtp-Source: ABdhPJw73AQ5XU0rvuolk+skiGszUyUoXZUHhNLIK+h7b/m67SIOgzn5obks5BtfTK2oRB6qWsWUeA==
X-Received: by 2002:a62:e119:: with SMTP id q25mr23131573pfh.300.1593957211499;
        Sun, 05 Jul 2020 06:53:31 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id c188sm16661793pfc.143.2020.07.05.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:53:31 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v10 1/3] media: tpg: change char argument to const char
Date:   Sun,  5 Jul 2020 19:23:04 +0530
Message-Id: <20200705135307.27564-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200705135307.27564-1-kgupta@es.iitr.ac.in>
References: <20200705135307.27564-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the argument of type char * to const char * for function
tpg_gen_text().

This function should take in a const char * as opposed to char * as it
does not make changes to the text. This issue was found while passing
the order of colors of tpg generated test image (which is a const char
*) to this function.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
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

