Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9F969FE50
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 23:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbjBVWOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 17:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbjBVWOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 17:14:34 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ABF2114
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 14:14:05 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id ec43so35847722edb.8
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 14:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTEndFXZ/l1vDOfzmYbg3ZufQ1osqUOSn+fpUklZzgo=;
        b=Iyuy6frOKBtwCAC0jTBbHeUubipxvnbXn6Pe9dNSehaH6IyV9WGI4TQCAT88rt+39G
         gsOAiL0HYz0uzzxkVB2dgH5UsqVUJ9lkQJjpSbbWXkGUXyAdvWcYBI2E96sYcY9SBTMS
         WEzDny6Bfy3Eox7VrhXNBGkpDATjkJEjGjq+x1mnz7dDPNBQ+DA+To77NoSOfPLPz8l1
         mBp4mxaNKh3U9lmSFRTA8mkl7ZJEafDG5lvzAR5AQ4D3QzeLeJFiGDCxwjZHAFDLhreA
         u9QURia/t7eiGdlQJctXoFff6nBqA7M9JKUpYX1wyv9F7eWWICS+pbhKz6vGt8ag+ybX
         JFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTEndFXZ/l1vDOfzmYbg3ZufQ1osqUOSn+fpUklZzgo=;
        b=B1U6zw6S13DUPbxtW5zwb6O0phHgo/ty8DEY7f+za2zKDzDco7R5mfQ1bCpuoOvjSd
         v+juQmbuwm34kjZu3y/Zw12lytgAeN5su8ukyqxYX3QMxDTSb9w+GTsYZ/87aLVOhAnZ
         c4ulR3rgp9JYp+JO60ameeILsaBQNo9orw2YSQxopKSUP4m/xOi15ojF1oI1LkmECumJ
         xEK4BNOt57fw0bpfeE8yp3cioDsZHpF3Vl9U8Ux4m5a4NlHOIEe2toahGyauX8hbbiNa
         SS/exRhfl7VwzB1VLODqr/JKoDeWu5ZT/UwnmHot+tj92n2bL0d97xqY0aK2JIycvhPu
         mJVw==
X-Gm-Message-State: AO0yUKUYnkCSdPWUV0vURXLgfngE09pHo4awPCj4QWMWHG+pmar9Mm7G
        61iKHZHtMWxRJ+VQgAqRNWAwRA==
X-Google-Smtp-Source: AK7set/TRpEFhpMT+/2HLh4qIz7Z+rHiLTXj+0HwclPVQW3m8WdkCp23shUFujeRnIwV6PEKm11bBA==
X-Received: by 2002:a50:ed0c:0:b0:4af:601c:ea21 with SMTP id j12-20020a50ed0c000000b004af601cea21mr3921313eds.38.1677104040607;
        Wed, 22 Feb 2023 14:14:00 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id a26-20020a170906685a00b008b1b86bf668sm7711893ejs.4.2023.02.22.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 14:14:00 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: i2c: adv748x: Fix lookup of DV timings
Date:   Wed, 22 Feb 2023 23:12:47 +0100
Message-Id: <20230222221249.1324102-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230222221249.1324102-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The loop to match the requested timings with the ones supported by the
driver is incorrect. It always iterates thru the whole array of
supported modes. The bounds check after the loop always triggers
resulting in adv748x_hdmi_set_video_timings() always returning -EINVAL.

Fix this by correcting the lookup to break the loop when a match is
found.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 52fa7bd75660..1d62e05572cd 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -176,9 +176,9 @@ static int adv748x_hdmi_set_video_timings(struct adv748x_state *state,
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(adv748x_hdmi_video_standards); i++) {
-		if (!v4l2_match_dv_timings(timings, &stds[i].timings, 250000,
-					   false))
-			continue;
+		if (v4l2_match_dv_timings(timings, &stds[i].timings, 250000,
+					  false))
+			break;
 	}
 
 	if (i >= ARRAY_SIZE(adv748x_hdmi_video_standards))
-- 
2.39.2

