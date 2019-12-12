Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE48711D6F1
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 20:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730481AbfLLTRW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 14:17:22 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46348 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730168AbfLLTRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 14:17:22 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so3936803wrl.13
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 11:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FkC2WMgoS/Vijj1HJiaDAqFaZ6UcaSu7y0MSL7Z4jN4=;
        b=aeJSnS0rq8abuyfIzLMuaophVtnnaJdGHymqo9H1s5OiLFRUvxGmnUlPeILgfSAXGG
         vhoE5Lj6OGvhOV2bYujhupknqCdhEzrDbcMpamQa3gF6F9ND/W5julD/gsWHG6H0AftT
         pyfNUsltU9RRhOCLKYBgkCrmM48RWFGCP8rHYiFGANFDzI8zjPL7pT5p/VAJnz9PlxmT
         kkcZiWWo/99ODJ3/GOLRswzwS7exiglKnouCAdC0vy/ue+/S3K71gqaGmkTFEBj3373R
         H9LnsVv8CpmYhj8Im/zlr6ws5i0R7yCRKE8Mp2St7FdX4BMGtJIuNvgo4AYCOg8XT0pp
         5zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FkC2WMgoS/Vijj1HJiaDAqFaZ6UcaSu7y0MSL7Z4jN4=;
        b=qhxBlS3ZQgopadJyLLnDHOF0spKcXO5SZlbUL+a6r0lDZ/re/DFj2qXe0A8tBIc7p7
         mo/R3v6DNcc7jj8Z9JtCC2H4Na7sVOONgfM4gVOlWj9QqR9W2N2u9SE9N7F2El8lwed0
         ULWr7yknPZt0JkFMpth04Tk9wPlcaT74x3xEzuJSHGHgd8IhL6GuejYENcKF5BRuFW4p
         TXAXcsK9MDkf6hC/bC/t41WKWeruMG9YFrrtCJuePsJ8R3qzwqbE25rk4iX8aH2/MJVY
         iI8+PmMWS9/PYW+CyVD04+w/6qU4u25gs7Gt9iEDq0QFJpqbmEzEi0/ERVcYrz658ram
         fbWA==
X-Gm-Message-State: APjAAAXu86Cu0n2ZgGI87bsbeh2EOuPqHJqIO1n12YCEy5V/2AfrVOyf
        mY9uhVn+uprgP0jhMUh4TOfhyQ==
X-Google-Smtp-Source: APXvYqyYBKhHlyhdJl06AV3VhUEFUbBql6P9HEgkqb0961Utwqp3hj14g7S8N7ZkswKwm4qayK3rKQ==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr7810817wru.173.1576178238830;
        Thu, 12 Dec 2019 11:17:18 -0800 (PST)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id e8sm6928135wrt.7.2019.12.12.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:17:18 -0800 (PST)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH] media: imx7-mipi-csis: remove subdev_notifier
Date:   Thu, 12 Dec 2019 19:17:14 +0000
Message-Id: <20191212191714.812249-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It was defined a notifier in the csi_state structure that is never
allocated. And besides that it's unregister in the remove, even though
it is a no-op, just remove both.

Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 99166afca071..383abecb3bec 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -251,8 +251,6 @@ struct csi_state {
 
 	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
 
-	struct v4l2_async_notifier subdev_notifier;
-
 	struct csis_hw_reset hw_reset;
 	struct regulator *mipi_phy_regulator;
 	bool sink_linked;
@@ -1104,7 +1102,6 @@ static int mipi_csis_remove(struct platform_device *pdev)
 
 	mipi_csis_debugfs_exit(state);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
-	v4l2_async_notifier_unregister(&state->subdev_notifier);
 
 	pm_runtime_disable(&pdev->dev);
 	mipi_csis_pm_suspend(&pdev->dev, true);
-- 
2.24.0

