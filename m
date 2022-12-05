Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0098642B92
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiLEPZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbiLEPY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:24:58 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305C620BFD
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:22:13 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d1so19067679wrs.12
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q307OwUmjrBOARnf+xhbF57KM6ddL1J7Y5GnrvOnQZ8=;
        b=gKXvK5MvFiZUPsJLobJ/bEu1c69AeNltUqU9RTPUdWBlhAzK6k8ZFL1gt+i262wKlM
         Xvr56W7R1nhieBYnElOWynJsFO4ZBvxXntHQi5SbzgJTCry25qFfvqcc4vEulQzfsd+L
         ykELg9ipAX0sHFZ+nOOdwLBIh22pCe/a44K5xVeuhWWhStISDcMM/Nd1tzSi4jPCiBny
         mWebCjlQc3kUp3vA2XQQ0RgONp/nFFFfCwUqDW7r570I27wjQVnDSpnr0K4RF7WoYItC
         LJ5ffgJsy3Aoa6rfg1kCyvSKI43kieGB99kFt6dNTTW0waVXnGAQTnnmLmy/oBzj0lyV
         Urbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q307OwUmjrBOARnf+xhbF57KM6ddL1J7Y5GnrvOnQZ8=;
        b=Rd9npLXmfRQr6Lb+CnCPZCo6CYQ+VUuy+EwY6tsq0I40nuxMh7ExT1YpTtmwjVIQ8r
         1TrrzEbv/HrD8hxv3MXtL7JZAYzYh7OyhDVanDetzYwMNx+ecMDACk9wESbzvzc829EL
         PW5pkhzntoZKgWDWQJajjxsXfzulsebPMtWbMS51ND+c120jI0FI1JLJDkQnq4rXWlt9
         slWaVxlIy9l1PD73JAhSwCl80gme/FF5e/dfSPo0B9yWp7AulDuKVtiVwQ0lAqgsBw5Z
         SG9mbcTxTDJRBmKMf8K5T5HmUlxKP2fUhHzUQ1EQ0GdRT0/NiZtg2JQU4cHrqbG/mYj7
         zXCg==
X-Gm-Message-State: ANoB5plD84vv5pUhPmRXEROCVNEFkgeZqTFnfAQehkSIKxt7MuFYbtko
        lOqJTXhJRjbAudoHH728xfGmJQ==
X-Google-Smtp-Source: AA0mqf6KKANqFPZtofBA6GvhbJfTWGN5MRyIwF1hM78s6NI5ANXdSlQPFRovgi4aqpheYh15J//wwg==
X-Received: by 2002:a05:6000:1046:b0:241:fa2d:debc with SMTP id c6-20020a056000104600b00241fa2ddebcmr34139713wrx.12.1670253731284;
        Mon, 05 Dec 2022 07:22:11 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm25144905wmb.22.2022.12.05.07.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:22:10 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/5] media: i2c: imx208: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Mon,  5 Dec 2022 15:21:46 +0000
Message-Id: <20221205152149.1364185-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
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
 drivers/media/i2c/imx208.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index a0e17bb9d4ca..64c70ebf9869 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -937,8 +937,12 @@ static int imx208_init_controls(struct imx208 *imx208)
 
 	imx208->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx208->hflip)
+		imx208->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	imx208->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx208->vflip)
+		imx208->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  IMX208_ANA_GAIN_MIN, IMX208_ANA_GAIN_MAX,
-- 
2.34.1

