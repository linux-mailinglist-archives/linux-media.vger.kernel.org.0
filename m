Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5842135B4
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 00:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfECWnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 18:43:35 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46842 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbfECWnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 18:43:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id n2so3367598pgg.13
        for <linux-media@vger.kernel.org>; Fri, 03 May 2019 15:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YTxb+AUQfvDbK/mf1ARE21Esut2lbyiCwuhalQCsvr0=;
        b=UzsOMahcyBx9jhIoDo4240WN+j0rAftAaVMGugFWvrRreJrB26SnSZQRsPlG5u5r8v
         XTHs7b2JCDN38wnGP2y1ECq/RysQ+5ckYWjqB6mZNEVHZR6H3iAZArTWyjQlZ2afM/nO
         bywmC3xn0YReLUrA70KkatnB9EHoqqL6NRzaquzLoh0USFxObeHxYgwvVlBLYNk5dF13
         2HfYWapB34xBhNntSoSMfLX0TZuwXtP6uQQyQscO/2E+Iarvy+wIInOIF4n5Ixg0Qutd
         D0zEHkj2Oebe2SdOhwO2QZVP/frh21YKuc9oj4rg8XGsNSpRbK3wwu7Fbv11B6TsLIeQ
         CQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YTxb+AUQfvDbK/mf1ARE21Esut2lbyiCwuhalQCsvr0=;
        b=KX4WVLZjqFxJ1JNo0zbVXAq5EH5y15RRn6DKoYOaAFPuV0F4PzWaqi38sAaTF/4hJt
         KlXchE2oax7hff9CY7KB87NFpVw2Qat9SMLGSBnzbvjQgUVVOGMJKNYwQTHzotJ0p1hE
         x0PMmroQCUujOV+i4F815ITCsHEKMzPYKVUrgrVLrfQrn2ShGVIaoxgojU1HtoAcc04A
         RRjycoX4n8VnDypmo8AFSWUCrCmnTHz0yZaBTFSjn1htkaS+paqU+5Wb/VYQXT8zCoVr
         fVCqTyEHgXCmGPG6/SSJfFVrO1Fk8sS3LW/T5kljvfPEK0bVhcZmltd1t5b0FowZYjD8
         0kew==
X-Gm-Message-State: APjAAAWRVhOXuahXSyPdEukKFfFVXcAtXJDtMnzi7Y2X+9Zx5QYYNFdW
        Dfx5ao8JmOOPvC4vzmM0m/HBZF/B
X-Google-Smtp-Source: APXvYqyJNdlB5L+mAML8fPc11pNWYXQl8FKfCOhE4btzj2fAl7hooHfpDhGBYHBxAuQO95xlLZg1GQ==
X-Received: by 2002:a62:575b:: with SMTP id l88mr14525485pfb.143.1556923413695;
        Fri, 03 May 2019 15:43:33 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e62sm4793871pfa.50.2019.05.03.15.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 15:43:32 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
Date:   Fri,  3 May 2019 15:43:18 -0700
Message-Id: <20190503224326.21039-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to sync registration for the IPU internal sub-devices, re-organize
modules, and a few other miscellaneous cleanups.

History:
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
 drivers/staging/media/imx/imx-media-capture.c |  90 ++--
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
 16 files changed, 857 insertions(+), 1106 deletions(-)

-- 
2.17.1

