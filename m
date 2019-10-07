Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2154CE09F
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfJGLfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:35:15 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33282 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJGLfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:35:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id y127so9038890lfc.0;
        Mon, 07 Oct 2019 04:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOQK/iTDEM2OOwuKD12eKM8a+YD1YCYg9jIBY8YMxOA=;
        b=CVvcI+QKQsUo5D025+b9xDs1bRrdppU6aObBZNL0n2CzbmNjSLSq4v45FsrN2oZm/D
         /NnQuRJot+jd0MwX2xIQoJeY1NmFeaIVy6G5vMNi/Ndc8KyPAfzoOIVQibg6SdZzVHfb
         yWfSwSmTRfNaivSozNMKczaEdVJpEx/CwjzwwAIZpvCOOcFnk23q9DyGSrOGhn4nQNRm
         VxlWR3lVIj5hwo7aX5ujWpZrxOpLLwgQg7cUg8Byd/wmGfSDxXqu1eLMMmjtZEGoRD4v
         R9Vmvp6Dgg6skQD4+vHyciWlToDUpUU1ZKQ4Ox/7iXOIlg86Ld596yQ0cg0k747idFi9
         +Uuw==
X-Gm-Message-State: APjAAAUoyMUqokWSYMCDdgtAjaNdeVOnhmGcPxNDKNchiy1jvkMsr6k7
        8OPSFryHL3/cOcValCvPoTA=
X-Google-Smtp-Source: APXvYqztCCaBxWPgOIMQhen2P198wIgh5SWv69czRq6l9HsoFpdENlYEQN4JpGoSwHxUr9wv2/9PsA==
X-Received: by 2002:a19:2314:: with SMTP id j20mr16513006lfj.22.1570448111484;
        Mon, 07 Oct 2019 04:35:11 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b25sm3666047ljj.36.2019.10.07.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 04:35:10 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v10 4/8] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Mon,  7 Oct 2019 13:34:58 +0200
Message-Id: <20191007113502.11746-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007113502.11746-1-ribalda@kernel.org>
References: <20191007113502.11746-1-ribalda@kernel.org>
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

