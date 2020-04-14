Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0624E1A8BDF
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 22:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505451AbgDNUC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 16:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505427AbgDNUCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 16:02:20 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7117C03C1A9
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so748219ljg.8
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 13:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/jTrRppTOaz3y0rG21oAUj12lqiSghZgqjFj/i9GzbU=;
        b=Q6+3YSAcQQYC6IVnZnn5zzNHgWEQgy/bJQE98XfovwEhiZ0p9v1qf4107b9YrFr01k
         SiuinysHtC70GNj0MbH/DbOckbdTY21/oxnqqTcZY8mdq60Y7kpP7SekNWScZpoBpVR2
         woTjZZLs6/aQiqF1V8SZqzfdKeEeTAqtY6+IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/jTrRppTOaz3y0rG21oAUj12lqiSghZgqjFj/i9GzbU=;
        b=T79GUmmZojKorWVk/GEohmqVY+ZpyYdwIeaHSziDGZ45z+dtbNjLZGRPpkwhD8Ajym
         mdOPWaUhPi4qc+m6l0Bzg6WSpaeVhBOgcokNZNQEQHcuTasx1hOXYWa3MWNi0PMIbelC
         VNambYVAWBRKQ9K/e5RKvJaenUmpw/YYqNXmmrHge2d5nje8lP1tpOeCyZn7oz+USMWM
         sCeiWbgipO5BKVw4ybugyzylT5A0gOqI31APeuMnCucZrRNxWl+gCGWwbk2wXMndjerV
         hKOKeaTwGHs9nK7eVsKKhRyEDNAzzyrSUJ3E7AIM/GZoOxbgn82vBSJEAh5IHmddCGR0
         qFvQ==
X-Gm-Message-State: AGi0PuY/glo0Qbi3zW7X+oXulpocua72VIYRSzHQ4S8bJK5GPMOgdfXD
        FGtQ0ehXzeSRUnEOg8uQQ+uQwA==
X-Google-Smtp-Source: APiQypLsxzNxstX2zFH9KjS4H039xX6iBLo0m9zhRrNss2VZD7P/+LmYpYVjjBrQKy09tQ/8cbxaMQ==
X-Received: by 2002:a2e:868b:: with SMTP id l11mr1072144lji.247.1586894538253;
        Tue, 14 Apr 2020 13:02:18 -0700 (PDT)
Received: from localhost.localdomain (62-243-86-95-cable.dk.customer.tdc.net. [62.243.86.95])
        by smtp.gmail.com with ESMTPSA id v4sm3525254ljj.104.2020.04.14.13.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:02:17 -0700 (PDT)
From:   Daniel Gomez <daniel@qtec.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Daniel Gomez <daniel@qtec.com>
Subject: [RFC PATCH 2/3] media: v4l2: Add v4l2 control IDs for temperature
Date:   Tue, 14 Apr 2020 22:01:50 +0200
Message-Id: <20200414200151.80089-3-daniel@qtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414200151.80089-1-daniel@qtec.com>
References: <20200414200151.80089-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a v4l2 control ID to handle the temperature.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
 include/uapi/linux/v4l2-controls.h   | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 93d33d1db4e8..17b93111baa8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -783,6 +783,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_TEMPERATURE:		return "Temperature";
 
 	/* Codec controls */
 	/* The MPEG controls are applicable to all codec controls
@@ -1344,6 +1345,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
+	case V4L2_CID_TEMPERATURE:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 1a58d7cc4ccc..76ec0a6da8d5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -143,8 +143,10 @@ enum v4l2_colorfx {
 #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
 
+#define V4L2_CID_TEMPERATURE			(V4L2_CID_BASE+43)
+
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
 
 /* USER-class private control IDs */
 
-- 
2.25.1

