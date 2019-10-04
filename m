Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7587FCB98A
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 13:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbfJDLzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 07:55:36 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:38342 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJDLzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 07:55:36 -0400
Received: by mail-pl1-f173.google.com with SMTP id w8so3038222plq.5
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=C2pUvODyeg7WJS3tOnU014Q1LpOSCXgT+3Q77jZRAIE=;
        b=CTqYbCe7Wg7gh/1DynGQyBDF5XT0iT6xhykzskmnWg6+F6mk9ezH4hritZJtSDYS39
         xAs/P8acx5mVvm2s63mfBWO5yL7r3FeFuqLkHQLTrHiw7KT8FYNstjBuQG3QvAAiirgK
         k/zkkRqfxtGLp4aEJ20UGw+qTCicZHFhFz2CFYzZ9JEI61VwPsMTKsgK1MTY4tD4WhUj
         5lQbnehuJPiRKwR2eFHbFNfcVkQLtc40CCVMTmUsdW0RH/8MUXYLlv8LIijjOdZ/cbtm
         jMPbqq1bWpcnAYRUt9Ol94V4PqjCfSC7uSrxM/0YLyTr5qdQGzt/ttARBJ3Pye2Ubr/L
         LXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=C2pUvODyeg7WJS3tOnU014Q1LpOSCXgT+3Q77jZRAIE=;
        b=mCHeO9Vk7E/3/eAlL04SQVdxVq7SjNFg9IUxKsfcg5+RmMcW+tY5PCEsccw+1Hk5Ra
         yS9SjiJf2gFaRwnv8p0ccJ8H++WQtGnnnye0UIbihzbFdbIwGEZe43r9jkRKYOoaXcv5
         D2C6w+ogZCjkbN+hC5N6+85tdaACl2r7fowJOATCCwytQVcCr8T0VR27kbRWGA4qRsqm
         VrZxPxnbTth9PUyi5ApPYFKFEcth+KiUMNDgB02ayxGEJmInEIl9OWJFayqKnaQ9QDzd
         RdTK2a3COeHOyPv0M6jgEOKYaSHv7yIXufRVDBrS4YReiZdntn5kPmCgK3vt5StOwObM
         I1dA==
X-Gm-Message-State: APjAAAVymfMniA2LP3aT+fRH0tuQKbmrSbT0PwH4ByzWQfD+6J7RhwQl
        6UxDfQyQITZIvUPPN41W06vjaeY7
X-Google-Smtp-Source: APXvYqx3mxlIBoYa5xttFy7as19k2Loes2z/POd5WDtauZ0L3Ay9TpsAuhoUAGYKKzDuC+cBgvv5wQ==
X-Received: by 2002:a17:902:b949:: with SMTP id h9mr15233707pls.35.1570190134108;
        Fri, 04 Oct 2019 04:55:34 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.195.107])
        by smtp.gmail.com with ESMTPSA id w189sm6465716pfw.101.2019.10.04.04.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 04:55:33 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] Documentation:media:v4l2:Add vivid metadata doc
Date:   Fri,  4 Oct 2019 17:25:14 +0530
Message-Id: <20191004115514.31259-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds new file for describing new metadata format V4L2_META_FMT_VIVID added in vivid driver.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 Documentation/media/uapi/v4l/meta-formats.rst |  1 +
 .../media/uapi/v4l/pixfmt-meta-vivid.rst      | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst

diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
index b10ca9ee3968..74c8659ee9d6 100644
--- a/Documentation/media/uapi/v4l/meta-formats.rst
+++ b/Documentation/media/uapi/v4l/meta-formats.rst
@@ -24,3 +24,4 @@ These formats are used for the :ref:`metadata` interface only.
     pixfmt-meta-uvc
     pixfmt-meta-vsp1-hgo
     pixfmt-meta-vsp1-hgt
+    pixfmt-meta-vivid
diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
new file mode 100644
index 000000000000..e6c349fadf30
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
@@ -0,0 +1,43 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/media/uapi/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _v4l2-meta-fmt-vivid:
+
+*******************************
+V4L2_META_FMT_VIVID ('VIVID')
+*******************************
+
+VIVID Metadata Format
+
+
+Description
+===========
+
+This format describes metadata in vivid driver.
+
+It sets Brightness, Saturation, Contrast and Hue, each of which maps to
+corresponding control in vivid driver with respect to its range and default values.
+
+It contains the following fields:
+
+.. flat-table:: VIVID Metadata
+    :widths: 1 4
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Field
+      - Description
+    * - u16 brightness;
+      - Image brightness, value can be in range 0 to 255, with default value as 128.
+    * - u16 contrast;
+      - Image contrast, value can be in range 0 to 255, with default value as 128.
+    * - u16 saturation;
+      - Image color saturation, value can be in range 0 to 255, with default value as 128.
+    * - s16 hue;
+      - Image color balance, value can be in range -128 to 128, with default value as 0.
-- 
2.17.1

