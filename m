Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80061210C39
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbgGAN3x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731009AbgGAN3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:29:51 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433EDC08C5C1
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 06:29:51 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e8so11735085pgc.5
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2020 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=45mvoeQBux3MWSaz6RzR2PRZkBysjO6mMNQF+8/LBaQ=;
        b=QBcptKTvxEQN+V/Do4Qokuk1wXiQmIso8OCQ3nTgj0q0MIIPYmUwPCemDz8nR59JDy
         RCA3mjY79KrlqCY7qzWWNpzODm93bbsavVdESkYepz43+rgcm6PulCOus37a0fUMz4Rq
         Y6FzG73J8+UjhNRgrvWvHblFiv2cRrubquxCC8q2xqdVp2kaY3m3oCoQMMut7KP/rSev
         6Eb7sBI+AM8Yb4bNu2yKbffciDmX/aYUPKL7qUSroUcYTE80g76F6zMRMe/3zC+rk9ap
         4DFKRhmiDdrNLShGSvbVTTCV6DBczyvpHLxuFyD4h4FGXfC1HNXujLAQm2FQuqexWQI5
         Jijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=45mvoeQBux3MWSaz6RzR2PRZkBysjO6mMNQF+8/LBaQ=;
        b=pVYAIl2Fx+zJYFp7QmkIND6FNxNHEuUpgaLPQkfSDHp04ocTc7hX2n/mVCVZTPeusZ
         RtgfMaI0FB957hfsAIauCp8yV171Ojgrbx3bie0xFjCO1bEU3DsP1o6zhb58emf+V2UY
         iwCzQKWx3Z8yLfZ0Nt0LdTwVLAdXmdi0oYZ71dwAvek6JBaCx2iXI4d8NYNeHg0UaikJ
         +XtA9kcNw39Sayfk3cYRlIHDdvU/HpmZ7lLxBj0vl3Hio1ZkUqBgRdeXdeKqvBBT15OC
         FHXwLR6fcdzDWa2uVEBQDjOyChTYfgsgoMwosHXt/WykrsMyTRQrRw+xjyfUEsKLq5Aq
         rZUg==
X-Gm-Message-State: AOAM530IjpDXQIaNk1aaAX3+eo2bpQUjYPW4CFjG4KXhVJdkJbmJp/Ez
        kqjM1Rjm/mjn0KAQ0Bj8rtdgNA==
X-Google-Smtp-Source: ABdhPJxEX6dejXzdDajn5bAmq0FPEu2Br4cDaz67y/xHqFQDrCCzbRF0BrtUR/Ca7Kf3LdqFC5IYKA==
X-Received: by 2002:a63:d944:: with SMTP id e4mr19775924pgj.376.1593610190696;
        Wed, 01 Jul 2020 06:29:50 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id p12sm6036493pgk.40.2020.07.01.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 06:29:49 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v9 1/3] media: tpg: change char argument to const char
Date:   Wed,  1 Jul 2020 18:59:38 +0530
Message-Id: <20200701132940.21257-2-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701132940.21257-1-kgupta@es.iitr.ac.in>
References: <20200701132940.21257-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the argument of type char * to const char * for function
tpg_gen_text().

This function should take in a const char pointer as opposed to a char
* as there is no modification. This issue was found while passing the 
order of colors of tpg generated test image (which is a const char *)
to this function.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
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

