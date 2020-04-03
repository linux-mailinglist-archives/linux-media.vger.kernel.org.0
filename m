Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21A9219DFEB
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgDCU6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:58:47 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:35042 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgDCU6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:58:47 -0400
Received: by mail-pg1-f176.google.com with SMTP id k5so4145316pga.2
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etDqRTNKmAS47LS6A796aB6CsEdqqD3OZHIZxuXb7NE=;
        b=BvUW029fvYTXL8a7Ig2R1IT8It5sYC1WNmAHIFq15nyq45seLgv1SsVRAJ7KeHcfVM
         z7naOEZqw5AASHQHwqDdG47RctklRcfj1n3mNKba/q9tu6OoAMIo0T8pi6xTsHSCh/6K
         7xwY88GUV8fGMgWeyRcDJUV+Gx19Pfk7A6kpREn80+OyHPvtZGC0KmsArogTGktbQ3qk
         mRBh/sMlYUqY9uhY4RFW0GE/XNk/J401V+ifcji+k1Vu8/ROVFHqd8/FAvXVWK2d5QrF
         yszHJv5gv16+9etKxPXXpMtzdpDX/NC4Aav0TmwMDMQx9a1Mx/cLvBgQ/eIM5lbWdEIt
         W6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etDqRTNKmAS47LS6A796aB6CsEdqqD3OZHIZxuXb7NE=;
        b=QGfysDRQPqgYTNyQZD2j1rjPMbSVyZLF38g5QA8yZofPg3HcxbcKEF6t++yEhIKA8/
         n6WPYAcsMdqgh64KZqdmAtVbuTRV89MRpINy6zfkOW0NxoAwWeJBY5oSsdxNdbfK+Sgv
         fPFc1kTcw5n7UlbrLg/yHE+zqpTOM6Aw706aYDjdmS0P2PLopVOnS4t6pqFPAlHLSqEd
         sN5jaFnnmaZHDY1yvelGDLHQ/jUYsUzgqNN25K8M1Jo2c36k3+jTWnqRICS7lbhj2nc9
         Uj8G4HPYAf81pC6mmZlK1UxQfCse4Otp03Z+CEXuo6I7ensM5YfjYwgG4CTVsvL01ToD
         mpOQ==
X-Gm-Message-State: AGi0PuYSoISymsHOM2dkT9EkRBvPybc72b8cfAH3rCfHwe6u/5pjYxSW
        SAiX4tpndipKziiI/ZEVZu+nwKw+VlM=
X-Google-Smtp-Source: APiQypK+okogSZGDxr7R3qgcqV9SYLG+ZgDOktfGlryDbtaQCAgPnWIt4kf2qpwVePtqpdsk5bN4ug==
X-Received: by 2002:a63:5d60:: with SMTP id o32mr9605828pgm.126.1585947525604;
        Fri, 03 Apr 2020 13:58:45 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:44 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 00/12] media: imx: Miscellaneous format-related cleanups
Date:   Fri,  3 Apr 2020 13:58:27 -0700
Message-Id: <20200403205839.4531-1-slongerbeam@gmail.com>
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


Laurent Pinchart (6):
  media: imx: utils: Inline init_mbus_colorimetry() in its caller
  media: imx: utils: Handle Bayer format lookup through a selection flag
  media: imx: utils: Make imx_media_pixfmt handle variable number of
    codes
  media: imx: utils: Remove unneeded argument to (find|enum)_format()
  media: imx: utils: Rename format lookup and enumeration functions
  media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*

Philipp Zabel (2):
  media: imx: utils: fix and simplify pixel format enumeration
  media: imx: utils: fix media bus format enumeration

Steve Longerbeam (4):
  media: imx: utils: Rename pixel format selection enumeration
  media: imx: utils: Introduce PIXFMT_SEL_IPU
  media: imx: utils: Constify ipu_image argument to
    imx_media_ipu_image_to_mbus_fmt()
  media: imx: utils: Split find|enum_format into fourcc and mbus
    functions

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

