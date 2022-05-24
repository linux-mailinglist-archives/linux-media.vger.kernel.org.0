Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 598A6532243
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 06:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234486AbiEXEpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 00:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbiEXEpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 00:45:41 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0178A324
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 21:45:40 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e195-20020a25e7cc000000b0065343cb6c39so379829ybh.6
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=oLazf8t/p27Pa2vVH44l9QAYjjiNNMNPAjMcPhr4XIs=;
        b=nCWlLPDRXva/Vz4wshjpzZMla00G7cfonvg1Spvo5LunDhzASLfRCpBxqYjELc/laU
         pf2ImB8AQNsZmVlswUzK48ITKK4tHKbM39TQUfhIhSUt1QO7JCLJ27nZsmBoSaGob0D2
         yw4ysF7mJKZAXwHAEz7+xwjgaoVdDvBpS+sQX6t5sy/BgBr57Jeu7muSqwgKHONoqOik
         3dLfoTdyQXmg+YgrmmW0YNgLwhoKs1gAZWPBz6H48u8qIKMDK5XLaWWjMipobLRGI2Mf
         fm5DFvOva/UvX/IWW5IjtzQnF4oorZQKZubiw7+1O1n9TuRTcing8AI+EJ+pqoLVoRRK
         yatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=oLazf8t/p27Pa2vVH44l9QAYjjiNNMNPAjMcPhr4XIs=;
        b=IVVYwygMFbzRcqHG66DrmeJ+BBDWExR3rH4y/pVfyApIti+JIAIsUXNB9NJGNnbHwK
         FcM14t0U9GmVCPbQ9fTvFp1mci3PfzX/inp2o79wlA1izkB9K9BpZX0ghHAI2oq/jfu/
         uu2VJhaUvQsgzEAmGgqVdOHR9vbVaWnSk/FtxrxhMU9oI3W1RYYZqxAZr362nHcyn35P
         exBN+3q8PsuCJ3/s6+3rwWpuDS0hLaIL+hLowTGcLfVUWKkjeYhyNA+pIAMAsI5BEGcx
         x/EbeWkkrBIubRSaqNcJVTCSzFkWy9UwO3diQBaTaqWR5O75G18TtIedKXMgbOk3CYHg
         CzKQ==
X-Gm-Message-State: AOAM532v+me87BJCgzlL7cLEkiwzjyMX/bZK0rEPYI0ZOEyaoB5uFh3b
        WQa7ka84smHjrma0uvR4ME5CN5HdpfQ=
X-Google-Smtp-Source: ABdhPJwFOoTH3CNNxJuZybHP5Sfv6L49963FuqRr+uxz11K9Ev2PoAKhZu7mZKHLjRxFnsy/1jVTtHeR5Sw=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7145:c41f:bdd2:acc])
 (user=yunkec job=sendgmr) by 2002:a81:1847:0:b0:2fe:dff0:46d7 with SMTP id
 68-20020a811847000000b002fedff046d7mr26081070ywy.501.1653367539751; Mon, 23
 May 2022 21:45:39 -0700 (PDT)
Date:   Tue, 24 May 2022 13:45:07 +0900
In-Reply-To: <20220524044507.1696012-1-yunkec@google.com>
Message-Id: <20220524044507.1696012-5-yunkec@google.com>
Mime-Version: 1.0
References: <20220524044507.1696012-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [PATCH v4 4/4] media: uvcvideo: document UVC v1.5 ROI
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

Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 .../userspace-api/media/drivers/uvcvideo.rst  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index e5fd8fad333c..9b96c8b90b7a 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
 	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
 	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
 	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
+	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
 
 
 UVCIOC_CTRL_QUERY - Query a UVC XU control
@@ -255,3 +256,62 @@ Argument: struct uvc_xu_control_query
 	__u8	query		Request code to send to the device
 	__u16	size		Control data size (in bytes)
 	__u8	*data		Control value
+
+Private V4L2 controls
+---------------------
+
+A few UVC specific V4L2 control IDs are listed below.
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
+	This control determines the region of interest. Region of interest is an
+	rectangular area represented by a struct v4l2_rect. The rectangle is in
+	pixel units and global coordinates. It is independent of the field of view,
+	not impacted by any cropping or scaling.
+
+	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query the
+	range of rectangle sizes. For example, a device can have a minimum ROI
+	rectangle of 1x1@0x0, a maximum of 640x480@0x0.
+
+	Setting a region of interest allows the camera to optimize the capture for
+	the region. The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control
+	determines the detailed behavior.
+
+
+``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
+	This determines which, if any, on board features should track to the
+	Region of Interest specified by the current value of
+	``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
+
+	Max value is a mask indicating all supported Auto
+	Controls.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Setting this to true enables automatic exposure time for the specified
+	region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_IRIS``
+      - Setting this to true enables automatic iris aperture for the specified
+	region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Setting this to true enables automatic white balance adjustment for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Setting this to true enables automatic focus adjustment for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Setting this to true enables automatic face detection for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Setting this to true enables automatic face detection and tracking. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Setting this to true enables automatic image stabilization. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the driver.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Setting this to true enables automatically capture the specified region
+	with higher quality if possible.
-- 
2.36.1.124.g0e6072fb45-goog

