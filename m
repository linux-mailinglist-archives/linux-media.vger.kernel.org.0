Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03B930470A
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730679AbhAZROF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389585AbhAZHuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 02:50:50 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E61C06174A
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 23:50:02 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id u11so18364060ljo.13
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 23:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QzNr7Y36ceZ98RJN+WjlQV3oeSFVn4zACIduR95Oy6w=;
        b=YMB8K50GIVNRpC0zCf5QxVa16FCljbVWL2+bEBT+BXpkJvwwah/jjSyt3rAn2FV3eq
         3Ht3q/hPN187G3xvyqaETyQkgy1AhyJ544lujYGu3JqBnYz9/OqJo71R7FMTJxE1BATB
         UFSxUViJ1rOyidSmEJFKCCKjmouKQzyz9/fGmkxyuMNSEy82BnzYKml+mkcpjwvA58/N
         dTWmFLIFs9pjMwj8mmqDSEsQpXl+nPIS3xxkMHNgt7EtSqdfEfU/dwN8YROOO0AU5BW5
         rUN186YmBRr5gjXTjURMPYYDcvNR42MzcuGEbyNQqMLdICSW+KdLgda1KbED9ThhH03q
         LOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QzNr7Y36ceZ98RJN+WjlQV3oeSFVn4zACIduR95Oy6w=;
        b=EINdizo//lsb7FpJkDj4tX4Ne7L1kIJOWw4Yo7qdkIx8V4FAUnIe/Wa7UUVj9Jm63I
         VpJOMarKi1plE4rwyJ/SkiFb7hTPxQYKT2WXo5ZPc0QAwQhH3CLdWpl4Cxhg+tSzHHtc
         eTBEw1yXCkZerfCSJozzdz6g7TCa6z29tr+O4OogLPwHzmHUHJWVT8st1nBVnjjBPtfY
         rHMG+j6/ddQ9kPjCXremDUCPxJakLBcjUneFPNvxVABkCmmSEea5J7bS2M8sPiRuj+AB
         mxJ7vVnP2WaGF/ilLebOySk+3y1LY59/dWdjDZuqFnfao5KzPhGpM9bOPwSfqMDfaxMs
         x26Q==
X-Gm-Message-State: AOAM533Z0zjbz5oTZIHYOnTUODKEQOGelBhbBRDJlnuLgrDeBXls9oRh
        aGI5YJjIfc0h1suGRCM159JyCA==
X-Google-Smtp-Source: ABdhPJzGj0hsn5+J9qBrOrmv41eiastPsTnom0tHpYcTffF0mdgOwieJ0RsqviboExS19wjT1ye9CQ==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr2232979ljh.332.1611647400805;
        Mon, 25 Jan 2021 23:50:00 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id j2sm2401068lfe.134.2021.01.25.23.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 23:50:00 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, dave.stevenson@raspberrypi.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH] media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control
Date:   Tue, 26 Jan 2021 10:49:34 +0300
Message-Id: <20210126074934.26980-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control is needed for imx219 driver, as the link frequency
is independent from the pixel rate in this case, and can't be
calculated from the pixel rate.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx219.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 92a8d52776b8..6e3382b85a90 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -390,6 +390,10 @@ static const struct imx219_reg raw10_framefmt_regs[] = {
 	{0x0309, 0x0a},
 };
 
+static const s64 imx219_link_freq_menu[] = {
+	IMX219_DEFAULT_LINK_FREQ,
+};
+
 static const char * const imx219_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bars",
@@ -547,6 +551,7 @@ struct imx219 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
@@ -1269,7 +1274,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 	int i, ret;
 
 	ctrl_hdlr = &imx219->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -1283,6 +1288,14 @@ static int imx219_init_controls(struct imx219 *imx219)
 					       IMX219_PIXEL_RATE, 1,
 					       IMX219_PIXEL_RATE);
 
+	imx219->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
+				       imx219_link_freq_menu);
+	if (imx219->link_freq)
+		imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	/* Initial vblank/hblank/exposure parameters based on current mode */
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
-- 
2.17.1

