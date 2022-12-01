Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65ADD63E7DF
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiLACca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiLACc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:32:29 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA64E8326C
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:28 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id j13-20020a170902c3cd00b0018981349b36so462402plj.11
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v/JaKlrJyoF7LSluGP2BZjSGaMLThxnszYRclIHmQ6A=;
        b=IIi42wUCeo6tTYNd7XmP4FJ6h6qKglXJbhS8X4MQV4XRV/v6iOqBNdhi68Ggk+NYRd
         7Qk9N+09uBFn9PQ9/LvwLC+njWxdGhQyu9AgzHMptCL4X78MH4a+cooopx313HknOW/J
         fLEYptGQlGfLK+oWrw9LJtjK5lQSJOnq3FJxAknm6q5Q85X1ODZs8BztZusc4CqGvKo2
         al82bJnaHhKdjrzJ3vdNrW9W50T7aby7/fVm3ot9G7G2KJ52Yx/3D15zfZgL0mH/uBsR
         nza3bOuUjcVAKEpgOeUF5039jqc4fadYcjElvYeu6KyAMrJ1lyaIOGdpuoYCbnkqxBVM
         Eozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/JaKlrJyoF7LSluGP2BZjSGaMLThxnszYRclIHmQ6A=;
        b=nxrTx0M58Sge0FlHxBUXcPzrdCZB17UX+d6lSJsZTp9s6rDxqJCa1ZnnrjOYAj2D5U
         KQURtkV5ukWfOIxTLcyxAkoGAFXlCiVyIWJNpctIgxEbYe25TsW8dzdXW8koBqTKR2Cg
         YMi2gv+Qdn5i64FDWK50HNQkr3VDoYW+blvOk5JHtukR30sNWbFKdJcPyz+Br4pMHrRP
         Il+PU+5DHn5TnOnQ6Q4iJ/HjT2x8cywpMaoAo6H/+SxAEAs1WRg/U3OkKqhVJsxnj7zo
         nDQjF8nEoQMWYi9w+n/999yL9TsqZWBWXwZpPlbbeIQBTxAn57Q5pzHIt4ZIhNCANkXm
         7VBQ==
X-Gm-Message-State: ANoB5pnvBZlFEvmIjBKhP3MxeanKNZZogkDY/jpCfnh27D8+qXDOh803
        GtS+W5KmV2/TpmnUC5YatPR3flw3Oxk=
X-Google-Smtp-Source: AA0mqf6jKoxnRh+jRaAn6EZmUy8lMiVmTjNY2cMrtwbfWS5iTXPTiZugQ8Wyw6kL2XcY+65udPENqJGa5gs=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a17:902:7d89:b0:188:4ba9:79ee with SMTP id
 a9-20020a1709027d8900b001884ba979eemr45806208plm.83.1669861948497; Wed, 30
 Nov 2022 18:32:28 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:31:56 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-4-yunkec@google.com>
Subject: [PATCH v10 03/11 RESEND] media: uvcvideo: introduce __uvc_ctrl_get_std()
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor uvc_ctrl to make adding compound control easier.

Currently uvc_ctrl_get() only work for non-compound controls.
Move the logic into uvc_ctrl_std(), return error for compound
controls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v9:
- No change.
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.

 drivers/media/usb/uvc/uvc_ctrl.c | 40 +++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index dfb9d1daece6..93ae7ba5d0cc 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1028,15 +1028,15 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 	return ret;
 }
 
-static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-			  struct uvc_control *ctrl,
-			  struct uvc_control_mapping *mapping,
-			  s32 *value)
+static int __uvc_ctrl_get_std(struct uvc_video_chain *chain,
+			      struct uvc_control *ctrl,
+			      struct uvc_control_mapping *mapping,
+			      s32 *value)
 {
 	int ret;
 
-	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
-		return -EACCES;
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
 
 	ret = __uvc_ctrl_load_cur(chain, ctrl);
 	if (ret < 0)
@@ -1153,8 +1153,13 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0);
 	if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
-		s32 val;
-		int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
+		s32 val = 0;
+		int ret;
+
+		if (uvc_ctrl_mapping_is_compound(master_map))
+			return -EINVAL;
+
+		ret = __uvc_ctrl_get_std(chain, master_ctrl, master_map, &val);
 		if (ret < 0)
 			return ret;
 
@@ -1399,7 +1404,8 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return;
 
-	if (__uvc_ctrl_get(chain, ctrl, mapping, &val) == 0)
+	if (uvc_ctrl_mapping_is_compound(mapping) ||
+	    __uvc_ctrl_get_std(chain, ctrl, mapping, &val) == 0)
 		changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
@@ -1566,7 +1572,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
 
-		if (__uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
+		if (uvc_ctrl_mapping_is_compound(mapping) ||
+		    __uvc_ctrl_get_std(handle->chain, ctrl, mapping, &val) == 0)
 			changes |= V4L2_EVENT_CTRL_CH_VALUE;
 
 		uvc_ctrl_fill_event(handle->chain, &ev, ctrl, mapping, val,
@@ -1746,7 +1753,10 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	if (uvc_ctrl_mapping_is_compound(mapping))
+		return -EINVAL;
+	else
+		return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->value);
 }
 
 static int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
@@ -1893,8 +1903,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		       ctrl->info.size);
 	}
 
-	mapping->set(mapping, value,
-		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	if (!uvc_ctrl_mapping_is_compound(mapping))
+		mapping->set(mapping, value,
+			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
+	else
+		return -EINVAL;
+
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
 		ctrl->handle = handle;
-- 
2.38.1.584.g0f3c55d4c2-goog

