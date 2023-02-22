Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487586A022C
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 05:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbjBWE5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 23:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjBWE5I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 23:57:08 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600A23755E;
        Wed, 22 Feb 2023 20:57:04 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c18so2914448wmr.3;
        Wed, 22 Feb 2023 20:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ1ygPoZcuhkXc7zdPRG9mHdkWlXAbKRlPTRdm1B9Xc=;
        b=QVAGNRXBucmqC3/ksxMo0H1YDI+NXvdl/Al8bLXaUC0gf6n7YtU+tGs1Z+vAYhhYJu
         IM+XPMgeh+tKrczoNu/s9YGf7SbzaOf97Rk5oHPUJ9vqSJZOyyFnnadut1pJ8/4Ax9+5
         yBl6b9su/oxyc0CVvevXiZjVAyQdHi//Lwn+FwMQ4yKHxlm3rl2CHIfS80pB58NZBYRX
         TDCVpXM9BtFYdA2/zfMO5Bfkj+6xUOwr3Sbh4aGX4RuCr9n6cxVjLAX4s8AlS3TMrME6
         JFJEhxvS53rUye41wpmi98FPLFy+ALLDUaBiLedLeQ1lmpL30FN53ziXxQxx05CNnJhZ
         IOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ1ygPoZcuhkXc7zdPRG9mHdkWlXAbKRlPTRdm1B9Xc=;
        b=V9SyrRfB5iv0tb3nsbleNRiDe+AOPEohb+NW80P3EEXdppwRengt7c4PzBY2mHHNs+
         fh7/6mYKaAwJrje06QTYAgmqBdAucjDQrdcw8N0Vr3DrKGFokKbRIVNO80gukTTsVGOm
         dE7Cy5KU5gV/Vt7HB7XEEwrxhcV1yGtbGe67VY0QxDYdKfK6yvgTXBTxOapr/elgRQ1E
         qpwDCJv6aD6JmmLyTQGGSDyOiBIIQL/ljLjKoNNKsRJruO1DO8qZpChnuju6QJXVtjwA
         AJsUk2Xd7XJzFTNuBOtUlF7TyBRwjFZCNy/1BaEpN3Gw5CoIbQaQyRCwBerYk474mAf0
         MC5g==
X-Gm-Message-State: AO0yUKUivCEmJh8A0I+tzoF0saYKc9MX1h/fY/dZhpWIXTjboqaPQ2wZ
        rI4QnLPpIJstY8nglmfcU9uQhwl3GgK8DQ==
X-Google-Smtp-Source: AK7set/nGRj49Cf562GHxGACRLLQYg6LyJnN/CPthdbKpbAPt2IuqS46yaC4fpQSJSsCTNjal3kAMw==
X-Received: by 2002:a05:600c:4393:b0:3dc:19d1:3c1f with SMTP id e19-20020a05600c439300b003dc19d13c1fmr2068750wmn.30.1677128222876;
        Wed, 22 Feb 2023 20:57:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k16-20020a7bc410000000b003e21f959453sm4543053wmi.32.2023.02.22.20.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:57:02 -0800 (PST)
Date:   Wed, 22 Feb 2023 16:59:51 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: i2c: imx296: fix error checking in
 imx296_read_temperature()
Message-ID: <Y/Yf19AE78jn5YW7@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "& IMX296_TMDOUT_MASK" means that "tmdout" can't be negative so the
error checking will not work.

Fixes: cb33db2b6ccf ("media: i2c: IMX296 camera sensor driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/media/i2c/imx296.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 3c12b6edeac9..bb0c896f3d67 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -931,10 +931,12 @@ static int imx296_read_temperature(struct imx296 *sensor, int *temp)
 	if (ret < 0)
 		return ret;
 
-	tmdout = imx296_read(sensor, IMX296_TMDOUT) & IMX296_TMDOUT_MASK;
+	tmdout = imx296_read(sensor, IMX296_TMDOUT);
 	if (tmdout < 0)
 		return tmdout;
 
+	tmdout &= IMX296_TMDOUT_MASK;
+
 	/* T(°C) = 246.312 - 0.304 * TMDOUT */;
 	*temp = 246312 - 304 * tmdout;
 
-- 
2.39.1

