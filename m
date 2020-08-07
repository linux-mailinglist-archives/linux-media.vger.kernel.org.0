Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE3323E91B
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgHGIhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgHGIhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:37:05 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9D3C061574;
        Fri,  7 Aug 2020 01:37:05 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e5so734311qth.5;
        Fri, 07 Aug 2020 01:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cjcm36AvnfDFsuVsTiC9gQnjUW8TNDAUzbXM337fp6M=;
        b=R8d1jdSU8OSvGvoHM0NM7xy4wg9PyGd5N9F6Pg/OFsy876f2sT/70Jtb65Ii5wex3c
         oZLorEInZEnAa4Ik3krkehyQEoxDt3z8MRVH4KwBlF4iUvPF6OxQDu25pe20Ly+2FSJn
         j9RNaWnCsGSko2Ei3iZ/W4S1pUWZrTAaNxDUIzklh96ELeuMmtiR4AGa/3Rm8d+5LHYh
         Zp5gpOnkfrJpgLoQ/n700o9hxWeIA5nxelGv+wzSGd4O+wmxgVKAR3XqdILzfQEYF5cZ
         t7GDmo13z00NsE3l2EqNauqWAbC7kIJMv9PpEBR9vsZYGMKA89Qatl8EVt7b05HeiMj7
         mVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cjcm36AvnfDFsuVsTiC9gQnjUW8TNDAUzbXM337fp6M=;
        b=TDnMFATmxtc4jyRPWDFp58ISCISdfePaabWAywY6+pa/EgH+X2+EIQCMuE7M0SqSBi
         D227E8jO2efGAt9SkvRWTSQLtwQf+Wpf6xtQN6GbLyk0CGUtAA+Pa/uffxlKcMVsZKxD
         otGAKmzzhRhRK+wL3pzZMCckPQ70LmmPdLXaK2bqchptsEI6EY2h51JtwN/I4rb4lLGB
         Cp9CvJtrUjXysbgEIGDOpH51qrAGlHpqPTeEZmyl0zoErCHxQtZFzTiLyy8Rbq+kBZ1U
         +gMF//ermgr9Dp9s0pwOEDc3kqDRUZ3muwhIeY5nQGoMVdTi/0LtAHMoIyHhvjLNjjkP
         aVoQ==
X-Gm-Message-State: AOAM531qGDhplkneFJ0B6n5s5QLQcNqX9WGAszgJaAr5JunQ2JzKNEL7
        hoC6T5kZF1Y+Jl4jCh8MOVE=
X-Google-Smtp-Source: ABdhPJzAKF+nzvu6Pxx7efzL+AuCIggi+ivNPuqOYHhwzXwydOr6ve4uOGr33g6tNEvtBZUkVaGV8Q==
X-Received: by 2002:aed:364a:: with SMTP id e68mr12710245qtb.260.1596789424782;
        Fri, 07 Aug 2020 01:37:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:37:04 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 17/20] media: i2c: tda1997x.c: Fix assignment of 0/1 to bool variable
Date:   Fri,  7 Aug 2020 05:35:44 -0300
Message-Id: <20200807083548.204360-17-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/i2c/tda1997x.c:911:6-21:
WARNING: Assignment of 0/1 to bool variable

drivers/media/i2c/tda1997x.c:939:2-17:
WARNING: Assignment of 0/1 to bool variable

drivers/media/i2c/tda1997x.c:947:4-19:
WARNING: Assignment of 0/1 to bool variable

Replace assignment to 1 with true and assignment to 0 with false.

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/i2c/tda1997x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 5e68182001ec..483cc19ed75d 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -908,7 +908,7 @@ tda1997x_configure_audout(struct v4l2_subdev *sd, u8 channel_assignment)
 {
 	struct tda1997x_state *state = to_state(sd);
 	struct tda1997x_platform_data *pdata = &state->pdata;
-	bool sp_used_by_fifo = 1;
+	bool sp_used_by_fifo = true;
 	u8 reg;
 
 	if (!pdata->audout_format)
@@ -936,7 +936,7 @@ tda1997x_configure_audout(struct v4l2_subdev *sd, u8 channel_assignment)
 		break;
 	case AUDCFG_TYPE_DST:
 		reg |= AUDCFG_TYPE_DST << AUDCFG_TYPE_SHIFT;
-		sp_used_by_fifo = 0;
+		sp_used_by_fifo = false;
 		break;
 	case AUDCFG_TYPE_HBR:
 		reg |= AUDCFG_TYPE_HBR << AUDCFG_TYPE_SHIFT;
@@ -944,7 +944,7 @@ tda1997x_configure_audout(struct v4l2_subdev *sd, u8 channel_assignment)
 			/* demuxed via AP0:AP3 */
 			reg |= AUDCFG_HBR_DEMUX << AUDCFG_HBR_SHIFT;
 			if (pdata->audout_format == AUDFMT_TYPE_SPDIF)
-				sp_used_by_fifo = 0;
+				sp_used_by_fifo = false;
 		} else {
 			/* straight via AP0 */
 			reg |= AUDCFG_HBR_STRAIGHT << AUDCFG_HBR_SHIFT;
-- 
2.28.0

