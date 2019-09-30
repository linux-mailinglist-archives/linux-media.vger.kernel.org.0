Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38753C1ECF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 12:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730702AbfI3KS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 06:18:56 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44075 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfI3KSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 06:18:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id q11so6562889lfc.11;
        Mon, 30 Sep 2019 03:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KOQK/iTDEM2OOwuKD12eKM8a+YD1YCYg9jIBY8YMxOA=;
        b=nIlwUNtEuWG+RdUQES82jJzhCa7g/O2j6BFQ4cBlPni43csXpb5G52QOEa4ArbR0n8
         SHGJLVDBR2rSxnuqjv4skxxJnDyiJEzRmbMclOuVLok9urT+s42DKeQl6Ttvlf7scKjK
         H9hy9m2x/PSKmhEvzu3l4+moUTz5hhwVj43kuo/y/qEz6nOsTKD8sLSAzdAzThRT6PKS
         4Zp4aKkeucl9Kr7Rnlup3V0rqCUj6TnLonWFLoQAymtDD0sGEr3n0B9/OjK0IUAdnzbQ
         PYDGt85rWOPvm2t7MhBXMg3LZqoxbgeIMsWvD3N2WixpaTqXPMT2Dje9eIz470Dx4u1+
         fiQw==
X-Gm-Message-State: APjAAAXYVMP2bULjwCeyXjR3qykSFRmz+txC5kbQejkjWdq3FLnTDHss
        8zuFDGXYGIZUn/2igH8fBFs=
X-Google-Smtp-Source: APXvYqyaiVS3IKGD7skOoN07t6poEXXEA3lO6aR943IBpXNW0to+kmiQktPNpyeJpzzfvb2DSQJzmQ==
X-Received: by 2002:a19:7605:: with SMTP id c5mr11512283lff.114.1569838730105;
        Mon, 30 Sep 2019 03:18:50 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z8sm3805970lfg.18.2019.09.30.03.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:18:49 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v8 4/8] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Mon, 30 Sep 2019 12:18:37 +0200
Message-Id: <20190930101841.19630-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930101841.19630-1-ribalda@kernel.org>
References: <20190930101841.19630-1-ribalda@kernel.org>
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

