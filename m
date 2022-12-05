Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280B7642B95
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbiLEPZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbiLEPZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:25:02 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B6320F51
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:22:16 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id bg10so9001231wmb.1
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTVIxYEQfLFJxt9tgsgUJTz/t7cytxV6N5857OmJlts=;
        b=SXA1c2F9YaXaMcnGm6ue1saPcIabZBH1FCgtKGVs64JfVhpQylYKsomj7N9W4t+IVE
         CE8gyKR0gNlabFNC4vw9iBpVGajDfFpES9ZuT/d5lAYk/kZJPIr4k4KE6Cz8i7MORks+
         HSoook0Tgmb5gmc8i8h+9GK/9aptNzomTHQDgpQA+ZOu2ROzQ8LVG0W6qcdYV/N/o/y9
         EWO933VwPbU1QthJtgGElJF7oHa7f77p27wsvY4b93o+8ix9CqCjJ0wTHwn9+9d5QCDo
         rt7Qf7Nhyh/ZKeaP+2d6jRNbc+sSdPIamQ8fLQtbiOAw8eB8k+ji2wClz9uBuqMNF+dn
         DqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVIxYEQfLFJxt9tgsgUJTz/t7cytxV6N5857OmJlts=;
        b=dMrWNNEF/HEzBxQQpcObYvPsYGPp5RUM7JT5c6CVKNUIIH8BZzRxTsQDbl2rbG7UgF
         mr63NuMciPrK9uIx1tdarU0WdYJRlr3a2k6T+neczUKAWssrc5wClJHeNmI9sQw8KzWU
         9o981Zjkcv/Gv9zNWtzlG0in/FHjXVPGs/t/ORk+RJjGcV/FQoi0Mn+DtIEyumm+XxBw
         E3nPSg3h93rWjedh5p+wPUxdcaGLz3nIokWRy1zYUpFWPJVvdyj7Sh+7w3GERrV4x8QM
         hCibn5p2rrCO7tn+tjXeKVmjrcM2Os3WD1ynJqFNzku/qbW/JfqKY8nrqdz2bS+ooemC
         KWYg==
X-Gm-Message-State: ANoB5pmdwwoNDqQTu0+O6URXPY6g1Cj2fJ5wX3J43KiUhNjzkVRPg8LZ
        p0OrH+1q7OtEHFhgml+r5Gyt1w==
X-Google-Smtp-Source: AA0mqf7kXt8ZkmkgIvQNanWi2m1xBpMEQz7RspYEH7QsffCEpjs++F3lbN/5zFqwI+k9Vumn9aXZYw==
X-Received: by 2002:a05:600c:5118:b0:3d0:7026:49eb with SMTP id o24-20020a05600c511800b003d0702649ebmr18230074wms.53.1670253733594;
        Mon, 05 Dec 2022 07:22:13 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm25144905wmb.22.2022.12.05.07.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:22:13 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 5/5] media: i2c: ov08d10: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Mon,  5 Dec 2022 15:21:49 +0000
Message-Id: <20221205152149.1364185-6-dave.stevenson@raspberrypi.com>
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

