Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74DEE52B259
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 08:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiERGZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 02:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiERGZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 02:25:07 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8325D4104
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:25:06 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id i17-20020a259d11000000b0064cd3084085so1073364ybp.9
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IL247PX6DIraKPCB4Qq4FB+o6HNS1RKeiQ6Tz/uvjRQ=;
        b=FdxeR+8skMynSecmFetvLVn67Fcw6lsg9c8nc7s2TSvLKG4ZrTG3v0h0c9nhwIjmBE
         Y8IP8ZLZwHsMBVL4fPpzHjE6enWFHhXlwIhBTgcu0X+SWhKmevc8cYdSjaErAsAhWHa7
         Sxd98lMF246Z6KyxpC3azJHrZZgkhmYL0QVabLrHAh1lysi+L/u+bdTP0Va/UL0FZhwv
         X0PD6H60LU3f3a3Vn8MAnyq3tJfdB9itWEKUHIkkI/2CVTx0RY1gPZSkwt9nJ5DqzDwA
         DDPuwQkSxInnLGyzipmBmQPIvHjyU6ahF30dnRCN5nwSDfhlbEELd/H54aKfbtlMcnRO
         +QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IL247PX6DIraKPCB4Qq4FB+o6HNS1RKeiQ6Tz/uvjRQ=;
        b=xwEX3ox5xR24EExVOCS9hkZHkKLWaj7R0qAn51jteRqiH7fxeGKVVi/KilnbFqbgT5
         63g8bTCQ4zwK93rqYl82K07/DLO1rasaSjcZxILl2u6SjUa/DSk7wCjrVDT6uNyGo8Gn
         e53T9d9K/F3Cm+t6IbLcQ4BNqvwT6iPz63sYTeUKZT5lbTkfXNasABeGurQRCNO5Sr/V
         BAJAKW0uKqhsVnb6EHuvReUu/r73JqszoGk7XWXydmTzpKg/ev4t/ZMjMbtpDtR+nl+d
         QtzY5gTo5+sVBlLwinifwJHacbpqtGg14b6b5i5B1lWBWFMFCXwwcS59gygH95+eHtH5
         Ttog==
X-Gm-Message-State: AOAM530Cr7VV5Gosnprvmnr7tyqJFHRqr3Z+y5oG6nkq+5BQdrAjbiiy
        UUtvH8f5uz+uKh9yhM/I3gF+1F4u8Jc=
X-Google-Smtp-Source: ABdhPJw9C7pZGG4d0mBb5yg4XC7baOuBg8BA07JJ5Kl87enb+uEwdsrQ401Dyorm5sx9BkvdySoFdMeUgac=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d4d4:2a73:fa69:7d32])
 (user=yunkec job=sendgmr) by 2002:a25:2488:0:b0:64e:a74d:fc7e with SMTP id
 k130-20020a252488000000b0064ea74dfc7emr399038ybk.563.1652855105948; Tue, 17
 May 2022 23:25:05 -0700 (PDT)
Date:   Wed, 18 May 2022 15:24:12 +0900
In-Reply-To: <20220518062412.2375586-1-yunkec@google.com>
Message-Id: <20220518062412.2375586-7-yunkec@google.com>
Mime-Version: 1.0
References: <20220518062412.2375586-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 6/6] media: vivid: Add a roi rectangle control
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
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

