Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C92C89AFB2
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394775AbfHWMhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:37:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43520 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393138AbfHWMhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:43 -0400
Received: by mail-ed1-f66.google.com with SMTP id h13so13220691edq.10;
        Fri, 23 Aug 2019 05:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p40xZMYAGYpetJdqBVpyW48sl5czw5pPkLwRvzd6Eo0=;
        b=g5rAUfXvWCrQsGEI2z5cyJXJrxVqgHfEuTpSF2Y7wZdUdYwWn3csN8vkahPHoqXYrH
         GdC7J9ZOfl8jDba1Am74pX+cB13jdb0/i7762S9qK1rKyDEJ0fnFw+lX4XtZAYMDkDuS
         uHTkPqS9tTNk9pxJb1ZlZUHNL0WGZEvYL/QFYCZuPxcY/zNM+YOYvdZmkOppcC3BO0g/
         BrdrHzizS3Yb4uD8rYtO41U/H/gHZOYRpjUW11JByANvLdK0H90qNGUt/dWOl8CHEPKe
         XjF1LWeQnIsLt5Zh+UduogIzIkTzxIsmbWIGd6HehbTOk5wLww7lKqPDiQvDOZI3LQWq
         htRQ==
X-Gm-Message-State: APjAAAWkLCt7OesQhalpXhoPQ0UWWcrfz2eFCVWmiMjZgcTUZXJEfwuY
        6JG2nJSUTYx4YK/Mji/Xp0kmddnWnYI=
X-Google-Smtp-Source: APXvYqzNQyPgUGP6zQrCxQ/Iq3KBmyKIyrEE4w272s0y3u8FHY/6I54q/+Lb4Z2Fae9kLys4A066ug==
X-Received: by 2002:a17:906:6d5a:: with SMTP id a26mr3942766ejt.97.1566563862119;
        Fri, 23 Aug 2019 05:37:42 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:40 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 2/7] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Fri, 23 Aug 2019 14:37:32 +0200
Message-Id: <20190823123737.7774-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New control to pass to userspace the width/height of a pixel. Which is
needed for calibration and lens selection.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/uapi/v4l/ext-ctrls-image-source.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
index 2c3ab5796d76..6e728accf67b 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
@@ -55,3 +55,11 @@ Image Source Control IDs
 
 ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
     Test pattern green (next to blue) colour component.
+
+``V4L2_CID_UNIT_CELL_SIZE (struct)``
+    This control returns the unit cell size in nanometres. The struct provides
+    the width and the height in separated fields to take into consideration
+    asymmetric pixels and/or hardware binning.
+    The unit cell consists of the whole area of the pixel, sensitive and
+    non-sensitive.
+    This control is required for automatic calibration sensors/cameras.
-- 
2.23.0.rc1

