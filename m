Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3249AFC2
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394826AbfHWMiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:38:16 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37123 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393115AbfHWMhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:45 -0400
Received: by mail-ed1-f65.google.com with SMTP id f22so13261381edt.4;
        Fri, 23 Aug 2019 05:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQDKuRwKWXsE4cqCDj1O7R1+PybASpMYa+6ozs2PYn0=;
        b=e+ek23PECyqBD1bW7FHYyiLQQAQiYSuSfQ/lqQ9dCi72Wq7HpSVW85ePNxr8ReQCkY
         OPpwxIH+ojCwmIIZOKp3KoP+kn9NN9EflNOKN8e4B0DiNoQGby+k4HRnKX/pRJPejwaC
         qkTnl31qbgkPH851H5TB04VQ75T2/p7SYZIH6xvzP4XAwHYye1tUxKzO2vzCEK6wCOkb
         mc5kyq4oQLUYVahrEWrerYyL+hwOSGVVEmsNLMfuzoVIXJ7lLhGwZLiRyn6ngm96bH8N
         ypw2hxFF/wNfHhVcJR1RSi6mMfqsRRIE/BVWioWyjvWCKMzt7rD5CVWhBJMysz7TP2Ly
         ZkcA==
X-Gm-Message-State: APjAAAV8RGuc8m8LE4dxboVpQKEKERkr9m9Vnr8qPPN3fEZKCFzFM79y
        f6kwZGoybeMZFS6QI62m2CM=
X-Google-Smtp-Source: APXvYqyhg+pbF2r8JVvzlfziGDuaIUOwdnhvJneGPjM77WmKPH/8Unv6pAwYfE123Sfva7Jm0QuqSA==
X-Received: by 2002:aa7:d397:: with SMTP id x23mr4100673edq.11.1566563863837;
        Fri, 23 Aug 2019 05:37:43 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:42 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 3/7] Documentation: media: Document V4L2_CTRL_TYPE_AREA
Date:   Fri, 23 Aug 2019 14:37:33 +0200
Message-Id: <20190823123737.7774-3-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A struct v4l2_area containing the width and the height of a rectangular
area.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index a3d56ffbf4cc..c09d06ef2b08 100644
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
+        of a rectangular area.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
-- 
2.23.0.rc1

