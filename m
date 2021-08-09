Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011203E42DA
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 11:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbhHIJfd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 05:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbhHIJfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 05:35:30 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64494C061796
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 02:35:10 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h14so20484128wrx.10
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sT/HsaDNiCiIxiqs7Z2NjoK/a9GnaoU2NEbK+Rzv5dU=;
        b=FZv9dhjSptoGrE727m/SrWZ99qgN7E8LemgLyVNUZBCoKUntrkeFSORfBpj6YvyeXn
         fADim+A8zZG9uRaHofiYRfF1TZ+2XDQNITx91ONXJZJ13ThwYfYsgGDO64bj0Zha1QBq
         30H8rNuCPohf6LKNRc0yuqELCJC3cGdZOEnja4lfYJMBT/acT3adu/X88O+fj1fyWP1c
         UwUhh9J+J9tQBzeXB9e0ibiPDsJEv1zlg3Zj8Gp8NivDKySATARMmeo3TZK6E/n5YZ/4
         +pXe95yI9buo/bOh6tWA5BcKWG4PHNsWEXkFJrx1iCHBu1FAwoahqjgvDBGWqAgTkasS
         32PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sT/HsaDNiCiIxiqs7Z2NjoK/a9GnaoU2NEbK+Rzv5dU=;
        b=FwIoiQTR8hyoXd0Cphk/wrOcJft/SThlDyo72/+4Jzhq0p6aSAno4Pt640gFt0CX1T
         a5iF6JmhWJ15pQTr47IFWhTB2C6a1yLLfkfYJ8f0exY9/+RekLCLCxTMQzCXuI6an72I
         FQirK3YPcr2GveRBlyRvoo2hToZX9Xqs9HaA/55V7/x9KGus0sgYgMM+ROWPAQkxyZX7
         9iHJnrVDjAMfzE9hlHBUqOugAfYE7XDoAJDcMFFw+CBaKgR/JZVSAg754PXGSl0i9rhr
         wvg+bFZ5bLGzzRoAUTug6iaOj7XqsRg1/p2ABKHCiWjFKQvFzmHO6YZ1bb+GKfIdwO2E
         vkEQ==
X-Gm-Message-State: AOAM531VR85tdTdJfkFlM0G9aIdbUwhrFSxT5AwxoBaETKa/a7k1pbGw
        8Gxxh9G8bpUp/6stUI9BDKoyKWnswuNvJQ==
X-Google-Smtp-Source: ABdhPJwNcpHxhEuYFk4367gW8Vt6yl635AWfG6onsWy0akqs4to5viv681hF+xSfIdz5X6SKDcAAkA==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr5266315wru.142.1628501708815;
        Mon, 09 Aug 2021 02:35:08 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:b9d5:8bb6:b974:d6b6])
        by smtp.gmail.com with ESMTPSA id j1sm19941720wmo.4.2021.08.09.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:35:08 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v4 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
Date:   Mon,  9 Aug 2021 10:34:47 +0100
Message-Id: <20210809093448.4461-2-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809093448.4461-1-david.plowman@raspberrypi.com>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
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
irrespective of the exact Bayer order of the sensor itself.

The units are in all cases linear with the default value indicating a
gain of exactly 1.

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

