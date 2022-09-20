Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DAD5BE83B
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 16:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiITOML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 10:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiITOLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 10:11:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2891A57577
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 07:10:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id m3so3987499eda.12
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=otqXP3UDAqjwrNkT6tbklT3BOOMLMfKuSbWuAvIyB3Q=;
        b=TKweVFOpI9p8Vp6cWi7bgg8pot60gzt7WyOsIDFJBOKXjv/Dxi76vEV5vHkzFwy2G/
         hLuxoIe8ZirS54WicUWmdKasZAmOpA7VuTZ7F3wNQYz96YFVQGns5d3fxNEmf7EuZ9jQ
         PUGIcJlCbdXxID8v/LQWwu3cViuIFsZr61MaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=otqXP3UDAqjwrNkT6tbklT3BOOMLMfKuSbWuAvIyB3Q=;
        b=H58z0yBUBImqHGPa0402FCVl8Iz2EgZKK3vf+hiH6WSQSD9uDsxPyic5otYgPyA0W4
         JPUQYC1xJkYwD0AWqydPtKvMyTo9tkJXJeHwKAJfnJLgtrPS6I64nHj1XsjlVwEzLa1g
         Gmw23VXLqz1nkoFzlTGIh1RF0bqI9magq1BHen7Xjb9wm4qTZG3pMcU77KfoppMe8B/R
         w5mXOG8DV4+d0BtNFQ1OxBnxFWnNKOaXdEs2+vihdS2HJIJwNrx+ExcGl7zF5E0VgZo2
         mKyrUg9KE4CP/vp+fs6fX2gXUsTzdiE6LtD8YAB2ziYhfprtYXAqEwf6KcqaNecKIkHi
         pdFA==
X-Gm-Message-State: ACrzQf3olR+mxsVzbQHnh2KHOzmKivlW9FDs8gG4ee+RSqac3hkVKTi3
        MRllt9p4CCoIq4rWy6XkJXWDgg==
X-Google-Smtp-Source: AMsMyM7/9So581DszjW7TI2lyf+LCAyaJaM52nLK0K9iZADI/LHlSWWt8mKmZvlo8xCP+Iu3whr24A==
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id eq13-20020a056402298d00b004515fc5d423mr20086554edb.102.1663683004230;
        Tue, 20 Sep 2022 07:10:04 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:935d:52b0:7461:88e1])
        by smtp.gmail.com with ESMTPSA id w11-20020a056402128b00b0044e796598bdsm115488edv.11.2022.09.20.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:10:03 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 20 Sep 2022 16:09:51 +0200
Subject: [PATCH v1 2/3] media: uvcvideo: Refactor streamon/streamoff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220920-resend-powersave-v1-2-123aa2ba3836@chromium.org>
References: <20220920-resend-powersave-v1-0-123aa2ba3836@chromium.org>
In-Reply-To: <20220920-resend-powersave-v1-0-123aa2ba3836@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=UulBAVr6hwSvCunfG42JRX4U7c6yd+7PeOGh82DVhYA=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjKcm1f3I0JQPFAaDRAu32YgWda+JXBaESB3kn+i5K
 Fl280rqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCYynJtQAKCRDRN9E+zzrEiIikEA
 CcqM30IqIshzzupb/gzLBEe8bV5HX1JYiWHwQ65tPSYrweN2UVoKqaf/xjlRrvPqvjS3xgU1autuHb
 9kGaWj1A422CNNvfsHGNJv/KAvdq8Hs4lqZVagMOUvcq3qH71zqb7AL8iZ9I6B+/mbzo0sPQhzPMLJ
 S+NE+lGguNa+bQge1C5sMPyHGF6Lrs1vGJARkkh/KllZVptUNCHqd6A5eLOVpxuFAabUkwDvkCTeuA
 lkOE7QHmTugDrB8Ht79T0lr60ztlEsDPmqaSIaOnQMXRGS+t++7WJhmHvAFwK/7IE0+1vKdsWcaPHA
 4inVOMbLjxECNxVMHP3X2PPYU83sDepicCabL7+oQqqfdgP5uirEeYWFtxfCMcs4eFMWS5mDhpnT4q
 sDuCwJn+FHJ7wm/zOGnnYesQWo7pfDmMiBMFfGoKv02PdKpMG2dofSireqhQlBlOLj0rKZKpiPkQ4D
 e8Iza9wNrRC8rwBYc/D5qQ8Ba4dGqkW5Aj09fqaBWneRiHX97Yr5kZF7Hn/zBhYkdEHZ2WqVuvwviK
 BEuwzLaq4CKvFmZaSvd3MXaM2QSM7Dzq/ffRfUkifKmvUMBU2Ng8YuG2CQIyWPlyXfoYD4/7BRG2Sp
 mmo2f38YAzzStrHHIcptB0OuDtng2P/iqTUXCMDptwDz4LcXccvC6DSQxu+A==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new variable to handle the streaming state and handle the
streamoff errors, that were not handled before.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 4cc3fa6b8c98..8d5002543e2c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -840,13 +840,19 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
-	int ret;
+	int ret = -EBUSY;
 
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
 	mutex_lock(&stream->mutex);
+
+	if (handle->is_streaming)
+		goto unlock;
 	ret = uvc_queue_streamon(&stream->queue, type);
+	handle->is_streaming = !ret;
+
+unlock:
 	mutex_unlock(&stream->mutex);
 
 	return ret;
@@ -857,15 +863,22 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	int ret = 0;
 
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
 	mutex_lock(&stream->mutex);
-	uvc_queue_streamoff(&stream->queue, type);
+
+	if (!handle->is_streaming)
+		goto unlock;
+	ret = uvc_queue_streamoff(&stream->queue, type);
+	handle->is_streaming = !!ret;
+
+unlock:
 	mutex_unlock(&stream->mutex);
 
-	return 0;
+	return ret;
 }
 
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 24c911aeebce..caf74c87aaf1 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -725,6 +725,7 @@ enum uvc_handle_state {
 
 struct uvc_fh {
 	struct v4l2_fh vfh;
+	bool is_streaming;
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;

-- 
b4 0.11.0-dev-d93f8
