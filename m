Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139D2534A20
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 07:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345738AbiEZFIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 01:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345684AbiEZFIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 01:08:18 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0048BA99F
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:08:17 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v191-20020a2548c8000000b00656d7d8d800so674922yba.18
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 22:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vf0ukjY5c2qSbA3tICknl8mPFsCtlOGDjLh6Gr5kAWE=;
        b=fJlomxXCfFo3YiBGh/FXi/ZaGr3eLCIqPJORqyakPNMVVTJrhvi+j6bhKKeEAcHZXq
         T6DxmVIa9UaBvMt7gYbmWKgs351ifwspbSHoLcMULU4K2t1Etu3VYb698rVdnRG2CxFA
         AVMjw5z0rCu24InQAGAZKIaY/OFzWt+pMMMW+BrkkwEklFc34iJf55MxwLSqzXHrcUMw
         c5G0Xzoq0UJTUXabaGV7IMALAz8grK1j8Lv6oVWtMPdYk00hzmIbVYJQ9WBV8V252zN7
         mTJrjPBETVcStE9QcSNmOt022fhLHaL6qpoCt7FnU2jZbWhjXPf5vPuCeuTbQ6h5fD90
         Db2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vf0ukjY5c2qSbA3tICknl8mPFsCtlOGDjLh6Gr5kAWE=;
        b=BJNgYCt0TakBhEkFiDvqlwgqFdBvk48Lhr+IO/F3nVz6BDXI93XcZetcX6q3W3MCU1
         UsnWGlxXYDHzCo1hhVQHwbiYoN3adcYdpYsboT9U/1PWAFzXzSqP6DwbiBm4Fgn4I3Rr
         CMH+enOCdpvo01bqEXzBNRHi+H8bh0lyhkzUxve6UHzULuqbf+NHHY7gLa4WZBPyAkhw
         YQEska94inCtl+34fRRMAafur7nQyWYqeR+bXPxbnlOUMkOVmETqMWD+Xsrdo/iZWvF1
         7I5Vis3gGgoRlK+OWqlmVABRWenEcgm3ZmVzcaf5mN4ukb5O9UlOb61hu2StqbS3p5XB
         oRSQ==
X-Gm-Message-State: AOAM533wP2IFnEraatbzk59z+y9X9GjaZExH61DTvcJBoLyTbgPTq7Ug
        UK1ZGpsR1aExgk9DKuU2gF/6AVV94mY=
X-Google-Smtp-Source: ABdhPJyODZ+ghKTjYDKboJSp/Gr2WVg9ZlVq3is2s9+wDZtHXScbz4JuHfrLHokNVdMk0pkXSDyjNiHvsLw=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:9e5b:ab60:68b2:d628])
 (user=yunkec job=sendgmr) by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr34708879ybu.604.1653541697210; Wed, 25
 May 2022 22:08:17 -0700 (PDT)
Date:   Thu, 26 May 2022 14:07:43 +0900
In-Reply-To: <20220526050744.2431518-1-yunkec@google.com>
Message-Id: <20220526050744.2431518-5-yunkec@google.com>
Mime-Version: 1.0
References: <20220526050744.2431518-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v5 4/5] media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
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

Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c470861e408a..add82db4f6f8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1784,6 +1784,16 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 		id = UVC_CTRL_DATA_DEF;
 		query = UVC_GET_DEF;
 		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		flag = UVC_CTRL_FLAG_GET_MIN;
+		id = UVC_CTRL_DATA_MIN;
+		query = UVC_GET_MIN;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		flag = UVC_CTRL_FLAG_GET_MAX;
+		id = UVC_CTRL_DATA_MAX;
+		query = UVC_GET_MAX;
+		break;
 	case V4L2_CTRL_WHICH_CUR_VAL:
 	default:
 		return __uvc_ctrl_get(chain, ctrl, mapping, xctrl);
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 040511da1005..a88d3fe6de93 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1038,7 +1038,9 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
+	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL ||
+	    ctrls->which == V4L2_CTRL_WHICH_MIN_VAL ||
+	    ctrls->which == V4L2_CTRL_WHICH_MAX_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
 			ret = uvc_ctrl_get(chain, ctrl, ctrls->which);
 			if (ret < 0) {
-- 
2.36.1.124.g0e6072fb45-goog

