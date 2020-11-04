Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB372A6C74
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbgKDSIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:08:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732220AbgKDSHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:49 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9422AC0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:47 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id y12so23063162wrp.6
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=00yDIMllqd/dhlfJcoib8aA1apSovUKmF4tHSgYMrU8=;
        b=HBRINmi/Jg/JTIsA9nTzVg3Q+PTWcEsRjort86K7ZnvxWx3WUXeGH53Rp4B8aXhYtN
         AzuVRYx4JuoAMwnsIAru6Hu247vjLabfUYayOZQJP9dRj9mJS20pDIglPVf0elbwMvdn
         yww+HW9Y7LlTxEM62LWul7GoiAS75LNmFsJak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=00yDIMllqd/dhlfJcoib8aA1apSovUKmF4tHSgYMrU8=;
        b=CNFCvHiBzL6h+NuIQKT855ykLmwttcRu8zb9PivcTfyg5Sd9OwDi6OfsTW8nGPmGzG
         KsYl0y36PQIvKNXPRtORL1rJSiJkrzXYNZ1IObXv+e1aaMGxiiBn/ecxyID8IivX0CxQ
         702ThBD9Cdp0FXLzHa9G5PbCMWCFrmIGbWQUItUGMqIOIPpZ+/5ibFKJTkhOr81nMaMd
         cDy8SBiffR65A+QejguN5AfxL4wWSUUhssMhgmCxjCC10L+wOFm+bPpG6blbxj7GBMQl
         CTLZ2OA8JoL2Ooy2WT9B+prMnPXp5cjXH4z1IQ87seUglGc5dZQb9jg8QtQp9T86A8Ps
         lrXQ==
X-Gm-Message-State: AOAM532lS9N9boiDqGir2aWWjuKn5U0vnKcgMWM4OTQYChmjsuwpPzBP
        4AU8qY1ipIjt54PgL075Mospdw==
X-Google-Smtp-Source: ABdhPJzkDuUYL/UU4eilQX7p0NAwDH5Dir5eZJxRYuT8aYI214lUtpeykKI466JmBbJP8ve5pcIqQg==
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr33143405wru.199.1604513266119;
        Wed, 04 Nov 2020 10:07:46 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:45 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/7] Show privacy_gpio as a v4l2_ctrl
Date:   Wed,  4 Nov 2020 19:07:27 +0100
Message-Id: <20201104180734.286789-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices can implement a physical switch to disable the input of the
camera on demand. Think of it like an elegant privacy sticker.

The system can read the status of the privacy switch via a GPIO.

The ACPI table maps this GPIO to the USB device via _CRS and _DSD
descriptors, so the kernel can find it.

The userspace applications need to know if the privacy pin is enabled
or not.

The obvious way to show it to userspace is via the V4L2_CID_PRIVACY control.

This patchset implement this functionality.

v2: Thanks to all the comments from Laurent!

- move guid to unit
- support entities with no pads
- CodeStyle
- Irq handling
- pr_cont
- new ids

Ricardo Ribalda (7):
  media: uvcvideo: Use pr_cont() macro
  media: uvcvideo: Move guid to entity
  media: uvcvideo: Allow external entities
  media: uvcvideo: Allow entities with no pads
  media: uvcvideo: Entity defined get_info and get_cur
  media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
  media: uvcvideo: Add Privacy control based on EXT_GPIO

 drivers/media/usb/uvc/uvc_ctrl.c   |  73 ++++++++-----
 drivers/media/usb/uvc/uvc_driver.c | 166 +++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h   |  19 +++-
 3 files changed, 207 insertions(+), 51 deletions(-)

-- 
2.29.1.341.ge80a0c044ae-goog

