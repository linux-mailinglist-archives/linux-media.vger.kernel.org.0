Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA244A3BF1
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbiA3X7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbiA3X7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:08 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D152FC061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:07 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a13so22061716wrh.9
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLOEgQy+6fnYykIS57HacmY2euW9Rqx5gnDk9sWPE3o=;
        b=fXFZPEaNqLykfj+IbzSldxb5HanlEQkH3SirkncG/5jloq7+4t+VeXQO/JhHtpeR58
         V405WXSER17CofiwqzAF/ECcaIllW82tF8JWk40C6mtCeID+L82RfLHhDCy0pMQKOZ7M
         6qk+TWd72t0BlM4C+ZyisvlGiWnXJKo7Ap31dd2yscGT3w2XE6nKsYcYRRi6RQYHs9ET
         VhnhYIlWRQMMmQLs1ebzEfQZ3Zq4DhOiiGTOYK3Nb7mggmUbbBCSq7Fjas3OG/WcZuhf
         bORBJMBj4fBp7eX0jeJ2q3SiTBhbyAX+RUcsqHi0TnbQmobrsxltUVO4GcuMG745ln8K
         vFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLOEgQy+6fnYykIS57HacmY2euW9Rqx5gnDk9sWPE3o=;
        b=SY2CGrs6mrL+9Xr3frq2CjtUcdouDDeXiFscwVyA69yZt9MAM2O3/scWYanEyD4mE7
         33dW3kz73W7YTIsCBbpd9JnoiJc7LoOrbuAO8wwXXAu6VSrQIByI9ae6eMlfLQ6MVB6T
         d22e9okIPsRgjhpdpK2B4NymErJrkvx0Yf57rG2JlTGZk73ugXq97ueWfGRtp6ko3Q/D
         EuXhQ/M4YC9v8MSEE7vN/B3vwh8UabYLFNAp401U1mn7SPgF5iWeJjwzPWyIB/Fo455w
         Oa9dmGiQS0+b729ELGj20XFdrQYVK/+6eSmr5EUXcgYIIdsD2QqYIwgW1H95CDSNnFrU
         sGoA==
X-Gm-Message-State: AOAM5327c9DQD15tS2sc4coMzcqUjUoKoNdYzFyYyWzBARD+w1JaRoBs
        l3sg2cg5XsV/hnbuoL9oEBdXvKMup84=
X-Google-Smtp-Source: ABdhPJwhWAN27A+oReR/o+9UM+QyaKv2W+gvqUCQFSTn1tBteihZLvqm2spcIWz95bJ/ZNRNe7sKMA==
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr15039180wrx.436.1643587146282;
        Sun, 30 Jan 2022 15:59:06 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:05 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 0/6] Introduce ancillary links
Date:   Sun, 30 Jan 2022 23:58:15 +0000
Message-Id: <20220130235821.48076-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

At present there's no means in the kernel of describing the supporting
relationship between subdevices that work together to form an effective single
unit - the type example in this case being a camera sensor and its
corresponding vcm. To attempt to solve that, this series adds a new type of
media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
struct media_entity.

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

Series-level changes since v1:

	- New patch adding some documentation to the uAPI pages.

Dan

Daniel Scally (6):
  media: entity: Skip non-data links in graph iteration
  media: media.h: Add new media link type
  media: docs: Add entries documenting ancillary links
  media: entity: Add link_type_name() helper
  media: entity: Add support for ancillary links
  media: v4l2-async: Create links during v4l2_async_match_notify()

 .../media/mediactl/media-controller-model.rst |  6 ++
 .../media/mediactl/media-types.rst            |  9 ++-
 drivers/media/mc/mc-entity.c                  | 46 ++++++++++++++-
 drivers/media/v4l2-core/v4l2-async.c          | 56 +++++++++++++++++++
 include/media/media-entity.h                  | 21 +++++++
 include/uapi/linux/media.h                    |  1 +
 6 files changed, 135 insertions(+), 4 deletions(-)

-- 
2.25.1

