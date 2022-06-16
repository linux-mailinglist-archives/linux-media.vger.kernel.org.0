Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0454DEA6
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 12:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359864AbiFPKID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 06:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiFPKIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 06:08:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0552A402
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 03:08:01 -0700 (PDT)
Received: from mail.ideasonboard.com (unknown [217.155.82.121])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CD438AF;
        Thu, 16 Jun 2022 12:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655374077;
        bh=1ClYqVr5NEcYgIdPdX9QDpYbakc4WKE8zc3PPBLdOPM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c90TK5bFV1wKE+s5iZbJf5UcBI30VwtO/7jA1clTCOysslf2ayrxvJ4CvLzz4fscV
         1CBqyPCo7WGgWw1LHNtdlVEMUzYv2p1BNj9cOzI7Cscrey7pkrf2HqrXFFNXsT2QoX
         wzrybtry6hsqm/mrkF31FDL8BVt1SAcF5PK3kfNE=
From:   Daniel Oakley <daniel.oakley@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Daniel Oakley <daniel.oakley@ideasonboard.com>
Subject: [PATCH 3/3] media: vimc: use data link entities enum to index the ent_config array
Date:   Thu, 16 Jun 2022 11:07:47 +0100
Message-Id: <20220616100747.48124-4-daniel.oakley@ideasonboard.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
References: <20220616100747.48124-1-daniel.oakley@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Future additions to the ent_config[] could break the association between
the index of the struct vimc_ent_config entries in the ent_config[] array,
and the index defined by the enum proposed in the previous patch. Using
designated initializers solves this by linking the 2 together clearly in
code and prevents the array not reflecting the enum. There is no
functional change intended.

Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Daniel Oakley <daniel.oakley@ideasonboard.com>
---
 drivers/media/test-drivers/vimc/vimc-core.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
index f3437d4408ff..c73f91947f44 100644
--- a/drivers/media/test-drivers/vimc/vimc-core.c
+++ b/drivers/media/test-drivers/vimc/vimc-core.c
@@ -82,48 +82,48 @@ struct vimc_pipeline_config {
  */
 
 static struct vimc_ent_config ent_config[] = {
-	{
+	[SENSOR_A] = {
 		.name = "Sensor A",
 		.type = &vimc_sensor_type
 	},
-	{
+	[SENSOR_B] = {
 		.name = "Sensor B",
 		.type = &vimc_sensor_type
 	},
-	{
+	[DEBAYER_A] = {
 		.name = "Debayer A",
 		.type = &vimc_debayer_type
 	},
-	{
+	[DEBAYER_B] = {
 		.name = "Debayer B",
 		.type = &vimc_debayer_type
 	},
-	{
+	[RAW_CAPTURE_0] = {
 		.name = "Raw Capture 0",
 		.type = &vimc_capture_type
 	},
-	{
+	[RAW_CAPTURE_1] = {
 		.name = "Raw Capture 1",
 		.type = &vimc_capture_type
 	},
-	{
+	[RGB_YUV_INPUT] = {
 		/* TODO: change this to vimc-input when it is implemented */
 		.name = "RGB/YUV Input",
 		.type = &vimc_sensor_type
 	},
-	{
+	[SCALER] = {
 		.name = "Scaler",
 		.type = &vimc_scaler_type
 	},
-	{
+	[RGB_YUV_CAPTURE] = {
 		.name = "RGB/YUV Capture",
 		.type = &vimc_capture_type
 	},
-	{
+	[LENS_A] = {
 		.name = "Lens A",
 		.type = &vimc_lens_type
 	},
-	{
+	[LENS_B] = {
 		.name = "Lens B",
 		.type = &vimc_lens_type
 	},
-- 
2.36.1

