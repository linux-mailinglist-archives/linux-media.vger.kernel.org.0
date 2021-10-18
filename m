Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59376430FA0
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 07:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhJRFHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 01:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhJRFHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 01:07:41 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6571C061769;
        Sun, 17 Oct 2021 22:05:30 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y7so13777323pfg.8;
        Sun, 17 Oct 2021 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gBhJdCQI3tgtAb+zO+s0+nyy0RkQE7ndnmuRgYdQzh4=;
        b=A4ueMt8YMHWW/89Hh4pdnL//KdrM/svGtwnfxp+r3w3lF/50FZqd/5YFCkL0jU/H9Q
         q7sMGUB7fvz9K33mRO+tE+q7nbC2KV3+gv8yzUMInzTRRyKtdG9uMZ64e9AzzIVB6iJb
         ldev6OY3KCHbw1rnKyY3vuQD7UVvBrofYRQFXVvmRvrN5HEXeSsGBpjBPgv0qp0Q7gC/
         e2DIqgWGb3f015ajx8fjLzg6vIGpI/Qg2/5cbE6QqjjXPmKxEPMdIE+4LOHxsvTjbYNH
         6m4mCxaDIWmArBiCArZ2uS/lB7mNgyCgLKpM2jKiNvRfmy0do3iruFzVlJj9MEx0K7sU
         n2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gBhJdCQI3tgtAb+zO+s0+nyy0RkQE7ndnmuRgYdQzh4=;
        b=nKfPmapDu9EpYqZN1Y65MkD7pQJdgpFX2ObyNBgJqqXIOVH9ysZ1FeGBYY9sXRd8gx
         lVrW44HA9gMglvFU5a46KW6rKgy8CcJMpb51oO3tq4kZpHYVkAutefvmCA20NERYXOJn
         gm9DADF86SxT8Lbj83o2easswFP7WDU5k4DOWsilu0JfY5gnaA7jTNd7Pas4uNyG0HhJ
         s5gTiuB/b4yAlV87yVfVc6FMDxN7nO4h+SJamcWHzVOuBXQ2D1ic+9OTNbIeaBwQmi7w
         +Wl5lidRxXZ2wbwR4i8lY6D32FvZlhe1aInNuk6YU8vTjWF9zDRrucKtl7ER4YvH8mi2
         GCtw==
X-Gm-Message-State: AOAM530rzzRz4kaCko9hSG5JWeiVBa6EXUx+P4ma0OLt31cB6oWjqAQU
        68T5TWocbODcrK8Cca56clU=
X-Google-Smtp-Source: ABdhPJyCsuGeq8UL5I8geM4XvFrDzoZlwiEmGEWko6BtyDIXuIYoj91fZat5S85qitooIzHRujHGBA==
X-Received: by 2002:a05:6a00:23d6:b0:44d:8426:e2bb with SMTP id g22-20020a056a0023d600b0044d8426e2bbmr22738198pfc.30.1634533530348;
        Sun, 17 Oct 2021 22:05:30 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:05:30 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 07/10] media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
Date:   Mon, 18 Oct 2021 13:04:45 +0800
Message-Id: <1634533488-25334-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

The max of V4L2_CID_COLORFX_CBCR is 0xffff, so add it to v4l2_ctrl_fill()
to sure not beyond that.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ebe82b6ba6e6..0cb6c0f18b39 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1400,6 +1400,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		/* Max is calculated as RGB888 that is 2^24 */
 		*max = 0xFFFFFF;
 		break;
+	case V4L2_CID_COLORFX_CBCR:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*step = 1;
+		*min = 0;
+		*max = 0xffff;
+		break;
 	case V4L2_CID_FLASH_FAULT:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
-- 
2.7.4

