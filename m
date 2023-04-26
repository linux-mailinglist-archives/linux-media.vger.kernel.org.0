Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7176EF043
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240118AbjDZIax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 04:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjDZIav (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 04:30:51 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232CA3AAF
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:51 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-b99f5daf7c5so3367881276.1
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682497850; x=1685089850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lebKifv5lt6ag6XdjNWl3IyrPv7ib44asZSlE3CJHVM=;
        b=rejQ50owTpS6LrLGWbrnbFD3lm7s9qF9YK82F07kRwLBWWfsmtUZ1gy/J6eV87eB//
         ezGBCu4na7UOpH/FTDWSL9ghKFmRbpYfFo56f6n1ouhpWRAK+jgV0hUBcI6HefkeyXUP
         gnj+94CIlXObzns1RRtmTfXOrCBznQEHHk0xybiGzEz1s/a8bYaGnU0wyhDPbQAevGB7
         b8dk76AFQyHgvlNre0TMLdcaUEZTElJ0pATF7Kg+2HKMfJ/V4OF/2WP0N9J2ej0PLGCV
         x9U4xSfirauTQNO1cj6th+dhq/VJ6k+xOdHl6a2ZnMZp8YPVlvHmh9Y1hSQKJshUW2lL
         TdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682497850; x=1685089850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lebKifv5lt6ag6XdjNWl3IyrPv7ib44asZSlE3CJHVM=;
        b=JhQab3VtTGc8EScv/eKZC2eUQud0NiUcKxP2ruc2KQ59WOrRdY3O9nytkzZMFNePFe
         gtPwwOzF9UIeArbTXzBWoJFTs3cbEqVIsclWFnoF7nbf3rEx58pufMuU85plS1o3pna8
         X8dyf1TBP/d5lYzC16nID1yC9+k8Ip6AZXEX+s7F2xGjqFkLaS2q54stCMoaPdkIUJFG
         erGEBbz0MLqp4xHAiGYLbv+PeDGUgSVokk2PrA9jq1UaynboefDCxlWek1EmQDW8BtCW
         6zOXlRGwwN+M5VHOoFaErqIjxjeyOkO9gviaZSb5cy3m01d3Ljg26qfDnISDnrce+t/T
         FHqQ==
X-Gm-Message-State: AC+VfDxAk+XJ82n3uBK2Y2Cr4tvReAcUlFswBTBviW/W+43mYvAHpynR
        4IvM2BF/fDpcCGRmznwamxCl0hUwvQg=
X-Google-Smtp-Source: ACHHUZ7FH+b1J5qlY8+3uCEQycjqZLnE3fMCa0FvIiZNcOpy6YQ4O4n7//4VipGYFbLVRkVN5rU4OVf4cec=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:1f4e:598b:ed:99bd])
 (user=yunkec job=sendgmr) by 2002:a25:d790:0:b0:b99:f202:db79 with SMTP id
 o138-20020a25d790000000b00b99f202db79mr3231106ybg.12.1682497850402; Wed, 26
 Apr 2023 01:30:50 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:29:19 +0900
In-Reply-To: <20230426082923.132909-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230426082923.132909-1-yunkec@google.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230426082923.132909-8-yunkec@google.com>
Subject: [PATCH v11 07/11] media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
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

Document the default implementation of min/max for rectangle controls.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v10:
- Added Reviewed-by from Daniel.
Changelog since v9:
- No change.
Changelog since v8:
- New patch.

 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 58982cd382e3..efa07428ba7a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -447,7 +447,11 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_rect`, containing a rectangle described by
 	the position of its top-left corner, the width and the height. Units
-	depend on the use case.
+	depend on the use case. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
+	``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of rectangle sizes. The
+	top-left corner of the minimum and maximum rectangles should be the
+	same. For example, a control can have a minimum rectangle of 1x1@0x0 and
+	a maximum of 640x480@0x0.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
-- 
2.40.1.495.gc816e09b53d-goog

