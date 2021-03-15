Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92FA33B2D7
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 13:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhCOMee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 08:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhCOMeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 08:34:11 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB4EC061762
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 05:34:10 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id si25so10171328ejb.1
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1xoa3G+ISwKSIeuqcwnTgZqAGyqpi/mTiJ1R03k5mAc=;
        b=LVWU4ordRDJ4NugmIqMqf+p5Llh9f5FzvOIzFM4b15JxtT3XC0042nqDEoZatqLSoV
         JpFGPD0n2tJdGQDzDOGYjPBtfpFxAy5DMUzmjQ0cwHJn8jt9UCmSad/tFTVrJT4PZXCz
         LIaFZxddaQr9VAgYrOqJleg4s94tHuhXJS3m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1xoa3G+ISwKSIeuqcwnTgZqAGyqpi/mTiJ1R03k5mAc=;
        b=R7xNYn7u/sLOuMfzH/Clj0QNqJOa1ISnNW1xvAn40hDG03uGFb+hvqm1wn0F2TQ1q5
         h1CMYZesYQXVHkEa5Xa9Sz0Aso+bRdxVcx6mp6uZeLvnETNopRUEkWwCFCioKPkCgK5V
         VAygk0PeX/cyZvQ8EEh5la0weg+2boZiRqY/cnkFiMpoU7XGB8OFAISnLDLT9Hptk2Z7
         bRxaSwX1hQxjYEHz8iRuGUWVazTlfUerlTONeBLdJR1xdjMi6Hia0snmd7cOLrH19ia3
         l9zCMI2Ttc6dHo4kSUb04xA2qG5pPu86pssJep3MJzt6MDXW5b2o1T2hemRyvb0aB/ZM
         x0xA==
X-Gm-Message-State: AOAM530H5hUv90vLA+TVaxp0MV6Xb2Zo3f+hyz5mTKtOCjgpSA/ni2jR
        i5S1FR/LmSgvw7FAJeIKHGZjsdyurRwxOF+0lEg=
X-Google-Smtp-Source: ABdhPJxbz1uomQZnioarVABqV3L+IGQZFx3lXkxNbJZJrcgnEuUdljiCLjtxg/f6IbAHcTmWTaan+A==
X-Received: by 2002:a17:906:380b:: with SMTP id v11mr23826856ejc.183.1615811649657;
        Mon, 15 Mar 2021 05:34:09 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id p3sm7155128ejd.7.2021.03.15.05.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:34:09 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: staging/intel-ipu3: Fix memory leak in imu_fmt
Date:   Mon, 15 Mar 2021 13:34:05 +0100
Message-Id: <20210315123406.1523607-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We are losing the reference to an allocated memory if try. Change the
order of the check to avoid that.

Cc: stable@vger.kernel.org
Fixes: 6d5f26f2e045 ("media: staging/intel-ipu3-v4l: reduce kernel stack usage")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 60aa02eb7d2a..35a74d99322f 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -693,6 +693,13 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		if (inode == IMGU_NODE_STAT_3A || inode == IMGU_NODE_PARAMS)
 			continue;
 
+		/* CSS expects some format on OUT queue */
+		if (i != IPU3_CSS_QUEUE_OUT &&
+		    !imgu_pipe->nodes[inode].enabled) {
+			fmts[i] = NULL;
+			continue;
+		}
+
 		if (try) {
 			fmts[i] = kmemdup(&imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp,
 					  sizeof(struct v4l2_pix_format_mplane),
@@ -705,10 +712,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
 
-		/* CSS expects some format on OUT queue */
-		if (i != IPU3_CSS_QUEUE_OUT &&
-		    !imgu_pipe->nodes[inode].enabled)
-			fmts[i] = NULL;
 	}
 
 	if (!try) {
-- 
2.31.0.rc2.261.g7f71774620-goog

