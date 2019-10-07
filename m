Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08075CE670
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbfJGPHI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:07:08 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37211 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbfJGPGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:06:48 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so14066674lje.4;
        Mon, 07 Oct 2019 08:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9NkjYUFveZggVHspgGbGz7WkNJuc9jbm/jcHnFp4sA=;
        b=FeWKGqa+4LroVvwErh+/kzWj73kWaqOpRa/ao9Mz/np5LgzS7xuycrDc+RzogSNgZC
         gKV/2ZZAq5jz5LjuROEUtW/N/WRGubZ65th23OoCyQn5cSgebao41QxQ1CoQHjTfMT2C
         pgtXFSfTrdrUiCF6BiCpHWcwewzZGOjj+dL8tcMvnvInCEdbk+oTlH5/s0tKKV7bvx4b
         ocAmwfoCHyiPIFfdxDGcnzovQloKnW+N4uOAH1OmiVR4VDEO6eR005KwiPbDJ4yEJFQ/
         ZLGvqKfa0sIjOzvJqmEvv6+B6+U+esVIQuQ6VRCN4g0CNfLQNsHKeBI1uMS8BUAYMEEv
         EUvA==
X-Gm-Message-State: APjAAAWC0x5JWk1+Qc/0fO81puoSazZe8wbC5ipk4z/r6x5uH/vvRpou
        ZgX5IvconIX8YPCtDXSa2aA=
X-Google-Smtp-Source: APXvYqz7fHa19siM3LdVAaGAJWVvjm0LdRVSdomXrfIjxqDIzeJthpsOcBnqOx2z8YpI2+/iY302Bw==
X-Received: by 2002:a2e:3610:: with SMTP id d16mr16365371lja.254.1570460806236;
        Mon, 07 Oct 2019 08:06:46 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id n2sm3145517ljj.30.2019.10.07.08.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:06:44 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v12 4/8] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Mon,  7 Oct 2019 17:06:32 +0200
Message-Id: <20191007150636.16458-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007150636.16458-1-ribalda@kernel.org>
References: <20191007150636.16458-1-ribalda@kernel.org>
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
 Documentation/media/videodev2.h.rst.exceptions    | 1 +
 2 files changed, 7 insertions(+)

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
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index adeb6b7a15cb..b58e381bdf7b 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_H264_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
-- 
2.23.0

