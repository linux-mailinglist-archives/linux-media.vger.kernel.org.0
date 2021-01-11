Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D432F18F2
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388999AbhAKO4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388989AbhAKO4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:56:50 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D1DC0617BE
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:56 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id y23so138403wmi.1
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/b1R3+bsCNv0D8QaTlCdd9Cg/ZmadyVtn3+pLwATEWc=;
        b=BgqVoKW4QdiYG5eo2hFu8iLAYEc9Su6ehfP+Qfrn734ZdeB4n1YpXusioR43fxVE6x
         MDlazEmtmLs9cYMZDo/Bxg/JWuCqxOsFtam+t+4ozRjDcCwNloPzo0fxMkWVNBN5gMTm
         DPN0KChZepN8Q+K1fcQnbhDv8yVNmmWCzjxK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/b1R3+bsCNv0D8QaTlCdd9Cg/ZmadyVtn3+pLwATEWc=;
        b=laUxA7rf8Ia4oFX5BY+GL5tRUiNFIkwG7puFL0CcqyOQTGdMFGdjhD2yJlprfDUwcm
         wO72aBLzz6ehAROLk8mNGwXv6aDr7HPXC3rZWUw8IksB/ba9Svs+kGI0P8sesBUD+0ty
         2G9eM1wmrm/2JcgQyTJLdCAtq5uIThal+oXBXp0FF+BqUd0VanUOoGrlhcff2JuxefCg
         /2JeQY5AgGV9Fr1OZN4Sw4hTMlUiqy23fU6M2SHSDRlllzNAZROPsI4Ssmq8Z87DFReG
         uxRnGHuJjX35K+8bDcGYVrYUrWEKHLxXohmITIHxzwMEGKCh7shN0gyJuuEHOz/BpItU
         qt4Q==
X-Gm-Message-State: AOAM532RG1jIcVpwhRWoc5Xifabwtvw0G/O5mxLs/7yYrlA4BXTltTSs
        b8AyZEK1m2dngJQmgPMF+fpWdxMkxKk01SaoIDA=
X-Google-Smtp-Source: ABdhPJxXBbZDp32ue8DMiN01TCHjLl2uLezF/LHBLHHQCJLa7oRe6M0nKZhGX3mlT2bbrv8a9hA4wA==
X-Received: by 2002:a1c:bd09:: with SMTP id n9mr115116wmf.32.1610376895456;
        Mon, 11 Jan 2021 06:54:55 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s133sm17780wmf.38.2021.01.11.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:54:55 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 9/9] media: staging/intel-ipu3 : Do not zero reserved fields
Date:   Mon, 11 Jan 2021 15:54:45 +0100
Message-Id: <20210111145445.28854-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210111145445.28854-1-ribalda@chromium.org>
References: <20210111145445.28854-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Core code already clears reserved fields of struct
v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
v4l2_plane_pix_format reserved fields").

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 4dc8d9165f63..60aa02eb7d2a 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -773,9 +773,6 @@ static int imgu_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 	pixm->pixelformat = fmt->fourcc;
 
-	memset(pixm->plane_fmt[0].reserved, 0,
-	       sizeof(pixm->plane_fmt[0].reserved));
-
 	return 0;
 }
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

