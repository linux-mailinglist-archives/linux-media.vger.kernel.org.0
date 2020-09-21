Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F145272060
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgIUKVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgIUKVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0E4C0613D5
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so12017393wmk.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=V00Hnz28PjN932GfSBJm8Se5vmkXoiml45tpc3tFwpc=;
        b=HaZ/lnL8xJwtzBDX7pkXbgDeboSMizBazK0gCzI0dHsYPLpLlyswsfVyhdQp3u2Jmz
         9l1oYpu73SdXGgeI4g5u5+/oH8VBWUwqUjhlwCmw43vV7kCJ16lsrIXzuFOOZt46QCY9
         TVfzlCIcadcAg1/roRpMneGR78Okpyu4AwGgfBgUGxru63ojmPPGxpmO+JT8GfnOWCx3
         jRx0CV/A+wlAK+xxdGWEitQgZLe4Mjontmac8ve/2H3v2ZXKqYmqUNpiA2lAMLOqLHfK
         XWablPnh2HrJbQB/rPMfrEKiuajAd0h1jZtfQcLhD47NNA8MQm945AS/Ttxlu7gbGzCT
         wupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=V00Hnz28PjN932GfSBJm8Se5vmkXoiml45tpc3tFwpc=;
        b=EifMCOcDUGNLVpjU8S+pPKRswufulDzJXourXEZ5yqIVozGah3LsWFULfO73BM3hrU
         RLU/nMoSevDggcpItHJ7mqkliritDZOEofp+b9KaCA02HBe1IqrilKmhm5h0al/me6bl
         zuv1lBSWsozYfmETtEH8IEmIDRo2Do1qGiCLPcAMvn0DO2AywdrgpxSWKpe/NYgfEkFJ
         fVr/uqP10np5MOp1PsLFE37i2m3vht5jbcb+oZprE2OygE4CTNSCm0/WlEPLAkVtCkNk
         /BE6GUGRSjV4MTNlVJxBUnTmGkkYnSeKcIMJZaQQp3ZZ0couI8eWXwIKHadO2JXwVOQv
         CRGA==
X-Gm-Message-State: AOAM530BObD5cjZm+YsC1rtBbKzWyzQyY88RXRx8KbfRLL6/6QhGoLhu
        HY+Yh8BpMbGqaXhTSp1VLkLxVg==
X-Google-Smtp-Source: ABdhPJwgbOyt3t2adMreBLWgBuOoAAdmy21xZ4x6cRhVH9rCZOfEVvotb2s8zR7J8LnaMYhvehXlog==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr28412728wmj.44.1600683667440;
        Mon, 21 Sep 2020 03:21:07 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:06 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 37/49] staging: media: zoran: add fallthrough keyword
Date:   Mon, 21 Sep 2020 10:20:12 +0000
Message-Id: <1600683624-5863-38-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds fallthrough keyword where appropriate.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 9558bafdde7d..7634d94f9359 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -268,7 +268,9 @@ static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
 		btwrite(reg, ZR36057_VFEHCR);
 		break;
 	case BUZ_MODE_MOTION_COMPRESS:
+		fallthrough;
 	case BUZ_MODE_IDLE:
+		fallthrough;
 	default:
 		if ((zr->norm & V4L2_STD_NTSC) ||
 		    (zr->card.type == LML33R10 &&
@@ -521,6 +523,7 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	/* MJPEG compression mode */
 	switch (mode) {
 	case BUZ_MODE_MOTION_COMPRESS:
+		fallthrough;
 	default:
 		reg = ZR36057_JMC_MJPGCmpMode;
 		break;
@@ -582,6 +585,7 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	/* NOTE: decimal values here */
 	switch (mode) {
 	case BUZ_MODE_STILL_COMPRESS:
+		fallthrough;
 	case BUZ_MODE_MOTION_COMPRESS:
 		if (zr->card.type != BUZ)
 			reg = 140;
@@ -590,6 +594,7 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		break;
 
 	case BUZ_MODE_STILL_DECOMPRESS:
+		fallthrough;
 	case BUZ_MODE_MOTION_DECOMPRESS:
 		reg = 20;
 		break;
@@ -827,6 +832,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		break;
 
 	case BUZ_MODE_IDLE:
+		fallthrough;
 	default:
 		/* shut down processing */
 		btand(~(zr->card.jpeg_int | ZR36057_ICR_JPEGRepIRQ), ZR36057_ICR);
-- 
2.26.2

