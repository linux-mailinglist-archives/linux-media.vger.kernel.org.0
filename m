Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2585FFD7A
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiJPGQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiJPGQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C4A386AE
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BC8F987;
        Sun, 16 Oct 2022 08:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900959;
        bh=S/Ez1qsQMBYRJxUatnmbHgvQgfLfY72NgUz09Ns4FSw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KeMlOL0jXOfYkObter4Y5o3FV923rg/cubD1ujWki92FgapdfnL2wjp3IhL3t8s3k
         O04mtA68x7lRXmLxjB/SKH7Z6fvoKCPlUyrnHa+Y9ygwPa8Clxii6zsjHA3gYV1B2d
         X0TrdM3RXnXSAJiYEwAFghLsIJ66MXl8sQAT3bJw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 07/20] media: i2c: imx290: Specify HMAX values in decimal
Date:   Sun, 16 Oct 2022 09:15:10 +0300
Message-Id: <20221016061523.30127-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HMAX value specifies the total line length in pixels. It's thus more
readable in decimal than hexadecimal. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index e1f91b4275c3..711282126c34 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -307,7 +307,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 0x1130,
+		.hmax = 4400,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -315,7 +315,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 0x19c8,
+		.hmax = 6600,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -326,7 +326,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 0x0898,
+		.hmax = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -334,7 +334,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 0x0ce4,
+		.hmax = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
-- 
Regards,

Laurent Pinchart

