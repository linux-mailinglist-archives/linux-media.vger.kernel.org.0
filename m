Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9282C326F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 13:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732160AbfJALYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 07:24:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43249 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732034AbfJALYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 07:24:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id u3so9563118lfl.10;
        Tue, 01 Oct 2019 04:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOQK/iTDEM2OOwuKD12eKM8a+YD1YCYg9jIBY8YMxOA=;
        b=r+F0Qdwp5fdvEXlBMioZZEu81T91BgZQd+z2sCuT/bacnRrRN19YhXalsHZZYaho8B
         qnx8pFCPJ6OZGPZBivK5lljNHiF4Upswadgn/a85wCZKNANOUuULUoSIVki46PlkPrVl
         iSamxjeDXeIVfh5yoM6wF6kYXoskkwbHW/2BNVapvIc/R43fse9zHXsIFy1fVHgUWjVr
         CAL03U4Qd/0oKw6hUjg/b6tJ/2dPXfALymY0TWwHXEZf8PNeSr++xkZwzs0e0hnzzAGq
         AL/QtRt+k/fp9XIcAnD9NZJgfLa7nUOOCj57ROJgtiPp9XVl/fkwkdB0yhQ7AFPDNSIj
         C/tQ==
X-Gm-Message-State: APjAAAUR+R+cvDc6pSKNLJmK/YTO/BjTcbNUGBjNftVEmCtmHBT8hi1P
        3KlBvwnrbCIJMTrd55/vXjA=
X-Google-Smtp-Source: APXvYqxc6S0IaCmirBB5H4KQ2LvQnvSMn/jfM8x+RS6F8Hv5i2ejRs+M69AKtV02a7fPk1cxl48ctA==
X-Received: by 2002:ac2:50c5:: with SMTP id h5mr14451515lfm.105.1569929072691;
        Tue, 01 Oct 2019 04:24:32 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 3sm3853894ljs.20.2019.10.01.04.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:24:30 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v9 4/8] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Tue,  1 Oct 2019 13:24:17 +0200
Message-Id: <20191001112421.2778-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001112421.2778-1-ribalda@kernel.org>
References: <20191001112421.2778-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A struct v4l2_area containing the width and the height of a rectangular
area.

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index a3d56ffbf4cc..33aff21b7d11 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -443,6 +443,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
 	quantization matrices for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_AREA``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_area`, containing the width and the height
+        of a rectangular area. Units depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
-- 
2.23.0

