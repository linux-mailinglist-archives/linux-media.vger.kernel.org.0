Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34827B9127
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbfITNwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:52:05 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42665 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387539AbfITNvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:49 -0400
Received: by mail-ed1-f68.google.com with SMTP id y91so6476581ede.9;
        Fri, 20 Sep 2019 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9gJ7SkH/thEjmGgBZRaPpt7oGSypkEw9l6Q05cUMYTk=;
        b=GeRATcxHTy4pYbwd4G55V+8VL0Tr3ilwCoklzCKhfTHwVxN96PWWhUZ3dpPbV0qmxa
         3u1Xjq1biXpY5txqC8Z4cJ8u3qDgrEyDRGzFEf691RzJ7RpLMEF+nLCOnc5izgyeSg9U
         2sGSTIIF+nu0HWi4I4Fkzb4/lon40N+Mf5/lYv3pWID8Bdz61Id3AqJ2t4O4OM0fSDWR
         z40KfztRj7V3fSBRa67vzPglGwJJb0Lrf1lPfwkHfx/nH+1sOxyfk0JUPDe/o4KflCKH
         PizcBxSnzmE1ikmNju+VIXq2YLC+sh/SzRYZTqCrJp5kne3JCbp8F1Zlvh6F08i8VVPL
         SGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9gJ7SkH/thEjmGgBZRaPpt7oGSypkEw9l6Q05cUMYTk=;
        b=YnP/2rm4LyyIbgh26NXXOb1VvIKVu4yKU7ULCMzmVq5vc9VYsEI6RqyycVXNB04l+P
         q6bNWr/DqqeR4v6x8Ya5XuCJA9dv+8dcSOpsZTG+IwJrznESP52xuoijcNiIA+OVqiKX
         mopNOMWaQ0D8I/KkiJ61Ek24fZbFZbCa1pbNpRS6LAkACJifqM9l+OwbE91HWpXPEpiz
         3RWXICiqbA/489HZFRpjzP5qpS0bAw7CB/L3fkUHi71hH1sVWppLdAStXUJoWUmkej07
         HNMFKf8uKd6k/J/zVv5wX7ggD2BbQ2+MDNhIJ8y4VS+4BKZzdVmDwnYlDdNvqXmn8+ep
         ys1A==
X-Gm-Message-State: APjAAAXfX0eyyDDYJjx8xaa5lstbpm0Judcz1FPyREi1rZjByA+NLNBK
        EAkrCURKm7Ng+qV8oaRVY5Q=
X-Google-Smtp-Source: APXvYqz8DkLi0VCqu8RMoU4CkF0E5FbNTWiX0ir6J0K5xoqaq+IYeNMr7QV1ZAZSLxgqKSXTXWHMNA==
X-Received: by 2002:a17:906:b6d0:: with SMTP id ec16mr19324484ejb.206.1568987507980;
        Fri, 20 Sep 2019 06:51:47 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:47 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v6 5/7] media: add V4L2_CID_UNIT_CELL_SIZE control
Date:   Fri, 20 Sep 2019 15:51:35 +0200
Message-Id: <20190920135137.10052-6-ricardo@ribalda.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920135137.10052-1-ricardo@ribalda.com>
References: <20190920135137.10052-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda Delgado <ribalda@kernel.org>

This control returns the unit cell size in nanometres. The struct provides
the width and the height in separated fields to take into consideration
asymmetric pixels and/or hardware binning.
This control is required for automatic calibration of sensors/cameras.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
 include/uapi/linux/v4l2-controls.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b9a46f536406..f626f9983408 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -996,6 +996,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
 	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
 	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
+	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1377,6 +1378,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
+	case V4L2_CID_UNIT_CELL_SIZE:
+		*type = V4L2_CTRL_TYPE_AREA;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a2669b79b294..5a7bedee2b0e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1034,6 +1034,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 5)
 #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
+#define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 
 
 /* Image processing controls */
-- 
2.23.0

