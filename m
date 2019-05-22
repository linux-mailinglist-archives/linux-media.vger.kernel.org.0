Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F0725B6F
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 03:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfEVBD1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 21:03:27 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35780 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfEVBD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 21:03:27 -0400
Received: by mail-pl1-f194.google.com with SMTP id p1so197528plo.2
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 18:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GaU+wpDwFXa63bRO3vNf5R0wFlWuTTQucZr1CVj4Aec=;
        b=eu7KVfh+1HT3eH5oAxYSnfA09Xuu4q3cT1e0TrF/KUzRAvKcM2oF7jwKZSL46+5QYz
         Qi+647umY5AIcdClwcdqzV+HTFLHQacePPbUMOcYngYyQAIa9u8E02BJVx2BlenPYyes
         wYu0OMf8NdVu85NuOU7JIic1lGHQggzQOKVbFTOlGOYkwDDu9GWSAhCAS+Rh8h0G78gx
         +vdhBxWxMNfQNbdw/GAoMeoc2sGoQjzfXFCgRysSmjydsdQutR1JuTp2X9evySANJR7t
         vQd8CfUlXqsUdYkLoR70+7m2kATWXQmjCEooQVOQ4LaihP35zaLSd5yTplojzFJYQafj
         e4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GaU+wpDwFXa63bRO3vNf5R0wFlWuTTQucZr1CVj4Aec=;
        b=N0rUizt066qQw8c4+JNQPVv7sSepBKUCEfvrRnmvrXa2WEp5McCsarKFJv1n4XZTRq
         w4uOM8ZxwEE6qai7QuEQ57TeoXTeXDsqde7jkX1OGJegXlAje5fLYd6EarWSPddWfCt/
         B7+0tsuCU0PAiJrBy9r1O/W+NdQiCnCi3F0wEdD+xHlDI472gYl0rVGWvu9w3fmK8nfR
         T0YSoJxjCfT/54f0ooeI32Rxk0Fsryn9h315YtBjHpele6+s6bCs2/yfzbuhPGCgdKfG
         W/hBQGElq9D+ZR534piPf7FQlGNXdHoHaoZFxuH/tuwv6iyPy73yrkh2sUMbG+KoeGy6
         /eiA==
X-Gm-Message-State: APjAAAWA5rGU0KXvmTqlyaaPOU8pN7uR66jpK3vDmGJDcnyADl7OzS/o
        YWa94KqKfR3tTIRibPqe7p3tQ/qv
X-Google-Smtp-Source: APXvYqxuI5mVySz/VT336aXergtXZM4ooDEnQdhKaTPU/LLDt245sAEZRFMcs0cXTNNXhuPPU8nlDQ==
X-Received: by 2002:a17:902:8210:: with SMTP id x16mr12513596pln.306.1558487005993;
        Tue, 21 May 2019 18:03:25 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q193sm34291242pfc.52.2019.05.21.18.03.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:03:25 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v8 0/5] media: imx: Add Rec.709 and limited range encoding support
Date:   Tue, 21 May 2019 18:03:12 -0700
Message-Id: <20190522010317.23710-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset adds support for Rec.709 encoding and inverse encoding,
and encoding between both full-range and limited-range quantization
for both YUV and RGB, to ipu-ic. The imx-media driver can now support
both BT.601 and Rec.709 encoding, and limited and full-range quantization.

History:
v8:
- removed the Fixes: and cc: stable in patch "Fully describe colorspace
  conversions". This patch is too difficult to backport to stable trees.
  No functional changes in this version.

v7:
- removed the run-time transformation of coefficients from full-range
  to limited-range, and instead hard-code all the coefficient tables.
- moved the coefficient tables into a new module ipu-ic-csc.c.
- introduced ipu_ic_calc_csc() which pre-determines coefficients,
  which are then passed to ipu_ic_task_init(_rsc)() as a filled
  'struct ipu_ic_csc'.
- added support for limited-range RGB.

v6:
- tweak some of the coefficients slightly, they were not getting
  rounded correctly.
- move the introduction of calc_csc_coeffs() to an earlier patch for
  easier patch readability.

v5:
- the hard-coded encode coefficients now convert only between
  full-range quantization. A new function is added to transform the
  coefficients to limited-range at input or output.
- add a bug fix patch for saturation bit in TPMEM register.
- add a patch to fully describe input and output colorspace to
  the IC task init functions.
- add imx_media_try_colorimetry(), called at all sink/source pad try_fmt.

v4:
- fix a compile error in init_csc(), reported by Tim Harvey.

v3:
- fix some inconsistent From: and Signed-off-by:'s.
  No functional changes.

v2:
- rename ic_csc_rgb2rgb matrix to ic_csc_identity.
- only return "Unsupported YCbCr encoding" error if inf != outf,
  since if inf == outf, the identity matrix can be used. Reported
  by Tim Harvey.
- move ic_route check above default colorimetry checks, and fill default
  colorspace for ic_route, otherwise it's not possible to set BT.709
  encoding for ic routes.


Steve Longerbeam (5):
  gpu: ipu-v3: ipu-ic: Fix saturation bit offset in TPMEM
  gpu: ipu-v3: ipu-ic: Fully describe colorspace conversions
  gpu: ipu-v3: ipu-ic-csc: Add support for limited range encoding
  gpu: ipu-v3: ipu-ic-csc: Add support for Rec.709 encoding
  media: imx: Try colorimetry at both sink and source pads

 drivers/gpu/ipu-v3/Makefile                 |   4 +-
 drivers/gpu/ipu-v3/ipu-ic-csc.c             | 410 ++++++++++++++++++++
 drivers/gpu/ipu-v3/ipu-ic.c                 | 138 +++----
 drivers/gpu/ipu-v3/ipu-image-convert.c      |  28 +-
 drivers/staging/media/imx/imx-ic-prp.c      |   6 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c |  42 +-
 drivers/staging/media/imx/imx-media-csi.c   |  19 +-
 drivers/staging/media/imx/imx-media-utils.c |  73 ++--
 drivers/staging/media/imx/imx-media-vdic.c  |   5 +-
 drivers/staging/media/imx/imx-media.h       |   5 +-
 drivers/staging/media/imx/imx7-media-csi.c  |   8 +-
 include/video/imx-ipu-v3.h                  |  56 ++-
 12 files changed, 614 insertions(+), 180 deletions(-)
 create mode 100644 drivers/gpu/ipu-v3/ipu-ic-csc.c

-- 
2.17.1

