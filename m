Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57631640967
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiLBP2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233728AbiLBP2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:28:09 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB63D1A046
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:28:05 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id ay27-20020a05600c1e1b00b003d070f4060bso4549376wmb.2
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTVIxYEQfLFJxt9tgsgUJTz/t7cytxV6N5857OmJlts=;
        b=YUkRKBK6W7UIdwbXqyMjGph9HDZk6UISocrwriMe5QIdxs95HJPCwjt2oethKpdau7
         bdxGGqj5skPbXoLiLLVNfcqs699VNWr2eqUQSOZm+3FIdLlU7k+2aewSbM2245aInbkG
         4xQdhPHLIJ1UQr6OkN2yVZ4VIR7Q0k5bOSaRv0bnyPKcIEm9TpJUDZoyNKgK225BSTcP
         aAq0SAzMb1IzuqlHEp68Zq1VnFd5PVzBo11HsOEYvYkiNQymP39MjCvJy3wYcHRW006q
         tGVg1pyOsnO9IE10qnzuVL8QNY3mvAPkJG4pvdM4jCDMr9j/HVWV1MOHSjkFmad4Dn4b
         k9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVIxYEQfLFJxt9tgsgUJTz/t7cytxV6N5857OmJlts=;
        b=1nkwTXO56YHT6czuybvgtm/YwkQWTOLi2uSWgGyTGFoBtRDIrSWTCtNdtZy11JZOI0
         gQDUOuq6B2M6T5gbXeCbdJ7+oLmnoPXcdTyT7Y2W23YiEezhHHsM+kUkSIQzOvleXqah
         LXL4NL4l64PBL79oWfqZdY9J7tlfJoEFijcRvG+jZ5/qANp/fgD/obEtOq1rsHdFhEC1
         9auhcno72M2v6uIc2SH5Mj38jlg67a0GXZ1TDCZ4dMiZR5Jh48Wq1WX15XBX4cR/0CXx
         YM5Q2OYwowP11LggAMra3FyIFP+upcCatZfG/4VUXt5xI2XVI8YKUDls6KEYQKF7JqUe
         2NCQ==
X-Gm-Message-State: ANoB5pmfgXQPn9XpHDQNkIzl7ezCpevuGPRgjlJuJNA/BjBiSa65k19v
        BQkNEhfiIbmq99Okpq/vJf5iDw==
X-Google-Smtp-Source: AA0mqf47v23i0Y6WxQlyWJtP8WdLL98zzrQukLxk2tgjXmYTZNKSEM060eK0fALUYdhKkBYPtRv09A==
X-Received: by 2002:a05:600c:4f93:b0:3cf:a616:ccc0 with SMTP id n19-20020a05600c4f9300b003cfa616ccc0mr57236129wmq.73.1669994884267;
        Fri, 02 Dec 2022 07:28:04 -0800 (PST)
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
Subject: [PATCH 5/5] media: i2c: ov08d10: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Fri,  2 Dec 2022 15:27:27 +0000
Message-Id: <20221202152727.1010207-6-dave.stevenson@raspberrypi.com>
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
 drivers/media/i2c/ov08d10.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index c1703596c3dc..a39e086a51c5 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -990,8 +990,13 @@ static int ov08d10_init_controls(struct ov08d10 *ov08d10)
 
 	ov08d10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov08d10_ctrl_ops,
 					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (ov08d10->hflip)
+		ov08d10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ov08d10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov08d10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (ov08d10->vflip)
+		ov08d10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
 
-- 
2.34.1

