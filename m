Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 335D61168BF
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfLII6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:58:44 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35062 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLII6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:58:44 -0500
Received: by mail-pf1-f194.google.com with SMTP id b19so6881883pfo.2;
        Mon, 09 Dec 2019 00:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5879LZ/Pi63QwYbKH9FG7q4Bl0Ds4fjn/Pvg7Od1Ec=;
        b=RZaX0ioqUEqw0QfmHP6faFSw/t94WFmFghK9AEN6Yv+N/+UKM772AHLpfMdRLslZCz
         A1LJv9UNjP5cXmhnRr/SWM/veawKnW1O+iElSUa5ANIA9akzRPw9A9t+sr4xuTp1CnLW
         2QueHSGHz/xh0Mpg5C31KZN2D/Uyu1LKQGTzO5S1a+AUG1Ky+qPl3uhZrOB1i+QBEEfV
         hSI2mvJvTb1hQga8wCfn6zUhQpldlomq2PprONFxrzqDnyb58T+3YlJ0Rk+HInqAqvor
         QkjLVHbIAEPN5qD75BlwVNmISorFFWMfXJvZfx0Tm0GEN5OmLmpcdGrqnt/LAq1VDAqb
         isTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5879LZ/Pi63QwYbKH9FG7q4Bl0Ds4fjn/Pvg7Od1Ec=;
        b=hp/sW0T0wG9qNqBAjZrNghNzf3d9IMbrJxvXtPRMXs3t4y6Ylj9KPxM1GnUKTiE9sG
         KcCpKwjLKaF/I35+KgGiCg6VLNlN3Lhqd0Icub5MvpKhKb8gQXor5va7QTkBmsoDkXB/
         hT4T8bUXMa8SsqaWHgghRRmj/6/9h84WRrZ4boy02hie9W/9UnjmxGcAFiQfvBLGBt2z
         WzIiv0/PN4ntEtGX90xnllBe1PH7xd8LwfBo9lba8GjDrpe1L03J9x3qHPwY7ungd1yA
         a56o7HzoTSdLAF0i9tWp8RjH6qBD7gsPB9kuPiszrW/aodPwNNIWJMeCXxp6KZ7PUxfw
         PSGg==
X-Gm-Message-State: APjAAAU27iI95TRG7F5i130hJF9e2tj3rftJDamzSLGN5OWAlaO0lqZI
        TrYAs+eUv6Qk3zdRxrrXGIE=
X-Google-Smtp-Source: APXvYqyOgxCtG+slALBSZvCRJBZ2STsFf/PiiOls9fa04H+mWGLjYNLpGc90OOQE5vNvxiYdGKoleQ==
X-Received: by 2002:a63:cc02:: with SMTP id x2mr17928600pgf.114.1575881923958;
        Mon, 09 Dec 2019 00:58:43 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id f24sm11681569pjp.12.2019.12.09.00.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:58:43 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: imx7-mipi-csis: Add the missed v4l2_async_notifier_cleanup in remove
Date:   Mon,  9 Dec 2019 16:58:28 +0800
Message-Id: <20191209085828.16183-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All drivers in imx call v4l2_async_notifier_cleanup() after unregistering
the notifier except this driver.
This should be a miss and we need to add the call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 99166afca071..2bfa85bb84e7 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1105,6 +1105,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	mipi_csis_debugfs_exit(state);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 	v4l2_async_notifier_unregister(&state->subdev_notifier);
+	v4l2_async_notifier_cleanup(&state->subdev_notifier);
 
 	pm_runtime_disable(&pdev->dev);
 	mipi_csis_pm_suspend(&pdev->dev, true);
-- 
2.24.0

