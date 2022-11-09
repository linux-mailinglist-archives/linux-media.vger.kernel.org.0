Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666756223B6
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 07:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiKIGHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 01:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiKIGHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 01:07:15 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4BB1F2D7
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 22:07:15 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id l1-20020a170902f68100b00187117d8e44so12686044plg.2
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 22:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwKnZDrRQEJbLlavz6iLrS8eYl9rVz8vxI0fv5BgSOo=;
        b=hck2f30Qanb9a5lS5C9ddC5ih7hs3YPV/G+CdtHNzb/EbOSj8Vwykf3FtfROS/OWha
         Y2i7kWEBTSxvtDhFYcmjdbU7aHtF0O+wd29UNiq+RqalDkpcJmEl0Ovv71ur2tjYQ2kW
         IKDiW1JYXUa1GdD/i95zPcGhxlkLUAwoul/iOjqjouhQsaPiS6OzoTP041qcZtqynC9p
         rK/mzPaTUhHsN7qJ6I49F8qMfpt4eCYtSafjE5Gi/Ohs6Xaj7LTSPYNfW3ao2OSOFsBX
         J1N357TJBSykXhGoJOI+NcKb0+DVZQ5AUamjsXOAZ1Nf3xVT0UJo4KlDL84DJOg8dY6d
         B2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwKnZDrRQEJbLlavz6iLrS8eYl9rVz8vxI0fv5BgSOo=;
        b=kXD0Oj1x9S1RisgV2F37OqPRoYW+7Pe/rKamaF6Ncpyw6TgTHvgq9W9ikp+bmBB4FO
         2WU4TX6DJl+cx8iTQMj/HQPncmKm5RhK3pr/aljlW3vFDaL5b+UJKj+bEohg4ghF12IG
         hc7YMpg8Xi3cPpo9eJeQWO1SeNw4E5rSRX6DA5UQ9+Yzy15pqM2e2tsh/l9HPdogplPW
         kqD3FBIPxxix0LFrfnb18fAeDrEuY0lInpgFshcK+RxontYV16iUID1tSKHKlALNK+z/
         Zt/S8zwTsHv6HMwPsAmVMrWwgQzP3h0go8eeF4e6kPyhuEDdHvRCrJXF7/PaQKKulL0P
         J0jA==
X-Gm-Message-State: ACrzQf19FtfrTETVK0HCrDx4Q968/tIIyE6l8GFWhExINBbRHOnWVMt+
        xFJd+rZTWUSPs2NYos923bKL7mByUGM=
X-Google-Smtp-Source: AMsMyM6vg3+t50zZGZ+Z+wObiwPVsjpqNa+YDX1k2sQQ97TQnHOjG+8D+FOxeetP0NUHWR9n4Y/QnlT+Y1w=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:124f:15d3:a305:3dbf])
 (user=yunkec job=sendgmr) by 2002:a17:902:e1ca:b0:186:878e:3b03 with SMTP id
 t10-20020a170902e1ca00b00186878e3b03mr60366862pla.95.1667974034851; Tue, 08
 Nov 2022 22:07:14 -0800 (PST)
Date:   Wed,  9 Nov 2022 15:06:19 +0900
In-Reply-To: <20221109060621.704531-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221109060621.704531-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109060621.704531-10-yunkec@google.com>
Subject: [PATCH v10 09/11] media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
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

Document the default implementation of min/max for rectangle controls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
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
2.38.1.431.g37b22c650d-goog

