Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B49716B17
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbjE3RbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjE3RbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:01 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE47013D
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so42749f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467843; x=1688059843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbrlyIIVWtljdw9WJ85IvtoCQCr75FYCyMVLGQO5Tmc=;
        b=CA0VBEoc9iIBzHXJRv4T+k/OL6i3wBgopcXzil+L2P8VpB3s0QjWHoj3gJlUnn2zfY
         MRABR0lKl6stLocFEZ+aneDF+hR2zlE4wnZx/9/0EXijhvm8zTAfVrGJjSercDkQurmk
         8zXW9mJjx6wEKMQBNsVwzedFlbFY0vEePWLDJR09RYvS/JnaqYw58x8vQ8JAlySRrpqi
         aBKWB5S7h7yXLGF9bI7mnvg76dFzq5ELcr3RbyunOAOcZEEuxj8awsxjcEZvCA9jUaHs
         sE5gfT/tIBldNYSqJ+w/Mbcv1ZyI5lYjLGJFoGYnCAO6g6Ha9/vL3KPkD7mgNflHAVpy
         /8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467843; x=1688059843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbrlyIIVWtljdw9WJ85IvtoCQCr75FYCyMVLGQO5Tmc=;
        b=lPcxtBEHEdqx877wKGdGGck2UN2ddVoxjGKFZZ14MylMTAjITUa5VIppeh+G6BemRq
         AAFjxlkY9QXnq/Fxh4MzHmJiAy7mDsfWp4bSbQ8KIB53El71zZleaKfoEwmz+/Ml3Xlm
         I31fkN8gZwS5pjKmdBOhQ8ALVyVRxBkmyhcoqW9MgMKBUP6lmNQIvMJBx1O1qeeszK+z
         qSiuWdVVtMq8p1HhjOGWhUoihvm2ciYjnFSt8LNd6qRyu/U9oIa+uiIdiL5xnZoYZ3k4
         S99AlqdLlMUDutmyp10SU8z/x5YnEGdNmtHyekzRyo9h96TleEWdh8txc7yxtIUMMfz2
         uYRw==
X-Gm-Message-State: AC+VfDwoWHBbDs4ff4KOrj5ObSqx8ybpuFomR4f+M4Uf6kW6Ewz1Hqe5
        X2qfAhF4H0/S8jtRLfSNm8Hgsg==
X-Google-Smtp-Source: ACHHUZ58ZZhVsCHcRerb4diHY/iL0doRdlIylB7Zl7T38eUt87QIs7tYNUSOBmSCHZnVQyQOthf1YQ==
X-Received: by 2002:a5d:5957:0:b0:30a:ed4c:e17d with SMTP id e23-20020a5d5957000000b0030aed4ce17dmr4276888wri.5.1685467843361;
        Tue, 30 May 2023 10:30:43 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:43 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 12/21] media: i2c: imx258: Allow configuration of clock lane behaviour
Date:   Tue, 30 May 2023 18:29:51 +0100
Message-Id: <20230530173000.3060865-13-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor supports the clock lane either remaining in HS mode
during frame blanking, or dropping to LP11.

Add configuration of the mode via V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 1fa83fe82f27..b5c2dcb7c9e6 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -72,6 +72,8 @@
 /* Test Pattern Control */
 #define IMX258_REG_TEST_PATTERN		0x0600
 
+#define IMX258_CLK_BLANK_STOP		0x4040
+
 /* Orientation */
 #define REG_MIRROR_FLIP_CONTROL		0x0101
 #define REG_CONFIG_MIRROR_FLIP		0x03
@@ -634,6 +636,7 @@ struct imx258 {
 	const struct imx258_link_freq_config *link_freq_configs;
 	const s64 *link_freq_menu_items;
 	unsigned int nlanes;
+	unsigned int csi2_flags;
 
 	/*
 	 * Mutex for serialized access:
@@ -1072,6 +1075,15 @@ static int imx258_start_streaming(struct imx258 *imx258)
 		return ret;
 	}
 
+	ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
+			       IMX258_REG_VALUE_08BIT,
+			       imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
+			       1 : 0);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set clock lane mode\n", __func__);
+		return ret;
+	}
+
 	/* Apply default values of current mode */
 	reg_list = &imx258->cur_mode->reg_list;
 	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
@@ -1486,6 +1498,8 @@ static int imx258_probe(struct i2c_client *client)
 		goto error_endpoint_poweron;
 	}
 
+	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
-- 
2.25.1

