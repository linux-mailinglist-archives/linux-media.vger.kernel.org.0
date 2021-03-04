Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730B132D4C8
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 15:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbhCDODb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 09:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234767AbhCDODW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 09:03:22 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59216C061574;
        Thu,  4 Mar 2021 06:02:42 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id kx1so819326pjb.3;
        Thu, 04 Mar 2021 06:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/dTebcdcxUQXXbJ4HBiTmegx9W3AXj6bSgb3FLSFk3Q=;
        b=I7jZuAqDs4LWK0bz4wZkKZuNUtR2fskbpmjBRqtjdvVpzUW58ExS42c29QC7mMoDQt
         itxl8CCiZ6gKDIKXQU0L/03henGHSxfd3ugF7OIbnRw45lcqPjGOV9694WmszOEIxa9B
         kL7vqVD4ckJsVZkFGmDECfmv2hEPkCMhVw1H5i+FqcrTNqdobk8Ln7APsxP0F03ZxuGz
         r81WnKe/vaOXN23S6W+4mBKJYq5Tm67OUTcp2Dgv7+RHcf3PmYDZU7IdksFZ6q2NisxS
         y0EykuBQkYQPZfiENJ4gJiVMvrLJnHHPD/dtRjfyzUkHQSxHfATnlr8jc3PthdxvmmoG
         OAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/dTebcdcxUQXXbJ4HBiTmegx9W3AXj6bSgb3FLSFk3Q=;
        b=J/2E4CF7kRplP0oYu2ttMuQfdHnyNKP++xfJTwwLJ1Vni/n0+Zk7hKxVmFktfZILuQ
         WgtzbYqpy6R0qBH3HiNdChBlj3Zc9joSC37gpbRa65NmiaEEWlwepKTFxOsAi6YfrC4x
         qcCkPhcLoz4ETE05avMN58v0zMMqGvo69BKEtd4Danr6CvaGZXjUvymKL4FHqJXYBAUP
         jG/2d+m98lxcdlnUktrdARWx2F2Xvh91zS4XvMwMthq4Z4fn/d/9ZuSeMJtbdRa8f2vc
         9hVOVpPsz4X70lxUwvSNa2Y34KW9EqytEETaPfkzr9oSpC2UHYmdbjFJGFfRf/ZN0uRQ
         q6Xw==
X-Gm-Message-State: AOAM531+XEK4VYLkhCV/aiGmhBo29Dj1oCAzwfy57LLns3IIupTwSGOU
        oUTT0G92zZbV/rnhIW4y8rU=
X-Google-Smtp-Source: ABdhPJy+D9OmNGckphIwW0x1NlSGLAzSAvkg2ZpC3WBwW8JOHi3t0ME3PGQF3+6vKCYThLmNvMWLIQ==
X-Received: by 2002:a17:902:6845:b029:e4:4d0f:c207 with SMTP id f5-20020a1709026845b02900e44d0fc207mr4078231pln.36.1614866561954;
        Thu, 04 Mar 2021 06:02:41 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.129])
        by smtp.gmail.com with ESMTPSA id l15sm10197668pjq.9.2021.03.04.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 06:02:41 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] staging: media: omap4iss: fix error return code in iss_probe()
Date:   Thu,  4 Mar 2021 06:02:33 -0800
Message-Id: <20210304140233.8030-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When omap4iss_get() returns NULL, no error return code is assigned.
To fix this bug, ret is assigned with -EINVAL as error return code.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/staging/media/omap4iss/iss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index dae9073e7d3c..085397045b36 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -1236,8 +1236,10 @@ static int iss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
-	if (!omap4iss_get(iss))
+	if (!omap4iss_get(iss)) {
+		ret = -EINVAL;
 		goto error;
+	}
 
 	ret = iss_reset(iss);
 	if (ret < 0)
-- 
2.17.1

