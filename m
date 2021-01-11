Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D232F18E8
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388917AbhAKO4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732707AbhAKO4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:56:10 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E480FC0617A9
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:51 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id r4so112735wmh.5
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UWRvQWUwrPFkkVqrFhhi1pQBAFyO41MacdjI236ZA30=;
        b=OTgGzZIicbYeBkzWjZCwM3d578bQk3fsxekMNukcoFlVgUkoDrnf4nL9eHp/WaDVnv
         X1PCE72h78cVbouMZF7wC21HOukqg9pvdDR9lUDXoR+nvux+9C8BgDF1yfMDUBj+RIzG
         91FjnZkMHOdMlsOHiBidyoDvjJNiRwIII9UXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UWRvQWUwrPFkkVqrFhhi1pQBAFyO41MacdjI236ZA30=;
        b=jbXPbj9AXu31jWLLIFSiZIMVZ6sRrdAn4b9GZPM6az4OPEq7Z2GgIt+BCD+NaH9Y+1
         5TIaz8ijnOjKXAG3dVIUowvYYSH9VCQmpJ1Yh++7yv0LHArPLYvfxiN4Hr7DtdS5DYA/
         G8DYTSbOcH7RRdvHN6QU8ZKtTbrkH+i2ORCUv2hQ/xVGEbmmzwxEy5pTdh/8lXh+msks
         nT9fqVhdbJUyLGBL/6p4U6gkK8E68LOprSEQPmCg4OivPb2kZUKTkAp3go6a01Qwzy7L
         Ltoqrn5eIYYeQotd2uGSAKtAdfLIJrvDiDkSHP8m1FdjIyiWfys+n1O/8DepmoVqnbFp
         p3EQ==
X-Gm-Message-State: AOAM532KnCiKPL8p6NckS9K0m/Zp5rOST6tvL1ZHP4qu6lCT5/6Kt3f3
        lHOSLD+S5TNin63TwqtCWxP+znsqeqsINRm5H5c=
X-Google-Smtp-Source: ABdhPJwE2ruvXuJCF4cZk406wM4rQwSTfy3+m5nY6ft6trpPAMaR6TDPibnZpXYKE3gt83lwxA+HsA==
X-Received: by 2002:a1c:dd07:: with SMTP id u7mr77572wmg.51.1610376890632;
        Mon, 11 Jan 2021 06:54:50 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s133sm17780wmf.38.2021.01.11.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:54:50 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] media: fdp1: Do not zero reserved fields
Date:   Mon, 11 Jan 2021 15:54:40 +0100
Message-Id: <20210111145445.28854-5-ribalda@chromium.org>
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

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/rcar_fdp1.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index c9448de885b6..01c1fbb97bf6 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -1439,8 +1439,6 @@ static void fdp1_compute_stride(struct v4l2_pix_format_mplane *pix,
 		pix->plane_fmt[i].sizeimage = pix->plane_fmt[i].bytesperline
 					    * pix->height / vsub;
 
-		memset(pix->plane_fmt[i].reserved, 0,
-		       sizeof(pix->plane_fmt[i].reserved));
 	}
 
 	if (fmt->num_planes == 3) {
@@ -1448,8 +1446,6 @@ static void fdp1_compute_stride(struct v4l2_pix_format_mplane *pix,
 		pix->plane_fmt[2].bytesperline = pix->plane_fmt[1].bytesperline;
 		pix->plane_fmt[2].sizeimage = pix->plane_fmt[1].sizeimage;
 
-		memset(pix->plane_fmt[2].reserved, 0,
-		       sizeof(pix->plane_fmt[2].reserved));
 	}
 }
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

