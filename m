Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B47550756
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbiFRWYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiFRWYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:24:47 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF1610FFD
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:24:46 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4C93E83F6A;
        Sun, 19 Jun 2022 00:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655591085;
        bh=kerJGLylwbgQWsqgCvrbOM4bW/j4Q71X/4yrgOIcYqk=;
        h=From:To:Cc:Subject:Date:From;
        b=eU9sd6bc3GnY2hkF3TKM4A15xKg3j8gx0QXgCKgBCVZYJ9ZyJlmZoJ3ZyYNmzhNlW
         8KbLw9inMPlnKDbiFP0UL9FPLGhySnqYY3H6H4dEMnflrDikTg2vMG6rnjHcEFHK9H
         e1bZ9t24wIRHh+iiWmECIu9kjbxQKFHssJ9iCLOnLkDw3lrS5oZG5e6IHl8QObymE0
         uOPg9sO07Jh+b2oaYbYajslBC92Bu+nZGqQPLbSd36JV1JmoDeEt5FbAMfY99SFgpe
         UcFlZ431cUY19ifNCtjKdIinIl30mNcoo9u3ADPwtt2YJEJOpN3aOwH7Pcfwv1kYrx
         1IXbucXoenLTA==
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
Subject: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Date:   Sun, 19 Jun 2022 00:24:42 +0200
Message-Id: <20220618222442.478285-1-marex@denx.de>
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

Any local subdev state should be allocated and free'd using
__v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
takes care of calling .init_cfg() subdev op. Without this,
subdev internal state might be uninitialized by the time
any other subdev op is called.

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
 drivers/media/platform/st/stm32/stm32-dcmi.c | 51 +++++++++++---------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index ec54b5ecfd544..ef795c12fb233 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -996,22 +996,26 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 			struct dcmi_framesize *sd_framesize)
 {
 	const struct dcmi_format *sd_fmt;
+	static struct lock_class_key key;
 	struct dcmi_framesize sd_fsize;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+	struct v4l2_subdev_state *sd_state;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
 	bool do_crop;
 	int ret;
 
+	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
+	if (IS_ERR(sd_state))
+		return PTR_ERR(sd_state);
+
 	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
 	if (!sd_fmt) {
-		if (!dcmi->num_of_sd_formats)
-			return -ENODATA;
+		if (!dcmi->num_of_sd_formats) {
+			ret = -ENODATA;
+			goto done;
+		}
 
 		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
 		pix->pixelformat = sd_fmt->fourcc;
@@ -1036,10 +1040,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
+	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	/* Update pix regarding to what sensor can do */
 	v4l2_fill_pix_format(pix, &format.format);
@@ -1079,7 +1082,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	if (sd_framesize)
 		*sd_framesize = sd_fsize;
 
-	return 0;
+done:
+	__v4l2_subdev_state_free(sd_state);
+	return ret;
 }
 
 static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
@@ -1183,31 +1188,33 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 				  struct v4l2_pix_format *pix)
 {
 	const struct dcmi_format *sd_fmt;
+	static struct lock_class_key key;
+	struct v4l2_subdev_state *sd_state;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
 	int ret;
 
+	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
+	if (IS_ERR(sd_state))
+		return PTR_ERR(sd_state);
+
 	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
 	if (!sd_fmt) {
-		if (!dcmi->num_of_sd_formats)
-			return -ENODATA;
+		if (!dcmi->num_of_sd_formats) {
+			ret = -ENODATA;
+			goto done;
+		}
 
 		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
 		pix->pixelformat = sd_fmt->fourcc;
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
+done:
+	__v4l2_subdev_state_free(sd_state);
+	return ret;
 }
 
 static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
-- 
2.35.1

