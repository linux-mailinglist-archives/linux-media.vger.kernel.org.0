Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49ECD2E1C99
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 14:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgLWNgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 08:36:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbgLWNgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 08:36:12 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E475C0613D6
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:32 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 190so5402020wmz.0
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xj6OmJsCRi+/nSFF99ojwxyR8UdFFK7nIZiW36FGx6w=;
        b=dwd53kQgekz8cwTSW1TheZUxeuVMqDtKXDhzEYQTsvNtYMWJhHD1qVlLP/HTJdj+6k
         dn3Y48l/FkzU+lf9zUBW+F4hQ1j8Br0ts9FJC8WKCPc90XomClM+kGUcvRHYsayMm6EB
         F3ZP0cnA0owtr13/7WVkmX66u9fB0qkMTBqz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xj6OmJsCRi+/nSFF99ojwxyR8UdFFK7nIZiW36FGx6w=;
        b=UlKGoOmfjbnGfY8jsVp3k82LBentUa+evHLzDEPGEGgSVHlFmXamglDAVp0u+SK5hK
         r+oerwVGzD/ZnZWLTeRdQ1XFkDmPa/7omG6UrPgA/AzAAm61EAV8AcGOlhd+sY5ERy0x
         4CycYjHUaZqEf4laHlwFXKyI7LnrAjZhP+o0YboNMfYcpp/FlkNm6s+goWfDQFVhtADX
         Nel7aA8e+P6w8h9BBKXnxcMTzBv1ZM751jqcyl8tus0Cn6dsahisXFu2m+fZiLeKsPjx
         TJbXgb5SWK4YZ/7+vrcJW/UGHm6GXGJz+n1h7/YjZRJK3RwaoowkHxIOAVGHagnvVSlm
         QFJw==
X-Gm-Message-State: AOAM533euc2FdjUeuRcrYmbJol0ikyfDDETEcaEKdDS1D/Hhui/+qse7
        GJF5cyBw7RGs39b1lUPdlXnrtjrMnw8bIYPKERM=
X-Google-Smtp-Source: ABdhPJwRnPvCNi6WrYB/oQP7ITPfqbnnX+d8iTODsyP+l2VgCpZSJGjTw8bC81Q81xvfIajX0yuANQ==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr26533986wma.60.1608730530684;
        Wed, 23 Dec 2020 05:35:30 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q143sm31572247wme.28.2020.12.23.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 05:35:30 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 00/12] Show privacy_gpio as a v4l2_ctrl
Date:   Wed, 23 Dec 2020 14:35:16 +0100
Message-Id: <20201223133528.55014-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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

The obvious way to show it to userspace is via the V4L2_CID_PRIVACY
control.

This patchset implement this functionality.

v7: Thanks to all the comments from Laurent, Sakari and Joe
  - New patch from Joe: Rename debug functions
  - Rename direct handler to sync/async handler
  - Only launch events with IRQ
  - Use mutex on the stream_quirk
  - CodeStyle, spaces are my friends

v6: Thanks to all the comments from Laurent!
  - Remove multiple async_ctrls from v5, it is not needed
  - Split event handling in two parts, so it can be triggered without wq
  - Save pointer to the privacy entity in the main structure
  - Handle the quirk in a different location to avoid races
  - CodeStyle

v5: Thanks to all the comments from Laurent!
  - Allow multiple async_ctrls
  - Use dev_dbg() for uvc_trace
  - Major redesing of "Implement UVC_EXT_GPIO_UNIT"
  - Major redesing of "Implement UVC_QUIRK_PRIVACY_DURING_STREAM"

v4: Implement UVC_QUIRK_PRIVACY_DURING_STREAM

v3: Thanks to all the comments from Joe Perches
  - Rework of printk macros

v2: Thanks to all the comments from Laurent!
  - move guid to unit
  - support entities with no pads
  - CodeStyle
  - Irq handling
  - pr_cont
  - new ids

Joe Perches (1):
  media: uvcvideo: Rename debug functions

Ricardo Ribalda (11):
  media: uvcvideo: Move guid to entity
  media: uvcvideo: Allow extra entities
  media: uvcvideo: Allow entities with no pads
  media: uvcvideo: Provide sync and async uvc_ctrl_status_event
  media: uvcvideo: Allow entity-defined get_info and get_cur
  media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
  media: uvcvideo: Add Privacy control based on EXT_GPIO
  media: uvcvideo: Use dev_ printk aliases
  media: uvcvideo: New macro uvc_trace_cont
  media: uvcvideo: use dev_printk() for uvc_trace()
  media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM

 drivers/media/usb/uvc/uvc_ctrl.c   | 179 +++++----
 drivers/media/usb/uvc/uvc_driver.c | 580 +++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_entity.c |  11 +-
 drivers/media/usb/uvc/uvc_isight.c |  17 +-
 drivers/media/usb/uvc/uvc_queue.c  |   9 +-
 drivers/media/usb/uvc/uvc_status.c |  44 +--
 drivers/media/usb/uvc/uvc_v4l2.c   |  48 +--
 drivers/media/usb/uvc/uvc_video.c  | 189 ++++++----
 drivers/media/usb/uvc/uvcvideo.h   | 105 ++++--
 9 files changed, 736 insertions(+), 446 deletions(-)

-- 
2.29.2.729.g45daf8777d-goog

