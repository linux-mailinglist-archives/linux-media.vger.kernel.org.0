Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00902660746
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 20:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbjAFTkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 14:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbjAFTkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 14:40:52 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB26534D6D
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 11:40:49 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id bn26so2251396wrb.0
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Latrb+MylXKpijKJpBSX+i5hbxF05MEWVlFc7jwtP/8=;
        b=YKctH5fjqcumY5lCDtSZvEB+l0daLNKgaN/gGuIAxKyiKTeAFvwYFuomDIaC3l6aad
         yisgmxL1Grfg0sgROu/hfu+di7RJVSlJLl46D9rvGhzudtXydCDByjlgChGlg3kCuNRy
         gk6S2LsElk0RQMXHyEEnWIhWWEpqik8i02fsnuiUTzI4Fm7K99hJ5Pskw1cl7/eyiPsz
         pPjLbCL+piZQdZuVzpmZJqnhwdWKIo+o9Kx7VK9gdCa95lsnDLXabPXrlpodXLK5jxCe
         R2ncpnaDz8etsBzyEwwM97LTo0x8F8d4a8gDsLN65N0rtR5Qja99zGpyyLriV00ZTDPU
         Ftbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Latrb+MylXKpijKJpBSX+i5hbxF05MEWVlFc7jwtP/8=;
        b=IjFvG4oReim+meuQCs5haOglwR/cWXiZlX+N7ahTnPUZHErEkJ2eGsDWjCeNPy6FWu
         KgFQATuSnCgLA5ddVblnIOV5edLMhqqC9qqpbG9mbr7QrG5oh31Dh24itrN3EB7y0NRy
         iVQg9UT8/Kqtvz0bs14Yo+df3+I7+y7zsUg0BxB4KhSjr2P+EgLdOAQIxonbntaUZ3zo
         fvg+o9OKoZS+BvsJfhVh85gsm9yfD2IGXXg9b/DmYmpsq2QtlOKmH71J+EwErpbOAXWK
         N06rHU5Od4hv7xxkZdqzxnweL7HLg55RJmeKWSJc6tF0dG9/5FzhXwmzLGwQ4LVLoBpR
         Irgw==
X-Gm-Message-State: AFqh2kr0nVqvxCq2eR6jfLt7hailEXopQcSPXh3n8Hm5oaX477RByDy0
        z/BxPjClXLnuS5jgfNq4NLGn2nbXEnd6rA==
X-Google-Smtp-Source: AMrXdXs19AD5nkwy9gvXfhwBvkwr2YNqDNswO1U8o9FlnL9V9B9zvOCLbPWOLuYPGUIYAaY7sdGYKw==
X-Received: by 2002:adf:ec0e:0:b0:2bb:3219:9bfc with SMTP id x14-20020adfec0e000000b002bb32199bfcmr1190256wrn.50.1673034049168;
        Fri, 06 Jan 2023 11:40:49 -0800 (PST)
Received: from localhost.localdomain ([90.242.19.250])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0023662245d3csm1968650wrb.95.2023.01.06.11.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:40:48 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From:   adam@piggz.co.uk
To:     linux-media@vger.kernel.org
Cc:     yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev, paul.kocialkowski@bootlin.com,
        laurent.pinchart@ideasonboard.com, Adam Pigg <adam@piggz.co.uk>
Subject: [PATCH 3/3] media: sun6i-csi: implement vidioc_enum_framesizes
Date:   Fri,  6 Jan 2023 19:40:38 +0000
Message-Id: <20230106194038.16018-4-adam@piggz.co.uk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106194038.16018-1-adam@piggz.co.uk>
References: <20230106194038.16018-1-adam@piggz.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Adam Pigg <adam@piggz.co.uk>

Create sun6i_csi_capture_enum_framesizes which defines the min
and max frame sizes

Signed-off-by: Adam Pigg <adam@piggz.co.uk>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 54beba4d2b2f..2be761e6b650 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -739,6 +739,29 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesizes(struct file *file, void *fh,
+					  struct v4l2_frmsizeenum *fsize)
+{
+	const struct sun6i_csi_capture_format *format;
+
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	format = sun6i_csi_capture_format_find(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_enum_input(struct file *file, void *private,
 					struct v4l2_input *input)
 {
@@ -775,6 +798,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
 
 	.vidioc_enum_input		= sun6i_csi_capture_enum_input,
 	.vidioc_g_input			= sun6i_csi_capture_g_input,
-- 
2.39.0

