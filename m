Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229383ACAD4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhFRMbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbhFRMbj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:39 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133EBC0617A8
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id my49so15604573ejc.7
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BTV2BvYY8bWiutEhIP2/m/mfzC6d/lLuRadlg4Dfous=;
        b=gcIDPulPQp3gl0wGUFdyXG2mEvhm7yHKumZulkrQ1F8PjggWVC1SGMzEOLqpKTA2Bh
         GU3imyIJLEdpqWIXmJme537HhWSWzY/Juw2PDzHQoL+UF+sRRbu4RbF9/pZFD2XfiGP/
         Sfvb05lauUtgNws0ceox1jyH88q71zrQljLwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BTV2BvYY8bWiutEhIP2/m/mfzC6d/lLuRadlg4Dfous=;
        b=pr6P0qvQ3tUOKwWl1QX8dQaz3Z9fGNA/wu+QooX8WtcPg6VIDC++4sgex/IxF36k0c
         N6iyzAEomzEbDnhpVZv44t+stW8SZqZB912cBPVyH8Ew1lRZRvjYWMaoXcnx0e88Z9tl
         Yxs0Gd2VAof21bWsZmMx6O28G+Sv5BssXcLchXyMVxtxZjJZrSHJpyRfppJoNYXm0R8t
         8teGhbTvBuPprkvk2Cb9mp/5cDBoGcZM2yITBP7liIxRkZ23aePBoVVEaelaDH8Njfwt
         SxNf7AZkx4yc9av8ajYO2Y0x6s5jLxItBxQEh/pU19gzgSwHt5+QyB4HU5k/c8LWjK4I
         GQrQ==
X-Gm-Message-State: AOAM533TUkdcAC/eA9i/FWdZYT92wplLOXLgDVIf+qiJ6n0RRE/B+zQ6
        E051vZsjesyuEYc6mtMV6khLYA==
X-Google-Smtp-Source: ABdhPJyoHanZsBjdG04zfmm0g14w/Fp9HfQ9yadHWdyYmzBTuikt6C/cYUHS17GFGIOdEW8c/Gp6lw==
X-Received: by 2002:a17:906:6847:: with SMTP id a7mr7165661ejs.268.1624019367638;
        Fri, 18 Jun 2021 05:29:27 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:27 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mike Isely <isely@pobox.com>
Subject: [PATCH v10 02/21] media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Fri, 18 Jun 2021 14:29:04 +0200
Message-Id: <20210618122923.385938-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
written.

Cc: Mike Isely <isely@pobox.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 9657c1883311..c04ab7258d64 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -640,10 +640,6 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 	unsigned int idx;
 	int ret;
 
-	/* Default value cannot be changed */
-	if (ctls->which == V4L2_CTRL_WHICH_DEF_VAL)
-		return -EINVAL;
-
 	ret = 0;
 	for (idx = 0; idx < ctls->count; idx++) {
 		ctrl = ctls->controls + idx;
-- 
2.32.0.288.g62a8d224e6-goog

