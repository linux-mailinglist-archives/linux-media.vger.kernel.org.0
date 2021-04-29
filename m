Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4480136EB5B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbhD2N3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 09:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhD2N3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 09:29:35 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF73C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:47 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m9so54220825wrx.3
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qNUeNwA8nY60aEA3aVaI9L7S03k8N0gBbtn34g0NOKs=;
        b=bFqRGON3t7Z00rpCFWYJtBn7zFtU/v29Pd6a69EusoEdkP42dwWrQd06jvDrWSayJK
         e8eEmr1AFEOhXkqiXJo7A/Wucs/ylMbSOtVehr8Y0tEdInZlwjhtfpY/rFukAc8swRpn
         xMMi5eSnec/w+wLfQzXQeG395ZHBhhpW01hpVLITi2zjTD5fAWum5wG3dXUl+s4UIH4t
         ectIo38QY3EmWDTVlKxAuQQOqJlz/PRlFo3ZhCa/j0u/oPIO4hwRRbDenquGoFOltj9f
         pRwsVuaCmqaIEjNKOcNFdIsYZHRAtsNHLTzF9znMkaYgNMsPQQMflpzHMY/KwCmaePO1
         QG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qNUeNwA8nY60aEA3aVaI9L7S03k8N0gBbtn34g0NOKs=;
        b=F9kyASbBNkPSA/tfunubBTA1EyTV/RzN1cdrv6irVONvB6p5lFPNlr5SnWFeDNJ3Hx
         cG2hNyPNpZe1W8nmWhVuTXkWGl325eJGp1Oq7GVdzDlrMopzKaqGAy/yDWVX6/Ew05ba
         EAaLxGIFgesZn24Qp0M10RYDbUSTkM8KI8wLTLUj6y6tXJfJDLe8GDa+632y0fS84om0
         gwrvYm7XxHzs98mQVMGy0mldFvmLlEmZf+jk5BUrKLqKBfVyob3eHivNQ1cxFaiqhvgE
         Qrvninr7G/rmxZAKWb76PqaqkT1J+MkkT6KdQOPkGPKCYLumxyMdw9QrDLNxBvhl0a3H
         v6Jg==
X-Gm-Message-State: AOAM530ksbLrT+OuYCYLgAPZEKf28WgxSYc5FkmXUL2iKny4d4gQrIQz
        BOROXpKacLbujaUi/e6aGD6TbmN5dnwNb+qt
X-Google-Smtp-Source: ABdhPJx1QVuecui5kOr9og4ui5nvgYnhIuHu8xrNfFS3r9FBriTpLNFjqs2CDKj95DgZpVqHWLvd8Q==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr10780042wrm.32.1619702925979;
        Thu, 29 Apr 2021 06:28:45 -0700 (PDT)
Received: from localhost.localdomain (hst-221-38.medicom.bg. [84.238.221.38])
        by smtp.gmail.com with ESMTPSA id n10sm4811462wrw.37.2021.04.29.06.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 06:28:45 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP 2/4] v4l2-ctrls: Add HEIC grid size control
Date:   Thu, 29 Apr 2021 16:28:31 +0300
Message-Id: <20210429132833.2802390-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control to set HEIC image grid size. This sets a grid (partition)
size for image encoding.  It will be used to instruct image encoder to
produce CAPTURE buffers for any grid of the input image, and it is
applicable when the input YUV buffer resolution is bigger then the
hardware can support.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 3 +++
 include/uapi/linux/v4l2-controls.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index ca50e21e2838..6b443f946906 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1034,6 +1034,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
 
+	case V4L2_CID_MPEG_VIDEO_HEIC_GRID_SIZE:		return "HEIC Grid Size";
+
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
@@ -1282,6 +1284,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+	case V4L2_CID_MPEG_VIDEO_HEIC_GRID_SIZE:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 6f8c08507bf4..6ae6cf3c815c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -800,6 +800,7 @@ enum v4l2_mpeg_video_frame_skip_mode {
 
 #define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY		(V4L2_CID_CODEC_BASE + 653)
 #define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE	(V4L2_CID_CODEC_BASE + 654)
+#define V4L2_CID_MPEG_VIDEO_HEIC_GRID_SIZE		(V4L2_CID_CODEC_BASE + 655)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
-- 
2.25.1

