Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8D92E1078
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbgLVXFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727678AbgLVXFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:05:30 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197F6C0613D3
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:50 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a12so16630901wrv.8
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bxxupScKkQylTgnzT1jQfJoerVH6s89+gfUZG72kVPM=;
        b=MVCR6f45O68amRjy6JOuaNJmfDEGVnpIF2mDSapSMTbXpdqXspqepYxxp7vu4y+Smp
         jmQ5nKLR+4nIehdk7+SrYe5ugoypMzJI8rkzjR6zmVjSz4t4VBnNgoAuP6eNKVJOOsnc
         HU8aEtiHyHjERvWzODBiPYWn7h/TzVP9+ux/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bxxupScKkQylTgnzT1jQfJoerVH6s89+gfUZG72kVPM=;
        b=ZYaldiHwDpb357G5/mcY20evLrPxv+5efk1/LXsHmFzU+nvHsAiEaZPLbKMeKlpyT4
         98K+So7D2qr3cXqzjELRyZAcD2xRb3L4THeLk9kM7K4O8bsQkEp6awvDR1Fqle8DiU6s
         gKVv9l6FtMQbKeq3Xa7IztldDKuPqSXPKRxqAzsC9Fc3teTXD07uoZ35af9FgB2a1Why
         wui0ekHgRlGbw8xCaRCJv/gNfbWzyuKrt/N/K0jRqROj0A7HmRRtgVjo3PRmjDqrgZmT
         rkuldrg/9RcWUriz+g7uLkefLRjGHOc3zPG6ZEAbru+BwzP4USNO3DbNoH6bFsbFvmU0
         dGcA==
X-Gm-Message-State: AOAM532IYxfR41QzfXP0Tmx36ZrLlxxP3SfM5lUpqU18jctUge6DCQrs
        XQDVYhHgZ5Y4g4oI2H7D3OjdOg==
X-Google-Smtp-Source: ABdhPJzPAAf/t30zcDZA03v+hjXJLfzNdOs2DTGTT2VPaETefMMFTTxqII3if/q2O/QNd9B9/JYaCg==
X-Received: by 2002:adf:f10f:: with SMTP id r15mr26982951wro.302.1608678288761;
        Tue, 22 Dec 2020 15:04:48 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:48 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 00/11] Show privacy_gpio as a v4l2_ctrl
Date:   Wed, 23 Dec 2020 00:04:35 +0100
Message-Id: <20201222230446.1027916-1-ribalda@chromium.org>
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

Ricardo Ribalda (11):
  media: uvcvideo: Move guid to entity
  media: uvcvideo: Allow extra entities
  media: uvcvideo: Allow entities with no pads
  media: uvcvideo: Add uvc_ctrl_status_event_direct
  media: uvcvideo: Allow entity-defined get_info and get_cur
  media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
  media: uvcvideo: Add Privacy control based on EXT_GPIO
  media: uvcvideo: Implement UVC_QUIRK_PRIVACY_DURING_STREAM
  media: uvcvideo: Use dev_ printk aliases
  media: uvcvideo: New macro uvc_trace_cont
  media: uvcvideo: use dev_printk() for uvc_trace()

 drivers/media/usb/uvc/uvc_ctrl.c   | 184 +++++----
 drivers/media/usb/uvc/uvc_driver.c | 603 +++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_entity.c |  11 +-
 drivers/media/usb/uvc/uvc_isight.c |  16 +-
 drivers/media/usb/uvc/uvc_queue.c  |   9 +-
 drivers/media/usb/uvc/uvc_status.c |  32 +-
 drivers/media/usb/uvc/uvc_v4l2.c   |  53 ++-
 drivers/media/usb/uvc/uvc_video.c  | 147 ++++---
 drivers/media/usb/uvc/uvcvideo.h   |  76 +++-
 9 files changed, 727 insertions(+), 404 deletions(-)

-- 
2.29.2.729.g45daf8777d-goog

