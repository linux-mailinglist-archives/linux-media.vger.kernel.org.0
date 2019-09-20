Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55CFCB9125
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387606AbfITNv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:51:59 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43927 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387550AbfITNvv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:51 -0400
Received: by mail-ed1-f68.google.com with SMTP id r9so6472342edl.10;
        Fri, 20 Sep 2019 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoO9ckVp6bHsGgArvJADN8syjSaSq361EX8PoKgrbQ8=;
        b=skWvAAG3BOQRM5aNO1mUSVrRRNoiwV5Kp0qLU0Br++DdKD/YmO+tfpS/QdhQmFVMQi
         cx91OpQ/3b4lXA1DFm1rFaCKpz9Yqpl6U3nabr3Q8GiikQLRzjSILfbGFEcD8lqdOqu1
         N7+NUDUjngyBydMktHpwQSPYOnT8clj0Lt7ZRdQzA2illEY69eK7IdjXE/dk/geBtKPm
         HxJmvrd6Ig2DXqRl5qN1QmodLXPOeJ0xJsz1JAG03wIvTsh2hT1s2w3scjBG66LFiGrq
         a8KM53zALhlGsnOJihehOUGD2ddrfZXgIsBCOpv2zptLzqyo9N2ah8Ewa1DUR4bNqFV3
         4E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zoO9ckVp6bHsGgArvJADN8syjSaSq361EX8PoKgrbQ8=;
        b=ImUC8j9j7WRhTuFqrX2k3DNMjYZzAWWVbBylwjEFHZTOwxoUPorlTqEw0pXi/TRQCl
         rml15pJX8C3EbNADmOW5LgORkvc11NaEvBCwLzI6JUP6KgbvpxVyWHRJ+0Fg97Ypva9v
         LSWWxKIkleOGtD4yhIxQdOufL8fWFpGiFMik9pimnheRNeOphfL1LiowvjS+o7XrGnSD
         QSupsXRXrmJTfmcHCS04KNlqaQVN3mQCym8DXGpTAtA/O/IwOaKY6NAx7L4WWuGftFyx
         V9V2KOOPCMF+M0/YyUeQrFTttneiHvx6WlWaEg9z8P2CaX3dzAODZHOINuobNwDWG9sd
         Nzcg==
X-Gm-Message-State: APjAAAUtMyr1HwCGLYIKayc6VsPfq6vFwXsiVnLnTo23r2Sg0F+zo3oo
        KMjNoR2N4n+bif7uoXQNvPw=
X-Google-Smtp-Source: APXvYqy72sSGoO8AB/vtmTkGyiZJDlZHv/imCwCwJSHIWvRQAnnJnVUcX0egMVQsLk9nNekCfRDmEQ==
X-Received: by 2002:aa7:dc55:: with SMTP id g21mr18237719edu.210.1568987509359;
        Fri, 20 Sep 2019 06:51:49 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id t30sm337673edt.91.2019.09.20.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:51:48 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v6 6/7] Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
Date:   Fri, 20 Sep 2019 15:51:36 +0200
Message-Id: <20190920135137.10052-7-ricardo@ribalda.com>
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

