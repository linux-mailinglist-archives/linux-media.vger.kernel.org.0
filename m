Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35306340F1A
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhCRU3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhCRU3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C126C061763
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:33 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id bf3so8306589edb.6
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9f3bEPb39EYdgaLvGilqzYRCGoUJsSIg+sKNAlvNS7Y=;
        b=IvNu+8iNA1mZAGDnfTXpSj5RcLuCIBZW0X83WpVwSw2TsFedDDZsxcbyA9nbL9n/pi
         B5cdwxC7jhFsaymrpl85vHho9JpIKiwmBIZss6wMfOh8T0lWiXj5glMLBDvtFSWhS00J
         DgK0UZivYEnbvgcovlc9HN+pYgjIa83pV/Nq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9f3bEPb39EYdgaLvGilqzYRCGoUJsSIg+sKNAlvNS7Y=;
        b=GtNwBVEBXjf4osSf4wMzckE0lMoAaQ/j9NUUJVpGR70NqI81KcCl81oq4MPNkStTJI
         i/vWvqfIiJXTyIU1Y8FzmZDxfTZ0tMAWT63lwV41S9OYlGlbribbNDep3yLm166tKj/M
         lbQ8dqc5VbOe8jTOyz8WZqJoxF16fNnYM9rxksbon14i2qK+jP7DuD3At9g7j5vardX3
         Gy2jCzbWSMmsaZLYh10NYVBvO9gFUGaTYi+wrW+LkcCyBXVKkBeqWOvmEoht5ZhVeqQi
         O0xT/kdiVk7/E61s5poB2qRGi9OMBpoJQnkqXaDCrPq9dT09EpTRXFZjYOtcpIcTXQ2f
         3epw==
X-Gm-Message-State: AOAM5331bldAyjhzV0jkGqw2rpVn3CtSKzeGBDsy50KLhUz/VDTMUQyr
        lQIj4fySxJ3OchTKluQymK39V+6N9Vu9FLWGwNg=
X-Google-Smtp-Source: ABdhPJx+sKBbTOY0oUfXaS8n7Kt8lu4LaV+QuUfgNErAMsuOdoknKgjiKCpO1/w+Ha7BNb9EbHfJZA==
X-Received: by 2002:aa7:cc94:: with SMTP id p20mr5990610edt.353.1616099371922;
        Thu, 18 Mar 2021 13:29:31 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:31 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 03/17] media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Thu, 18 Mar 2021 21:29:14 +0100
Message-Id: <20210318202928.166955-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
written.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..47b0e3224205 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1089,10 +1089,6 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	unsigned int i;
 	int ret;
 
-	/* Default value cannot be changed */
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
-		return -EINVAL;
-
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
-- 
2.31.0.rc2.261.g7f71774620-goog

