Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514892074C9
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 15:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391062AbgFXNoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 09:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388502AbgFXNoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 09:44:18 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653A3C061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 06:44:18 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f2so1073491plr.8
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=AiwPFodV68n/l193jLQzyI/XsSDoyctwtNrxbM044mIAiYaN5Idf0LopBbgDmBJOWI
         vyPtT4rt6HqxUOfcLkWv7b9bhuisuKUBW0H4p7pf3TZD25jphe82BK+t4tO8RNJOYgVT
         p98cHUOskWXZgheETIpQhnsmKD2kXOzjCqBeqxd9K+S2HLuBK64T3p14jt4u/Kqi82tf
         znMczjrtcAK/I3GgVAGf60PXbH7yNBelT+nSArxyf4vCigxINdql6cSHLJ71sROr9PBU
         cIjkfi6HrmgGUBGPwE6Qdjy+drNXtTy+f5oF0edHZ0yn0d8iV9wsMjzFyHwFLbF/qFyd
         rGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ancI0DiJuBHXSKZ5+IbcX7oH9DUg3u3wUo5JHY1jQ8Q=;
        b=S1C7eAXh9A56MKywJOPYCVLfbf4y0ZfY8zRzO3LTls2rd9gidjmYGsr7Vy0q9rivWs
         O19N9wZAp7GpT1ilbPRH64XQpNEscuiXPEeATnQXHHqnaO6qxjrzn6qAuxatZWWYn+5M
         kGB7bJEYivlk9AwRrt7UH5Q3w13Fosoomp/5KeoCjGLpGC8oNt8EXLUKS7tPAC+P+8qK
         C56KJxcshF6JMpF/yUqJO5mNz/qKqqq1DX+cJOl6dSBlVHFJEbpByt6d+gAvvXO4y+nM
         z55m/rt3Gi94qHKUv7SQLrpb/cf3CSFgA9k6z2QgV7Qk7VBsgYRKzVQ148jVjqQpFiCP
         Mzmg==
X-Gm-Message-State: AOAM532MhJi85BUCkrrM4CnnBkzlIqF8VaTPngJURLpeAhJR5VYzvWlX
        9mfDFh9Ab8RF4DVcPOiQSFL+mg==
X-Google-Smtp-Source: ABdhPJzmpOkmB4Il61sJRvl2YVfP7vvsx93Vsc8mJPGSsphZLsMi5RmLLCUGlqRFnjcS58AL6MbcBg==
X-Received: by 2002:a17:90a:e384:: with SMTP id b4mr26147917pjz.134.1593006257856;
        Wed, 24 Jun 2020 06:44:17 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2401:4900:4174:4b69:7433:bb27:35ac:b181])
        by smtp.gmail.com with ESMTPSA id i184sm19478065pfc.73.2020.06.24.06.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 06:44:17 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v5 1/3] media: tpg: change char argument to const char
Date:   Wed, 24 Jun 2020 19:13:52 +0530
Message-Id: <20200624134354.7023-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624134354.7023-1-kgupta@es.iitr.ac.in>
References: <20200624134354.7023-1-kgupta@es.iitr.ac.in>
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

