Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D943ACAD6
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbhFRMbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbhFRMbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:40 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE20C061768
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id he7so15589992ejc.13
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ehjSeMtXI5Zvz3TvRYeoL3CXpOToECbC30AIQyDolkQ=;
        b=FMVhWZhVPxHAnBE0v751B/sTPNYXRUMSywsQhoT9IoMswTMHPIBbp36wuRtHV1IucH
         plb+cdTd2SPwGkSIHTjCWemZsLEbman2g+63aolh2Lcd1AXAp4E/y7WFJVNEOvOa1GRi
         o/foeR2Oyh/8+1F9b+/C5GZt6yQr9oovg8/ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ehjSeMtXI5Zvz3TvRYeoL3CXpOToECbC30AIQyDolkQ=;
        b=FfvsOcGsIp7YL64UvQxx7IDkY7AdGMJnUjNzS9IIYTlbtK1Jh2oI5F1fkxukZacQB5
         OMWEmYfLWigL2WkoojfKaaBJsF1dwbIaX/83pZOk1QRdBXb+d7POw6QITzhu1xWP1cnJ
         Bx7lMlTL5DlEkFna47w/f/BjEuDP87p3jsUbfYRHBNLyodVHaJewzmzRrn/vX8MqmDW4
         Cy2hpCp+DQWb9lIkboKPF7N+DMLY6oWJ4PtTzqMmJDE/r6o5u2+m45kif+fzhUAEPVcw
         DPANdkmglGhpM7p8WdaeWnomT3tFfHtCg4MMfMhmkIIaJLKI8avCUu/90wvJxxsHN+0q
         NpYA==
X-Gm-Message-State: AOAM530O9dKIa2j4OTJkjsZanjhbafFqv52laK+uLvB3WzyESi3rGJ8b
        jCTpo7bBdwjvLfJyPcSRV+1jKR/Jz41ENQ==
X-Google-Smtp-Source: ABdhPJw26kvrG1Fw4FA8W0qWuJl1S+RTHVUQcYot9TmCA98m+YN/1A8NsIivQ53kHD4l6Sn0hzztdw==
X-Received: by 2002:a17:907:9617:: with SMTP id gb23mr10815535ejc.483.1624019368641;
        Fri, 18 Jun 2021 05:29:28 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:28 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 04/21] media: v4l2-ioctl: S_CTRL output the right value
Date:   Fri, 18 Jun 2021 14:29:06 +0200
Message-Id: <20210618122923.385938-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the driver does not implement s_ctrl, but it does implement
s_ext_ctrls, we convert the call.

When that happens we have also to convert back the response from
s_ext_ctrls.

Fixes v4l2_compliance:
Control ioctls (Input 0):
		fail: v4l2-test-controls.cpp(411): returned control value out of range
		fail: v4l2-test-controls.cpp(507): invalid control 00980900
	test VIDIOC_G/S_CTRL: FAIL

Fixes: 35ea11ff8471 ("V4L/DVB (8430): videodev: move some functions from v4l2-dev.h to v4l2-common.h or v4l2-ioctl.h")
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 8b3977a85b23..1a305aeab2f5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2224,6 +2224,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
+	int ret;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_s_ctrl(vfh, vfh->ctrl_handler, p);
@@ -2239,9 +2240,11 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 	ctrls.controls = &ctrl;
 	ctrl.id = p->id;
 	ctrl.value = p->value;
-	if (check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
-		return ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
-	return -EINVAL;
+	if (!check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
+		return -EINVAL;
+	ret = ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
+	p->value = ctrl.value;
+	return ret;
 }
 
 static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
-- 
2.32.0.288.g62a8d224e6-goog

