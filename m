Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC3C353520
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236967AbhDCSJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236954AbhDCSJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:11 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C66C061788;
        Sat,  3 Apr 2021 11:09:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o126so11807314lfa.0;
        Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bvM51z8cjqX/PN4QCJT3+RrZd+ouVe3FEK6NjdrSmdI=;
        b=AF6mfDWcVrLIMbqyiZR8LuSuQqxOasPruw4me7RZORQceTtBgOEWeKVqNRSYU/pIyZ
         HlPAqvGMNH1zCymtaEFDl/Lj+2S7DbrMpQIfbsMyHXNdm+UQlxZc2o5FP0w9ybMG9VHW
         lov3Tk+BcVGlm1Lk3brc5REz6s9NlkHNvCBJdvdFsVDvFla1M3LXl8WWGhsYa9I8fItI
         XS9DUlGT+/7J16HGvLSp7PfSi6xm8ZVonAHBDi5PUYk0PNdpB1d3SA4eFzKdSWnBTeKD
         JFfaS8p+E0FGrXxhj5srbWsXoA1WOzDGHplq5AVKokkIPP5gq9wp5TqbruUrvXDMUBiu
         q0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bvM51z8cjqX/PN4QCJT3+RrZd+ouVe3FEK6NjdrSmdI=;
        b=m0CnGj15Hi5XGAUzjlfJ5GMrmYPI+naoegtPVbSJgwRVuLlgX0NXpdmtXlQtB6NSKY
         8H/OCxU8KQkYyn0itv+RIBRp2zqifZ8CfqeX8ziCDjPCx8u/8KS4G9tv8ltLFAwvbowy
         8q2A7IyMaVhUG1iH1qA6lTzvYbW5KMzqnvnnITewGBe/9J+FvmimuyFmEICxlI4XVm6T
         pKeOUyfQeI+fwJk1iLItOxVu9k7lKnjmMVmjaj6YA/vLdusYmu9r0ZgIaD28tsMmDaHA
         vcdtZmaxIIOoprRSS9FEASP9Tgz+dK8FJSHOKwcNMkvw2EdWpRDEklX2QLEJDOI+LWRO
         1ZXg==
X-Gm-Message-State: AOAM532gTe4zNrMuZsxPay/fV/ArXyRP5wFzQZFewbLtGD6BPgEUxHF5
        DvncnGl9YtNS1CuCV92x9Ns=
X-Google-Smtp-Source: ABdhPJwVSdQ08JwNMq4mL4O5W9L297HUhAK4aarWCNBqfJjOxlkY5ZMTj4rS/Rr6yAeuAwLEv9OiUQ==
X-Received: by 2002:ac2:5091:: with SMTP id f17mr12690500lfm.660.1617473346707;
        Sat, 03 Apr 2021 11:09:06 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id e11sm1204585lfc.141.2021.04.03.11.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:06 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:09:04 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 5/7] staging: media: zoran: Rename 'VidWinHt' to 'vid_win_ht'
Message-ID: <652f88a0cd62b91ebbb1ccee153a73d8d8fd3fda.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename 'VidWinHt' to 'vid_win_ht' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index f0344f4a4727..49e0efcc0062 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -293,7 +293,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	const struct tvnorm *tvn;
 	unsigned int h_start, h_end, v_start, v_end;
 	unsigned int disp_mode;
-	unsigned int vid_win_wid, VidWinHt;
+	unsigned int vid_win_wid, vid_win_ht;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
 	unsigned int wa, We, ha, He;
 	unsigned int X, Y, hor_dcm, ver_dcm;
@@ -342,9 +342,9 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 
 	/* Vertical */
 	disp_mode = !(video_height > BUZ_MAX_HEIGHT / 2);
-	VidWinHt = disp_mode ? video_height : video_height / 2;
-	Y = DIV_ROUND_UP(VidWinHt * 64 * 2, tvn->ha);
-	He = (VidWinHt * 64) / Y;
+	vid_win_ht = disp_mode ? video_height : video_height / 2;
+	Y = DIV_ROUND_UP(vid_win_ht * 64 * 2, tvn->ha);
+	He = (vid_win_ht * 64) / Y;
 	ver_dcm = 64 - Y;
 	vcrop1 = (tvn->ha / 2 - He) / 2;
 	vcrop2 = tvn->ha / 2 - He - vcrop1;
@@ -383,7 +383,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 
 	/* display configuration */
 	reg = (16 << ZR36057_VDCR_MIN_PIX)
-	    | (VidWinHt << ZR36057_VDCR_VID_WIN_HT)
+	    | (vid_win_ht << ZR36057_VDCR_VID_WIN_HT)
 	    | (vid_win_wid << ZR36057_VDCR_VID_WIN_WID);
 	if (pci_pci_problems & PCIPCI_TRITON)
 		// || zr->revision < 1) // Revision 1 has also Triton support
-- 
2.25.1

