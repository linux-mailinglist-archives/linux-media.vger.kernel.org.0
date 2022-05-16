Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF703528669
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 16:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244228AbiEPOFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 10:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244209AbiEPOFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 10:05:18 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98A03A1AC
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:05:17 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id y17-20020a258611000000b0064dd2e4eeb5so1228079ybk.7
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IL247PX6DIraKPCB4Qq4FB+o6HNS1RKeiQ6Tz/uvjRQ=;
        b=KRU3miZ4W7ns4ogp0C2LCyh8bx1fPDmA/5USqd1p44aD8RFph0JZcAgxX5ZnwCIRf6
         QhcTE+J4TAAEMSyUebWEdqWL0J2uoVVK0fbChrvUUnLpiWR9RMGtdN1QS4FvBo72yjbq
         VRH3tSCiXsDfOkBj8n4Bjxetu/Xy3OYr5glnVqfZpqjaeTTU0prHnuMqfjlM+vM4OWaD
         FKhyRbmYwKPRFalSk+4xkEp8CTcFh4azxoPyPVb5pEwIBmwahHaEuL4ZU6HGFEyS8awu
         UTMCAuvuEBUo57elAJ0/keiczJNLg7Xh9NKBRMT5Yp8mIwrN4bpeW+wGbYnHSjOQ6Y7C
         +ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IL247PX6DIraKPCB4Qq4FB+o6HNS1RKeiQ6Tz/uvjRQ=;
        b=RExk/Oksr0zBF3RxQ7krP1/XgFSvVJve7pG3v7uYnmKAIuTvNWgByUDdF8NHnhpOFF
         yC6jBDNYDg+TWmwz9TmFFM5QBqNrczPqixwO5dLmFVwHqyVCiZgwtImca1VHTjnuwb7z
         hqPIMm0bGWVM6F/XvwwUMHQWkp1wKClB87JhSqwXINDh5LE5TG0jErvcFR9+pqGxzG/G
         dq0mraMqaV8szzJUmmtmxNrAvnIfl7uy05n3rdc3YccT3qWnDPwU3ODvWfuJDZfYv7jF
         fn3Lzk16D9Cgyhu//X0k/Z7eNdQPADI6btxl55XqE/ZebbG8wTVhZxRj87tYDx5cUeRZ
         nxWA==
X-Gm-Message-State: AOAM531UmyqwYJ3aGuFLTPQXF9+qKv1r44VyZYCviCnh8bdTzJlxZqbq
        T1k6ebkWzV6iDX1k51xmMEwp899e9ck=
X-Google-Smtp-Source: ABdhPJx52G6okON14zw2T8EAq5a/pLYYSWLsoVNGSpkLGX6rh0xUleByYNp+L2KsJZDyoE5bNd3sKgOeq48=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a25:2c4:0:b0:64d:b6f6:b5f4 with SMTP id
 187-20020a2502c4000000b0064db6f6b5f4mr4029147ybc.199.1652709916990; Mon, 16
 May 2022 07:05:16 -0700 (PDT)
Date:   Mon, 16 May 2022 23:04:34 +0900
In-Reply-To: <20220516140434.1871022-1-yunkec@google.com>
Message-Id: <20220516140434.1871022-7-yunkec@google.com>
Mime-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v2 6/6] media: vivid: Add a roi rectangle control
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The control supports current, default, minimum and maximum.

Tested by calling ioctls from the user space.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index e7516dc1227b..79093882d386 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -34,6 +34,7 @@
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 13)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -292,6 +293,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_area = {
 	.p_def.p_const = &area,
 };
 
+static const struct v4l2_rect def_rect = {
+	.left = 0,
+	.top = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_rect min_rect = {
+	.left = 0,
+	.top = 0,
+	.width = 1,
+	.height = 2,
+};
+
+static const struct v4l2_rect max_rect = {
+	.left = 0,
+	.top = 0,
+	.width = 2000,
+	.height = 4000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Region of Interest Rectangle",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.p_def.p_const = &def_rect,
+	.p_min.p_const = &min_rect,
+	.p_max.p_const = &max_rect,
+};
+
+
 static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_RO_INTEGER,
@@ -1611,6 +1644,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
-- 
2.36.0.550.gb090851708-goog

