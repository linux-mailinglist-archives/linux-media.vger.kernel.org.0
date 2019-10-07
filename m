Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF1CE66E
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfJGPGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:06:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33946 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbfJGPGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:06:51 -0400
Received: by mail-lf1-f68.google.com with SMTP id r22so9560210lfm.1;
        Mon, 07 Oct 2019 08:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UMcbJXVkLFQKjwiek+1XAltyAJgo9tN49kR+LoXfqHI=;
        b=fu+4SED9YvnUO1io+EKdFzrjz9Hwe9zWH5BgCcUYWxV0qtCKLK2A41ImJRlWQMpLWW
         xENCM5Bq6bjE9ckOZF0ileHhFWMwhqId5O3jjDTCC4WeNZjzCHTr/e/cHYd1hlHCid19
         I30Y8JGfOPVl85SsXnV8Cdwj9aBebMp7tfOX8Eq9jZvzwGtXW+yshSW1ZrnZ3R3N90ps
         KvghPpMbFBjmWoirdmvF+24zt1YzCv6Z5c+fjPTV3jMm5hqjuHVqwtjLIT5GPAAGSIDX
         pIScTogpcolyrSsbZUBeIY2Pl8Flw93OCNdD1D3wbB5ub0wENrx1Z7NVAOeEdytN5JbJ
         CDbQ==
X-Gm-Message-State: APjAAAWhp50a/UR3mRgssM9RmFDW6D6cLvWY9rRiIE/byLSXODxRKwnK
        k4mvJ6AYkRIRW5Ap4sOq1bY=
X-Google-Smtp-Source: APXvYqx5faEgTg3018IJ3rcho1KK2DYnWj69WhoQSYeEUUoHR/LagEO+wokNxxsjt3emWmMrhP/1BA==
X-Received: by 2002:ac2:5090:: with SMTP id f16mr17700746lfm.66.1570460809299;
        Mon, 07 Oct 2019 08:06:49 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id n2sm3145517ljj.30.2019.10.07.08.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:06:48 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v12 6/8] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Mon,  7 Oct 2019 17:06:34 +0200
Message-Id: <20191007150636.16458-7-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007150636.16458-1-ribalda@kernel.org>
References: <20191007150636.16458-1-ribalda@kernel.org>
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
 .../media/uapi/v4l/ext-ctrls-image-source.rst          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
index 2c3ab5796d76..2d3e2b83d6dd 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-image-source.rst
@@ -55,3 +55,13 @@ Image Source Control IDs
 
 ``V4L2_CID_TEST_PATTERN_GREENB (integer)``
     Test pattern green (next to blue) colour component.
+
+``V4L2_CID_UNIT_CELL_SIZE (struct)``
+    This control returns the unit cell size in nanometers. The struct
+    :c:type:`v4l2_area` provides the width and the height in separate
+    fields to take into consideration asymmetric pixels.
+    This control does not take into consideration any possible hardware
+    binning.
+    The unit cell consists of the whole area of the pixel, sensitive and
+    non-sensitive.
+    This control is required for automatic calibration of sensors/cameras.
-- 
2.23.0

