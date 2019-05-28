Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70BC2CBA9
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfE1QTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:45 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:42712 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1QTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:45 -0400
Received: by mail-ed1-f47.google.com with SMTP id g24so4681569eds.9
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=oFmnIQV+QxgU1Tn8914ynnNHesr2pnNWjmNrkwm6kr8=;
        b=P/XvfrKMNYbsBJe7Z79OxZM7pYgpGzSr5o7PchUfT7SXpbEV5zapftyZHlERyKfHjW
         bQKVmyt32fwuEvGfiky/S225TcMpC0sArfvJzc9+jvmvxwqr8eIHPQvvRjcO46hVvtJB
         9Z+FMFsOlqb/GCAqKy1vyjkmsCj8mmXAZbQfpdXtPbf5jlCJbKxawbshdgM8/ZxUznhd
         VNhCXasP2HK6kMhoTuM1rwi9VCX6W0lfPpo427FQM/SDjRRh3qsUmFQXFFcOLr5vptoj
         ab1tf29MHnCrQ5mjYFPlrKYmy5iVNEqe+zUONoyl4Nf+1d8vWwb+V39+scDhf/13aiBv
         LK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=oFmnIQV+QxgU1Tn8914ynnNHesr2pnNWjmNrkwm6kr8=;
        b=fpsVOE0vKC+4Yu+RgZWtuwxxRyaFZRGPqTSFvAMGnIxa9QOeGq3OVhgrGbrKfhVbCp
         h1rCK9iAX8FI3k2nLJjmhpa9rdcIl+pIlJ8kqRWTs08w1hdWoHPMhwY8KGoKeG55Uwnz
         mmlBmN2MMktyYGISMpmuKU+F5U1saBwS7yANp482Es9qzo3cFr6AxgwBrLvUPbyWHl9h
         B9syVUEZH28hT2amD3mh15ajVmsBjs4tVdYb7OIkCiXxVZDequ5XhhGMs/C/fHND7/2x
         3dW225OmfVuq2Pcv8tD9fghdj87xGhprOEFWCzEJAWLLmmH7x/zJcnB/Kg1mrG17hCPR
         vPWQ==
X-Gm-Message-State: APjAAAUPpnKmCpmrnSedWTeWX4Oj3SEPHdSiCs6QeFgrLlLGzALvlmOE
        7ukmXokDG2zM/TehmK4QfclNW3SnPMU=
X-Google-Smtp-Source: APXvYqwO4q7ZcyfZ9BB70YpZNU1XeYIT3H6TN5ugMg9AaOAhVT2MM7HJmm5FyzC0OC1F0I+26AW3wA==
X-Received: by 2002:a50:a5ed:: with SMTP id b42mr128350266edc.178.1559060383828;
        Tue, 28 May 2019 09:19:43 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:43 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Subject: vivid: Add HDMI (dis)connect emulation
Date:   Tue, 28 May 2019 10:19:04 -0700
Message-Id: <20190528171912.3688-1-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series makes vivid V4L2-compliant* by adding HDMI (dis)-
connect emulation. This is done by by adding a custom display_present
control to vivid output HDMI devices, along with the following standard
controls:

-ctrl_tx_edid_present
-ctrl_tx_hotplug
-ctrl_tx_rxsense
-ctrl_rx_power_present

* Fixes the following warning for HDMI input devices:
   -V4L2_CID_DV_RX_POWER_PRESENT not found for input n
  Fixes the following warnings for HDMI ouptut devices:
   -V4L2_CID_DV_TX_HOTPLUG not found for output n
   -V4L2_CID_DV_TX_EDID_PRESENT not found for output n

Johan Korsnes (8):
      media: vivid: make input dv_timings per-input
      media: vivid: make input std_signal per-input
      media: vivid: add display present control
      media: vivid: add number of HDMI ports to device state
      media: vivid: add HDMI (dis)connect TX emulation
      media: vivid: add HDMI (dis)connect RX emulation
      media: vivid: add CEC support to display present ctrl
      media: vivid.rst: describe display present control

Documentation/media/v4l-drivers/vivid.rst     |   5 +
drivers/media/platform/vivid/vivid-core.c     |  36 ++++--
drivers/media/platform/vivid/vivid-core.h     |  32 +++--
drivers/media/platform/vivid/vivid-ctrls.c    | 105 ++++++++++++++--
.../media/platform/vivid/vivid-kthread-cap.c  |   8 +-
drivers/media/platform/vivid/vivid-vbi-cap.c  |  16 +--
drivers/media/platform/vivid/vivid-vid-cap.c  | 119 +++++++++++-------
.../media/platform/vivid/vivid-vid-common.c   |   8 +-
drivers/media/platform/vivid/vivid-vid-out.c  |   6 +
9 files changed, 245 insertions(+), 90 deletions(-)


