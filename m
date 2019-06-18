Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8163C4953D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfFQWjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:20 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:45218 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQWjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:20 -0400
Received: by mail-lj1-f175.google.com with SMTP id m23so10940762lje.12
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOJW4OZ6HcRQ7BnMRKuqlT7fDpt92CWroJQ6GPCfF6Q=;
        b=fstsoOW97DHdgJqzpe/5hY0tBxvZOdPyJMfdoRwZAHYx5EdFwc9u4lZh1XvCLBMG8E
         EY4YX0yC7HcUlAi49cKLAUt0I68mO9q0how+WGLVHrLdPdPbkaLJQSPQMB2QtEJvBB+k
         AoDd51ASxoQoCQOSUMwieRBAeE9iwFQtygnWe+d4MA0EpAUFlg7/ThFqTlWdTWYw3LXs
         Hq8bOWNPzZdCrPaOqIWX18xxLQ28eg8mxYoTJASMO4hxm2E45qbjzR3ElfYqISYQvXpo
         pMsKOrdjGer8x06Sgfh8g5DIP40fliJyk0gjgQpcSKhnZJABd3fz8WPwv8K74iyijb4q
         xYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOJW4OZ6HcRQ7BnMRKuqlT7fDpt92CWroJQ6GPCfF6Q=;
        b=acmld0qD09+hd/+GquP6F9XIsafyAmXPaLHyAssCgVx3x9tz0+8dktRaeADGMh0MuK
         t1BY62L3+S0fHLoH/YOkVVBPzDlvTTH9pKcmA7/WAPk6SHVJoJoG42bngJrD/UZtetwJ
         pdRVKkoOYQF3I6RcZPvO5bUKzcuDGF2KGe+PPsz1PlgeOZRnzvNQZurH/6GP+qJgUZIt
         02iJUJ4/khCOt8FZNH/v7Van1ihfYIySBHgbucODhyS8mzHoSX7WazmDNjA8+jm6qvrE
         cwQLQyN+G3OEMLx0a8jtpjdCQpgvC68YJFQY76UOy7yFfHqd7GINAbjOBgMHAzuvHSH0
         UIRQ==
X-Gm-Message-State: APjAAAXAoQe5fj8bDydr8NwFIdTIqVAJvpdAix35AfnUlCJggU3JWGEo
        sqHmv1G525575BlZXt7nj1XZIShWWV0=
X-Google-Smtp-Source: APXvYqwCkNvu6C9WnT82XWGcu0gNrX0s8+JZnHni9J77GnKIbThzpN4mpIpE1tkAjxfRUGFR+uf93Q==
X-Received: by 2002:a2e:8613:: with SMTP id a19mr43135lji.163.1560811158249;
        Mon, 17 Jun 2019 15:39:18 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:17 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v3 0/9] media: vivid: add HDMI (dis)connect emulation
Date:   Tue, 18 Jun 2019 09:37:17 +0200
Message-Id: <20190618073726.61776-1-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series makes vivid V4L2-compliant by adding HDMI (dis)-
connect emulation. This is done by by adding a custom display_present
control to vivid output HDMI devices, along with the following standard
controls:

-ctrl_tx_edid_present
-ctrl_tx_hotplug
-ctrl_tx_rxsense
-ctrl_rx_power_present

With regard to v4l2-compliance:
Series fixes the following 1/1 warning for HDMI input devices:
   -V4L2_CID_DV_RX_POWER_PRESENT not found for input n
Series fixes the following 2/2 warnings for HDMI ouptut devices:
   -V4L2_CID_DV_TX_HOTPLUG not found for output n
   -V4L2_CID_DV_TX_EDID_PRESENT not found for output n

Regards,
Johan

v2 -> v3:
- Various checkpatch.pl fixes. There are still some warnings as I am
  not sure those really apply. Please let me know if they do, and I
  will fix them ASAP.
- PTR_ERR_OR_ZERO -> PTR_ERR where applicable
- Fix broken check for cec adapter not NULL

v1 -> v2:
- New patch: media: vivid: reorder CEC allocation and control set-up
- vidioc_s_edid: Use bitmask (not boolean) value for bitmask controls
- vidioc_g_edid: Changed dev->output to edid->pad

Johan Korsnes (9):
      media: vivid: make input dv_timings per-input
      media: vivid: make input std_signal per-input
      media: vivid: add display present control
      media: vivid: add number of HDMI ports to device state
      media: vivid: add HDMI (dis)connect TX emulation
      media: vivid: add HDMI (dis)connect RX emulation
      media: vivid: reorder CEC allocation and control set-up
      media: vivid: add CEC support to display present ctrl
      media: vivid.rst: describe display present control

Documentation/media/v4l-drivers/vivid.rst     |   5 +
drivers/media/platform/vivid/vivid-core.c     | 120 ++++++++++------
drivers/media/platform/vivid/vivid-core.h     |  32 +++--
drivers/media/platform/vivid/vivid-ctrls.c    | 108 ++++++++++++--
.../media/platform/vivid/vivid-kthread-cap.c  |   8 +-
drivers/media/platform/vivid/vivid-vbi-cap.c  |  16 +--
drivers/media/platform/vivid/vivid-vid-cap.c  | 135 ++++++++++++------
.../media/platform/vivid/vivid-vid-common.c   |   8 +-
drivers/media/platform/vivid/vivid-vid-out.c  |   6 +
9 files changed, 312 insertions(+), 126 deletions(-)



