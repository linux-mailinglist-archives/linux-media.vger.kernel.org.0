Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E66255D24
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 16:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgH1Ozc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 10:55:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35027 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726400AbgH1Oz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 10:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598626528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=dY8soZQxplpIr5t025W/ct4MI2YimaV2y2Pnl5LKJQQ=;
        b=H8shbgy2sTHNy77hOkF+QYocEDyhHHzeIbE7Rm9BcrY5SwGMcSw4lJkADcrksjXm5l0m1e
        7VFF6K156mjjZzaUKX3TX0UjUx0LLrVh+WCTZQs+xYr+ceOYe7hI/2J+6XRuOhd4fG4L0f
        F+xhYmVyvSDMCbECgMKnUlP+xDkhcd8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-NksA_v27OJqjtQd1xS4D_g-1; Fri, 28 Aug 2020 10:55:25 -0400
X-MC-Unique: NksA_v27OJqjtQd1xS4D_g-1
Received: by mail-qt1-f199.google.com with SMTP id w1so900337qto.4
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2020 07:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dY8soZQxplpIr5t025W/ct4MI2YimaV2y2Pnl5LKJQQ=;
        b=a9ID3GWY1rTGSNZshZ7LQXECnpBkosXwFewVvJxcDFNdBGA4qjcRO2BcvEE5+wRFUA
         4c8/HYpJE7UDpYGB0dDRFntFAMltBcRPaPeQ11D/IcAmPszKQ1xFyxHgzhutzddMFs3Q
         ApnFHCQddmQOpGT+WK2C55msBShdAQRa4H9Jodh0WmWJHYWn9uRbKuEq+Ygrl+CLqrGK
         Rfo8SWim6GohfPdFZLHY80l6PLuVZPRBvX7XVEgzCn4BGZq3Q/bKer369hGmJt8fr/Lh
         gTGqtmiO74+zrORx2xgvR6uRXJf0vQsyM6fAEBxaZ1+NWzPlCUS2WNcJfLhJJrDlxxeq
         uCZg==
X-Gm-Message-State: AOAM532iAKOVnAMm/VojbRuP/NOFbwM27oZpG1hGF1xgcqgtBKnj1h7w
        f+H/LrRKREi32n8pZBQsPUbscTrANmuJvYGzx5QxVnwiFBAJVkPc9Tr1xymVpQCuwvHbMOgzb88
        5MU9qG09Blf1Bn7qpFikw1P0=
X-Received: by 2002:ac8:3836:: with SMTP id q51mr1875670qtb.41.1598626525327;
        Fri, 28 Aug 2020 07:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTyv6Dcvf7JIMnb6Tl0QbVqispJtEs2IxGCkvKAa5tM3L596s/Au8e2J9bLRlyfSveblr7UA==
X-Received: by 2002:ac8:3836:: with SMTP id q51mr1875649qtb.41.1598626525042;
        Fri, 28 Aug 2020 07:55:25 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id w36sm1206414qtc.48.2020.08.28.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 07:55:24 -0700 (PDT)
From:   trix@redhat.com
To:     corbet@lwn.net, mchehab@kernel.org, natechancellor@gmail.com,
        ndesaulniers@google.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: ov7670: check status of ov7670_read
Date:   Fri, 28 Aug 2020 07:55:18 -0700
Message-Id: <20200828145518.26324-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this representative problem

drivers/media/i2c/ov7670.c:1463:9: warning: Assigned
  value is garbage or undefined
        *value = gain;
               ^ ~~~~

gain is set by a successful call to ov7670_read()

So check that ov7670_read() is successful.

The remaining static analysis problems are false positives.
There appears to be a limitation with checking the
aggregated returns.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/ov7670.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index b42b289faaef..001d4b09db72 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -929,6 +929,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
 	ret =  ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
 	ret += ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
 	ret += ov7670_read(sd, REG_HREF, &v);
+	if (ret)
+		return ret;
 	v = (v & 0xc0) | ((hstop & 0x7) << 3) | (hstart & 0x7);
 	msleep(10);
 	ret += ov7670_write(sd, REG_HREF, v);
@@ -938,6 +940,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
 	ret += ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
 	ret += ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
 	ret += ov7670_read(sd, REG_VREF, &v);
+	if (ret)
+		return ret;
 	v = (v & 0xf0) | ((vstop & 0x3) << 2) | (vstart & 0x3);
 	msleep(10);
 	ret += ov7670_write(sd, REG_VREF, v);
@@ -1460,6 +1464,8 @@ static int ov7670_g_gain(struct v4l2_subdev *sd, __s32 *value)
 	unsigned char gain;
 
 	ret = ov7670_read(sd, REG_GAIN, &gain);
+	if (ret)
+		return ret;
 	*value = gain;
 	return ret;
 }
@@ -1470,11 +1476,14 @@ static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
 	unsigned char com8;
 
 	ret = ov7670_write(sd, REG_GAIN, value & 0xff);
+	if (ret)
+		return ret;
 	/* Have to turn off AGC as well */
-	if (ret == 0) {
-		ret = ov7670_read(sd, REG_COM8, &com8);
-		ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
-	}
+	ret = ov7670_read(sd, REG_COM8, &com8);
+	if (ret)
+		return ret;
+	ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
+
 	return ret;
 }
 
-- 
2.18.1

