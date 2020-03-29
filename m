Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22047197062
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgC2U72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:28 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:40487 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgC2U72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:28 -0400
Received: by mail-pl1-f180.google.com with SMTP id h11so5880798plk.7
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ci5S4VfxSeBgJz6ubD2FKWcDvQuosbtKi3C7PM4y9k4=;
        b=N+m6kSZeFZZ7tcsN62LKfkQMm53YkUyg8meXQUcxQr81h3znHhAWH3z2QuGyPgqVeH
         fXLQqin3nBWTNnYRIZYL4bcTEyXESXJezBK+ruAuVnnvs9VqfQ8en0ZckkElZ9Rx9BRr
         xiGncp7u4tFziCUHjgPy23fXCMwjrIP7x2oIvbpEXAztj5mdu1A1yB/7zXw7AaYDC2M6
         xpkbyU0b3x6GhkScvNEu+aiRzdokEzd1Yk+6DymVNme01DuEsO/G3fQjk+DyqpNRl8EA
         KBA8K6UIP7QuQ+M8p4MGC9bv6OCMbSW5BR7WLSAaaiXm/i89pcQaXVXBwI9PVsU+RobV
         qmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ci5S4VfxSeBgJz6ubD2FKWcDvQuosbtKi3C7PM4y9k4=;
        b=K/H7ZXsC9D4pyPEpe7XjX3uFwZWzGs2jCY/EcPUv3PdF1GPob9akNLrMyHHDPRTvnS
         v5h1LTZz8OXrYFBRluzrqNgT/hWgzkAT51y9EbdyrVKgaoxblR0wJE2veSoqcuhs5QlK
         MwBvUWqL9rG5noW2Y6Llcj96xVpVPNg4WZcxmxd/FStPAYwiDtmjXR3aDV4dJD0fho4y
         jX0N0aXRavAiTvIcoJvmHeZP0O0bQIYaEWa3IW7Lluwt6TzXwuwHd6dC5260Q9gjG37b
         6HVO0yfdS2tDIyBUMXBgxtirFm2k66B/2TQDqoJ5QPBBNJVUUvC8l2GzxhFXD/UqborG
         cSSg==
X-Gm-Message-State: ANhLgQ017T7XuE55Hex0tpSv+Dogb3ra1EYl2vInoM8JQctcaj8VlKYD
        WIQ6XXHUuj3WEyQPZk7t4+OA30nNRf0=
X-Google-Smtp-Source: ADFU+vtCLDzymHKf++7+lAA3OlXgFPNooBkYojEDvp4YoFIDUolwbWxKXomOuCim1FQGBVIYzozObQ==
X-Received: by 2002:a17:902:8492:: with SMTP id c18mr9972995plo.147.1585515566813;
        Sun, 29 Mar 2020 13:59:26 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:26 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 00/11] media: imx: Miscellaneous format-related cleanups
Date:   Sun, 29 Mar 2020 13:59:09 -0700
Message-Id: <20200329205920.20118-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series picks up Laurent Pinchart's series:

[PATCH 0/8] media: imx: Miscalleanous format-related cleanups

with a merge of two patches from Philipp Zabel's series:

[PATCH 1/3] media: imx: enable V4L2_PIX_FMT_XBGR32, _BGRX32, and _RGBX32

with an additional patch at the end that splits up the find_enum_format()
functions into separate functions for in-memory fourcc codes and mbus
codes, as requested by Hans Verkuil in the series from Philipp.

History:

v4:
- Constify mbus arg to imx_media_mbus_fmt_to_ipu_image().
- Constify ipu_image arg to imx_media_ipu_image_to_mbus_fmt().
- Return -EINVAL in imx_media_ipu_image_to_mbus_fmt() if given
  image pixelformat does not have mbus codes.

v3:
- fixed derefencing a NULL cc->codes on return from imx_media_find_format()
  in several places.

v2:
- fixed a bug:
  "for (j=0; j < fmt->codes[j]; j++)" should be
  "for (j=0; fmt->codes[j]; j++)", in the mbus format enum functions.
  Caught by Laurent.
- move some local vars under the pixel_formats[] loop. Suggested by Laurent.
- decrement the index passed to the enum functions, instead of introducing
  a match_index local var. Suggested by Laurent.


Laurent Pinchart (7):
  media: imx: utils: Inline init_mbus_colorimetry() in its caller
  media: imx: utils: Handle Bayer format lookup through a selection flag
  media: imx: utils: Simplify IPU format lookup and enumeration
  media: imx: utils: Make imx_media_pixfmt handle variable number of
    codes
  media: imx: utils: Remove unneeded argument to (find|enum)_format()
  media: imx: utils: Rename format lookup and enumeration functions
  media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*

Philipp Zabel (2):
  media: imx: utils: fix and simplify pixel format enumeration
  media: imx: utils: fix media bus format enumeration

Steve Longerbeam (2):
  media: imx: utils: Constify ipu_image argument to
    imx_media_ipu_image_to_mbus_fmt()
  media: imx: utils: Split find|enum_format into fourcc and mbus
    functions

 drivers/staging/media/imx/imx-ic-prp.c        |  12 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  11 +-
 drivers/staging/media/imx/imx-media-capture.c |  24 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
 drivers/staging/media/imx/imx-media-csi.c     |  26 +-
 drivers/staging/media/imx/imx-media-utils.c   | 545 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
 drivers/staging/media/imx/imx-media.h         |  31 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  14 +-
 9 files changed, 315 insertions(+), 357 deletions(-)

-- 
2.17.1

