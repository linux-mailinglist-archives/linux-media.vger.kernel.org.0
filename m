Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA3ACE097
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfJGLfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:35:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42492 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfJGLfQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:35:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id c195so9005900lfg.9;
        Mon, 07 Oct 2019 04:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=70x3tCLN15pVZABiv+sJGfjAbt3B67/xHyirI0wzx58=;
        b=EaSeURKIkRqGCykuhny4XBag4Y5NiCyerPTwd8qwa1AQQnQjdgOhOSgNcfbd8cXhOZ
         g1aTgFDG3FsUfH1m9wA7m9hX9316XhSX5CmrQU6G1bBRqEXg7emcvuhOXqdSQLOLWmJh
         +TA0mOGvoePi0Ql+v6U7uUNNY8Z/868W/Pm0PbqdlFHrMjivsxbNqsrO2N6N+xxgyvD/
         wG75MSU2d5EUxdygvcE1K6t/NFb2S6+ySnhg7aA+LxfZ1O5WKFHL2oMmXc5ZeZ9ubY2t
         n0QxwBh+b6Ovs5kWpJS9IZapc+mXhnpuxVyVEZ4ZaeQbn/fYp+uqrkYN1cu6vtJ5sjsv
         uy7Q==
X-Gm-Message-State: APjAAAU2oih/L+kCtp1CfLXPG5XWIUqmsNnGx5mzXiDz6xsiB49XuLbB
        KOmcaIZIYdOUnQDOCfmq8AY=
X-Google-Smtp-Source: APXvYqzEs8wmTTWmN7yGseypLKH8UDpB02czRsmtX90rJG0hsVqNV0Rn5O5UdeYrV9fkZcUB4o2mGQ==
X-Received: by 2002:a05:6512:304:: with SMTP id t4mr17226147lfp.15.1570448114103;
        Mon, 07 Oct 2019 04:35:14 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b25sm3666047ljj.36.2019.10.07.04.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 04:35:13 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v10 6/8] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Mon,  7 Oct 2019 13:35:00 +0200
Message-Id: <20191007113502.11746-7-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007113502.11746-1-ribalda@kernel.org>
References: <20191007113502.11746-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New control to pass to userspace the width/height of a pixel. Which is
needed for calibration and lens selection.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/uapi/v4l/ext-ctrls-image-source.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
index 2c3ab5796d76..6388668855d0 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
@@ -55,3 +55,12 @@ Image Source Control IDs
 
 ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
     Test pattern green (next to blue) colour component.
+
+``V4L2_CID_UNIT_CELL_SIZE (struct)``
+    This control returns the unit cell size in nanometers. The struct
+    :c:type:`v4l2_area` provides the width and the height in separate
+    fields to take into consideration asymmetric pixels and/or hardware
+    binning.
+    The unit cell consists of the whole area of the pixel, sensitive and
+    non-sensitive.
+    This control is required for automatic calibration of sensors/cameras.
-- 
2.23.0

