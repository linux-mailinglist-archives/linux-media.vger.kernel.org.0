Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DED9C3270
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 13:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732286AbfJALYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 07:24:38 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42829 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732215AbfJALYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 07:24:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so9564739lfg.9;
        Tue, 01 Oct 2019 04:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6p4YV1zw75GWQJusYr45Q284S6H3/JdTSqt0G1D+1gg=;
        b=EJSX0n34DsU6oRkDnNORzhh0VjPNCy7NzeaFpaD7tArU4Nt7QtNsaCTpQM7+J/mHfA
         LvygwPtYJr6JpKeODL14o+ehp+5CZU+qDjUlVGJwhgugVUZ/ZaOMbj6LJZxThMzRNZWX
         XYY0PqNP2bjcrVwFyRIdfLQRz8mmohxpqWIBcr2jzEh7BpTQiQUM+N5KH/3Gc2FJkd8W
         T/bRSdSnadAPwEDCtjvDAw2ieU20DOHSqFFTxp/a4oomwLw1c87btjBmxaCP1ZvWbsNX
         xumihsF7xQkpONbQRKK9G76sW4cdpqFrhKqTEjGGhujEdEsVEF/eJfxbYrmzz7wKXsLQ
         59hw==
X-Gm-Message-State: APjAAAVlvXFBiU+I0Hp/c77yhk3PMmbAsBB0ygchmnnxozouyb0THvsB
        jBVgXRJD1TqFKeU9T6+Ry9c=
X-Google-Smtp-Source: APXvYqxuuHGmYJw9Go+LXkMmgo5Wf6LKyGqIajb3dXZTvMvU2ZME6oKYjkhfQA/AxFrWBMKVeiLhrg==
X-Received: by 2002:ac2:4196:: with SMTP id z22mr5218720lfh.54.1569929076043;
        Tue, 01 Oct 2019 04:24:36 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 3sm3853894ljs.20.2019.10.01.04.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:24:34 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v9 6/8] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Tue,  1 Oct 2019 13:24:19 +0200
Message-Id: <20191001112421.2778-7-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001112421.2778-1-ribalda@kernel.org>
References: <20191001112421.2778-1-ribalda@kernel.org>
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

