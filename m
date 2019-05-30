Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D922F97B
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 11:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfE3Jda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 05:33:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39097 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfE3Jd3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 05:33:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so3724712wrt.6
        for <linux-media@vger.kernel.org>; Thu, 30 May 2019 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6m1gjqr7LLo5czWaTNxbcS9O7G75X5W+OVxVsjgwdOk=;
        b=dmyIRlMRlkjOTvPMU8h28OONRBSGMbu5OSkC56ceQtI82uyy9wZSUWnAAFvv4qeefD
         1uH+WS2sxeXVRW2DNdtQA1dDIEw6uVypGKzciRZoT6bctV3lMYh+jNP1ZR36djmDCLjw
         VKLc53Cg59P21NX3oLbIHnVwGGcPUG1neQP65J7MTFocgNYwh20lwAGvv3Ngi8M2C82+
         0fvLmrK0jdeSOBNSEQdAbiJWsx3fUupQM0n/aD6hJWbVcLzf+l4XVtOED3rcZchEf3ut
         bVwX3gW/aTaj4Dm6vSGvA5Jlw9ng9ZXieYne8XtFL5y7PF4Y3iBDODeM8v5OEF8Ttnc3
         biHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6m1gjqr7LLo5czWaTNxbcS9O7G75X5W+OVxVsjgwdOk=;
        b=hph3X1QPqXkRSwV9/lNIjNyzHhr521tYZeDjxlQuW0/HvjNoLJBsf6s2bibQdwMKnY
         /eHvg3x4U5kKjcCOdFU3aXQUTA180EKjmuulwDfAn6bCXNHE01sM5NYGVu4xsmMTLjai
         py7ZHAJtgOeCrixToYB3SqLg+gkzvaga4Q/sdWPZQU/zvaYXlYKx847Rw0O1L2NggHtZ
         jDe6LmOipj8rftwrHGAuSNR0sH60NzqQJE645ysgUY8yFzJrt1rcyP6akcoqfoUs2BIF
         +/eeELIFEfyhrTuOIColb0XH28z/2z6QpBo5tETAxz1A471xZKd8fJzUu2NXrNdY8sIB
         ZcYg==
X-Gm-Message-State: APjAAAXT+HfcJf5gqWxeBRJ9MDYkJqN2RavVkyqU9XMop20A11k6pStu
        YUN/yEL3ndaNxJgNWE4wjn3uauxHWFE=
X-Google-Smtp-Source: APXvYqxEASlLnIkp5PQbSa4BfrTxFJ6g24r6qZiMp+C9TsnMS8uQxuD/y1DzZGzNDx7DhMVpHGITmg==
X-Received: by 2002:adf:c982:: with SMTP id f2mr1940460wrh.235.1559208808019;
        Thu, 30 May 2019 02:33:28 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id a124sm2863900wmh.3.2019.05.30.02.33.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 02:33:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3] media/doc: Allow sizeimage to be set by v4l clients
Date:   Thu, 30 May 2019 12:33:12 +0300
Message-Id: <20190530093312.27562-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
field description to allow v4l clients to set bigger image size
in case of variable length compressed data.

Presently s5p-mfc and mtk-vcodec codec drivers use that. Lets
make it obvious in the documentation.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
Changes since v2:
Addressed review comments from Mauro.

 .../media/uapi/v4l/pixfmt-v4l2-mplane.rst         | 15 ++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst      | 13 ++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
index 5688c816e334..db43dda5aafb 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
@@ -31,7 +31,20 @@ describing all planes of that format.
 
     * - __u32
       - ``sizeimage``
-      - Maximum size in bytes required for image data in this plane.
+      - Maximum size in bytes required for image data in this plane,
+	set by the driver. When the image consists of variable length
+	compressed data this is the number of bytes required by the
+	codec to support the worst-case compression scenario.
+
+	The driver will set the value for uncompressed images.
+
+	Clients are allowed to set the sizeimage field for variable length
+	compressed data flagged with ``V4L2_FMT_FLAG_COMPRESSED`` at
+	:ref:`VIDIOC_ENUM_FMT`, but the driver may ignore it and set the
+	value itself, or it may modify the provided value based on
+	alignment requirements or minimum/maximum size requirements.
+	If the client wants to leave this to the driver, then it should
+	set sizeimage to 0.
     * - __u32
       - ``bytesperline``
       - Distance in bytes between the leftmost pixels in two adjacent
diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
index 71eebfc6d853..da6da2ef139a 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
@@ -89,7 +89,18 @@ Single-planar format structure
       - Size in bytes of the buffer to hold a complete image, set by the
 	driver. Usually this is ``bytesperline`` times ``height``. When
 	the image consists of variable length compressed data this is the
-	maximum number of bytes required to hold an image.
+	number of bytes required by the codec to support the worst-case
+	compression scenario.
+
+	The driver will set the value for uncompressed images.
+
+	Clients are allowed to set the sizeimage field for variable length
+	compressed data flagged with ``V4L2_FMT_FLAG_COMPRESSED`` at
+	:ref:`VIDIOC_ENUM_FMT`, but the driver may ignore it and set the
+	value itself, or it may modify the provided value based on
+	alignment requirements or minimum/maximum size requirements.
+	If the client wants to leave this to the driver, then it should
+	set sizeimage to 0.
     * - __u32
       - ``colorspace``
       - Image colorspace, from enum :c:type:`v4l2_colorspace`.
-- 
2.17.1

