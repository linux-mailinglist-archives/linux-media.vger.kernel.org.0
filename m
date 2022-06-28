Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF48F55CD50
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243166AbiF1H5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 03:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245258AbiF1H5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 03:57:34 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F248615FCC
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:33 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id z188-20020a2565c5000000b0066c086258ddso9243435ybb.9
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OqDXLLw2gE6LQdAoQryltTRk36RdCADaFwUGEHVSOFw=;
        b=lvx8Eq2c2z7wJL13ExsGRrVD+J5W7bjUHw8XK27bKlM6dNf1HfnltTuJQ5vnnItG1F
         P1H2saKf+Ae/+2Njq9XarXNmSY1p0BJVJjh0ELTTzsmS+IFe4b+OefY6IRa+pZ6GNKYn
         oLUcQEyGuuov9X0Kg5ConWElpc0tQpzUtDKvCGhAiDED04As+QwZxEj/D1qsFDw18GbP
         YwyaXyYprxbqtTUjC3MQMrCyqjHt/6tiGgbeT6QKd10LriQb+bPy0IrxZJ43qN9Vqfn5
         LcN492aJB+n91BkgdSr7oRwAuQXXreIP8mwNJOtllC+sq7yNsiFnteRMfUWxcMY01plw
         /Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OqDXLLw2gE6LQdAoQryltTRk36RdCADaFwUGEHVSOFw=;
        b=xz78qV4m5b9NEjl5hC5J9jUfpQB79dUTEH22G9sugYpWXO+dt8jQChTB+xgVKL7ObI
         NOWCvOwipFHvN6K2MHAckCuFG1akOspbq6Ts75AuuOHcUU46nilzRVO2meuuUyAcxhZB
         +DkKq/Mb4xyoOtNBNY2b4Bj0yq5P6ueByq/Y5z4iO/Sw3CIcckc8RRf18X5TK3slT0Po
         4GUZ/I+jUSyMZrUw2w9YLGnbvV4ACyd3IefmzGTFpTLyLfpLGc5BpCS+9XhzkqLSY6yo
         A7zZgddbfmGxhtFqmY4HFv5Pypvs/2ZDMVWY7hk1PY60h3Jl/jk0jjZDBO4+cK4sKeU7
         Jg1w==
X-Gm-Message-State: AJIora/Q3a2O3pQdO41g1n6itnyheCzcVPZPKe6Ed/WePPF2ExUUJL1p
        dQU0E9D3uB1oPoPY6RH7D6ai06WYBm4=
X-Google-Smtp-Source: AGRyM1s6eRUV406pXEDDD57cJuAJRvis8QgsmqE6fK30UleksKv+k/BrCuMrWwRHTaI/ZIVhJTgfLHWKnfU=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:983d:14d6:e059:135f])
 (user=yunkec job=sendgmr) by 2002:a05:6902:1186:b0:64e:b02c:4f99 with SMTP id
 m6-20020a056902118600b0064eb02c4f99mr17855922ybu.165.1656403053324; Tue, 28
 Jun 2022 00:57:33 -0700 (PDT)
Date:   Tue, 28 Jun 2022 16:57:00 +0900
In-Reply-To: <20220628075705.2278044-1-yunkec@google.com>
Message-Id: <20220628075705.2278044-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220628075705.2278044-1-yunkec@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v7 2/7] media: uvcvideo: add uvc_ctrl_get_fixed for getting
 default value
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
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

Introduce a new uvc_ctrl_get_fixed. It simply calls query_v4l2_ctrl()
for now, but is easier to extend to support compound controls and
V4L2_CTRL_WHICH_MIN/MAX_VAL in the following patches.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  6 +-----
 drivers/media/usb/uvc/uvcvideo.h |  2 ++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..772d9d28a520 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1697,6 +1697,19 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
 }
 
+int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
+		       struct v4l2_ext_control *xctrl)
+{
+	struct v4l2_queryctrl qc = { .id = xctrl->id };
+	int ret = uvc_query_v4l2_ctrl(chain, &qc);
+
+	if (ret < 0)
+		return ret;
+
+	xctrl->value = qc.default_value;
+	return 0;
+}
+
 int uvc_ctrl_set(struct uvc_fh *handle,
 	struct v4l2_ext_control *xctrl)
 {
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 648dcd579e81..0366d05895a9 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1042,15 +1042,11 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
+			ret = uvc_ctrl_get_fixed(chain, ctrl);
 			if (ret < 0) {
 				ctrls->error_idx = i;
 				return ret;
 			}
-
-			ctrl->value = qc.default_value;
 		}
 
 		return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c5b4febd2d94..ba028ba7c34e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -901,6 +901,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 }
 
 int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get_fixed(struct uvc_video_chain *chain,
+		       struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   bool read);
-- 
2.37.0.rc0.161.g10f37bed90-goog

