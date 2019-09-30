Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9567C1EA7
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730548AbfI3KGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:06:54 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44099 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730646AbfI3KGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:06:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id q11so6537100lfc.11;
        Mon, 30 Sep 2019 03:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6p4YV1zw75GWQJusYr45Q284S6H3/JdTSqt0G1D+1gg=;
        b=BjonJ9ILw6RRwjTiFrMIaj31RuzaZ7miY3RaFcljK9HcLoJvFct7uD95kaaQExRYAI
         SjGl2MjoY78TR7LvDTHkHvHn+H14nTWCAovboJGNcrWyTeVRrj65OqZUG0eMSF20BgCC
         xbAy5yPoLrZuPr8GiyoMsoxwR54U3zSBk/0BEUrlxCpnKSp/kJ7xRyS/ukxay4UPoUlK
         OyE2YCkQer8X1/doOMTVIW/Bt8oXE8r7gAV+ZwtY0co51uQ/NY4CSTibXbDGxxeyI8qH
         i2dVe8xKrIgi/kFrZtqbghCCscM7Kj44sFA2piMkL/Rap53zC6x3igXOJQzTft1WWYUv
         s/Hw==
X-Gm-Message-State: APjAAAUj9xli6OB72l+227CwJwdBTbn9/g2oq76XQehB6onNSOCjL9k3
        OWoe7VXbTTA7Oh9PovyYa8g=
X-Google-Smtp-Source: APXvYqw8zda0A2oGUqGRrQwHDEkBvqQbk1BCAQE49t7Bs4nPMb0eS+4MQGxGU8w7NDRgi4KJJG/5+g==
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr10400224lfq.179.1569838009497;
        Mon, 30 Sep 2019 03:06:49 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z72sm3091580ljb.98.2019.09.30.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:06:48 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v7 6/8] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Mon, 30 Sep 2019 12:06:34 +0200
Message-Id: <20190930100636.18318-7-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930100636.18318-1-ribalda@kernel.org>
References: <20190930100636.18318-1-ribalda@kernel.org>
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
index 2c3ab5796d76..033672dcb43d 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
@@ -55,3 +55,12 @@ Image Source Control IDs
 
 ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
     Test pattern green (next to blue) colour component.
+
+``V4L2_CID_UNIT_CELL_SIZE (struct)``
+    This control returns the unit cell size in nanometres. The struct
+    :c:type:`v4l2_area` provides the width and the height in separated
+    fields to take into consideration asymmetric pixels and/or hardware
+    binning.
+    The unit cell consists of the whole area of the pixel, sensitive and
+    non-sensitive.
+    This control is required for automatic calibration sensors/cameras.
-- 
2.23.0

