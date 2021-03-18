Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C758340F1B
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhCRU3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbhCRU3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EC9C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id bf3so8306627edb.6
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FSJfEMpG3gmvu/1zHkC5YrHmNIBqGbW9b1IfyrEOzZs=;
        b=Rp4sh8SvTreezYaiDbX6nqPkn8WyaoqSz0zaebel9/imOxNHSoL9bthZuVHoVCkf71
         7QJKS3y6fYrxXmTMdwt8qb3fklRMDFlaHtMM3LTvIvmf8e+PzAjM7I2eql6+jZHGOesl
         vXlLQILAdwRyPAWp2JQObCuexRmNK1owoaOAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FSJfEMpG3gmvu/1zHkC5YrHmNIBqGbW9b1IfyrEOzZs=;
        b=NHao1qD+x2IIu7OpKGgUE6y2WvnK9OlM1+9wqfKbtkaqpoiKq5QGErFclxo9fyNdRW
         Ws3fqLo4LfNzsdrZmQORMx/ykp4K73e7Euu+T7ZcoS3vmmsHPAxgBYtn3bjK6TYTbPrM
         OKlW7AmkiZRS+OlUAlCBCep8JVmGRgAMQvZ3OicL+ro72HpCBNkrIH91vMX2zvt6I3og
         YwxAI4THG4FJqwKyNsIQxBiBrHLiKNzU53eiFd1Uv0Zk1ulbu8T0kTeUHiQo5Zd1+5e+
         lcZhbdUJ8IpPlEeB+wUThvg6JLt+IU3KUOZAAKAQsphwL8NrXJYqyqicWBzAIdzgY1+4
         DILQ==
X-Gm-Message-State: AOAM531768gci9pVZ68JKbvH8YBM6dk37lmuY4P4lPBWoF8Z8tSz4qEZ
        1MX/isETtqMSx4soAqLAbmnmEA==
X-Google-Smtp-Source: ABdhPJwqeVRPR+ciinoz7xoNyT/jTcke1zYbW8YkxRuNHCXr3JS6OFtIU7vU2KZjZB0pp7Zry+2baQ==
X-Received: by 2002:a50:fe81:: with SMTP id d1mr6013551edt.308.1616099372499;
        Thu, 18 Mar 2021 13:29:32 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:32 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 04/17] media: uvcvideo: Set capability in s_param
Date:   Thu, 18 Mar 2021 21:29:15 +0100
Message-Id: <20210318202928.166955-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes v4l2-compliance:

Format ioctls (Input 0):
                warn: v4l2-test-formats.cpp(1339): S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
                fail: v4l2-test-formats.cpp(1241): node->has_frmintervals && !cap->capability

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 47b0e3224205..397217171bbb 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -472,10 +472,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	uvc_simplify_fraction(&timeperframe.numerator,
 		&timeperframe.denominator, 8, 333);
 
-	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		parm->parm.capture.timeperframe = timeperframe;
-	else
+		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
 		parm->parm.output.timeperframe = timeperframe;
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	}
 
 	return 0;
 }
-- 
2.31.0.rc2.261.g7f71774620-goog

