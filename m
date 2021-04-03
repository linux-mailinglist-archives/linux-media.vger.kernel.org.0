Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CFE35351E
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236939AbhDCSJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbhDCSJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:09:07 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D557C0613E6;
        Sat,  3 Apr 2021 11:09:04 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r20so8684240ljk.4;
        Sat, 03 Apr 2021 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+zl2y4WcU4R0W3ITuE2QJIZQ00fTmDL+l8JpHXE4Pss=;
        b=Ef4g5JV8ccGUQyQlk37yDwtMcWa7IICkX5aS3i5PlzDbvJwpzuRFqDQ5siaBKuyi9W
         dveov30OlZGym6TCbh7yi8zp3gSVLpfV6QzL5zBZpwZaSB2nwszwCnyv/UVIsKhIu3mP
         ch6Abac6Ir0239SFunFsDOhDBxKEHjB7RRTcMEXvphtPmSBL/fwuHBoRo9fk6PdkXM0h
         ef2+OBKWNCaKjKuOQVBgurIOHfHw2YLKqLDxnlGIz82HmcmiGTeKL0fGF4PCta1Cvy3c
         aY7KnSc06aUg0Q0+HH9m+KrtEpxTfEPo2adSud/KzaMenzb1gsD7N3jPGqI5L36suWtK
         NX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+zl2y4WcU4R0W3ITuE2QJIZQ00fTmDL+l8JpHXE4Pss=;
        b=gfPn0r02kHbOHbBs4vuC742aw/1iDWxcmfAbTysaOPJfW9CEhRRZ3NVC44ugT73K4q
         FwjTnX+cWnxdV31Aj9amduVCbmHctpX2nkiM4DStlgsDa18k5eUVuhzmkTTRUVFjmuvY
         Dwi6nDVeWImnb97aTVpu8dHOsZmWmkgzbD3YQ0vBwPaiBDo0D5CHlUt+Xi1P2K0lJYNO
         UkB2HkdL+9VNfyQm/WkNJddlgHdoyPjjzJOCyl4xlSQTXQGovmliU1woRj/Ve359QPYK
         EkZPb/5WACz6n7ncQPRiM25BdYth/cw7/d/G5cGRW+k22fR8amTUG4ydAZ+xlHUfYRNj
         eA5g==
X-Gm-Message-State: AOAM53027qYzFQvdksZykT+1boSDMtfm1FDNP7hrmYyJYx/EwFb76yBb
        cEubuPGiI29WhFUf1VKvEX4=
X-Google-Smtp-Source: ABdhPJwYgsFnK5tSAVhVtZgSGw+9HqINO1123L1juHBNuCIbsR/nJPfcyQ60/A7PJj2KmK0esZX2qA==
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr11506253ljp.252.1617473342760;
        Sat, 03 Apr 2021 11:09:02 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id h62sm1201544lfd.234.2021.04.03.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:02 -0700 (PDT)
Date:   Sun, 4 Apr 2021 00:09:01 +0600
From:   Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 3/7] staging: media: zoran: Rename 'DispMode' to 'disp_mode'
Message-ID: <0e31f8ef345b5972ea3f16ea29f962286ebab3e8.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename variable 'DispMode' to 'disp_mode' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 6764b51fc595..8891f11f6276 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -292,7 +292,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 {
 	const struct tvnorm *tvn;
 	unsigned int h_start, h_end, v_start, v_end;
-	unsigned int DispMode;
+	unsigned int disp_mode;
 	unsigned int VidWinWid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
 	unsigned int wa, We, ha, He;
@@ -341,8 +341,8 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	btwrite(reg, ZR36057_VFEHCR);
 
 	/* Vertical */
-	DispMode = !(video_height > BUZ_MAX_HEIGHT / 2);
-	VidWinHt = DispMode ? video_height : video_height / 2;
+	disp_mode = !(video_height > BUZ_MAX_HEIGHT / 2);
+	VidWinHt = disp_mode ? video_height : video_height / 2;
 	Y = DIV_ROUND_UP(VidWinHt * 64 * 2, tvn->ha);
 	He = (VidWinHt * 64) / Y;
 	ver_dcm = 64 - Y;
@@ -362,7 +362,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	reg = 0;
 	reg |= (hor_dcm << ZR36057_VFESPFR_HOR_DCM);
 	reg |= (ver_dcm << ZR36057_VFESPFR_VER_DCM);
-	reg |= (DispMode << ZR36057_VFESPFR_DISP_MODE);
+	reg |= (disp_mode << ZR36057_VFESPFR_DISP_MODE);
 	/* RJ: I don't know, why the following has to be the opposite
 	 * of the corresponding ZR36060 setting, but only this way
 	 * we get the correct colors when uncompressing to the screen  */
-- 
2.25.1

