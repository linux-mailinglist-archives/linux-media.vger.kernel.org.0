Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5EB102A9
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbfD3Wu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:50:29 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34287 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727636AbfD3Wu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:50:28 -0400
Received: by mail-pl1-f194.google.com with SMTP id ck18so3123493plb.1
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 15:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QFhlu/5HT1/6G6K3aUYiFkndkSDhSqqmX6rCfYgFkBY=;
        b=tYKuzmg/fsHWdg8/QCcQ4FFwYVdTfAYCMrBWUn3qN/0mldAJAL7zei4JoqdtngWTYI
         d9goBqInTSuAsc64k7Kz81Qm2xImPq50Y93I/bC7NhTXeRZvKlOUGYK0NQwLuS4vLGF4
         2Agois1KhsSvYE0xcH6AoQeZQu+CbyeBMdHOKp8owdcQlEFhNo0LRF6YwT+c7prZ1F1F
         iMl9kMEiSem6yxNAa5oBX74uAAkkXSFVJTTc+k/SWOtbdm3bDSssrPtASuBBMUMwsWff
         R4FpGI5/Ihth2PyBnp5K9CxfNQ/IHvUwrJP4WlHy7+sTzaQDkDubUXetof4Apzlxg+sf
         7J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QFhlu/5HT1/6G6K3aUYiFkndkSDhSqqmX6rCfYgFkBY=;
        b=cJEYnnqPBRsu6ue1BwfBd9bYs9Y8i/4TsWNDib0miNS8FfPG1SgFphrB+zjTOQsPQ3
         kZakjOscOwqqOAVLAyySdCaiD0TxJ2RBfD4Buioyu1PH3yQO4vXnHVY6JjHJR3PNc751
         bCN47YF5UsgTBGtWacRBcoR7lQyk1gI2/w60QCkeIoKAuKHfgyeWGvp8kZUV3sTdnTIE
         42+A+fSs7lZ/DrlZ9oEbdl9kMSrbxlVwqKR7gEbp6SPkG1z6oWoFEdDWTIhxCUMVcv3L
         z7ojUKfMrEh3WD5Dpb6o8eGaE9WtUoEhplAVw/Mu2/px9f1IlgEnwGNPvtYErnxRyeCX
         o6MA==
X-Gm-Message-State: APjAAAVAE6Pd8TLYPReTVySZEpOLEUd8u7cVehAKYgbWvLd5Zeh6RLuM
        OwDLrqaf7Gbeo5Nivqt8MORGu7NF
X-Google-Smtp-Source: APXvYqxbi5tU5f3z8QvfCOKHbuwGTu/fNZi3c1LBQOGY7iSlzPoJK176jiIjSE4GocfYQptqOY558Q==
X-Received: by 2002:a17:902:362:: with SMTP id 89mr70412767pld.172.1556664627227;
        Tue, 30 Apr 2019 15:50:27 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id l23sm9804654pgj.36.2019.04.30.15.50.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:50:26 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 0/8] Switch to sync registration for IPU subdevs
Date:   Tue, 30 Apr 2019 15:50:10 -0700
Message-Id: <20190430225018.30252-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to sync registration for the IPU internal sub-devices, re-organize
modules, and a few other miscellaneous cleanups.

History:
v3:
- A couple patches did not compile/link. All patches now build so the
  series is fully bisectable. No functional changes.
v2:
- Added a patch that improves the pipeline upstream/downstream search
  functions, which no longer require the media device.
- Add a patch to remove getting media device from v4l2_dev driver data.

Steve Longerbeam (8):
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
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
 drivers/staging/media/imx/imx-ic.h            |   6 +-
 drivers/staging/media/imx/imx-media-capture.c |  75 ++-
 drivers/staging/media/imx/imx-media-csi.c     |  45 +-
 .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
 drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
 drivers/staging/media/imx/imx-media-fim.c     |   9 -
 .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
 drivers/staging/media/imx/imx-media-of.c      |  41 +-
 drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
 drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
 drivers/staging/media/imx/imx-media.h         | 113 +++--
 drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
 16 files changed, 848 insertions(+), 1100 deletions(-)

-- 
2.17.1

