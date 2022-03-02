Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087904CB1AA
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbiCBWEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236829AbiCBWD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:03:59 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C731C9920
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:03:15 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id x15so4873008wru.13
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkCBctUs8JfByOI5AquYb2jZIIcNNXfx8mnbNeZyZnU=;
        b=WDQzRXrN85g6mwz3tIqkHAG0hcDYZVxyc8vF8+pXinCAuJsq9JLN2LQsQX/2TvPrrU
         EdY3KD+ZbezHtJGUgkQxkINCqnmkJV7OdJGGQWE69c+8AbzNGy1/fdgN9+UrCTL3YZs0
         nxvfwcLaGqWvmG+L4mKvhYWxYMqJdXiHVqFhoXBMymVd+u97UpS//iPRbBHfWUVgGwKr
         v7oFTeAJ3mluG6GU5pogXi9fu2LVKwyuIpl77Dwnoevef2Te3j/fdlQKhwd0imjxyQZb
         wO7Rmus9AtMWYzE7d1bGf/uI5iZ3ockcr0dGH6xt6hIEWPqVrSlBbhY/4nIZ21n991Zr
         e3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkCBctUs8JfByOI5AquYb2jZIIcNNXfx8mnbNeZyZnU=;
        b=zxr1PRJ9L75pCQekR+2jP0w6mttWRwaSc34+4kugn7LqWqiATRr5GxhZN05YZwlSjB
         +bM8hKQRXPGpo6BXJw5jfiQewZSymHmPiF2iAKpHNWy1hbAsv9QVm+EpQA5R3nfl8rti
         p/y06VoNWoENOWuHxsg6yRejEB4RCt5dsOSDh58huab1Bs/oGX/tTcpH1GuJVHVCaeSn
         rnR44OU4kQ3Wrz/GRMVP2Dtv/rd0XSK5E9kx4i66XDnjCb+Bp/lR6WuC+USbNHOWxsr8
         MpWffBzDYqkj3rzC4jvSstKAWV+tLJoDpUrMe/ITw4uVXf1gwuURnaOzfZpIsilvKBV9
         mBzA==
X-Gm-Message-State: AOAM5329bLE42UPVeYgDyhlITLKKZ8xBKlzEkTJ+daajI+NsRWdCxv2B
        kBzvA7aR9lf5PIJqVlP55OdaJn67FJIM7A==
X-Google-Smtp-Source: ABdhPJzDwjeA47SG87rvfvl42EjBHeb+TOX3Ic7MZOYrnT612yka5DFntyEpPAy7XKDifIvJDGNliA==
X-Received: by 2002:a5d:64ed:0:b0:1ef:e1e2:1fcb with SMTP id g13-20020a5d64ed000000b001efe1e21fcbmr11446154wri.37.1646258593772;
        Wed, 02 Mar 2022 14:03:13 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0033383cdeea1sm229258wmq.10.2022.03.02.14.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:03:13 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v3 0/5] Introduce ancillary links
Date:   Wed,  2 Mar 2022 22:02:59 +0000
Message-Id: <20220302220304.1327896-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
links. I haven't gone further than that yet, but I suspect we could cut down on
code elsewhere by, for example, also creating pad-to-pad links in the same place

Series level changes since v2:

  - Squashed #2 and #3

Series-level changes since v1:

	- New patch adding some documentation to the uAPI pages.

Dan


Daniel Scally (5):
  media: entity: Skip non-data links in graph iteration
  media: media.h: Add new media link type
  media: entity: Add link_type_name() helper
  media: entity: Add support for ancillary links
  media: v4l2-async: Create links during v4l2_async_match_notify()

 .../media/mediactl/media-controller-model.rst |  6 +++
 .../media/mediactl/media-types.rst            | 17 +++++--
 drivers/media/mc/mc-entity.c                  | 46 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-async.c          | 31 +++++++++++++
 include/media/media-entity.h                  | 19 ++++++++
 include/uapi/linux/media.h                    |  1 +
 6 files changed, 112 insertions(+), 8 deletions(-)

-- 
2.25.1

