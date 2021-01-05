Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E2E2EB43C
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 21:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbhAEUbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 15:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729608AbhAEUbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 15:31:21 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D362DC061574;
        Tue,  5 Jan 2021 12:30:40 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id w1so2161833ejf.11;
        Tue, 05 Jan 2021 12:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ATMiMhOGdNGb2H7yTKxBixWgJ0m9iDQbo2lqGV5shds=;
        b=QXiiDz3j1LH018diNgWoyn43TV7X/vca2nz7rpv6SszpgLBA3Y1LgBQ70HyLQur0xB
         9wkS8SeeVfNsniBz+MjED0LH38zCm32YdsOupKiR23+mzmiEwvE1QtE4GX9uW5K3ImQI
         yFVqs73aW955adpBQ1lAUuMHmG6VIzC73doJTUqUFXPfo3KiT8Ni/9RLvP9H1fzneiQj
         bzVqkdzgfrEKujYNEeWuIdgNamxXdbsD4gBi2DiRcPGcbjadgNuFLIMCvbFS/rLhpPNl
         tmaPgfJ83WT9VZGRhIAFuzdzA6dGKU+IHSVy4V4xCRKjLedvCcQc5JsyIDZf1GpuB+rx
         LnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ATMiMhOGdNGb2H7yTKxBixWgJ0m9iDQbo2lqGV5shds=;
        b=UKdPKqXx22osegHUprJByRN/Of4h2ZlsWex7CnXbRPjScyuKdc23gdKw7J/5zLDSZJ
         j6sGI3393KKEmrbxw9aCzqDPNFSGdHQhjQBZa6DGSUxoQCMXI0atHoftEHvHd0rH4bBc
         b3KrGzrxT/xT1zkf/yjYqswojbeTPN0KbeHKvQY+73Y4rxBOWWEP69JHD2VLfB1U9aKT
         bYOVzULev3DNVBlcFlAS9dr9/WrXMMGo2rvc8S1MhsmtLQe5s5h5Zx/i9QbAux2SIK2P
         0oYEbTl4wLABjYL9+dmEemf16daACJooDxlAA8vXv9gJMiI6VrUekMlpgAifMXMJL5P9
         1kbg==
X-Gm-Message-State: AOAM531877uW9GMQvnOQCG8hiWyzLx70HMPrO08zds6pwN4FCO02Vk3y
        Pe+vL8oo1W/viQhUHNxVtR0=
X-Google-Smtp-Source: ABdhPJxAiG2jqPLt0FbNfkA331PcVSFMVwN2ToZI78gYGShQZwmpRNVvIfGXSPCvFWQdBDRch2tVGw==
X-Received: by 2002:a17:907:20a4:: with SMTP id pw4mr697060ejb.499.1609878639621;
        Tue, 05 Jan 2021 12:30:39 -0800 (PST)
Received: from arch.laptop (84-238-151-182.ip.btc-net.bg. [84.238.151.182])
        by smtp.gmail.com with ESMTPSA id j5sm79858edl.42.2021.01.05.12.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 12:30:38 -0800 (PST)
From:   Filip Kolev <fil.kolev@gmail.com>
Cc:     Filip Kolev <fil.kolev@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: ov2722: replace hardcoded function name
Date:   Tue,  5 Jan 2021 22:29:18 +0200
Message-Id: <20210105202945.26913-1-fil.kolev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a debug message using hardcoded function name instead of the
__func__ macro. Replace it.

Report from checkpatch.pl on the file:

WARNING: Prefer using '"%s...", __func__' to using 'ov2722_remove', this function's name, in a string
+	dev_dbg(&client->dev, "ov2722_remove...\n");

Signed-off-by: Filip Kolev <fil.kolev@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index eecefcd734d0e..21d6bc62d452a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -1175,7 +1175,7 @@ static int ov2722_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
-	dev_dbg(&client->dev, "ov2722_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
-- 
2.30.0

