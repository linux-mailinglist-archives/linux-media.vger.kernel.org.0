Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D6A2F18D9
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbhAKOzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732320AbhAKOz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:55:29 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E571C06179F
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:49 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id g185so126810wmf.3
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/b1R3+bsCNv0D8QaTlCdd9Cg/ZmadyVtn3+pLwATEWc=;
        b=Ah7J8LN0jlZEL24PLX4WG1e3DiCnqHEN630ZaqiqvWw7XaQh60RtZO84LDEJd95g0B
         rC6J9lvBFXnqZ7OKBlfmteclgVykEj1nnnmX3gJCXPNSLiho6s5c78EY5a/TayLTL5QX
         IPVa1mzpBmZN3LPedZiYIMxOtyAwskSZD+WAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/b1R3+bsCNv0D8QaTlCdd9Cg/ZmadyVtn3+pLwATEWc=;
        b=VH3g0w34EPPOhLAdeiGRBBNlrVfysQl/Alu9BgLqdHIkVTRHMGI7UK9FlnY0HCof8K
         E0ByjEoO+W+7DBM4bTQHFRgSVwfGvxyuJIjdvqXtZzzb4KmEIFE08s2LBCeyLTyLIVrS
         UAx14AeES2ZQc4KyWKnnx7CVKcAqzDdps6ouyxBkkvBfPG/l3qz617UDIoiCksGWgje5
         c4fho+i7vUFSvniDRMs6W/fEKt45svbHdShoWwmd9gmu/vZ9X2bT+xQ8RXkrIOETCfYU
         2P5I4at/IOSiaUsALBdE5QJQzrieVyV0OfXmOPbjftAi/9b+6HuZZEScAr7sz8gjFDai
         /OaA==
X-Gm-Message-State: AOAM530jfqgnQbKDzxBKxEGAcbyqhjjeYjMvCQOQbATu573dueUF3YVe
        JGVa+HffhPKldcqsbTUaDGPiSMhh/IgUdW76xSY=
X-Google-Smtp-Source: ABdhPJziuRVwPLalrG6E3rAJ9OUpO6HGQxNVSLmpi4fw6EyNHSq6p9HhJ2/VSjm/bGnZlEOIu0rw2A==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr61099wmi.151.1610376888199;
        Mon, 11 Jan 2021 06:54:48 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s133sm17780wmf.38.2021.01.11.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:54:47 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: staging/intel-ipu3 : Do not zero reserved fields
Date:   Mon, 11 Jan 2021 15:54:37 +0100
Message-Id: <20210111145445.28854-2-ribalda@chromium.org>
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

