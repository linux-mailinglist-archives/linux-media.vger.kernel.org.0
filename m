Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F79863E7EB
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 03:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiLACdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 21:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiLACdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 21:33:00 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75708391C3
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:59 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id b13-20020a056a000a8d00b0057348c50123so598650pfl.18
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 18:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sH33K9fAtKywVT1+A2hjvaBvIHCIIkTIK0pfUCrFP0M=;
        b=bFux/LnHN7bmR2JLUq3ZUtFu0MjO0C671ONRUu2Ow1XEqY6PHjLvsjRwSq9rtXBQ7i
         NhR/ulnFu3U1RVpK+tEPpEOt0Dv8emhoUrdacRSxe/8ubvC+WmnyCNFlAgFrAeyV05Xy
         u1ICxxumnzulP7HcndWXkDVTIu3/HXjRUhD1GTdf6BsppyBV+/D2w1mxnM7lAvRaT+Ph
         m9cpN9WduaXGWn4xYlkPvxlY1pfshP9RKB7wJ3D3odJgHY89yWC0jjyBQZ6yaSG88ezA
         sEgzUGZRq0BHe9PXPnaopuo4b9RQ64f2HFNAjfYtdIvxx4nwGR74SsQiHQvRd3GpCOoi
         tYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sH33K9fAtKywVT1+A2hjvaBvIHCIIkTIK0pfUCrFP0M=;
        b=eILLJ+bZNYK+nrqTnUdMEB9XMiYDH+wVylntckn/+YuAecow4pKBydTOz3y///U2r+
         6qJn4UcZePMYmrU3owMvyY65M4L4vvpdaGsQi5xbnwtX/4hT9nOFISWw/b5oZerX0J8m
         PUfw3hB1q0Mbgp5TsgmFwzpn0i0qQj+UfUd7mXjZOFnlJsH8cgpP/2jyDKqPdsSZ8Iej
         q2OVtkgJMX/qlpoCIYGTn+hx9IjAC9PABkMkhIhMoDjR3ZLAojyb0JtlzV4BEDZ0zO3t
         BdkBkxSOq4j4RP962/hNyBc8Fh/tUFHT+H50dD6HW9gNaTRqRE2yh1CE1G08GclfPZse
         gS/w==
X-Gm-Message-State: ANoB5pkfTiR0A+naLZ0vZj6XCjSsaZs7isMAAX3kznKgYZLzivTQ+2Gy
        4nhnG18d/dhlGbXaLv0xpPJ2WnOYFOk=
X-Google-Smtp-Source: AA0mqf5JLjFsewmVTjM2fV3yLuvCxp8igiNrCweWwRK5I+PaLkErIQt6vmU9MV1zgWO54nuuXRTaQoHTtWY=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:8366:b78e:6451:c163])
 (user=yunkec job=sendgmr) by 2002:a17:90a:d086:b0:219:227d:d91f with SMTP id
 k6-20020a17090ad08600b00219227dd91fmr2439863pju.0.1669861978685; Wed, 30 Nov
 2022 18:32:58 -0800 (PST)
Date:   Thu,  1 Dec 2022 11:32:02 +0900
In-Reply-To: <20221201023204.2177458-1-yunkec@google.com>
Mime-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221201023204.2177458-10-yunkec@google.com>
Subject: [PATCH v10 09/11 RESEND] media: v4l2: document the usage of min/max
 for V4L2_CTRL_TYPE_RECT
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
2.38.1.584.g0f3c55d4c2-goog

