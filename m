Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7520D353522
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236972AbhDCSJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236953AbhDCSJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA84C0613E6;
        Sat,  3 Apr 2021 11:09:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i26so11731560lfl.1;
        Sat, 03 Apr 2021 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O3p5QBNJq6bpJriPcr9hUrPsu9ysLNiodRXiRx02CbM=;
        b=ZVCczNC1Ysv5H3DSWYKx5vFPj4JxgQ2wgTw5t35q2XPko5TERIcOEj58CJK2WOb17C
         JkeipxkRHbcPOS1nPcR6YaiGJa4fHsFpyi1QxarMFT6MkUDurwT8vhFQ1Iw5OuJiD8tq
         2DIiqaBlyJJUKiTXSV0FQ/0hTGV1m0IeHA6QFs4KrTeC9hvww2lMRE1nZBayIPFl2icQ
         uCpTcRkk2u0mgqXWOMdEr96zvRstfATAQaG0rT5lNwseSvAyrrua/ekXZibSJNG5zmGI
         qXhoIinaxyKcRJfLoe7WityyHbT95yqEmSH61nKNxpmFAZvlHV0KFmiSr29xnapM4CV/
         qrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O3p5QBNJq6bpJriPcr9hUrPsu9ysLNiodRXiRx02CbM=;
        b=AoEufdfiCInH8fZEctG1MNhhkCT8yJC6ug/7HTT++3OdZWO4czv84jUmqcWg/EgynK
         ANxegruMorbNj0peBT2rlcYwtRCNpznNZSQA++vp/GXD5ycejYvCSL4hrzuqllrrauY/
         2SXMDMBmudmejnAlGvGH/GUY+SVf7hZBm3kDEVe2NnY1GP4M3omFzfDwnZVKxhZzaSlZ
         7LA4GxO2ZhOPFp0dvud6IwTNyHHWMFdnvi+/9boSI9fBOdBppEhxuLxjfeSZO5RJoe+g
         Q5VOJ0pGOe0VlBYXX3PSfppfIhhEuofcjSeyj+mpEsodT+0iM5GDjmzSyROJSazezlPJ
         Dwsw==
X-Gm-Message-State: AOAM531rgGGgHcv4Ks9hLoVdrymkzE2Xk0LwhgP4bhuXs8JUIpPhG1cV
        4DtjA9FZAJJY/3bc+YfuKG8=
X-Google-Smtp-Source: ABdhPJz6zYAb+LZhel7ZPyzNVMYKG/lTpN8Wq7BccQ3jp4Y7qNVdYIe4c39cpUAUEbzPGlEhslmoYQ==
X-Received: by 2002:ac2:5306:: with SMTP id c6mr12081779lfh.88.1617473345910;
        Sat, 03 Apr 2021 11:09:05 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id d8sm1207325lfa.49.2021.04.03.11.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:05 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:09:02 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 4/7] staging: media: zoran: Rename 'VidWinWid' to
 'vid_win_wid'
Message-ID: <426cd7e38b03926aa8de9e4d3e630433e9c11f3d.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename variable 'VidWinWid' to 'vid_win_wid' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 8891f11f6276..f0344f4a4727 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -293,7 +293,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	const struct tvnorm *tvn;
 	unsigned int h_start, h_end, v_start, v_end;
 	unsigned int disp_mode;
-	unsigned int VidWinWid, VidWinHt;
+	unsigned int vid_win_wid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
 	unsigned int wa, We, ha, He;
 	unsigned int X, Y, hor_dcm, ver_dcm;
@@ -316,9 +316,9 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	/**** zr36057 ****/
 
 	/* horizontal */
-	VidWinWid = video_width;
-	X = DIV_ROUND_UP(VidWinWid * 64, tvn->wa);
-	We = (VidWinWid * 64) / X;
+	vid_win_wid = video_width;
+	X = DIV_ROUND_UP(vid_win_wid * 64, tvn->wa);
+	We = (vid_win_wid * 64) / X;
 	hor_dcm = 64 - X;
 	hcrop1 = 2 * ((tvn->wa - We) / 4);
 	hcrop2 = tvn->wa - We - hcrop1;
@@ -384,7 +384,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	/* display configuration */
 	reg = (16 << ZR36057_VDCR_MIN_PIX)
 	    | (VidWinHt << ZR36057_VDCR_VID_WIN_HT)
-	    | (VidWinWid << ZR36057_VDCR_VID_WIN_WID);
+	    | (vid_win_wid << ZR36057_VDCR_VID_WIN_WID);
 	if (pci_pci_problems & PCIPCI_TRITON)
 		// || zr->revision < 1) // Revision 1 has also Triton support
 		reg &= ~ZR36057_VDCR_TRITON;
-- 
2.25.1

