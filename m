Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60390550754
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbiFRWX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbiFRWX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:23:58 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D912411A2F
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:23:57 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5577683F6A;
        Sun, 19 Jun 2022 00:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655591036;
        bh=JzLYLG6+uKVyOgzUfVF0G9CvRGpBJwsOe34hPa8nUFg=;
        h=From:To:Cc:Subject:Date:From;
        b=lPOHB5RQ1msl7YpLe2ibK3mzPfL0TZaxDoxFK+HHiO/PfqWEuWxprnYOSOrZt/bEo
         Q/w3/rvigkzWXWN/NQ9Mr/IZX+STi873pJyQX8IpbpI/4Fz6NnU9MPDpxQmS6lp0p5
         foMF4EVbVj1HP5/B6KzkErz99knJJJFXj/KhNxlp72U3pwjxjeCTwGHK1FdG7e2/Mz
         aqL3jJr6kUL/8mTf301HPy21u2Un7uybz1curgddQdCpjakNhnOsAoFyMx6UiSww9u
         MUotBAv//w2wiVZ0te7EFRfC2NHuw+UbKYuBYLr0H2tL/CDT3Y8F9jjbJ0Bpz6G9W0
         ULDLE0PM3tTlg==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: stm32: dcmi: Drop always NULL sd_state from dcmi_pipeline_s_fmt()
Date:   Sun, 19 Jun 2022 00:23:54 +0200
Message-Id: <20220618222354.478227-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The second argument is always NULL, stop passing it to the function.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 56f4e04bc7c49..ec54b5ecfd544 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -622,7 +622,6 @@ static struct media_entity *dcmi_find_source(struct stm32_dcmi *dcmi)
 }
 
 static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
-			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *format)
 {
 	struct media_entity *entity = &dcmi->source->entity;
@@ -664,7 +663,7 @@ static int dcmi_pipeline_s_fmt(struct stm32_dcmi *dcmi,
 			format->format.width, format->format.height);
 
 		fmt.pad = pad->index;
-		ret = v4l2_subdev_call(subdev, pad, set_fmt, sd_state, &fmt);
+		ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
 		if (ret < 0) {
 			dev_err(dcmi->dev, "%s: Failed to set format 0x%x %ux%u on \"%s\":%d pad (%d)\n",
 				__func__, format->format.code,
@@ -1115,7 +1114,7 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	mf->width = sd_framesize.width;
 	mf->height = sd_framesize.height;
 
-	ret = dcmi_pipeline_s_fmt(dcmi, NULL, &format);
+	ret = dcmi_pipeline_s_fmt(dcmi, &format);
 	if (ret < 0)
 		return ret;
 
-- 
2.35.1

