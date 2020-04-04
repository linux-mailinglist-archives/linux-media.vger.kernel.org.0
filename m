Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE00319E7E8
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgDDWlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:42 -0400
Received: from mail-pj1-f54.google.com ([209.85.216.54]:40653 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgDDWll (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:41 -0400
Received: by mail-pj1-f54.google.com with SMTP id kx8so4728638pjb.5
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=h5fUms017wnpBJQkCC9/L2KjXS3Fny88GcFtQ1RMVag=;
        b=iIqyHc2eDX0chViKZNmk0I+By6qz+P7BtYtZN7Z4A5vCSmkJtEn5y0YuxGiOtSFmzS
         L51gW60dT/abDJzu496BQ7f/pR9c5uWETglQo053y9D07kIg8xHl25G5BW3eA10nQZKi
         QsyrQCP9cnjLGkYYaVLd1gJSbAaYZ+QgEkaHG75Xfawj3ysnXRJkgsPFrxgI5UM3QtuG
         sChYOLoDO9zzENfy24eccU1M3afnI7XR42ho/MDe4ufo9aOK1QXh8NMI2mfIRizQ3geY
         ru2QMYvn9Vwkyb3YE5EiyYwvhtEZWMPlG9C3HvzUTlMXd+6kR0/5Lf0r1EE+gwTSAf0M
         GMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=h5fUms017wnpBJQkCC9/L2KjXS3Fny88GcFtQ1RMVag=;
        b=Q6j3MSELUT79c2RZJcmun2PFVsQxQ5MwalFYob6Tugeo5kX7oJXQV+BG1Kt+v3AyJ8
         tJP+8Fflx+a4hpUYVJ+7+gYUrkQclFGTizYNsT6g/hGFeMF7qKxuTfcPgwL7+DhA1GlK
         vYVieiu5D0ZgS1B2n3QST3rV6XcNu27EVIa4Q6Aly33Ll9ydGiZf40+ykTRC72JotDxw
         WCRVDTa4p887huPRVOtiUEiv8VZiwSAPir77rgTy7N+fnVtImjAG4GcgRrPJ+CFtJmh9
         pB8DsvxLwOHiHwp7XwH2oo1c0xyHjpzfdvZRgxvcXpS9cQpreDNAarYfsC82hirki1tm
         sryQ==
X-Gm-Message-State: AGi0PuZX1Ma7nwIvum09jOJ3X4nR4qaE1PNAI6M4B18wjBFSaHaCJSbQ
        XI8n8ur87ISYB5pOAP7InU48G4aNWc0=
X-Google-Smtp-Source: APiQypJJn/M5MNYqqLvwstCPHcC5FMnkV8xNRZj0SVBfmjh9tXdpIJUOWqeD/u2qkBW5wc7dlPIg+Q==
X-Received: by 2002:a17:90a:4d43:: with SMTP id l3mr17015797pjh.165.1586040098298;
        Sat, 04 Apr 2020 15:41:38 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:37 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 00/11] media: imx: Miscellaneous format-related cleanups
Date:   Sat,  4 Apr 2020 15:41:19 -0700
Message-Id: <20200404224130.23118-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
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

v6:
- Moved the last patch, "Split find|enum_format into fourcc and mbus
  functions", up in the series, which makes the patches cleaner and
  reduces the patch count by 1.
- "if (sel_ipu && !fmt->ipufmt) ..." should be
  "if (sel_ipu != fmt->ipufmt) ...".

v5:
- Added a patch that renames the pixel format selection enums/flags.
- Added a patch that adds another format selection flag, to select
  the IPU-internal formats. This is an alternative to the previous
  patch "media: imx: utils: Simplify IPU format lookup and enumeration".
- Add comments for the struct imx_media_pixfmt members, with a
  warning that the codes pointer is NULL for the in-memory-only formats.

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


Laurent Pinchart (5):
  media: imx: utils: Inline init_mbus_colorimetry() in its caller
  media: imx: utils: Handle Bayer format lookup through a selection flag
  media: imx: utils: Make imx_media_pixfmt handle variable number of
    codes
  media: imx: utils: Rename format lookup and enumeration functions
  media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*

Philipp Zabel (2):
  media: imx: utils: fix and simplify pixel format enumeration
  media: imx: utils: fix media bus format enumeration

Steve Longerbeam (4):
  media: imx: utils: Rename pixel format selection enumeration
  media: imx: utils: Introduce PIXFMT_SEL_IPU
  media: imx: utils: Split find|enum_format into fourcc and mbus
    functions
  media: imx: utils: Constify ipu_image argument to
    imx_media_ipu_image_to_mbus_fmt()

 drivers/staging/media/imx/imx-ic-prp.c        |  13 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  13 +-
 drivers/staging/media/imx/imx-media-capture.c |  42 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
 drivers/staging/media/imx/imx-media-csi.c     |  42 +-
 drivers/staging/media/imx/imx-media-utils.c   | 526 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |  12 +-
 drivers/staging/media/imx/imx-media.h         |  45 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
 9 files changed, 327 insertions(+), 384 deletions(-)

-- 
2.17.1

