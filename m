Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F24B9121
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387551AbfITNvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:51:50 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45710 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387536AbfITNvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:48 -0400
Received: by mail-ed1-f65.google.com with SMTP id h33so6461023edh.12;
        Fri, 20 Sep 2019 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fcQKN2FoAnIqh2MMcTmTGon9VYJKHZn6rQDUAoPW8gA=;
        b=F+CrL95mFF5BVyHK13mH+G7Ix0G//l04t7gw+IZu6GOske+LEUnhEhQgLfflVwr+q7
         8Z0v18jt/1IHsNL7ZiWd9iENRQIogMamlx2lh6hAEoEcDg63gZu7EuZyeP7ylR5Jp6ng
         n7xSbiHj8TJCUnPffvBC5Bjow8O/tFVL5h5xImbQhZIQHZPDsHH8sgRhJcvmGn9Tt6YL
         8tqZGaVEt1fpMWw1b/HOwxmOcdv6AsiABrqryWps2JXaRpC38Js4s4CrUEwtobEbyGz+
         ZfWHj5z7lRM/FEYSmpV/BbTkByjb/Vwg0TSXAX4ptQ+hRjEzybY59XoWPPosqfNOjsb8
         yvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fcQKN2FoAnIqh2MMcTmTGon9VYJKHZn6rQDUAoPW8gA=;
        b=OC9Sy5fJfu6im4fvEez1lQXGUeeCK4ZxJjRVcRaFK5acvW8rdjT9ycbkIblvbm2VA/
         iDQogVrV1NQGtNUeBn8WB6RqjTckPA+uG1Z1PzZPU3oLMEFkXkYNMgzqmCrKW8JNgAEE
         onyb6g/CrSMP+eTy22na74lHPSm2R677ZLEC7Z332M5lZ+NhgIdZxVJLIfFxjuxcZ/Tb
         3LxMlEhL5K3MNFX4hdRu39F7F9sCWXVlmQIBkSegQ3Ex17PrCJWQijTlzUbtIFa9uDQy
         I01LVAeHKh9GEJbJStkXDczNuyfDcMfIKfC/Eg2rtR5JzZjBNXnSGTFJZ2gMciENDk8Y
         wdNg==
X-Gm-Message-State: APjAAAVwDIegt4RnTJh1zrhsaqtytJObY26Kz6p2RlGimdLKQ4VtamUV
        f/vFLmbCcCzcWMdmwQj7yDQ=
X-Google-Smtp-Source: APXvYqxxoBOy/UG8BvrzxJ9tY2DrNK3pYbebxIwKwnjXKhrMIrfs3fGtQ914lFT+3FMYIhKd5KJ1dg==
X-Received: by 2002:a50:d5c5:: with SMTP id g5mr22242130edj.57.1568987506574;
        Fri, 20 Sep 2019 06:51:46 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:45 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v6 4/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Fri, 20 Sep 2019 15:51:34 +0200
Message-Id: <20190920135137.10052-5-ricardo@ribalda.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920135137.10052-1-ricardo@ribalda.com>
References: <20190920135137.10052-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda Delgado <ribalda@kernel.org>

A struct v4l2_area containing the width and the height of a rectangular
area.

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

