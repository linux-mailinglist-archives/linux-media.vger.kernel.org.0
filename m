Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A9420B09D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 13:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbgFZLgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 07:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbgFZLgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 07:36:41 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF63C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 04:36:40 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id m2so4837934pjv.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=dL74L/zZ9BCZoo+PCRLQB08bPtBOvxGg1hZA+U17dmRj+ppEOwCdggfQeRcWIt+vRk
         W/AT3zpaRrzMiI6lyQssdG8lydU7xNOgjgUL/Nx9zCIYHYdGEKIoijiEZyRAWsobMfAJ
         IYSdQ1wHfgZ1a2pIZ78ZxAMdt/9TYUccBYcXrNiztpvZ/sc1OCErUGrSS0HDONzyTwDQ
         NjkuJlmWlLOe6O86M4P7ZOot9BLLbp+saJcfhoV5OCsstFA3gGvnq+jgnMku5mkQ6/a1
         ERMUJAK/pTnx5MvrtGFcZW2dLfGZ7kAUHLQmVwKWhT2MvZ75aO3dARUB38tExu5hO02M
         kzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=huLL7ZfU4Caj5lM9gW998mSpauCoxSy/D0+AhmSzYYRL2X0s81wu/rrIxjVtJYAsaY
         hrXtG6tIiDTGagEjPO5eHMUk9tHCnHloQMkoYoAmrAFLU9PTCbodnVtc8lmceKawiSTS
         EEdwAR1gOxIP/TxgW+ZLJrzYsblHCzM3Nyjo6gr4rHLOgPe9sIVO7HSU0BlH1F+EYmyW
         OQlulm57D+6JPp+Li1w1SAMUa4DC9FWQWAluqvTDiDJmxB4NKgB+3mlDzETqOHVY8a3E
         x9XlQZ1qU7L52Rrf2DEyBTX5xePkABtUExNf+fxKmWHq4mcz0gmqCa2bv/A1AJCBElsz
         +NDQ==
X-Gm-Message-State: AOAM5308aGx1VMU7IYReYSc62a1jcXayz11QF6etr4oFoWuwjI0Pyi0M
        6rbH3H9/vABHREQLdrPQ07dHQQ==
X-Google-Smtp-Source: ABdhPJy6ErsJT16VPFHKOiaPUEdP1mlwdhrj7eydFCYmEdwSrIFEUXAYcV5RrNW1YACyp6kdQVjgTQ==
X-Received: by 2002:a17:902:9303:: with SMTP id bc3mr2389843plb.56.1593171400185;
        Fri, 26 Jun 2020 04:36:40 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id i26sm25994768pfo.0.2020.06.26.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 04:36:39 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v6 1/3] media: tpg: change char argument to const char
Date:   Fri, 26 Jun 2020 17:06:16 +0530
Message-Id: <20200626113618.15280-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626113618.15280-1-kgupta@es.iitr.ac.in>
References: <20200626113618.15280-1-kgupta@es.iitr.ac.in>
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

