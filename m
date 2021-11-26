Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318C845E3A4
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 01:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350183AbhKZAVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 19:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351856AbhKZATh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 19:19:37 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD41CC06173E
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 16:16:19 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so9540262wme.0
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 16:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MdGgzLe+PHePhKKQX80kcbu6DYhXjpwJWtLW/+WuKFE=;
        b=lhJjSdG/Wv0mQ8/li65URO8s70qb95pJrCzBix/bA2x4qhbfEMj+BkAjV5pf3HKa0x
         seI1QeOLKZ6yCR3B/2kEj4YH9gCEwDYjnxXzXQO3UFPMxcz5TznB0J/82DUwr/7lC6Yx
         OrHdH7u31H/if/JWPnZvNeCWCysaQZhZSoDFYUI2OynWz+Kh3DjZEtEioOn/V/oWAWC6
         BTZ4SvlFYAzMATn1WmyInQ5sxf4eWaFN18NgNJlrvBK0KdPS2GoO7aA9Vg9lZhtSgPCP
         yTM4LbOlw6NJXin2bLbkYgakcoc/VzbeMKR9TOc+fKcPkc7hfHFYFzD5hFQbKFfG8sT/
         OZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MdGgzLe+PHePhKKQX80kcbu6DYhXjpwJWtLW/+WuKFE=;
        b=QelvCy5ExFG7nO3HhIhS+HRdc0TG4wog1hVz0fxXwLl73q2HqVfvgO+Fbjo058XMYK
         7GIh1wn9TugmI5ZuNY04chqSp2tYVQ/NaSQCbDV47bBW3/RcOGLOP64GPb7I2iWucYIx
         wuo7fyhZNDbx/QtHYg2ra0MbmL32w8HGcnCLoHzUle1YvZLm5507McNfZJhnjHQYQtKE
         jKtk0UB1J020CLWYX5gqfANHO0FVY84KOHk23Zi32RDjVgVJW0nNETnG26LMtHYQQs6v
         EI2rKkeTo5Y/CQZfOSVJDoBZ1nq25TwZ5GubcJnUtRAzOz6CZP7O9UdsfIw2dCGXUwtU
         zw5Q==
X-Gm-Message-State: AOAM531meKYlaQeCOVZ+bKk4o5ojlb0ZL4ngFRzo/6TrMzk2HIBqD0ZE
        GLuTsFZNmjwjN/94zd0sidjTYrx/sS4=
X-Google-Smtp-Source: ABdhPJwtKLLViOVJD1bjt3MZXZS0D/PKbZtDfdxffrzkMGPza615Ytt6yW9i6dIo0R3hfGEkmVHaKg==
X-Received: by 2002:a05:600c:40b:: with SMTP id q11mr11619212wmb.185.1637885778391;
        Thu, 25 Nov 2021 16:16:18 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p14sm8693728wms.29.2021.11.25.16.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 16:16:17 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
Subject: [RFC PATCH 0/2] Introduce ancillary links
Date:   Fri, 26 Nov 2021 00:16:01 +0000
Message-Id: <20211126001603.41148-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series is not yet ready to merge, but I wanted to share it as I know some
other folks are working in similar areas at the moment (and I am including the
libcamera devel list for the same reason)

At present there's no means in the kernel of describing the supporting
relationship between subdevices that work together to form an effective single
unit - the type example in this case being a camera sensor and its
corresponding vcm. To attempt to solve that, this series adds a new type of
media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
struct media_entity. Further work would be needed to document it properly, and
there may be ramifications within the v4l2-core which I have not yet discovered
(a lot of places seem to assume that media_entity->links means pad-2-pad links,
so some extra work might be needed to validate the link type before doing any
thing to them).

The mechanism of connection I have modelled as a notifier and async subdev,
which seemed the best route since sensor drivers already typically will call
v4l2_async_register_subdev_sensor() on probe, and that function already looks
for a reference to a firmware node with the reference named "lens-focus". To
avoid boilerplate in the sensor drivers, I added some new functions in
v4l2-async that are called in v4l2_async_match_notify() to create the ancillary
links - checking the entity.function of both notifier and subdev to make sure
that's appropriate. I haven't gone further than that yet, but I suspect we could
cut down on code elsewhere by, for example, also creating pad-to-pad links in
the same place.

Thoughts and comments very welcome :)

Dan

Daniel Scally (2):
  media: entity: Add support for ancillary links
  media: v4l2-async: Create links during v4l2_async_match_notify()

 drivers/media/mc/mc-entity.c         | 30 ++++++++++++++++
 drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
 include/media/media-entity.h         | 30 ++++++++++++++++
 include/uapi/linux/media.h           |  1 +
 4 files changed, 112 insertions(+)

-- 
2.25.1

