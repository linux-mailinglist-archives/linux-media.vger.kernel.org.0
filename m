Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B243F640965
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbiLBP2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbiLBP2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:28:09 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2890519C05
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:28:05 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id y16so8325613wrm.2
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnNaOqKELb/P/Bk4n6UhDUAchVtxeaDm0Jk7LHbei/o=;
        b=Mm/mzfVVNCYf8kjvat7BSLisCc/OzjqvnC444isE/DezE7YR7+Zi9k25S1QPlT7rli
         ygZmawugGma+uiiEt/aYi+zEo9NNkBwUQfY/3NDFlhJ4JlL/T1rUZxWAHpJXXuBbrzoC
         GrbRdgsc/5lhF9a5yCErg6FB/Yl1GKGMhndlMllKrmwqqrJmeUOj//9Ex8ZTwKh6aNLH
         S4XYGmuUC87rXuhflh/RL/CkMidjCS4j8k2Vw0gUhzX8wdzN24dEpDwRbfXfaxxKQmjM
         SKJpT/fDyWL7UoTtEAAcSdzvwaYvIWfGzVjBqkiiaRLdSYp1MQZyluBPuGsg+CsgYlmh
         7AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnNaOqKELb/P/Bk4n6UhDUAchVtxeaDm0Jk7LHbei/o=;
        b=hriDHrIQz8+E+IiLe4vU2AlXPObNU0wX/dh5wDNcwK0TO4S2/Qq98tNa98RlL/omE2
         kZlEbMDCidvIBW9cbOLBZqAkRrGW6DJV8KlZlUUkxVkyDWtPuM7wINgomj3GKPIB8NFO
         DrQwkHf6/p+Sx+4rfPhYxnTmlllRJy2TdbiWbRj+7eC1PNzVDz36TcKyaG7atPq+bghH
         FmQvJLGTen1BRDb5UGHKOlumV9xUi6UbylsO2s2dx7Kk3w0F+PWJe7B/Pf2MFaTQD8yJ
         /rBhqRRCCAMW/dnJQ4QRBX+5/34chssiWiZOrPWyD6QvXLXrOesfkYcbEwPjFqsXwBuT
         xrVg==
X-Gm-Message-State: ANoB5pmwO9iXuM+3N+nnDNC9VxWs/mI2HkeS1mj5Jka+7b8yHEzDFjQZ
        EU/IIQrtBAp0djktRyNTS+smZw==
X-Google-Smtp-Source: AA0mqf7/pNDv1/QdN9ChUzaw8ns8rLpOt3wafok3tKjPrOL+wO/U23xAjDbQKReFp/J8ZWI40Ckrgw==
X-Received: by 2002:adf:f243:0:b0:242:28f8:1b5f with SMTP id b3-20020adff243000000b0024228f81b5fmr8684088wrp.545.1669994883645;
        Fri, 02 Dec 2022 07:28:03 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id t17-20020a05600c41d100b003cf71b1f66csm8322773wmh.0.2022.12.02.07.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:28:03 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 4/5] media: i2c: imx355: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Fri,  2 Dec 2022 15:27:26 +0000
Message-Id: <20221202152727.1010207-5-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
References: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver changes the Bayer order based on the flips, but
does not define the control correctly with the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b46178681c05..f515cf1e52e7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1617,8 +1617,12 @@ static int imx355_init_controls(struct imx355 *imx355)
 
 	imx355->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx355->hflip)
+		imx355->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	imx355->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx355->vflip)
+		ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  IMX355_ANA_GAIN_MIN, IMX355_ANA_GAIN_MAX,
-- 
2.34.1

