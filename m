Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A60967CF47
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbjAZPHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjAZPH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:07:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630D36C13C
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:07:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 166E2B818D3
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06352C433EF;
        Thu, 26 Jan 2023 15:07:17 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH 16/17] media: st: delta: introduce 'err_too_many_comps' label
Date:   Thu, 26 Jan 2023 16:06:56 +0100
Message-Id: <20230126150657.367921-17-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code mixed gotos and returns, which confused smatch. Add a
err_too_many_comps label to handle the error instead of a return,
this helps smatch understand the code, and it's a bit more consistent
as well.

This fixes this smatch warning:

delta-mjpeg-hdr.c:67 delta_mjpeg_read_sof() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../platform/st/sti/delta/delta-mjpeg-hdr.c      | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/sti/delta/delta-mjpeg-hdr.c b/drivers/media/platform/st/sti/delta/delta-mjpeg-hdr.c
index 90e5b2f72c82..c132487637d3 100644
--- a/drivers/media/platform/st/sti/delta/delta-mjpeg-hdr.c
+++ b/drivers/media/platform/st/sti/delta/delta-mjpeg-hdr.c
@@ -59,13 +59,8 @@ static int delta_mjpeg_read_sof(struct delta_ctx *pctx,
 	header->nb_of_components = *(u8 *)(data + offset);
 	offset += sizeof(u8);
 
-	if (header->nb_of_components >= MJPEG_MAX_COMPONENTS) {
-		dev_err(delta->dev,
-			"%s   unsupported number of components (%d > %d)\n",
-			pctx->name, header->nb_of_components,
-			MJPEG_MAX_COMPONENTS);
-		return -EINVAL;
-	}
+	if (header->nb_of_components >= MJPEG_MAX_COMPONENTS)
+		goto err_too_many_comps;
 
 	if ((offset + header->nb_of_components *
 	     sizeof(header->components[0])) > size)
@@ -78,6 +73,13 @@ static int delta_mjpeg_read_sof(struct delta_ctx *pctx,
 		"%s   sof: reached end of %d size input stream\n",
 		pctx->name, size);
 	return -ENODATA;
+
+err_too_many_comps:
+	dev_err(delta->dev,
+		"%s   unsupported number of components (%d > %d)\n",
+		pctx->name, header->nb_of_components,
+		MJPEG_MAX_COMPONENTS);
+	return -EINVAL;
 }
 
 int delta_mjpeg_read_header(struct delta_ctx *pctx,
-- 
2.39.0

