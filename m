Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A50D60C38C
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 07:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJYF41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 01:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiJYF4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 01:56:24 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649E9AF19E
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:56:21 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33dc888dc62so109560597b3.4
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 22:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AcvfZjZlnpNT367BjsbpG6KxYYbzuCMnjTLt4Jb7b+s=;
        b=bJhMyDwFtqqzt+GBaoGOFOO2akXeDrdp13/tcTMaFrQ6iHeZ3vnuyeIm+ivQhYe6s3
         JMU3/m2MKBQ/c/QnMZj5I3dm5eaPOr9OC/J5j2VAyFafgRsk9y4Bpsz168Lrq3u3Mu0G
         kSnzex9Paxp+ZaE/+G23Aalax6hG3f9FxAXLL7IwnBC5646JZgq4xfOgkk5P9c/CE+Jb
         9QObN9IVJ8kf/8WkBQoJC0utlYz3wMd7Q1bynyY0Ye8gDoFehSToPxgVWkfcU10Olawc
         7pKFj7/YKLNrKPzwsPYV7rLMRSNPFUNW2cdKAqtdKbK8p3Zwobgj3BQ9RrRc7yMa7xTb
         hVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcvfZjZlnpNT367BjsbpG6KxYYbzuCMnjTLt4Jb7b+s=;
        b=c/axItF8hL+QyPOpA6ZOwZWrNWeB1RDax/XDwKR5Tl+HVJ67PkbdvSfh70hnpmbD1A
         Pq5k4pxRxAr4X/T2NemVKi5MrwTGiTa712wytqBKZPOBbrfUuGXSu9wVsKZsFo2IcUgR
         Wz8zBU+koGpK5UxaT0GXKoAkr0geSOSK+ugvJV0vmPGNhxMx/UUSuunCU9/MULFV1TwT
         lAWEOdxdvedMWkNclfS9ltflYOOKlTdegNR39g9Xh0aQKB76eJwQuf5rSYQ4w94EwmB4
         GzvVr/b2NyVd6fJu2of5kq9vSRWU0vv41DUZygJs47+gSz/PZ83n4TKONrsk6XuTNrEK
         2ovA==
X-Gm-Message-State: ACrzQf3wEkX+8msm258WAerdocy3xRG3hp4ziuyjRpGpWXYg/BaW+jZG
        1acQ5eolZWiQDDiTJvxWLKM8ZZUYJzA=
X-Google-Smtp-Source: AMsMyM66CcjNhgdoiH66FaWoZYwgnVGV4ZcFC+H2B3NtRulGFyONxt9ClXxFcmmDqy8BCYHVr2tSEcW43Og=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7ee8:fa64:12b0:14f3])
 (user=yunkec job=sendgmr) by 2002:a25:49c6:0:b0:6bc:17dc:4441 with SMTP id
 w189-20020a2549c6000000b006bc17dc4441mr32909468yba.593.1666677380716; Mon, 24
 Oct 2022 22:56:20 -0700 (PDT)
Date:   Tue, 25 Oct 2022 14:55:26 +0900
In-Reply-To: <20221025055528.1117251-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221025055528.1117251-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025055528.1117251-10-yunkec@google.com>
Subject: [PATCH v9 09/11] media: v4l2: document the usage of min/max for V4L2_CTRL_TYPE_RECT
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

Document the default implementation of min/max for rectangle controls.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
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
2.38.0.135.g90850a2211-goog

