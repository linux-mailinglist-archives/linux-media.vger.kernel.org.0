Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB05B911E
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbfITNvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:51:46 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39065 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbfITNvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:45 -0400
Received: by mail-ed1-f68.google.com with SMTP id a15so3815955edt.6;
        Fri, 20 Sep 2019 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1L5wvhrcj05L6Oi0AWV9lhZy5Fef20ozg7DXeRJZdoY=;
        b=fZMA/bVmkqllNGlxudrFUWPeGgAjDTqB43R8nnxytMDYbzL0uKSrErQdriZiy+IT0G
         5/BU1H3plBBkSYPvuCcNlivi5+TjGtGo+K07WV1tUxVIYhnrjI8diPu+LaNtbtXnVTel
         UGN7dd9gRLArpeLU6z7ArdXU4OQispxQJWVo+wZsihM601hj+Ubogvt9FY4yHQ6Bh10r
         zbIKwreXAw6kTmYZGYKt2y+OzWaDXXxYQdWRnEiin0mBD3vPubnSB0hkByTb8XSLdK7D
         DemO4uOdf+xDYqSKB6Wm/DCiu22qQiB7dF325s7GvORKyBIS7hc9gL79grsP1InygtbT
         LmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1L5wvhrcj05L6Oi0AWV9lhZy5Fef20ozg7DXeRJZdoY=;
        b=Rp3vFm7zgC5pq6/B6JP8FesnB5XBTc891AUwH0OA43gtLnZa97iiCjZ1BLlrHOnvh7
         QJ2Q9UuM7seLXEQYYektfNJNTrQhgWoKWjdy23cDvnzoOodnknqiC2079pgSowZVbUJF
         OZ1m1gvQK5ErsT2eifFdV0lzxmCRddugrcXF0rPaJIOOwOz9uBsIFevatD7XGOf8pE2e
         B7wTSDNZc2wwuK2/Y98l+CrydvUJNkgSFUtqtc2xyNX5sqxtkJdMzgvrLkXP0xpvVK6R
         AzP0L/7vtbkQM8rI1wjiplBRhH8iCUHVT2SR3NSH9WPzoM1bdIBG3SI5KEIZ/Y7LJSRy
         iDpw==
X-Gm-Message-State: APjAAAUlB8V/Z4B0NLUPRgx7yZcW/uJcd8M5JI5UXrOQ8Jgg458JztLj
        fRHX0LzjKdm/nLkfgrOWjM0=
X-Google-Smtp-Source: APXvYqzOHSR71XmdJdpaj2ekazzMy4mOXgXqV6P/5OI1y+gpf3956rI/yotp/AnqfoUiYxw49BmGwQ==
X-Received: by 2002:a50:f045:: with SMTP id u5mr22054997edl.297.1568987503452;
        Fri, 20 Sep 2019 06:51:43 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:42 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v6 2/7] Documentation: v4l2_ctrl_new_std_compound
Date:   Fri, 20 Sep 2019 15:51:32 +0200
Message-Id: <20190920135137.10052-3-ricardo@ribalda.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920135137.10052-1-ricardo@ribalda.com>
References: <20190920135137.10052-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function for initializing compound controls with a default value.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 Documentation/media/kapi/v4l2-controls.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index ebe2a55908be..b20800cae3f2 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -140,6 +140,15 @@ Menu controls with a driver specific menu are added by calling
                        const struct v4l2_ctrl_ops *ops, u32 id, s32 max,
                        s32 skip_mask, s32 def, const char * const *qmenu);
 
+Standard compound controls can be added by calling
+:c:func:`v4l2_ctrl_new_std_compound`:
+
+.. code-block:: c
+
+       struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
+                       const struct v4l2_ctrl_ops *ops, u32 id,
+                       const union v4l2_ctrl_ptr p_def);
+
 Integer menu controls with a driver specific menu can be added by calling
 :c:func:`v4l2_ctrl_new_int_menu`:
 
-- 
2.23.0

