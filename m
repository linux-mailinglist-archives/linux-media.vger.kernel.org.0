Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C5920FD0B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 21:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgF3TvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 15:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgF3TvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 15:51:06 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E59C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 12:51:06 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so4493136pjb.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=FQVsZ98pYkmWDMkBuZCTWvKgDO6euIiyscquOlbOmcoHQoo6wutBML9wKCscR/MDo3
         AxDOZTddsf564cX1HZoyIcZV/Beh9k7X+Rm6C0WRU+XnXItAnuMl6EtR4DGm631aLv8L
         Xy/w4Y7v5gdSB3KhAHGVaGYJ5MtGL/WjxQtmv99hEjUpbQKomUQVhCuvilXIpKT9+T04
         f5vLa1y74sq6sgltWJc1/UMJaWlzpWHb7aiciYfQuMVj7BtRKAgVy18tntQhxSgTdFy+
         5HOfGJIJ3M5Pf448z39K4rxsnjpmZxxcaFwo16MQRZ8ksc5R1RdrSJNeYZoHxRwz4+o5
         lTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=fh/H5MPjBiG+3joV1Hq90nmf8l5RBALAcRrsPX3fhxETts/FOZMcdcUMaPMKsRJtoR
         wiF8kcdTmA+mJuMi0pTfhl89sYacKRAnuQhNG2SO/hz7svYF0L5A/D/L2l0Tu6UH9gcs
         qypByP8a3TuvUJU178qZyZbgRM+PsZZuMVar1rxdjBqdSF2WTx2Xm7FzciKWtoggpSbs
         UyMqrj+cmd1NksWhmldKZGgV1TK97TvdoeGuMlzBjlNJcGH0rqCl7EZv3Nfl/dXrQ0Bj
         zlzKMYYYdZ0kP1RiQYPkZ192EGntU4SU8gZ5uLyaMi9yTyI8F1Al2tGxc4BWVKlzklDf
         TvpQ==
X-Gm-Message-State: AOAM532YSkiaGOcqZ/M+drgla9gDEU9W+MIJ6zQFq67w5hQb8yy5ALZP
        yZS9I5OD1B3eIhewIZ2FsuTQYA==
X-Google-Smtp-Source: ABdhPJwNODeZeudQYcWBJdIPl+YYhPDxfULlLnsqfxCNMteLtekFnk29oNh+GtFOwiH0lGIXR0HLIw==
X-Received: by 2002:a17:902:760d:: with SMTP id k13mr8556590pll.144.1593546665477;
        Tue, 30 Jun 2020 12:51:05 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id o11sm3362328pfp.88.2020.06.30.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 12:51:05 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH  v8 1/3] media: tpg: change char argument to const char
Date:   Wed,  1 Jul 2020 01:20:50 +0530
Message-Id: <20200630195052.23880-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630195052.23880-1-kgupta@es.iitr.ac.in>
References: <20200630195052.23880-1-kgupta@es.iitr.ac.in>
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

