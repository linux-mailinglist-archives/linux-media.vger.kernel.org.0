Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23813ACAE9
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhFRMcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbhFRMbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EEDC061226
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id u24so8344247edy.11
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=osMXZB6zVUCRxwMKbtanTuzmkF8QH55sKJbs0+x3AmY=;
        b=fVsM4046HINJ+QXPvD+ppPBaulEvl1ZxQ1MH8dRFpJhgXjGHguP7eGr0SgfcKYh6yH
         qIy2w8HjMHa9OCz5oyskCTQub2iP+V+NFuVDD7ZzbzbXqEBPFvgy9egJo39iARxC5Qhc
         1vFXSaypcnh7dCd5NTYkaj5yqd70jrRQLAdlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=osMXZB6zVUCRxwMKbtanTuzmkF8QH55sKJbs0+x3AmY=;
        b=PQQmr4DihMj7042ViwkDfJEeUV+UCLp3Pl2MkGibxW5Z77hhaL25LKlUqYJT24bUlT
         hdXztvwC4Q9ShSCPxpo2mnen4JCmcK4SUOuBZUMNeG62RrMFsrJbckzkfZWRxC5+5Hf4
         rIGITYQTPPkA5C9dp5kMteH9EI56ik+SLLTMywsAYZ8EMKs3kKcReM8wxfPCqTyOMBie
         HNYEkzQBN0FWu1TFxMz61bjA9byYPXJcTVTXAJS2HLyN8i5CGTswIBrUzgC1eCj/01Ay
         Euv7yFuiu7PSiMQtfzKNHTvEEOzqGgFv+qhsJZDfkcwQPdFDD3CPQOXMeG/fpLcmGjJE
         z9Ug==
X-Gm-Message-State: AOAM530NAeOmGKvc2HeUJeDYAIGOPbwlZIpojxbqg4szYPcUk4NDKNSY
        bC+itlN0B96C5zFMAq1UeC1s3g==
X-Google-Smtp-Source: ABdhPJz9wWQk+ezYuhFBHw+H6Ox6XkwxaTroqTpWAQ/XCc2CXrQpbYH0+q8ymt1/A151HmjnZQCvRA==
X-Received: by 2002:aa7:cdd9:: with SMTP id h25mr4692295edw.246.1624019373590;
        Fri, 18 Jun 2021 05:29:33 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:33 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 12/21] media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
Date:   Fri, 18 Jun 2021 14:29:14 +0200
Message-Id: <20210618122923.385938-13-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans has discovered that in his test device, for the H264 format
bytesused goes up to about 570, for YUYV it will actually go up
to a bit over 5000 bytes, and for MJPG up to about 2706 bytes.

We should also, according to V4L2_META_FMT_UVC docs, drop headers when
the buffer is full.

Credit-to: Hans Verkuil <hverkuil@xs4all.nl>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 5eb7e87f8430..37a092d717cf 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -524,7 +524,7 @@ struct uvc_stats_stream {
 	unsigned int max_sof;		/* Maximum STC.SOF value */
 };
 
-#define UVC_METADATA_BUF_SIZE 1024
+#define UVC_METADATA_BUF_SIZE 10240
 
 /**
  * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
-- 
2.32.0.288.g62a8d224e6-goog

