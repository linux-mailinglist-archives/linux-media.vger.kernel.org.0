Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37836C1ED2
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbfI3KTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:19:09 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33247 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730668AbfI3KSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:18:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id y127so6602024lfc.0;
        Mon, 30 Sep 2019 03:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6p4YV1zw75GWQJusYr45Q284S6H3/JdTSqt0G1D+1gg=;
        b=M5fQQSLcME9hFROXxw7NFTFySwlcu3eObn9Hivaho0qCEKcF8Iy9KoqW4bS1D+/gbL
         JghIs1iIo31Cg0R/mINuo1EzB6StQPc7NpE/w4yprn3v3p+273Sa5twajo6n0ya0dMbe
         Hq87uCQ7RWgG+yaO8wLds95ydVYxKCAEuy1ymrS5/RJWtZ8/FQbcIhECRI2M80tmx7I7
         PXMRz3PRBtywJGRdPZNCfnNPA0xxjlZvVzHR4rEZxkA7aKcNn5PCTSfx50CyJ5PsTkqy
         7xGB9CH8tlIbFWkWXoMuUC7B6KquYGYkLOzzrNdAPuBtwPYI5xg/mTDsD+ppp/UW0hut
         V4mw==
X-Gm-Message-State: APjAAAUyJCf2oeqLfSKQdHGfHilZnSTH5govxYFl/AwdBugjqHBZlSIB
        WH36SJJwxzIu10RROjIju6Y=
X-Google-Smtp-Source: APXvYqw5PMB8dTcf2TZBADy6Q9OcIjv1d+eGxP7zjbmPAS3pWEe6xWdiFeqRLAOlXqt/+oKbkD2+AQ==
X-Received: by 2002:ac2:5633:: with SMTP id b19mr10815385lff.103.1569838732619;
        Mon, 30 Sep 2019 03:18:52 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z8sm3805970lfg.18.2019.09.30.03.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:18:51 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v8 6/8] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Mon, 30 Sep 2019 12:18:39 +0200
Message-Id: <20190930101841.19630-7-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930101841.19630-1-ribalda@kernel.org>
References: <20190930101841.19630-1-ribalda@kernel.org>
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

