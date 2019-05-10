Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672521A4C4
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbfEJVuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:50:24 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46817 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbfEJVuY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:50:24 -0400
Received: by mail-pg1-f194.google.com with SMTP id t187so3596484pgb.13
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 14:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TDayI0CVvirZP7Nv9/UPdHfrcLTR2jRyulKGM2fr5Zg=;
        b=F68LXMSJMZ1j8wJcPSXscFNq6NqCmbgQu9Nt6Hpm+lMP/dM6aiggRWC+30MC4NIOk7
         9hPzmSnuI7EhoO6vpWs0FnlJmE5ofHfMQL9cstvNqZnVnxC2ijCElO0dSrn7NWGfKsjY
         CXjAy1tTA+bvZuWmUAF8zjYkZiQG5i7UxsbHodgncf2sJpzyCV98UOe4LFtgxSoSq9Bv
         1XQiudpOKreCh5tavn+4+IdyAE919kBxE2+1bzMoInaMzVvrx3Fi5mUBzugEV1HiVt6g
         Y85fL3ur1A5yQWqA1wVXG/yVC8lrNAElMiZpNDREA+KM7flnDjBvCItdg7iuFTmfNhP7
         aLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TDayI0CVvirZP7Nv9/UPdHfrcLTR2jRyulKGM2fr5Zg=;
        b=Xa3JfRlEAO0pfnv61D1FDncszNgmepDQxO1mRPgFdf+ROWAIWMG6DZgC4z56OmNsGL
         JbmbU4se9CH+BBxuTy0Gvocbyzk6FY7SgL/GtJICvJI3yFf697v8nflVCS5Oq3DrUYiF
         AB7BxvLFQ7IV0oTl7o/7pPKHNmlxazwjuBfDdqbhyTkNxgGuxLpOmqzJTBJFKhIogqxL
         788aD9091KXaZXq3p82CHnU7Ans1LA4HwT7SlkmiBt4gU94ELNagi03QdrVkFRgVwhbh
         QRLFEi05q1xtOTDg/gjyPNDmnwx4ZkD5KbG8iAl8KfWEGJ9Wdlal1pENLUQrk6htr+RC
         mttw==
X-Gm-Message-State: APjAAAUmfbRiW2FpxTCepgpcEM2rSKVUGSR3KVu2jxMbw21xDrJbyl1y
        i0KJACbqGiMHlaaLrP9SwNyNCBMH
X-Google-Smtp-Source: APXvYqzgVjW0woQWj5Say1+eMykYy7fWOY1KA0KFTYtkrfcFYnM1IPS+q0nG2vLqPfDEe2bGw7Oziw==
X-Received: by 2002:a63:b901:: with SMTP id z1mr6204550pge.102.1557525022971;
        Fri, 10 May 2019 14:50:22 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e14sm1524108pff.60.2019.05.10.14.50.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 14:50:21 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 0/9]  Switch to sync registration for IPU subdevs
Date:   Fri, 10 May 2019 14:50:03 -0700
Message-Id: <20190510215012.13881-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to sync registration for the IPU internal sub-devices, re-organize
modules, and a few other miscellaneous cleanups.

History:
v5:
- Revert commit 16204b8a1c1a ("media: staging/imx: add media device to
  capture register").
v4:
- Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
  instead of calling ipu_pixelformat_to_colorspace().
- Add error message if capture format validation failed.
v3:
- A couple patches did not compile/link. All patches now build so the
  series is fully bisectable. No functional changes.
v2:
- Added a patch that improves the pipeline upstream/downstream search
  functions, which no longer require the media device.
- Add a patch to remove getting media device from v4l2_dev driver data.


Steve Longerbeam (9):
  Revert "media: staging/imx: add media device to capture register"
  media: staging/imx: Switch to sync registration for IPU subdevs
  media: staging/imx: Pass device to alloc/free_dma_buf
  media: staging/imx: Move add_video_device into capture_device_register
  Revert "media: imx: Set capture compose rectangle in
    capture_device_set_format"
  media: staging/imx: Remove capture_device_set_format
  media: staging/imx: Re-organize modules
  media: staging/imx: Improve pipeline searching
  media: staging/imx: Don't set driver data for v4l2_dev

 drivers/staging/media/imx/Makefile            |  18 +-
 drivers/staging/media/imx/imx-ic-common.c     |  68 +--
 drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  90 ++--
 drivers/staging/media/imx/imx-ic.h            |   6 +-
 drivers/staging/media/imx/imx-media-capture.c |  94 ++--
 drivers/staging/media/imx/imx-media-csi.c     |  47 +-
 .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
 drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
 drivers/staging/media/imx/imx-media-fim.c     |   9 -
 .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
 drivers/staging/media/imx/imx-media-of.c      |  41 +-
 drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
 drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
 drivers/staging/media/imx/imx-media.h         | 116 +++--
 drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
 16 files changed, 862 insertions(+), 1112 deletions(-)

-- 
2.17.1

