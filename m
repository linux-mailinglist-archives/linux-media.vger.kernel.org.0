Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BB3379E0A
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 06:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhEKEKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 00:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhEKEKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 00:10:37 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3244C061574;
        Mon, 10 May 2021 21:09:30 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so687691pjk.0;
        Mon, 10 May 2021 21:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=V5cc8gqWmhgI8hymJnMxwJpjQF8i+VU2pCJJ8axwstk=;
        b=dXYTVILtW0smoS+ZCCp5EKDoSxqxtkmkBGghPetrKwjOh7CMyDUtvatt+o49mlEC+p
         VCC5qxBMsKrHzec9wcE7cP/ZtBa5s1n5ezpdPDXEX+52xnqqeFma9lOeCczZr4fnozhc
         o2EAGXFhRjzQpTKXGjRiR/oMXUoyBeesKN2rr+QyW7VYX9SUiUEWcdLXHrgA7C+GDWkE
         lL8on+iYUS4iGpa3tiXuPqqBnpl517Y83MhhrWrS9SYU3R1DFFMcZumQ4HxmiGOdVTkk
         Sp9q5PoLoL/CS4wmXnjWPNkzHMIEMB1ItjXny6mpsrlRUyKLrq023pTah9W8ehYDxkQZ
         8HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=V5cc8gqWmhgI8hymJnMxwJpjQF8i+VU2pCJJ8axwstk=;
        b=rFGqJ2BxLgyjhydRlLyyMXpyRkSPSziPcypBP4NTLH5Mx+ls61m8OKe19l6EynonQy
         vw0DfeoSAe1Uj4nxzczgXnmjggM74wi4D8gMU8iyBkb/Y9O3Fn/ImRIw/9kiElawmuxQ
         UL8C7S9BQdIdLbCvD6/59BzC7HQD7ArwgbZ1CYx+R+kUD+w9bI5kIIFlJYumz3Ym/D4J
         2benIxvWzgH3rymzqgzcCmR+ViSXFeY2fh14rrBg+zz/VTvYHuoTD5A1kGFAq98uOGPT
         A8p8t0glRg4iCXqaJm5V7N882CpFGmgl3opNsPR19NJiXwB2KgRruRlsz50GmpY5mteH
         g1+w==
X-Gm-Message-State: AOAM532Yot9ZWWZDZS5Uh9zTymWb9kOk+Fo+KUw7hPyJBGuwuMDXEOPB
        u3Pv/gp/fo/s1ulotRJagYM=
X-Google-Smtp-Source: ABdhPJx92pj68s8jJWnq2LdkDNdYrQb2lFiDBdLcfgK3rBeuv9O5qgLHeqYSp905RMzgPA5h8BA2SQ==
X-Received: by 2002:a17:90a:488a:: with SMTP id b10mr31428392pjh.2.1620706170503;
        Mon, 10 May 2021 21:09:30 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id g18sm12531352pfb.178.2021.05.10.21.09.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 21:09:30 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
        a.hajda@samsung.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH] media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
Date:   Tue, 11 May 2021 12:09:24 +0800
Message-Id: <1620706164-28856-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

The m2m_ctx resources was allocated by v4l2_m2m_ctx_init() in g2d_open()
should be freed from g2d_release() when it's not used.

Fix it

Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/platform/s5p-g2d/g2d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 15bcb7f6e113..0818fdd3e984 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -279,6 +279,9 @@ static int g2d_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
+	mutex_lock(&dev->mutex);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	mutex_unlock(&dev->mutex);
 	kfree(ctx);
 	v4l2_info(&dev->v4l2_dev, "instance closed\n");
 	return 0;
-- 
2.7.4

