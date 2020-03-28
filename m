Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5361969FA
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgC1XKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:12 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:44597 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbgC1XKM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:12 -0400
Received: by mail-pf1-f170.google.com with SMTP id b72so6548739pfb.11
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yhKtc2k1meueXUMIfVGqWBsTH8w6oZQ3EEPRwf9lsIg=;
        b=B5XVKp8rUXU0WFp7W3J2maFeezhs7tqbM7DjHFeradPB3BH/X7F5m2z5eiokXqXCtN
         Xcvs4UgTjEHBoPMeqzrPMX2kleIE6JIJE+IRmA+4XfbQFrrgpJj/EFfH8pWOIvGy8Nfz
         bOgN5xeCtSZNyyO2s8/TFCjDXCIsTn1LI1xsYHydc/IrQqh5fn64k5CWrfYPrBzMUzSH
         ejAWrTc1gaAjpN6bM+bnM8tXomsjBzDsQarwnW0zEOWsjyB4Tw8yn6IR3CezGE/nkGeR
         K/rp+cfwknkYC0tcDIlZpOhI2nr6W9bxSp71kLRjSUdxLEsOHlLHUF9qWx8EVyhdri+D
         IBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yhKtc2k1meueXUMIfVGqWBsTH8w6oZQ3EEPRwf9lsIg=;
        b=gJYqMrAS0tatkvflIBdSP22FLbWbSJVv9H5CgR2oJurC/VSWljq0hF6wxCop2qvDrp
         yjtywGAO+ZMlSUuDh6PjcF43WaGueC8fb+zjhhrxvBDRVwHgQCo4r03EY1mep+Xyyfa6
         v/71TlwxmWQyrEVk/o6a7sYoTw9L5pgn4BIywUo5vAwf4y7swQ3dnSEPOeQoHaE31rRg
         ZUe1xAYOISj6u+eqGoXT8C95mLptZ4Tj8JDsXGlM7giftFTnM5isKUCvsHPvlGHj8UTC
         y3durpNHR0KaAB567G4EIVYrV46ux9s/KTVpiz1zBFOsqAwPkxt7yRg7lI9fYt4e0r45
         P4ZQ==
X-Gm-Message-State: ANhLgQ3ofQ0EnvA9+Qux/UfmHK/cEcBV1o2kEoMLyD8tU4pRX5XM3nv7
        p6eiOrAxxIGfWHYAuwsXsW2cd+W7Ozw=
X-Google-Smtp-Source: ADFU+vuyfCw5I1GSqdJb2LnQlvEE+Vq/ztBI7qxQsNeI81o1ftPZgRlQvFV9nS/xfQ+WHLva+Ki4gQ==
X-Received: by 2002:aa7:931a:: with SMTP id 26mr5853287pfj.11.1585437010537;
        Sat, 28 Mar 2020 16:10:10 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:09 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 00/10] media: imx: Miscellaneous format-related cleanups
Date:   Sat, 28 Mar 2020 16:09:52 -0700
Message-Id: <20200328231002.649-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-capture.c |  20 +-
 .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
 drivers/staging/media/imx/imx-media-csi.c     |  26 +-
 drivers/staging/media/imx/imx-media-utils.c   | 539 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
 drivers/staging/media/imx/imx-media.h         |  27 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  14 +-
 9 files changed, 308 insertions(+), 350 deletions(-)

-- 
2.17.1

