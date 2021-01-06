Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23262EC03E
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 16:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbhAFPRq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 10:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbhAFPRp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 10:17:45 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1731C061357
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 07:17:04 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t30so2781340wrb.0
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PE0jOtNMjFje+mvhguTZNdxmt10fdjmfoJdtuZiVuXQ=;
        b=e1rsNgAlHPp3/TCa+MY7d3ka4llX4r09bOvkvcB0TvQPov2f3/vd9mKoadQoiOORVi
         9g62BhwSFqwjdMZ0bKtc0OB7O9bkU24x6IpoD+kEPYWeFr/SHMuPsowv5CHWAeMHj1UB
         VtfvsSKdxZzkrPoHeHDxfDNXePRTX27XXlwVUtoOARqPSiUvXO6mJZwdSBgWTC+y9+Vh
         ya45nnh90VdsQzhHROD+YrpAXbPZ0Eq7ET/8LqfQsBK7tHxjNeDRUqlmErSQLq50uomi
         rtcj8IrmslUT5TQYcwxUBhH6jPTcmSu1PSU90D5dy6G7sX+zOcAqo2yhkn585e8of5VT
         OyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PE0jOtNMjFje+mvhguTZNdxmt10fdjmfoJdtuZiVuXQ=;
        b=GWueWqCmGJMmtCoT6jpjTTuskStsaUjXHivoNlOqTMhrDUi6u4chsIOyYr7DxJ+GBj
         BMaCa42GgmfXzBwORLx7sTUlitdh14j8R/PyVsuKysNaoJaYkpGcqvxM2P4tlVLrPp6v
         1dAB0booaI2Hzy2fbgmx23K48P5PbbDS/IToQtflcTF59BTRK0P8o582AHyLl2bbJPrf
         ghAyR5rBiA8dtAPrMfZmjN5lVmzFpN9KFtjilEf4DyNhtx5La8ROLyBv2CVrxTiMG0K9
         ln2xU42dOPMbj2vy5IzHJyj2eaGX5Gaem/4dMfG3TuK98caXGBPm4vL4hmYpVgy1BW1i
         PLjQ==
X-Gm-Message-State: AOAM5305g1TT14sCnm6qr/I42zo2kB2dwLzGFOeBpteeTKJF9/41ygve
        itYEecMARSOHlhjO378NP13LTHXkSsbCxg==
X-Google-Smtp-Source: ABdhPJwvYDioKJZF+OaUlEWuT+zvSLBsig/DSHQudgEfm6KcaYex2YUi4t7nR5ejcmC6XdvDxjyD0A==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr4775211wrc.224.1609946223362;
        Wed, 06 Jan 2021 07:17:03 -0800 (PST)
Received: from naushir-VirtualBox.patuck.local ([88.97.76.4])
        by smtp.gmail.com with ESMTPSA id o83sm3408512wme.21.2021.01.06.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:02 -0800 (PST)
From:   Naushir Patuck <naush@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Naushir Patuck <naush@raspberrypi.com>, stable@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2] Revert "media: videobuf2: Fix length check for single plane dmabuf queueing"
Date:   Wed,  6 Jan 2021 15:16:57 +0000
Message-Id: <20210106151657.16210-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106135210.12337-1-naush@raspberrypi.com>
References: <20210106135210.12337-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The updated length check for dmabuf types broke existing usage in v4l2
userland clients.

Fixes: 961d3b27 ("media: videobuf2: Fix length check for single plane dmabuf queueing")
Cc: stable@vger.kernel.org
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 96d3b2b2aa31..3f61f5863bf7 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -118,8 +118,7 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
 				return -EINVAL;
 		}
 	} else {
-		length = (b->memory == VB2_MEMORY_USERPTR ||
-			  b->memory == VB2_MEMORY_DMABUF)
+		length = (b->memory == VB2_MEMORY_USERPTR)
 			? b->length : vb->planes[0].length;
 
 		if (b->bytesused > length)
-- 
2.25.1

