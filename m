Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EBD196EF6
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgC2RkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:18 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:56169 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbgC2RkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:17 -0400
Received: by mail-pj1-f49.google.com with SMTP id fh8so1383988pjb.5
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BXbcs6LNWdWaEPsc6zJHbrgX/7I6uANOSBPjvu32Bk=;
        b=IKC/848AY34uBJ3gXkTUiU1eOCsXjjmAUj6h4f6w8g44/CMpSu18F2RsxDwlbQZrQg
         J1Ptw94k8hv51COO31DtkYc0hHhk1Dg919VF8lHNYFMfj94jAT7wnptA2Ilc2r3qAB5W
         AuAbInAuPtvGDcsz8xbVs7zk7CxHICBSk+50fSBqjPkKaRIZwsG2H6zhVJBBwGDIlk7A
         Z+R+t4N7Hpx6Y9CezoaOHtXh3IAAVeijLAlTF8jb32/W22sVDCa7cj7foJofcUBvmo7r
         zEVkoc0Rh1kPSmbtEPuzwBwOGDrSsO7HyY0FIepiErhz74bUl/CGAG6vvidA7F3wWQD+
         cmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BXbcs6LNWdWaEPsc6zJHbrgX/7I6uANOSBPjvu32Bk=;
        b=C3/+aDHdi932AHMOI/tKENUBxoM7gTY/AnqZN+QTGVkjJ6G6OceH1CtuD21Z5mH1yH
         FL/vEVJXcdrMIU1D4JuOXtGCLWs30JJMCCrvkkNaLsl9GvszZNJcjIpGrtIXAxeJJI9u
         Wq/qadn1jy69dDWoB/Q+YytJIT73JC1KvAkK2s6Wm7wbMTBmwRVRDi2TyuhMb6xhhq0m
         hiLI6IpDn1SJOauSkaeK0/dTtJIL1M/VRy1tV3S/kHvaN6UwFDFBZPHiw88FKNjGxjM8
         Asws/EV6RQW3D4XqBYwxF4x+W36lSuwKKJNsc2zuS7zBnv0vb0NCZVpEPBi+AY6+RjzN
         BgeA==
X-Gm-Message-State: ANhLgQ29ngW5llsY1O9OnNf9usSlNTznWWaNacjO2LWfrqbeEL0lzZts
        vmhH5D4rsnIUkdPlhwmhCQ+e2uRxkgE=
X-Google-Smtp-Source: ADFU+vshYq9RNjKHc3ir6qt7XBeZ4UeW6dFoRwDKR0OqYfjawlvXXYXuYoEI7Yxp1pszrjA4gvSIQQ==
X-Received: by 2002:a17:902:aa84:: with SMTP id d4mr9295184plr.158.1585503616388;
        Sun, 29 Mar 2020 10:40:16 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:15 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 00/10]  media: imx: Miscellaneous format-related cleanups
Date:   Sun, 29 Mar 2020 10:40:00 -0700
Message-Id: <20200329174010.12304-1-slongerbeam@gmail.com>
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
  media: imx: utils: Constify mbus argument to
    imx_media_mbus_fmt_to_pix_fmt

Philipp Zabel (2):
  media: imx: utils: fix and simplify pixel format enumeration
  media: imx: utils: fix media bus format enumeration

Steve Longerbeam (1):
  media: imx: utils: Split find|enum_format into fourcc and mbus
    functions

 drivers/staging/media/imx/imx-ic-prp.c        |  12 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  11 +-
 drivers/staging/media/imx/imx-media-capture.c |  24 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
 drivers/staging/media/imx/imx-media-csi.c     |  26 +-
 drivers/staging/media/imx/imx-media-utils.c   | 542 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
 drivers/staging/media/imx/imx-media.h         |  27 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  14 +-
 9 files changed, 312 insertions(+), 353 deletions(-)

-- 
2.17.1

