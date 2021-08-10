Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3BF3E572C
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239225AbhHJJin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237707AbhHJJin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:38:43 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5692BC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 02:38:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h14so25354569wrx.10
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7mqS3/0u9zikzgyiq6RTjXlJna72qnR7Oy4JzUDb+vQ=;
        b=eK+/pQDtg/O4CCL3Q8zyl5W4TGawZlm2FSHVhPaq8AiRHEJy3txlRfVlDJY6sFsYga
         TaM1tMpy8GYs+SzJbk6aBUvKakOIgy22JTGgG7Bo4izMRmcpcsu8o7ljTqfJUvKNVIG5
         dPJV3p8Ple6UzRQPDnDSzKoVY6Co1MqioNlInDZKEWOzkZ8f8wV5kpNf1o6fWDlvnf6K
         QWfUuEewO5jsNTwrwFt7bv/ti/L7ExVgpggHhSocIJGfmP2/8EXQ5zZA5rEzbnfxwt4y
         A/7FvyPJoW1RH9JJnsix5KzM6io/f1Wv/L3pLnA3Lqcdn0Z0KAIReoicUwt4WWlZN9Cq
         ++Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7mqS3/0u9zikzgyiq6RTjXlJna72qnR7Oy4JzUDb+vQ=;
        b=nSI0/0bKxRqBj2WZ/t27xcAgqf27gSm0KL+LvDVB4wrJAsM/8sFxgs9OxBoXlPwLyI
         lUaReCQQtsgNIlT3if53Dzhd+cSxXaoXyMVWrWPEqzu9upVePvXLY+4KWXnkXqmjFOCO
         43xVFs16Elz8aYHGGc9JxPHT4whG/vcFVO7SNlJnNFKsROWJb7ELDaUmWapGHDODFOBF
         /bUD4mQGyoDZsjNpOah+knp+m+iZcZSZAAJhyso/xumow0PtHALHBpRSlJbOC+6oPlXi
         Tz1PJpUaRthGOJO/YBF8A6G76IneGO4EyP/fzveCubsQQtpFHy4w/gJ7Nm1Y0t2tbEhM
         f21w==
X-Gm-Message-State: AOAM531QcKTB6Vuw5FIQX7Lry8jQGG+7+N0wlJHcFc1YdGrHyn/zOOLX
        bWUytYsJMcAUAQylffvtUBfR906KB3kdBQ==
X-Google-Smtp-Source: ABdhPJxW+WsPsdIUYlw2s73Jn3tWxkJfDeRSrLUEaeKO7DI8sU9f2zpgGqjl/xGQpgd7K82FLHlchA==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr17470257wrv.273.1628588299756;
        Tue, 10 Aug 2021 02:38:19 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:c482:80d:24db:a016])
        by smtp.gmail.com with ESMTPSA id x12sm22933385wrt.35.2021.08.10.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:38:19 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v5 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
Date:   Tue, 10 Aug 2021 10:38:10 +0100
Message-Id: <20210810093811.7205-2-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093811.7205-1-david.plowman@raspberrypi.com>
References: <20210810093811.7205-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
be notified what gains will be applied to the different colour
channels by subsequent processing (such as by an ISP), even though the
sensor will not apply any of these gains itself.

For Bayer sensors this will be an array control taking 4 values which
are the 4 gains arranged in the fixed order B, Gb, Gr and R,
irrespective of the exact Bayer order of the sensor itself. The use of
an array makes it straightforward to extend this control to non-Bayer
sensors (for example, sensors with an RGBW pattern) in future.

The units are in all cases linear with the default value indicating a
gain of exactly 1. For example, if the default value were reported as
128 then the value 256 would represent a gain of exactly 2.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 421300e13a41..f87053c83249 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
+	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..133e20444939 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
+#define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
 
 /* Image processing controls */
-- 
2.30.2

