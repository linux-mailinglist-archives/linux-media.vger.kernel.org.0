Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79EBB5280CD
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 11:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242160AbiEPJXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 05:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242145AbiEPJXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 05:23:31 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D8A25EBD
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:23:24 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fed8245a03so34652647b3.1
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 02:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IL247PX6DIraKPCB4Qq4FB+o6HNS1RKeiQ6Tz/uvjRQ=;
        b=KFgP8HYf/u1YqkzNXS8ek75t+U3whxqOaiUbWvQT7rv/TKcZkgXX+KhU98h0mOVw48
         mQrzFdDfyO6Yzc9QhMTT5LPNGIWsaQHtcoY8dle/Ji/lX1bJcsqiPyCfiTSOFtYXd2bD
         CB6TRgK/nXBeyC9kqqlW6T0X/653qAMsT/3LAVag1O011udcUSWyL1ISWQgNlUUaylSo
         +7Gh+JJMMRMG9Nel5XgfBcr15mm4UdaNOE3NzthppIMc2XMG4j8WH+qwMU+DTVnGKaAs
         tPIJjx6Twjg84Wjb+cYkufgk7dbiXMvK3+UK0dydlmL4LH6CiYNkKLXiTBVVcCAOGsVY
         YeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IL247PX6DIraKPCB4Qq4FB+o6HNS1RKeiQ6Tz/uvjRQ=;
        b=T3m66sLIPK2XN3SDyRF+HcHoDg2AeqfmH3eQ2dpnOJEafDfVrSzLvw9btwlL5DItA7
         6dHMxBnPaZJleqjRvtNcLMfsCnybML+SbF43ZvayGvpZtomkS50QByRfIorZ2LQ7yszx
         sfWMoJK/mQ5vFVqy6G94lb31TEI87Op37QAeu7UJHnhG7BYSo6CwTnMt91jOzQMJc+A8
         5SKx9FB9SbgAsrupW7Z0WzmpibCkMpuPY2d3qcT4yCxzeyuGXUI4HB8QlPdu7mx+32xx
         P/Qc+FCjRtlKNTJWLnZFBWOef0RxCaO+IyKVo5P4uZM1lIZFhnxmqsc1Wqt35V7TUIQm
         plzg==
X-Gm-Message-State: AOAM533UNGXh6TwQSGX+k9+EblcOPtWv8hrzudYOydT/tK0WWQVYECvP
        3SzGr350ERv0/XD6C/qMp7/6RjqAgeM=
X-Google-Smtp-Source: ABdhPJwrI8ICCctSFTq1tdm5cLeSw7m1Id2aR3dWDRNjVo8Bxi19CN/FB37fV3W3h1u9qf8oda/AfwDT3uY=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a25:258:0:b0:64d:6b57:bf25 with SMTP id
 85-20020a250258000000b0064d6b57bf25mr8665650ybc.193.1652693003674; Mon, 16
 May 2022 02:23:23 -0700 (PDT)
Date:   Mon, 16 May 2022 18:22:09 +0900
In-Reply-To: <20220516092209.1801656-1-yunkec@google.com>
Message-Id: <20220516092209.1801656-7-yunkec@google.com>
Mime-Version: 1.0
References: <20220516092209.1801656-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v1 6/6] media: vivid: Add a roi rectangle control
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

