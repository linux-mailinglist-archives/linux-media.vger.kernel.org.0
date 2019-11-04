Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD0AEE0AC
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfKDNJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:09:40 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34663 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbfKDNJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:09:38 -0500
Received: by mail-lj1-f195.google.com with SMTP id 139so17562773ljf.1;
        Mon, 04 Nov 2019 05:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sjj30/458E859XQbnjLj4WwTf4kInVK2hNYmrjy4KYE=;
        b=LbP/PLJc7r6DKKlK2u6h3yg28y6C54o/XkbCEpvvKcZehQkXRBwa71E+Whf4YX0ogw
         s4uyiLMBMUf/1Yi+SGqWPPj7oJ5hHeH4rJfzC2NN2qIwRe4p24j6qP1BIUAbWCzitOyM
         Nj47uQStItOGpdxLw/tPMVJ9Z4drB8HXowc2i+8UY5rRU19NcrHghYIlnDJryVS46xQo
         YtiRoazDI9xMrHMcI4GHyCvxQw12WQ071pcLXIOzpzpzymwHIR0+PyV/J3+/wnP1Lqnt
         FLmWuAjwUZXAwmH6jsxT++HeiH4XMSvSjqZyA+KzJs23KI/CwkBTLelytajKCV5ay6QW
         4h6w==
X-Gm-Message-State: APjAAAWWxktVdDUY/Hy3diP1X3CMYzZFEcKUog/M5Kj9UW2z+YfzDHio
        dKbFEz9P1/KE7bHpTE4U+OOGRrTt+UY=
X-Google-Smtp-Source: APXvYqzyxtz+Iwz3Yh3awlpBY2DgMBQeAfmt7kvGJbVgXdIYYcwbFPwPqQHT/OVrUCdTysAeLoyYmQ==
X-Received: by 2002:a2e:914b:: with SMTP id q11mr4737209ljg.13.1572872976283;
        Mon, 04 Nov 2019 05:09:36 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id q124sm985414ljq.93.2019.11.04.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:09:35 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v4 5/6] Documentation: v42l_core: v4l2_ext_control
Date:   Mon,  4 Nov 2019 14:09:22 +0100
Message-Id: <20191104130923.22184-5-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104130923.22184-1-ribalda@kernel.org>
References: <20191104130923.22184-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Describe p_area field from v4l2_ext_ctrl

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
index 13dc1a986249..271cac18afbb 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
@@ -198,6 +198,11 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * -
+      - :c:type:`v4l2_area` *
+      - ``p_area``
+      - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_AREA``.
     * -
       - void *
       - ``ptr``
-- 
2.24.0.rc1

