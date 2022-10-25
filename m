Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 555A460C386
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 07:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiJYFz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 01:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiJYFzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 01:55:54 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA0948E8C
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:51 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d18-20020a170902ced200b00180680b8ed1so7606416plg.1
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv6dMsttfIS/yNccLcgdn9kGfrfq9OLbuIFlF3os57Y=;
        b=MHjUMlZeiByYW4d4EBxdR4ODMF9cBqunFEDD0DrmzRcpJUju47LL94x57BI4YV8/ZZ
         lOmRtFT0o4/JBHdqeuOJ/K4gJKiZHyLHlheVT3oh4iGzGGyBTdCHoBIES9bSkiqJKjLJ
         bPOok7cerCXT7YShr4YLuljSNeg6vgdiIY9FP49ceZihLxokBzc9vNbMGrsk+t6ndA9Z
         VjPCElI70DZZb9OQBa4T6LZD7wgYZ406Fu2Fb85EBzOTTmEz0EkRML+rc1xWR0fv0AwB
         7/vJSX3HRtZSNPoel+TOsdB0megB/0XUkefXFEn2M8F/pU/9nRw3yVezq0t7LNDcyIEA
         c6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv6dMsttfIS/yNccLcgdn9kGfrfq9OLbuIFlF3os57Y=;
        b=wtX5quI0uuLXym9kIeINU4u4VmWRrj5I8KoxFUwsG4+H7YcVS3Suap7DZkrQ03PPJE
         vaFSb35d6UYRUG/Jb/GG1ajRVYCjN/ia79dlSJe1LsQR+u1W9z6jemSK8tA9CWadBrEE
         CSSuNSmsZ1/T4Q1BM/HbB2RIMYaRUfmXm0kZof98GdSamwBH7ew+AFcq1Q9iqGnOcLRP
         CqIjkuWVGMtzlf8h/ARvGUnwLfnuunYXSnIoKc5oqw5d4V5Rf6x8XTAJr4syUO0zJYEF
         KfCWgRyGXMZmrlTV8/jNGm363rE+P3j545h3paSG6vIeuPIFaocLQi55BL2xmQR4F0Eu
         Pfmg==
X-Gm-Message-State: ACrzQf3sNGxkpbhe6jfrFQLgCtdvnSviGJaA1Tglf5Iby1vBBdc3xBZG
        JSAHs9YdT04WINXpEQNwh+0I+73uMyw=
X-Google-Smtp-Source: AMsMyM5y/21vCrgKicWIDbd7MfIBjtQZXMdB+kodl1wJK9qBCrg3Lmvs87ygTX1Dw67q8DGS/5ITYlA9YgI=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7ee8:fa64:12b0:14f3])
 (user=yunkec job=sendgmr) by 2002:a17:90a:b794:b0:20a:eab5:cf39 with SMTP id
 m20-20020a17090ab79400b0020aeab5cf39mr4154572pjr.1.1666677350169; Mon, 24 Oct
 2022 22:55:50 -0700 (PDT)
Date:   Tue, 25 Oct 2022 14:55:20 +0900
In-Reply-To: <20221025055528.1117251-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221025055528.1117251-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025055528.1117251-4-yunkec@google.com>
Subject: [PATCH v9 03/11] media: uvcvideo: introduce __uvc_ctrl_get_std()
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
Changelog since v8:
- No change.
Changelog since v7:
- Newly added patch. Split the refactoring of uvc_ctrl_get from v7 3/7.

 drivers/media/usb/uvc/uvc_ctrl.c | 40 +++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6997e7466a2b..40c5d01364d9 100644
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
 
 int __uvc_ctrl_get_boundary_std(struct uvc_video_chain *chain,
@@ -1892,8 +1902,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
2.38.0.135.g90850a2211-goog

