Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AF2473877
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242103AbhLMX3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241570AbhLMX3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:29:06 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089E5C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:06 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q3so29631172wru.5
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBpQi8cixIriWZXygdYGQQ2YRLpWurHN+imQRdozMOI=;
        b=kgXIMqdv2RWUG4WccPY1SWXsXCYKuJNgQKNeFLu0394mYclDC+Xv3f9jY7p8/tbzAv
         s55fud/z8Erfdh2VZPVCuPzvJua4XHkEIF+Uso8cjss33M+yzS+FPb+d5F4axRdMznaT
         CK/W0FS1Dbz7qYpKi7ExOv3vLHaYZFiOHYA2glKOq1O3ihrpf2XIoKTGIFR3tsIhso5M
         BA0gmooThwhosRdGYTftjBWCFgb8P88Gz92eRlkjCOG5Kzvmi98gvYweNAa90Os1jWk9
         JgvCDhDbnTP/nfHrBTH14acF+Ve/XJpuBsg2Tlt7iikZSRAuw7HiSxf3x0bt1RGDy14n
         LS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tBpQi8cixIriWZXygdYGQQ2YRLpWurHN+imQRdozMOI=;
        b=mMnieiiX7OMFPIXU0Zf4vR50eNCzxEIMIpFT+RG5KlKilGIjh4nW1u+qfAJ7b2Kwdf
         Ndm4Gf8yeC+eDOH4DAdd4YNTnpfdCtYdRvfF3RVUJrggEcF2UYuW6DCsIKoMWCDCrZk6
         eJusWm6c3kyPrxW5eTe3GxEvFY5+JjT2I1SIcV6n+lTzI1aAH/PDNT4GTTShKpTVVoq5
         h+UsF4f1mqCwM5+43asPYFWBvyMvNemmqq0tqSGEQQ0CBtrficbsvL+TUxyfAYjalbrh
         G6cs0UeHIiSoCflIXd9fiVuS8nPEu9L5RTW/htjvTCDEZmVW4IiEgbKbo5/SNF/VXzbL
         yK3w==
X-Gm-Message-State: AOAM530qI5wb99KvZ0qsSHtMeElIHsKe1Cw5wTLwOL7LjHnXiTXV9UKW
        uu/UQ2fLPxOaaroXXSvCXjUsLvh5iFc=
X-Google-Smtp-Source: ABdhPJxADSgDVQM2574ZSuDqBA+wHjAjUYG7xkxLWGEpVe2/nVa3wj8HXS0+CVx6tA/C7fB6BwzHCQ==
X-Received: by 2002:adf:a193:: with SMTP id u19mr1692722wru.563.1639438144603;
        Mon, 13 Dec 2021 15:29:04 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 38sm12551643wrc.1.2021.12.13.15.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:29:04 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH 0/5] Introduce ancillary links
Date:   Mon, 13 Dec 2021 23:28:44 +0000
Message-Id: <20211213232849.40071-1-djrscally@gmail.com>
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

Thoughts and comments very welcome 

Dan

Daniel Scally (5):
  media: media.h: Add new media link type
  media: entity: Add link_type() helper
  media: entity: Skip non-data links in graph iteration
  media: entity: Add support for ancillary links
  media: v4l2-async: Create links during v4l2_async_match_notify()

 drivers/media/mc/mc-entity.c         | 56 ++++++++++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-async.c | 51 +++++++++++++++++++++++++
 include/media/media-entity.h         | 29 ++++++++++++++
 include/uapi/linux/media.h           |  1 +
 4 files changed, 134 insertions(+), 3 deletions(-)

-- 
2.25.1

