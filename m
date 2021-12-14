Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0184947476B
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 17:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235706AbhLNQRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 11:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235684AbhLNQRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 11:17:00 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E24C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:17:00 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso16628643wml.1
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yfJZtohVWDSZMzjIFwnIJSA32PL2KWx5qeRnts2nEJc=;
        b=WRjX41ehg7tciFFyuUTxc/2pAQAgBOczsZ1wOBkNu9SkIKofB5qwSh65Y2JXD/fSt6
         cVGQuYsv6LmXoJHcwimQvOALb8GzauatmczbDujeftSOyWBwFK9PNwP5k7/02sK30t/T
         G6kgUHJTD9Y3MkSBsHGkVItKWCSuynRtYM92UewPaLNPos1e7Ua7Esj5QwMRD2WDNZDp
         pnYHBfs/wxNw846mwfjY+7gsv2zumarrT5fS/3UJKP3hBX9vAiZf8YxQqUMyhyzhibho
         56TBaLydOPoetIsFqKhivK5vprH6W2J6dozBVeN1feZYUqDpy/0qi0jp9xG8h4q0jU5g
         H08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yfJZtohVWDSZMzjIFwnIJSA32PL2KWx5qeRnts2nEJc=;
        b=gFNO0Uxx4OVZn3Mv3lw/z0aLnfLAnl0CLNFO++pbe3/s805+yChKskJKSDmv01rfJv
         y1r/znp5xHT+AVpS0XvGDLcglWi8UwuhqjSZKlvlCpJ8D48XF7ZPCjta6ngM7FZKQp88
         QJGgjesE/YWkhzKrDfQ/hCWhGXaWTOOcvtWOPXiGPuijxM/W3DGmbVCr20+HX1IS6RiR
         V2aQ4G0tYzlF9q7Sopg0SOa38K9B6tf0doKG/a2Ay2E3c4HKN3fM2jpLv5Lt3TJqeWXM
         9IrhHw4svPmwmA4t4wGtMFaYfY5G0fG8W6tCakklG+U2IcrXLm2LWk7uHLR8t8zY84+x
         cacQ==
X-Gm-Message-State: AOAM533EWt9xXlKXCUWSeaJL46WoMmAZBQq88P/VRZDBmdtcDcVRsxO2
        +sokIWzbQfqBJKtDcl12UszE0Q==
X-Google-Smtp-Source: ABdhPJyEECFe5E5h2hoiIPTiQTsMGX5ROjNLPvytp+z8hY51tg+CyIAMgQrNSBpvSwVes3YzLv5CEQ==
X-Received: by 2002:a1c:9d13:: with SMTP id g19mr47518896wme.41.1639498619019;
        Tue, 14 Dec 2021 08:16:59 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:58 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 16/18] staging: media: zoran: fix TRY_FMT handling
Date:   Tue, 14 Dec 2021 16:16:34 +0000
Message-Id: <20211214161636.1886900-17-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

TRY_FMT must not set actual capture values (zr->buffer_size in
this case), since it is a 'try' only.

zoran_try_fmt_vid_cap() also didn't fill in fmt->fmt.pix.bytesperline
and fmt->fmt.pix.sizeimage correctly.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index dd19ee023d91..367fe4be8357 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -398,7 +398,6 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 
 	fmt->fmt.pix.sizeimage = zoran_v4l2_calc_bufsize(&settings);
-	zr->buffer_size = fmt->fmt.pix.sizeimage;
 	fmt->fmt.pix.bytesperline = 0;
 	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
 	return res;
@@ -433,6 +432,8 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 	bpp = DIV_ROUND_UP(zoran_formats[i].depth, 8);
 	v4l_bound_align_image(&fmt->fmt.pix.width, BUZ_MIN_WIDTH, BUZ_MAX_WIDTH, bpp == 2 ? 1 : 2,
 		&fmt->fmt.pix.height, BUZ_MIN_HEIGHT, BUZ_MAX_HEIGHT, 0, 0);
+	fmt->fmt.pix.bytesperline = fmt->fmt.pix.width * bpp;
+	fmt->fmt.pix.sizeimage = fmt->fmt.pix.bytesperline * fmt->fmt.pix.height;
 	return 0;
 }
 
-- 
2.32.0

