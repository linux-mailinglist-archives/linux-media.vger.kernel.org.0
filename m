Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3755424F5F
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 10:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhJGIkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 04:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhJGIkT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Oct 2021 04:40:19 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4121BC061746
        for <linux-media@vger.kernel.org>; Thu,  7 Oct 2021 01:38:25 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 784911B00188
        for <linux-media@vger.kernel.org>; Thu,  7 Oct 2021 11:38:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1633595899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2PZ70emEU5MBuCW67XL9iWPUlVET0/dCB2A5gS5XxQQ=;
        b=kjKvxK/K0/hy+3Rn3wvp4/YrJlTMX9Ui7CXLloeffM+zsccrGTYbvDn5UMVTfDybMicFU7
        d2Nc6sLoa4MePQbw9Izfio1piRCS4nxBDJdMsFG/6ljovstzpi0et0br/ZpLx1t6vRk3Qd
        1s9AURhuvhj9hElPRR1oxmrPeHhYEZzoAbQYrF940xmEAchj8TXmV4iZ7BpGvgS5pFHC+t
        PWcbhWSvXMPYuWDdR+oIBrUg3+hQ30l0UC3mks0IxQW1oywUg5nuFG7VcJUO+j4QchS7Hg
        HafGLrrTTofTdPanOEgYiZd0gIbCqWNS9Rr8QyFGAOTmTie5Ank7QQzpaYhLGg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1962F634C90
        for <linux-media@vger.kernel.org>; Thu,  7 Oct 2021 11:38:19 +0300 (EEST)
Date:   Thu, 7 Oct 2021 11:38:18 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.16] Camera sensor and IPU3 driver patches
Message-ID: <YV6x+qscgN5/pcaY@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1633595899; a=rsa-sha256;
        cv=none;
        b=dWRbUBx6EHpEpQD1u1djSrEDQU/Ie1maAg7+q/R0b+fzymSzYiHHtl0/iVBk7CIbQS8onm
        TCgObj9oPUYgMLwRvEPYzM5esOZ5A4wsdX4CsTGcZ+Z/Yy1R6Ux1FZgokZUQnW/VoGVAgX
        GHq2hvqnCl5ZtithlAVhhtbxprvWT4f5MlbGyLpuT2nxa9R/TeRDIBc67q/8aI75WvRgmM
        zkgyluJDX3FPme04JgiV2kk9dXzhj9dJz307NjRKggckiCUsM1omMjhf3G9C0aUuecYoVw
        mt7OEpBUZLK0BlFJbblz7dbxbZ2u2Q8N0AohnjsoSaQB/wj1OI3OSgOAqg9UJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1633595899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2PZ70emEU5MBuCW67XL9iWPUlVET0/dCB2A5gS5XxQQ=;
        b=J0TsfD0U0dZ7eE3CiGUJoIxfUZPEu/g6ayuAEqi3i7PaWmnb/F32tFLEF4DuZ9tQOZFblT
        fvWcNhrFcB/CMyrc94EoEww6KsbIhjsNQGH+giHOq1mp4hWt9rGI91gidjuY+AwhgLd8nx
        vNYG4wRe7gyBA6n7VsLOMtWAwDzxVlXCOLwTJX7uI8apEoaVYWqm/xKRhN2a5rglNp1Kbf
        yajL6JYfenVfAejTbSVDfcF4r5cq6A4qxOR9crEDICkIRQAB6Tj5jUIR6GeZPcUWGgA+H7
        pAO+bynsLvCyYJEreENTNQ+XxNhNEjlFxYBBQwYzKXC6BPAxYQMFpRYZrw6rmw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of camera sensor, rcar and IPU3 driver patches. In particular,
support for SK Hynix Hi-846 driver by Martin Kepplinger and rcar-isp by
Niklas are included.

Please pull.


The following changes since commit 4114978dcd24e72415276bba60ff4ff355970bbc:

  media: ir_toy: prevent device from hanging during transmit (2021-09-30 10:10:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.16-1-signed

for you to fetch changes up to 461793c165bfad3713ba871cc39c680d17cd1a67:

  media: ov5670: Add implementation for events (2021-10-07 01:39:27 +0300)

----------------------------------------------------------------
V4L2 patches for 5.16

----------------------------------------------------------------
Fabian Wüthrich (1):
      ipu3-cio2: Parse sensor orientation and rotation

Martin Kepplinger (4):
      dt-bindings: vendor-prefixes: Add SK Hynix Inc.
      dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pixel sensor
      media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera
      Documentation: i2c-cardlist: add the Hynix hi846 sensor

Niklas Söderlund (1):
      media: rcar-isp: Add Renesas R-Car Image Signal Processor driver

Ricardo Ribalda (8):
      media: ipu3-cio2 Check num_planes and sizes in queue_setup
      media: ipu3-imgu: Refactor bytesperpixel calculation
      media: ipu3-imgu: Set valid initial format
      media: ipu3-imgu: imgu_fmt: Handle properly try
      media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
      media: dw9714: Add implementation for events
      media: ov13858: Add implementation for events
      media: ov5670: Add implementation for events

Rikard Falkeborn (1):
      media: staging/intel-ipu3: Constify static struct v4l2_subdev_internal_ops

Sakari Ailus (1):
      media: admin-guide: Update i2c-cardlist

 Documentation/admin-guide/media/i2c-cardlist.rst   |    8 +-
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |  120 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/dw9714.c                         |   14 +-
 drivers/media/i2c/hi846.c                          | 2190 ++++++++++++++++++++
 drivers/media/i2c/ov13858.c                        |   11 +-
 drivers/media/i2c/ov5670.c                         |   11 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |   60 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.h         |    9 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |    8 +-
 drivers/media/platform/Kconfig                     |   16 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/rcar-isp.c                  |  515 +++++
 drivers/staging/media/ipu3/ipu3-css.c              |   19 +-
 drivers/staging/media/ipu3/ipu3-css.h              |    1 -
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   13 +-
 drivers/staging/media/ipu3/ipu3.h                  |   12 +
 20 files changed, 2997 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
 create mode 100644 drivers/media/i2c/hi846.c
 create mode 100644 drivers/media/platform/rcar-isp.c

-- 
Sakari Ailus
