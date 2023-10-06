Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48A67BB4DA
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjJFKJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjJFKJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:09:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F80FD
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:08:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A36C433CC;
        Fri,  6 Oct 2023 10:08:58 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 5/9] media: nxp: imx-jpeg: use goto instead of return
Date:   Fri,  6 Oct 2023 12:08:46 +0200
Message-Id: <64c3edcac5e3193303e87d3be04bfa12ebf43e71.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For consistency use goto instead of return.

This fixes a smatch warning:

drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Mirela Rabulea <mirela.rabulea@nxp.com>
CC: NXP Linux Team <linux-imx@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index e74b0ed8ec5b..1fc6b3660bdd 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2789,7 +2789,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	ret = mxc_jpeg_attach_pm_domains(jpeg);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach power domains %d\n", ret);
-		return ret;
+		goto err_clk;
 	}
 
 	/* v4l2 */
-- 
2.40.1

