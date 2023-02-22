Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F2569FE53
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 23:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbjBVWOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 17:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbjBVWOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 17:14:37 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596F948E1E
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 14:14:10 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id eg37so32566366edb.12
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 14:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEppd4OhzMYnVa+HKy8qqHzfPuUopXSp8sEG9Vdb4jM=;
        b=EYbRWsmMG++uhINyyeH8Zn2RewJQqhVUkAG2QqSYlgHoUF9HGkAGswoAPQAto2DPYr
         R9D+1rBmO2qgkg9vLq3g4hpo2S3D+WoUlA1vl/Lw6Xc1YTcQHv8n5FAXN7uVJt0+tNI3
         vPcMhwI8KWQzq29ktsN1DkbU9oKF4aiN9syhvikd2mMhpfz9hTo3ENUymVSiua4H5wqQ
         FGNDIk4+jdwZwMJ2OAx5MaBsmWJLAPO9FjXMmBqwDUdvoxEs9GX+GR9vJIuoRSoY/HTU
         zaDH+H/soh4TX3y/JG/Tu3ahVPw8SFzhFSxfsHGk5JX5Z1tco5S/5j2bFqUCqRuhZyjW
         n/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEppd4OhzMYnVa+HKy8qqHzfPuUopXSp8sEG9Vdb4jM=;
        b=2fMljXeJ/XRiD1wB4g9muhDWoL9OiMNBp7pE/X36hQL2+9A0GLycdOCGMXM/of3Y1X
         +9wB2yh9aEDcC1RFDdjYw6Su3RBY8ybuEB1tcdf9evv5OgnQEXemv5pi46pWAyrQIVgU
         V5NyI0RwJOS0aGkp8vn99A5u6bWCNh3tuxaYelXoRjKUgc22hfFqpvqBlkmhdA7+3T6Y
         1UFqUD4HcBiIMTIk3k479BOMYTIhOc9GoF1fzhDxyN6ZHcLNFvwjd7MdCCqkChCVHPJp
         eA0Hvn8Q0sF6b51ORPPzT/HX4KuB6x5iymUlIb5+5iIbUXcnMshRy/boGjaLL9mGy5q9
         ojeA==
X-Gm-Message-State: AO0yUKVHSfXbf3D4EAZVjRRiPyrcanrfUwhEPpGZzfUcDdhsfki4YNHH
        QqZ3MmJ4HdP9+NQh095/yemSYw==
X-Google-Smtp-Source: AK7set8AfoeIZeyoOYhpqhlggdvn4LUAj2j06/1mpD2pGHua9C13pVdBojL2xs9rQt0Vu+33IahfIA==
X-Received: by 2002:a17:906:fe06:b0:8af:2fa1:619e with SMTP id wy6-20020a170906fe0600b008af2fa1619emr16755194ejb.18.1677104042279;
        Wed, 22 Feb 2023 14:14:02 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id a26-20020a170906685a00b008b1b86bf668sm7711893ejs.4.2023.02.22.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 14:14:01 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: i2c: adv748x: Report correct DV timings for pattern generator
Date:   Wed, 22 Feb 2023 23:12:49 +0100
Message-Id: <20230222221249.1324102-4-niklas.soderlund+renesas@ragnatech.se>
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

If the pattern generator is enabled the device shall not be queried for
timings. Instead the timings programmed shall be reported as they are
the ones being used to generate the pattern.

Before this change an external HDMI source needed to be connected for
the pattern generator to work. The driver would query this external
HDMI source for timings and program the pattern generator using those.

With this change the user can control the timings and have the pattern
generator work without the need of an external HDMI source being
connected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 47688d1b6833..400d71c2745c 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -283,6 +283,16 @@ static int adv748x_hdmi_query_dv_timings(struct v4l2_subdev *sd,
 
 	memset(timings, 0, sizeof(struct v4l2_dv_timings));
 
+	/*
+	 * If the pattern generator is enabled the device shall not be queried
+	 * for timings. Instead the timings programmed shall be reported as they
+	 * are the ones being used to generate the pattern.
+	 */
+	if (cp_read(state, ADV748X_CP_PAT_GEN) & ADV748X_CP_PAT_GEN_EN) {
+		*timings = hdmi->timings;
+		return 0;
+	}
+
 	if (!adv748x_hdmi_has_signal(state))
 		return -ENOLINK;
 
-- 
2.39.2

