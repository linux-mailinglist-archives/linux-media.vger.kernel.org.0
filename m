Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71CA32AC34
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 22:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfEZUsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 16:48:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46240 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEZUsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 16:48:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id l26so10568672lfh.13;
        Sun, 26 May 2019 13:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W8mYYWBQJosjwipD1CvvNNNq1i8OAaYumTI2biJWE/E=;
        b=nh1ZY8pWQpTkUyzgKnlrGGDBCKLuN2UZEmKWdH+TBkUzy9RMLxK7Ef2ajgLs0AzDN7
         VDu/CyUWtMaSzb2VKOghUbz/b/0JtBvFoUwwrQcgUOFdzITVxMs1fpHjeoSz5odkRglS
         Vd6LrTtlASAeA71u2a9AnZLlXH3por9e/YLMckKdojbmDZNNH7omtzdrO9Qn6gsE6ben
         RI+yLcAMFesSbhS7qcXOp0PrdzgjQgFoiY6K2VG+N4Mt6kTmI2DOSUhgKlbpAQXUwva8
         UeZkg7RXY3hVVxV5QSMiGoBB1q8LA9QIX2Hr8VXdelrN4IPrUV8yyTJ3WUW1AaG7i4GL
         zMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8mYYWBQJosjwipD1CvvNNNq1i8OAaYumTI2biJWE/E=;
        b=ZdFiefVjUfkXtR6Z0hFQ7xJeQDwAGQgnBWwQEKlU1OS1IHpX3TZ2dum+4QtbbXyJt+
         J/0NU5tN8+A1bnHhTL1lRQjS2WYw3F7cQP6rYb/gpO/NXHGNxYrSIzo3o5KyQ9J9aki1
         SqfASh33cbY9uMpR7Nm/mq1YbFd6r+pd0z0hyc+OMXcDOXWnRFq/ADcRq+HzrFRNezqs
         g2aMo0uXOHWrovaihyPgRj25cUdu0FE9zventm7GjSbYEXP/qbzT4M102xbtGt2wHpCk
         o2slepi5mThSeUsPIn9t6XeCJsYunU+jOn5p/Wtxc5qn7iqDs/J7ZvzmOkQfTVCpuKFC
         bSJQ==
X-Gm-Message-State: APjAAAWs4JciKiNYVuO85tsFeq1odDm9RevHGK/UveZJ8hMdIPqhhVg9
        wPyi0S+VhPptfemOrpg/dAw=
X-Google-Smtp-Source: APXvYqyjA8lxM+r8BZSmmRljaWrEPojIgBmalQfNSBrTkh2E9Mmhrlz6CBQFNG9G8OLYZUhB0Qz3Nw==
X-Received: by 2002:ac2:4430:: with SMTP id w16mr14972736lfl.35.1558903691999;
        Sun, 26 May 2019 13:48:11 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id i187sm1859475lfe.64.2019.05.26.13.48.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 13:48:11 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 1/5] media: ov6650: Fix V4L2_SEL_FLAG_KEEP_CONFIG handling
Date:   Sun, 26 May 2019 22:47:54 +0200
Message-Id: <20190526204758.1904-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526204758.1904-1-jmkrzyszt@gmail.com>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This flag is now ignored - output frame size is affected by new crop
settings regardless of the flag value.  Fix it.

Since keeping output frame size untouched while applying new crop
settings is not supported, simply return results of .get_selection() if
V4L2_SEL_FLAG_KEEP_CONFIG is passed to .set_selection().

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index c728f718716b..1b02479b616f 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -484,6 +484,10 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 	    sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
+	/* No support for changing crop rectangle with frame size preserved */
+	if (sel->flags & V4L2_SEL_FLAG_KEEP_CONFIG)
+		return ov6650_get_selection(sd, cfg, sel);
+
 	v4l_bound_align_image(&sel->r.width, 2, W_CIF, 1,
 			      &sel->r.height, 2, H_CIF, 1, 0);
 	v4l_bound_align_image(&sel->r.left, DEF_HSTRT << 1,
-- 
2.21.0

