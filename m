Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244D6336CFE
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 08:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhCKHVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 02:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhCKHUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 02:20:50 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CEBC061574;
        Wed, 10 Mar 2021 23:20:50 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 18so13899744pfo.6;
        Wed, 10 Mar 2021 23:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lKdnTdoqXLbsBfqrhsin7UrpLs6vnpxljNbXtqWYIZU=;
        b=IrDn3fzNb700sAHDvXgFhU1hLUdsCdBPDDYojP2WZjw/fJ/a1P0N1T8niiJKgMqi6F
         Hk2k6AMW7akuxN9/KFzBRXWIJknoadC9aui2dO7/h7OSyjmA3fjWZ7O+S1hkKWGL0qXb
         slB1U1iso1lREMtOl/Yj4Ukgi1ZELdT2t2kkTLpTmH4rkVgdg+SgprTIVBcB4GTkDuCq
         eah/a2xsszXL8JceEz/mQvy42og/7oDpNlPvpb9r2t9LOpqVqv2r2IJ37dfQ0/icDFcv
         OwBp5AkvryZnwNRm7fx5W/2Ni/5upstzSRJQ+a/8x3WXyLE078r8YNvivEh14b7nsjZe
         QB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lKdnTdoqXLbsBfqrhsin7UrpLs6vnpxljNbXtqWYIZU=;
        b=N0axTibe40TNZuZnDHz9JICNjT/ih8bvHdEAeJ3hNwUiLzsnUxa8yYaIHTGqLME6uX
         M3Nimzioq/WPxzeaP3sxYsDTBkD462no3ygg1BrW9kdQusuh9IDvn4MqcvzR1inVAaTs
         WBB4bH5XvpXBzkQzWxUR/J4BaEwlgoAEA4G0A+pkei7rQujB8S66BfMdTCb/9Xinl3U6
         zKUjkNayTalMgHazA8g7L+0bLED3Fnjr+JfpU/DJlIe059L6sOlK6Z+fmOC4IAvsPfOr
         au69s5io3OHZO9yiuU/a7fuVTdmn1gO7Pqak1XYbDpxWFuAEbMiG5yM6/MXq2qmHlY5o
         VLsg==
X-Gm-Message-State: AOAM5339YaZhhmGMaAdEFu2cZs/tur+e5+6O/8Qw2R1KE0XWD21aE9DK
        RnMuEVV9xjU/W+pnQiQ9bIs=
X-Google-Smtp-Source: ABdhPJy8UpGb7qt5c1JzHsmGE3/NzHuO4BEzof7cgRCPggK94x6osZWldszDHrRAv27kDb20cwwumA==
X-Received: by 2002:a63:140b:: with SMTP id u11mr6203343pgl.436.1615447250502;
        Wed, 10 Mar 2021 23:20:50 -0800 (PST)
Received: from DESKTOP-4V60UBS.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id y194sm1500134pfb.21.2021.03.10.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 23:20:50 -0800 (PST)
From:   Xiaofeng Cao <cxfcosmos@gmail.com>
To:     mchehab@kernel.org
Cc:     gustavoars@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiaofeng Cao <cxfcosmos@gmail.com>,
        Xiaofeng Cao <caoxiaofeng@yulong.com>
Subject: [PATCH] Rectify spelling and grammar
Date:   Thu, 11 Mar 2021 15:20:44 +0800
Message-Id: <20210311072044.388-1-cxfcosmos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change 'inaccesable' to 'inaccessible'
Change 'detrmine' to 'determine'
Delete 'in' grammatically

Signed-off-by: Xiaofeng Cao <caoxiaofeng@yulong.com>
---
 drivers/media/radio/radio-si476x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index 23997425bdb5..b39a68f83c5f 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -152,7 +152,7 @@ static struct v4l2_ctrl_config si476x_ctrls[] = {
 
 	/*
 	 * SI476X during its station seeking(or tuning) process uses several
-	 * parameters to detrmine if "the station" is valid:
+	 * parameters to determine if "the station" is valid:
 	 *
 	 *	- Signal's SNR(in dBuV) must be lower than
 	 *	#V4L2_CID_SI476X_SNR_THRESHOLD
@@ -255,7 +255,7 @@ struct si476x_radio;
  *
  * This table holds pointers to functions implementing particular
  * operations depending on the mode in which the tuner chip was
- * configured to start in. If the function is not supported
+ * configured to start. If the function is not supported
  * corresponding element is set to #NULL.
  *
  * @tune_freq: Tune chip to a specific frequency
@@ -917,7 +917,7 @@ static int si476x_radio_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_RDS_RECEPTION:
 		/*
 		 * It looks like RDS related properties are
-		 * inaccesable when tuner is in AM mode, so cache the
+		 * inaccessible when tuner is in AM mode, so cache the
 		 * changes
 		 */
 		if (si476x_core_is_in_am_receiver_mode(radio->core))
-- 
2.25.1

