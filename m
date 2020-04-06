Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB2F19FA3C
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgDFQjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:16 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:33266 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728962AbgDFQjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:15 -0400
Received: by mail-pf1-f171.google.com with SMTP id c138so7817429pfc.0
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=t4gTWiuERv1Fkk5u323/RQ3kwscLNdEOQMPuvW/oE0E=;
        b=Ge3qYqPQgRdRI3+VY6Ei3lwUz9wGNEIHiBuB1Q42JwWUqhF4T4xe5LYelkmtm5wmmY
         FnJxwZTmWsFEevAvt21vyfzfBPwMPgiEdyWouQh7TgmUIc8EHFR9hGb6ZYJGHe/0g9ib
         Vai8u+2sWIyXtz2bn/2DZdIyYrslTVY0gxWnyQNuv84ZK9FWXYrCFdDP7GjA0wuzMCim
         82cNnwUNSgoovLnBgq6Ph/7q0v9qWQcX31BHRYb3r3vOEkjq8t2k72OwbYASDUE2Nnnu
         K/TKwDPEs02aBShDJxwBKdOSkyPaGGJvkif8VQt5JDuXsOin8PJ37XNMEDAmM1HtlisG
         w7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=t4gTWiuERv1Fkk5u323/RQ3kwscLNdEOQMPuvW/oE0E=;
        b=MfckOe7Eh+ETbobK2qvcYsg2Vu4XvHshI01U+gTA+ctn1/Vs89gv6MZM51JK80t2M+
         sCs+mawSoZhVXX9IrSBKRcNTXTmzDFh3Ow/Hfdv+pmn7bCTCnCQvwpx9US5x6jLbudkk
         E9spClnjD03h+0k9YHBCpVhUDdag2M/9xnpyi/IrKjhlOvJDeKLi61IdqBuPGfmIu0cb
         aHP6HDimc9RpidqwjE+cmLykzg2ivtnS60mzxtQV/hKexmLo9/p23nGE/2kOB5avS4oU
         lL3l5S2AsNH9ypBaZliBz/gKQEE+cDHTk3LPjXwJIh+GObekXcm4rOLd6FdxcB4hyQWZ
         j85g==
X-Gm-Message-State: AGi0PuYLywRUANKsIWSfYDuscItz7TwJXu+HbpK7HPWKWRcKwWneABEf
        4cfuP6qT2EMoTnxE196ethwGRVUIx94=
X-Google-Smtp-Source: APiQypKGK4doJjGtRHBYCjSjR9Sl0NfvMteyW7bmEtVHOlzZ9yXQfLlKIdUzFfmBqMHeA5fjuEUtrw==
X-Received: by 2002:aa7:9f11:: with SMTP id g17mr282492pfr.43.1586191152090;
        Mon, 06 Apr 2020 09:39:12 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:11 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 00/11] media: imx: Miscellaneous format-related cleanups
Date:   Mon,  6 Apr 2020 09:38:54 -0700
Message-Id: <20200406163905.24475-1-slongerbeam@gmail.com>
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

v7:
- Patch "Handle Bayer format lookup through a selection flag" did not
  make equivalent translations of the format selection arguments in
  some cases. That patch in this version now makes sure all selection
  flags are equivalent to previous behavior. That is, SEL_ANY is
  translated to SEL_YUV_RGB in situations where allow_bayer was false,
  and to SEL_ANY where allow_bayer was true.
- Added a new patch that fixes the selection flags in a couple places,
  which in previous versions were sneaked into the "Handle Bayer format
  lookup through a selection flag" patch. Suggested by Laurent.
- Squashed the two constify patches into a single patch. Suggested by
  Laurent.
- Made imx_media_find_ipu_format() and imx_media_enum_ipu_formats()
  inline. Suggested by Laurent.
- Clarified the comment block language in the exported find/enum format
  functions. Suggested by Laurent.

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
  media: imx: utils: Constify some mbus and ipu_image arguments

Philipp Zabel (2):
  media: imx: utils: fix and simplify pixel format enumeration
  media: imx: utils: fix media bus format enumeration

Steve Longerbeam (4):
  media: imx: Fix some pixel format selections
  media: imx: utils: Rename pixel format selection enumeration
  media: imx: utils: Introduce PIXFMT_SEL_IPU
  media: imx: utils: Split find|enum_format into fourcc and mbus
    functions

 drivers/staging/media/imx/imx-ic-prp.c        |  15 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  14 +-
 drivers/staging/media/imx/imx-media-capture.c |  42 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
 drivers/staging/media/imx/imx-media-csi.c     |  42 +-
 drivers/staging/media/imx/imx-media-utils.c   | 518 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |  12 +-
 drivers/staging/media/imx/imx-media.h         |  57 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  17 +-
 9 files changed, 334 insertions(+), 386 deletions(-)

-- 
2.17.1

