Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 463D247658
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfFPSXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:06 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44645 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfFPSXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so7090887ljc.11
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kDoWzmzEfZj2kAiBOxsvQhkpp1+4VO/c18hxEkturXk=;
        b=eYaPxlWTAy7CB0eOLKM0qoglr8mYbLjvqvuKOW1qQlL6HtrkZ88Z4xXf5UUEhKvgGl
         tu7XRVr1Ig7f/Te7ZKLdkN98JnJkjfmxq7mVSuVhT4ExxRWb4mpisY+Hq6A1pTdhxdJo
         aeIa70u3Ok0/USTZl8F0xQ8JXqkeHdTugf7T3NWPm6t7pzU4OfZ0AduvVxmw3+zKlggN
         VLKAIRbDp2JtDGMoyt8/s955pWX2hiDf5FiAMiExlCxorfkC8pc7QfJ/8uZe6BkLp+zx
         uDuOIygoiDwEm0YVOymJTY6vuP24JnZZibHCm7VIWYsj+1ua2vEP4d7jh2pb0hiMVlBm
         dlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kDoWzmzEfZj2kAiBOxsvQhkpp1+4VO/c18hxEkturXk=;
        b=jPx642yNbFs8gxbd9Ldtw3eco9TpmfEDtB4LeQegmQPQ6ql1G00rOQA17p5D3vQkgk
         5jcX1mMJ+h9JSc0gkiWdPQsCyfnM4nX6p11ZdvSpFrgCsBk2fzGq2ZXlnihObjSr2bzg
         gn1BsP4aloECKqctkgmi57piIEm47SoQvCyAlQ3R0VvR0PyR8zw8jhNczg4zsLoFfVzn
         DncX+amlRhm0PAsneEuWhZ/JFqRsRUh6qOUtdtt533OkQ6VFagbhyLwS/w3SEaH8FMg7
         /FU8706hOah549cH6G2cWSaFMx0Io+Xcd8Ibn+Na1f7afRADxiz0PrpIIKJ2MiPleYbV
         Fueg==
X-Gm-Message-State: APjAAAUm8vLK6qKNKnakNQJgr8h5Cq1vHe8KVcUVrRl/4ZVSFnxlhj7t
        8LhsLYvADZmsWSXdpsGAgP/XANLE
X-Google-Smtp-Source: APXvYqxIAhfmgQB0d+0SQdddLuCzliVFLbLuXt4HcNhJjA4E6uocsnsDXhTOWhhL3HVzkU7wx9IKSQ==
X-Received: by 2002:a2e:8802:: with SMTP id x2mr46651773ljh.200.1560709384065;
        Sun, 16 Jun 2019 11:23:04 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:03 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 0/9] media: vivid: add HDMI (dis)connect emulation
Date:   Sun, 16 Jun 2019 11:22:09 -0700
Message-Id: <20190616182218.37726-1-johan.korsnes@gmail.com>
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
drivers/media/platform/vivid/vivid-ctrls.c    | 105 ++++++++++++--
.../media/platform/vivid/vivid-kthread-cap.c  |   8 +-
drivers/media/platform/vivid/vivid-vbi-cap.c  |  16 +--
drivers/media/platform/vivid/vivid-vid-cap.c  | 130 ++++++++++++------
.../media/platform/vivid/vivid-vid-common.c   |   8 +-
drivers/media/platform/vivid/vivid-vid-out.c  |   6 +
9 files changed, 305 insertions(+), 125 deletions(-)


