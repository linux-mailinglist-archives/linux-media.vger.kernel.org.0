Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93A1640962
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiLBP2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbiLBP2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:28:07 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD4E167C3
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:28:03 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso6698077wme.5
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHxCc37p6tdMw7GDX0tfO1VJnOm4kf0kDirvDqrlf+U=;
        b=iH1xMw1EZeE3ieyZngL2aKBDPg0kK4e5KNUdwDcb2o9pI/xPyFNUOoybW6AcjMT90U
         9gJEjhCIszudTcnSbq30aGCiUgKSGNvVnBdxTF6oUZpSoySE03DSmKKd7RykhEL7WT/b
         PQaGEA3p3V7sLcp6yKSBh4mmo8FeLwrHO//gawx/Jyg2hsGcQWyxp/lux5/bFMUrpgLi
         KwsAwfZA5Rqso8NR8e+WC4pXHq02hXnq0NrJRVtaeHMOqmzHEO+nhjDTEiB15EVDI9VF
         XTutjxe/2mONqZ9twjkT6L7+mFkxFhbxbkQJtPbd8DEnusOmAkjss5CXePb/NlN23Sys
         54Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHxCc37p6tdMw7GDX0tfO1VJnOm4kf0kDirvDqrlf+U=;
        b=eaDQKagvrzXbt6TDKtE8Sl/zFwiumptpKrCSlHclDHyMNd6ncCNYjRUvbyKVGOomsM
         rGgHFQaPXSOOg3aj0shwMF/yXpG4metb5WO+5AIEEgORy4CCjsOql3OnLJMqp8Mt8/a2
         pU8z03Jd/Uz5nxW3q8GaR9rAs67eZ6471p0yzLb3L2zmzB3Px0cpeDupOdG2uvvi3UrV
         UmMFjOYNto7vfRWkmkjiHGIO4fWh9hJo2EY8yfNj4xanRXHK/HJk8PC5kC9rTX5Ny6vr
         rVPp8Kj+DYsvoUbIPcJx/9EMj1+8HvISOMgrCqVi0Q7skFljrqA+MrPwS61J89Nn2iAg
         Ll8A==
X-Gm-Message-State: ANoB5pnYSgJv7kmZCkrvqLptqYf+p7oOE9IRqqdmBGhlTPt/tiJRaEyB
        4l3GIj2tn//49q4hTjUfp2j9Vg==
X-Google-Smtp-Source: AA0mqf4P9YXaLNj4QsVVeT0EqnwpCUk7hJy/YtvZWeRrD7OZ1/cT9z4iw8Jr8Nn7KEF8g87r5nlcdQ==
X-Received: by 2002:a05:600c:3b1e:b0:3c6:c182:b125 with SMTP id m30-20020a05600c3b1e00b003c6c182b125mr46128746wms.145.1669994881707;
        Fri, 02 Dec 2022 07:28:01 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id t17-20020a05600c41d100b003cf71b1f66csm8322773wmh.0.2022.12.02.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:28:01 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 1/5] media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Fri,  2 Dec 2022 15:27:23 +0000
Message-Id: <20221202152727.1010207-2-dave.stevenson@raspberrypi.com>
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
 drivers/media/i2c/ov2680.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index de66d3395a4d..aca76d7d674a 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -941,7 +941,11 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
 	hdl->lock = &sensor->lock;
 
 	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (ctrls->vflip)
+		ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (ctrls->hflip)
+		ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl,
 					&ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
-- 
2.34.1

