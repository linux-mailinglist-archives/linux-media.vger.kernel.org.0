Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC29E4598DE
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbhKWAEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbhKWADt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:49 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7719C0613E0
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:38 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so1120356wme.4
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U9ZVbvAuegXr+a+vlcFgH630TcEnv1wQ1dMPufLVmio=;
        b=OORmd6iaMoobwEvQDMy65A2bI9tvY0rz2VuEsfii6JXtrnUo12AlVnCMlAOokt+zeW
         a/oFIvfNI0B7jM7FiCjsrVj3BklvQSmaRiIZvEFpBc+KMH9M/ditmVDbKojdsIN/mXp6
         0i1LM3wVA465aFZ0dGgV4+e1mrgoDhcvGYV7wqwM+A4tJzPtYuBJHLrN+tKNfQoCilRH
         YBLI+7upMdLWRuPspzvqz39OAZRos4GgyOQjwIGXzJieDZtMfC1MbdCic0kuHPwZO2Ju
         iwkX6/f5VrMf8scry7miDKmJiD71XNaP2VTVHJEZDE5ZTrD8Y5MU/YaJlhQMxqiieefQ
         cBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U9ZVbvAuegXr+a+vlcFgH630TcEnv1wQ1dMPufLVmio=;
        b=5uAmBd2zYtOWplePFZt5rYhVY01DI4LmU5VNbQCj+ic80VdcvDKh5Dj5qMn9hD9S26
         79JGBl0SDRhJaS4cdPJ9uknBaKIzl66z07fOyPxo+JXEkr0biyzKZc2F08P9gDDneV4n
         Lmn2lcFZ87lgx/1jzWSX44MCBVELUszfCQTY7/f9KYmHyLI6sZtQ0pd3QDJ4R3IP1wEn
         nFGByB6ec9UkbxxbN9zvr0zsQfZL5GaewC+9rwFGrj46YfU8k6kPUmUqiBIDwtJRZpIH
         Rmp3GBhJLYOP6pwC4UqxFX5gMzDHgvKOH+ALm9WbLUxU4CBZhu0s6rYN7UHs+/gwSiB3
         0flA==
X-Gm-Message-State: AOAM531YR+F6AqWD9+5oZlK6Qs5RYVufTz/IeKQ3RbOGvbcdB7+v3Hm1
        HuxKf00SsgUSDazqqKIP1CbJURjmsZA=
X-Google-Smtp-Source: ABdhPJwgZk1Kbq0eKvkkvDMcd73lA1RU7weKuELttT56aNPz4R1gs4ZKBeTLycEtsgK5YENDI31zRg==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr34896338wmd.184.1637625637496;
        Mon, 22 Nov 2021 16:00:37 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:37 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 14/17] media: i2c: Switch exposure control unit to lines
Date:   Tue, 23 Nov 2021 00:00:14 +0000
Message-Id: <20211123000017.43187-15-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver currently has the unit of the V4L2_CID_EXPOSURE control
as 1/16th of a line. This is what the sensor expects, but isn't very
intuitive. Switch the control to be in units of a line and simply do the
16x multiplication before passing the value to the sensor.

The datasheet for this sensor gives minimum exposure as 2 lines, so take
the opportunity to correct the lower bounds of the control.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 45b569f1e7c0..1cc9f78bb97a 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2126,6 +2126,9 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 {
 	int ret;
 
+	/* The sensor stores exposure in units of 1/16th of a line */
+	exposure *= 16;
+
 	ret = ov8865_write(sensor, OV8865_EXPOSURE_CTRL_HH_REG,
 			   OV8865_EXPOSURE_CTRL_HH(exposure));
 	if (ret)
@@ -2527,8 +2530,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
-					    1048575, 16, 512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 2,
+					    65535, 1, 32);
 
 	/* Gain */
 
-- 
2.25.1

