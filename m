Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E86335B03F
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 22:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbhDJUAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 16:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhDJUAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 16:00:17 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6440BC06138A;
        Sat, 10 Apr 2021 13:00:02 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id s11so6543806pfm.1;
        Sat, 10 Apr 2021 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8qqSBlwS3BjvcFhE+2QmiRSvqs5dG4808gdiJ8MHloc=;
        b=R9E0t8jbEk8pEznmH16EJC3SE9XWeFJKEto+B3bLUgFg/KNcTYMpQmo5lVhdsvQ85B
         tYNRDvqslfA/C8KzTBPg5ppe2T100rPX/fzVtEKTTDmbluutulvnr+kYmsSM/KVg2Dqz
         WT6997QdO0bElsR1Z4dCJoDOdV/sBmL2vWy81JUG5PfaOTSETIrrNPpQxpSLB8UVe0K0
         BoXFgK2YWsYC5TwHTeo1/IW7OKbza3zuFXSXYAtRUYbgsF2fmVaLFrzb+4mUfjXWG6fx
         m5R/v+TiDuw8t7Z8HazpEI26y5iwqnXYW3gYbDOfLVljMJiPWzvSup+4cn9EVLwMSUgn
         +xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8qqSBlwS3BjvcFhE+2QmiRSvqs5dG4808gdiJ8MHloc=;
        b=ASwKMpFjlB1rMNZFr3KTAhxziJuSRjlMk8nXJ6HlkKmYgj+QA82YUyXRAsDOkgQyoL
         UtkKTdWORVlcat/QpA6b/GPY/VxoKkXHSAKMEa9GeZz+Qa/br90xvoo+g0trNhn3DG2y
         HMnz7TtKub3Awvsy63qBz/DlUdoePmW2fDe94eAk3pkI9Yzaa4g+rmdhPW94iojUHact
         ihz7TgrJSKrtWhfVJ2/vuuhXTv/jm+tICERdF3dfq2IQHO876481YfNMQo+ChzH0Mb1p
         2ttCzdr9LUsJ/UPaLt2jdtUnLddMI7nc3kfO2Q91u1PoucT2529Fxx1RP1Z/GiqZwB6O
         WaGw==
X-Gm-Message-State: AOAM533TQBQXw6K776XdaRYjNB05lrb6MHIv8XGscTspGqbNZpvXLCHV
        GWe0cj4xiz2vGdGHpaa4SZ8=
X-Google-Smtp-Source: ABdhPJz9ZE6/H20EWXVj5VokMTn6CzyncVCxx+zAozO8FqPL4U15btcy878L9n+lVDVJjBz5lyZ5/g==
X-Received: by 2002:a63:c111:: with SMTP id w17mr1829524pgf.127.1618084801801;
        Sat, 10 Apr 2021 13:00:01 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id k69sm6554464pga.45.2021.04.10.12.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 13:00:01 -0700 (PDT)
Date:   Sun, 11 Apr 2021 01:29:53 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
Message-ID: <YHIDufKhTEeuxyl5@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
This indicates the value of canvas indexes will remain constant throughout execution.
Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
u32 reg_name as it will contain data/registry bases to write static
const indexes declared above and will keep track of of contiguos
registers after each reg_base.
This makes code look better, neater. It improves readability.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
 drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 21e93a13356c..861d8584f22f 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_mpeg12 *mpeg12;
 	int ret;
+	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
+	static const u32 canvas2[] = { 8, 0 }
 
 	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
 	if (!mpeg12)
@@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 		goto free_mpeg12;
 	}
 
-	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-				  (u32[]){ 8, 0 });
+	ret = amvdec_set_canvases(sess, canvas1, canvas2);
 	if (ret)
 		goto free_workspace;
 
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..df5c27266c44 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
 }
 
 int amvdec_set_canvases(struct amvdec_session *sess,
-			u32 reg_base[], u32 reg_num[])
+			const u32 reg_base[], const u32 reg_num[])
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index cfaed52ab526..ace8897c34fe 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -17,7 +17,7 @@
  * @reg_num: number of contiguous registers after each reg_base (including it)
  */
 int amvdec_set_canvases(struct amvdec_session *sess,
-			u32 reg_base[], u32 reg_num[]);
+			const u32 reg_base[], const u32 reg_num[]);
 
 /* Helpers to read/write to the various IPs (DOS, PARSER) */
 u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
-- 
2.30.2

