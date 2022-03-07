Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CF14D05EB
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 19:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240475AbiCGSE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 13:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235995AbiCGSE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 13:04:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7DF6B0B1
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 10:04:02 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC4998EB;
        Mon,  7 Mar 2022 19:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646676240;
        bh=RN1KaYPR86OAmsv+ndwaXA/1GmqnIThqQYd+ZcJZLBI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S4HSGu17Agrr4Al1e+Hl942FAdyXlnXTMRCaHJ8dV9gD4ceGkRT082JvHMFqvYUBo
         RTuJcvOg7p/F+HobSo1DOS41W6aX/upqXJWIBW+tESv1tHSEsZX22mbDc1nc9WqHuQ
         1H8VgHYPVpygSuc/mVzoxgz6E0tqWo+u4ntdyOzQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 3/3] media: vivid: Add support for the new YUVA and YUVX formats
Date:   Mon,  7 Mar 2022 20:03:42 +0200
Message-Id: <20220307180342.10666-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
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

Extend vivid to support the newly added YUVA and YUVX pixel formats
through the TPG.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/test-drivers/vivid/vivid-vid-common.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index 19701fe72030..38d788b5cf19 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -198,6 +198,21 @@ struct vivid_fmt vivid_formats[] = {
 		.planes   = 1,
 		.buffers = 1,
 	},
+	{
+		.fourcc   = V4L2_PIX_FMT_YUVA32,
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0xff000000,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_YUVX32,
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+	},
 	{
 		.fourcc   = V4L2_PIX_FMT_GREY,
 		.vdownsampling = { 1 },
-- 
Regards,

Laurent Pinchart

