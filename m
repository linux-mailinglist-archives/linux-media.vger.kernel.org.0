Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E636223B0
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKIGGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiKIGGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:06:44 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9322F1F2D7
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:06:43 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id f19-20020a056a001ad300b0056dd07cebfcso8318758pfv.3
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gaW72PzawlXdWGsieYhN2LBrU7QLLKsiUAmaLXFtJ8=;
        b=ng5ZiXVq9J0rsU+wE2TXKvlm3q+PFx3Joawd0y/PZvLw6sQlICq7qvhZvHCRoxyDMO
         OC8PFfl8TCs7IMfcjx9uNgIOJUYoQIAyctTq8NkZzfKNBQGQ3zrOtBvrLCC2CLgeGOe0
         TzJw0ILNumUTbuFjuMkOPe0i92xo4cdkFZODzZ542R5ExLPGs0xRnPHqnSWXQoZsCD82
         Nb7axdrohLVZkrgQGUjl0Iz4uOEqB4xabpxHUl+gjLam1zxs5qUUfyrPysK9un7IypKV
         52VTemEBgdJizbJc2XfI8ZYMhRHgu/4IE0YrO8mdWCRoT2m+rTkj2P8f58brfhN0jwWB
         KTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gaW72PzawlXdWGsieYhN2LBrU7QLLKsiUAmaLXFtJ8=;
        b=0ePHCmZrPrv58ESdUzlnEmOv64T3Xx/YVJFE/1a26kiBr58EgLW5qSbB8IreHcI9Zb
         ZnpoNICgtozdJO+xNacp4ly4Q3BUcT1H4lUUnkYqVFe5M9CwhJQA5ArVZcYI8jmgBAEF
         NS9767bQo36SumqDAefYg4D7txD+/7RcXTEYzKCeDX+Ow2aEDeqrB8dTgxNY3g13mJVa
         d2HuTEV9bgO9vIYNrC08lm0XH8CJANlz1fIWJOlsfyYq6q8QFVZ602D2Pj0zajnSNISA
         XlU3vGV21QEdJ3nPMor0qsM7MMK/3sdAhYQPF/8p/jKAw6MeEb2ooZuBjY3lk86ObwrC
         TkQw==
X-Gm-Message-State: ACrzQf2oS/eMsvMU8Pu5/50zHfcTMiVtF+wFio9RsNTsy88Oj56WxStg
        mXCEFOWpUrV9N2N0UqbnNPT1VGQZXp4=
X-Google-Smtp-Source: AMsMyM7XrBOloEnZ2rwO9p81X7WEAAY3YP/LFKyHPSehiPBsxaMIty+fI/ieDduTHxxUVyVj+rnTVHQdHvg=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:aa7:9aed:0:b0:56b:a672:6299 with SMTP id
 y13-20020aa79aed000000b0056ba6726299mr1132215pfp.10.1667974002970; Tue, 08
 Nov 2022 22:06:42 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:13 +0900
In-Reply-To: <20221109060621.704531-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-4-yunkec@google.com>
Subject: [PATCH v10 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
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
2.38.1.431.g37b22c650d-goog

