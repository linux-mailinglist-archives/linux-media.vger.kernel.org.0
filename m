Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4F77594BE
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 14:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjGSMFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 08:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjGSMFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 08:05:32 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5272CD
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 05:05:31 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-56fff21c2ebso69838577b3.3
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689768331; x=1692360331;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLowqAWOc4M3SC2uHAXkI5IQ+uhVoM7LHPPZMdxwUUI=;
        b=PXxx2pbSriUm3e3DE8gaZBuxsjDEaS9cNZVOUYnyPAfBJxQrxxfTjVx0oYzXIkle8p
         3h0cu+5hkbVFSEMnwxoB8bwlIAvcGQAHmUcopd3kUevwruiIpasepjFitt/u0UqLtRtP
         H3DyyFPDMqjgwp2EY90oRs42NDTjWfzb/Wy9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689768331; x=1692360331;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLowqAWOc4M3SC2uHAXkI5IQ+uhVoM7LHPPZMdxwUUI=;
        b=A+qmLfVLwUu3uAb3aWhU5mG87hlplghg97J/jNqNMnS8jkJrHDUz8t8EIktNxNsa6/
         GPlHYPleCxTY1pOkWxhHBnDo4LGiidifzmPHRhNB0HZ6OAqadZGxevjv0CeJ+QSJJ95g
         AaoQM7MLxllRf2/HYfSHxe+QMSnQilxTEqQP9/yP4iT0g1E5Xy+1EbwxNrA2LteY2f9D
         xm/W60u29UuPz59dmxgLDMRyaP73I+9Uw/ZdIeBUujCW3eXG9ANlU2EeaD0tEvNBJHlb
         EJ3Ay8f5G+0h36plzH1wIG/aFQ+Za53ivA8e3ihrj9JozVsMXzfonu92VLAEWxuT5xzd
         aLDA==
X-Gm-Message-State: ABy/qLaOtuVFR2xr8po6b4ogmEabQc92XyBfDhrkYUg9obiCGnoSei/s
        fQKsEv2LxsPrU9mnxygUl6BnCQ==
X-Google-Smtp-Source: APBJJlFdeodEO4GvSVZ6iL4l++IC6+iB7U3nA713Qb6WkeDhBtWERU8pA/1NoLzA6DHJVVVs1XwgpQ==
X-Received: by 2002:a0d:ebc3:0:b0:568:d586:77c4 with SMTP id u186-20020a0debc3000000b00568d58677c4mr17111470ywe.4.1689768330891;
        Wed, 19 Jul 2023 05:05:30 -0700 (PDT)
Received: from denia.c.googlers.com (122.213.145.34.bc.googleusercontent.com. [34.145.213.122])
        by smtp.gmail.com with ESMTPSA id h23-20020ac87457000000b003f9b9d7f319sm1274205qtr.70.2023.07.19.05.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 05:05:30 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 19 Jul 2023 12:05:29 +0000
Subject: [PATCH] media: uvcvideo: Fix OOB read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-uvc-oob-v1-1-f5b9b4aba3b4@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIjRt2QC/x3NQQqDMBCF4avIrDsw0UBKr1JcTOK0ziYpE5SCe
 HcTlz/vg3dAFVOp8BoOMNm1askt3GOAtHL+CurSGkYaJwou4LYnLCWij+T8k4m8C9B05CoYjXN
 au+/EhJc+/Uw++r9P3vN5XkwfF9l0AAAA
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the index provided by the user is bigger than 32, we might do an out
of bound read.

CC: stable@kernel.org
Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Avoid reading index >= 31
---
 drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
 drivers/media/usb/uvc/uvcvideo.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5e9d3da862dd..5e3af66a2223 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1402,6 +1402,9 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
 	query_menu->id = id;
 	query_menu->index = index;
 
+	if (index >= UVC_MAX_MENU)
+		return -EINVAL;
+
 	ret = mutex_lock_interruptible(&chain->ctrl_mutex);
 	if (ret < 0)
 		return -ERESTARTSYS;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..139608f83499 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -101,6 +101,7 @@ struct uvc_control_info {
 	u32 flags;
 };
 
+#define UVC_MAX_MENU 32
 struct uvc_control_mapping {
 	struct list_head list;
 	struct list_head ev_subs;

---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230717-uvc-oob-4b0148a00417

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

