Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECE1A114E18
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 10:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfLFJSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 04:18:50 -0500
Received: from mail-lj1-f175.google.com ([209.85.208.175]:41422 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfLFJSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 04:18:49 -0500
Received: by mail-lj1-f175.google.com with SMTP id h23so6871020ljc.8
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2019 01:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d2i4UOsA5Su/C/Zzrjd7fBbotpOpRVWBJ+lKAYxIu7s=;
        b=r4OyxNxwxuL+k0zycKJzXVYmwAF//QBxO9ivkOjwJRYZzEqd4hIl8MKx0pDiwb0vEK
         AQH0VHMcEDrq2ecGfHiZxmNzAjgXL0YtMZld2WfHwTx03aCDCcircjqUQYXsnPRrmqQp
         o8ZxO9CRukkoyLoUG+0LZ7Z/RCADnZQh538kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d2i4UOsA5Su/C/Zzrjd7fBbotpOpRVWBJ+lKAYxIu7s=;
        b=TukVPcxPQpndLgPGCtpeyb5ZIQAEtZEDyH4e7vUvthjZyCFIzn1TpCGXktLRdLGD9j
         XFTlXhOIO2i2pO4wFf9XhSZNZcNR+F+yDD/6bpcjeMOavV+p8gd/zSn8hivqK0rqZr4N
         fux1MOopIqcC1QYhUUYj2OndwlG/NL83MNh8scQ4lqTgT0aQzeqXh46V4MuiFqUU6iei
         p6llOGIdE/dOdEJdotAG1lgltW1HPwiy+0HugLbL/+4eK6T2nphO2pPp/c7kf/rZL9dR
         2PVyMk+a0eXyvToYztPZQ9NIsA2xxd5k3yD52hUqFbjedbdimGjqS/5mzLScfIuilUO3
         910Q==
X-Gm-Message-State: APjAAAXUHZ6duhE3zhV9d+o3928ZggZ06yTWy27q+S7ZdGKGdQnLWNUG
        EOO5TrzTERRE2kPs1tiTbNlqnQ==
X-Google-Smtp-Source: APXvYqyQtTeFvrdIv7pVAHmMNvia2KFDl7UueO9bWJEvIKUyCFBRZgzTuHWLVXvB7WdLhclzW2yFwQ==
X-Received: by 2002:a2e:b056:: with SMTP id d22mr8249065ljl.73.1575623927737;
        Fri, 06 Dec 2019 01:18:47 -0800 (PST)
Received: from turia.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id s22sm6361405ljm.41.2019.12.06.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 01:18:47 -0800 (PST)
From:   Daniel Gomez <daniel@qtec.com>
To:     sakari.ailus@iki.fi, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Daniel Gomez <daniel@qtec.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: v4l2: Fix fourcc names for 12b and 14b packed bayer
Date:   Fri,  6 Dec 2019 10:18:21 +0100
Message-Id: <20191206091822.6877-1-daniel@qtec.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix documentation fourcc names for the 12-bit and 14-bit packed Bayer formats.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
Changelog v2:
* Fix fourcc names for 14-bit packed bayer formats.
* Fix fourcc name V4L2_PIX_FMT_SRGGB12P.

 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst | 2 +-
 Documentation/media/uapi/v4l/pixfmt-srggb14p.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
index 960851275f23..045540bc0d86 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
@@ -13,7 +13,7 @@
 .. _v4l2-pix-fmt-sgrbg12p:

 *******************************************************************************************************************************
-V4L2_PIX_FMT_SRGGB12P ('pRAA'), V4L2_PIX_FMT_SGRBG12P ('pgAA'), V4L2_PIX_FMT_SGBRG12P ('pGAA'), V4L2_PIX_FMT_SBGGR12P ('pBAA'),
+V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC'),
 *******************************************************************************************************************************


diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb14p.rst b/Documentation/media/uapi/v4l/pixfmt-srggb14p.rst
index 1a988d7e7ff8..051ae3d05bc3 100644
--- a/Documentation/media/uapi/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-srggb14p.rst
@@ -13,7 +13,7 @@
 .. _v4l2-pix-fmt-sgrbg14p:

 *******************************************************************************************************************************
-V4L2_PIX_FMT_SRGGB14P ('pRCC'), V4L2_PIX_FMT_SGRBG14P ('pgCC'), V4L2_PIX_FMT_SGBRG14P ('pGCC'), V4L2_PIX_FMT_SBGGR14P ('pBCC'),
+V4L2_PIX_FMT_SRGGB14P ('pREE'), V4L2_PIX_FMT_SGRBG14P ('pgEE'), V4L2_PIX_FMT_SGBRG14P ('pGEE'), V4L2_PIX_FMT_SBGGR14P ('pBEE'),
 *******************************************************************************************************************************

 *man V4L2_PIX_FMT_SRGGB14P(2)*
--
2.24.0.rc1

