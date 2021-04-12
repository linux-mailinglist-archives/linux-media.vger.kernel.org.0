Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5FB35C883
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 16:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239497AbhDLOTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 10:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241920AbhDLOTM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 10:19:12 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C93C061574;
        Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id r13so2933419pjf.2;
        Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=;
        b=kAr42R2krMprDasFsl+izamVChxE+LZ8Vd0aPw47+CCHoupj1Qgnq68hh9kaimTv7F
         37gTXi1cEh+NQk9l6uzuQrdIhj/8ScTKyLBVwYcOjRw9TDXI0peJmFyFq4ikp5qLPnzX
         fXZA72Vq8jWSg0VH0W7sfejshHq75rG60XhYxtyYvEwAThHqqIsFMZN6YEOUwTQWUuzh
         IIDTwHv7zQfSZXfOsovIERUgBePRT/8dJFfoWIc0HkJ8n5vCTJyCVaBu8e9rntDVYWXZ
         7nu29nmtdJzotxfPnQeWQ4tMZ6IxdL9d3i/LmtAqO7DlXrbp5Pj3xdetRHlCrKt+lMP3
         gANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=;
        b=B61F0fapGFPD3fMkMMjpcGhSVKY7D56G2oBvXaGIGCdAY6wBHIxHwiDakOUnzek1Rh
         UUZLDjy3S3sKISwsi1wjEgG7r+kjoHbcjNLyTWYXGyJ2QtAAoxlc1opU/vr1raq9C0wl
         h4z1ZXXT+E7U2KOY8OMku5Uvb4+E677XMYMmH6KTd5JQnOsdOgpkmZe2pQXZ5ykazaeq
         FvHIO8pp6LpVhhn6FfEFbmKtUpoZxOk4lllNFs63GhfFc03rE8FAWrq3rxIvDKOOm8N9
         Vq1XVLqJTTozM04XGb1SQT7F2kjAgsMYKz69nY0Xj0nXd6m0CbiJXbp3UR4i8IzFdCwj
         2oQA==
X-Gm-Message-State: AOAM5335nPm6T112wR7qoo97BJMd9ayNHGqoThH4Ag5a+D22oTo5sioE
        LCNHFSn56PP43A5bNuFiq7C5h08fSJ9Epg==
X-Google-Smtp-Source: ABdhPJy1IOQSh91XC3ctGh4jru7zmv9U5bKzAJBmvP804WFF9A+NhYzJx1RaM2WGdTkFa91OwV6kOg==
X-Received: by 2002:a17:902:ac89:b029:e6:d199:29ac with SMTP id h9-20020a170902ac89b02900e6d19929acmr26586468plr.46.1618237134354;
        Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id gb15sm11274248pjb.32.2021.04.12.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Date:   Mon, 12 Apr 2021 19:48:45 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: Subject: [PATCH] staging: media: meson: vdec: declare u32 as static
 const
Message-ID: <YHRWxeXA9m+Gt+e+@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant throughout execution.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..ea86e9e1c447 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
+	static const u32[] canvas4 = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2

