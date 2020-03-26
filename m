Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E101946FD
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgCZTFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:52 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:43042 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgCZTFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:52 -0400
Received: by mail-pl1-f173.google.com with SMTP id v23so2509244ply.10
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1c9mTyk8op5wM3ftA9e259ZTYMPwKUPDNXwTzH4RwA=;
        b=gkc4XSLhuDRCESheqin61wab3g3L0OmoL8FsWNr0ggLNTzBR8G+ghVuIC3LKGduQEW
         QkvNjfzZOffC6uWMWdYtXGcPfZjHgvHAX1LGn9ATpXdSPm9wl/k/Z7cPEez1pVckmf7N
         BkDnnXBYfYZHO29+PfMELixr1ODOPO/kWnus/DEZ0PWw1dP+aI2Wjvfeg8ezig01VXRb
         sf26d+n7aL4wLDKHWLCGaBRQp+NFCvq/rbi6wKzu9wB3tFZDA+WN7gjTkQSg3OBLr+aE
         ko5ZP2KuEDq10rTJImyOhU7DlAcdiZq5w+lGPw86cgYXp0jIKi0Xycrj8bPpaSs9VkJa
         4jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1c9mTyk8op5wM3ftA9e259ZTYMPwKUPDNXwTzH4RwA=;
        b=a+yPy4O3jhvmbcS2f0tLz4WG8moEJpgrXUaNlosQ296vIeXoi/A3gbm0inWIUpx3dQ
         CA3d28UDxfC2Rrnn+hjg7FWWzd+NSKiRdEcJNLZ8v8yG0PQGJOMtiA9UV5dtVNib3QMx
         /fYESz7eKjzWIKcQFgoMgtf62hM1/glj/JoBf4sB9aVluuNErsGixJd3Rwq+FTwjbFfJ
         xrn+eOE4ZxwQSLj3wpGpEDwfA+Cc7HK4QfsdWRYv2/FwCM0i66Gs0k5GBGpo1hTLyJIy
         3ycaRZC5Kp8gGvq505oV6fIdmPSag0+k/YWLsg2SmChSpstoj08BqME7E8cKwvBcIH7V
         3+XQ==
X-Gm-Message-State: ANhLgQ1wyiuknWwU9ZSp47ngkqwesZ3X5QSwHzWIJYe2pXZMewK5Crn0
        x0XOzUX/7rMqijVPuG4AL86jk6ijbLs=
X-Google-Smtp-Source: ADFU+vtPIS7PPrBitN/vlEk340AFJKk5NOJLAaNGioyG4BlsIMjpzp3VrWTQYaHij/bXnhzftnNVNA==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr1640382pjn.8.1585249550460;
        Thu, 26 Mar 2020 12:05:50 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:49 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 00/10] media: imx: Miscellaneous format-related cleanups
Date:   Thu, 26 Mar 2020 12:05:34 -0700
Message-Id: <20200326190544.16349-1-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-utils.c   | 531 ++++++++----------
 drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
 drivers/staging/media/imx/imx-media.h         |  27 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  14 +-
 9 files changed, 304 insertions(+), 346 deletions(-)

-- 
2.17.1

