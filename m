Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B1BC1EAF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbfI3KHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:07:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37601 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730487AbfI3KGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:06:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id l21so8803160lje.4;
        Mon, 30 Sep 2019 03:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOQK/iTDEM2OOwuKD12eKM8a+YD1YCYg9jIBY8YMxOA=;
        b=spHvLnMMnX0VkxN40/72gF9rW+YRioRaS1PVsyszTLHuGLHFMP0IlRIECcWxvyKBMg
         m+pV4T29WXUMzgfVqChut14+TY/qhDk94XErHxf7Yu3fWzNTCT3Jmib5A/L+ruVLwJ4x
         DCeXk97GoxI0XaUE4wHJNvGfK46YSeqaOlevWqaJke97brSs39C0/YLY5RhvP2XKsRIx
         +NRt7Wp9Un1LWwOCYAMuEFmu7dwEpNtHe/kVORYKZ0JZp81QCQzFr/6bHcgWtM1IT9rX
         Y8+Zseyh3fJ7iY95NtAKmshJ+MrhokWpqTJAgwGP+wPgoeyc/j0xc8eyGeVDKPiiG5ob
         Xo1w==
X-Gm-Message-State: APjAAAXTbipKQ3POzu7VA8iucoFQ82X56S1Xxu3xO4oD+o7cNjksO58f
        hMp5n81a9Zq5J2TYINJ2UnU=
X-Google-Smtp-Source: APXvYqybt31i8zFAslAiL2G4nrSBLQqDRC8Mselga5NNQP7J6ahsWpWA0p4qWgfrbTNJ6Oo3Yn9TdA==
X-Received: by 2002:a2e:63da:: with SMTP id s87mr11231250lje.79.1569838006572;
        Mon, 30 Sep 2019 03:06:46 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z72sm3091580ljb.98.2019.09.30.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:06:45 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v7 4/8] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Mon, 30 Sep 2019 12:06:32 +0200
Message-Id: <20190930100636.18318-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930100636.18318-1-ribalda@kernel.org>
References: <20190930100636.18318-1-ribalda@kernel.org>
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

