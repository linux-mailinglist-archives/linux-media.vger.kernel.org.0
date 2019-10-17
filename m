Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF5B7DA5BB
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 08:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407834AbfJQGnb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 02:43:31 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:46861 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJQGnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 02:43:31 -0400
Received: by mail-pl1-f172.google.com with SMTP id q24so623903plr.13
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 23:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GUVwmMWs+NFlwsRyyMUic0tAt1lmwPLXgtIetiZT8JU=;
        b=t3gqADDiZ0uyssnk6nftb9UKY/+p7nnMTQ2e3wNxjQkGO2YpA/Y0aUYR/BL3pugp/m
         7nn4kxL1g/rsC4sQCicRdJIWotHzgZ8aIRxGvgIN4/91hfZ9yN1yDn4FOMZTo/7tPBFN
         IXql7HF08VcCPpjM5Wobc2ZwqJ0r19ZkAcHc31Fr5iIw1utZaFJLrXnuqMZeIhyCKmV5
         wd1iaoobU3fxc/wFpvkJWDtPJvPtqP79b1xWOTWA1nlGCwa8PqFpAoLuTyHo3n9YIJIO
         E9EpXbZKfxbOgLHyhwifsGQkNk8SfKpfPlR1DKOyimBtJk2U8orgYogf7DI8E8snWRxB
         dSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GUVwmMWs+NFlwsRyyMUic0tAt1lmwPLXgtIetiZT8JU=;
        b=PqteTZCesULwktJORB874WGlO/3T7/9peGvRQCRCgXGFRbt30jsb+yAVaGKfS+THS5
         4G9BpG569mCXzRYWiRxGoCc6sNErGXBSmpckfEkKj372Tn/ZGBX7PMV1DF+cq/lVH+qS
         wXyFg6iVbEPpML88vmfbxODmF+M9yf9uBYiBMzhfKAzYs+l+MoUj5KG+YV8Kpj+14y3P
         6E4gmzKPNHGrjrf0F0m8LoMU3ffgGZzjkx5T1UIJWvy01F1PTLLE2nlb+49kHWM0Cmqy
         skqQjuyZi9VZuI2gEDPmKoNiUih1yQ58bQLKn/ltLqqSfnMIxawAorzKnPZqpyNHM1SU
         ZBgg==
X-Gm-Message-State: APjAAAXMHYTDALEr+y2UpPD1qhWkZHqTxmSxwrJ0rKYwPGlKhes2Jlc6
        ITCYe0/53WTdSPUMCuomjh+Y8/rC
X-Google-Smtp-Source: APXvYqz1aQoN4b1Za7gtHXkea+RZG4cMR8JRQlvI0nO3Cj7UbkO2z/J1aAspTobYmMo3CoEtL25Sdw==
X-Received: by 2002:a17:902:7885:: with SMTP id q5mr2226365pll.317.1571294610171;
        Wed, 16 Oct 2019 23:43:30 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([61.1.209.17])
        by smtp.gmail.com with ESMTPSA id f6sm1222003pfq.169.2019.10.16.23.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 23:43:29 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v3] Documentation:media:v4l2:Add vivid metadata doc
Date:   Thu, 17 Oct 2019 12:13:08 +0530
Message-Id: <20191017064308.5924-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016164503.01b9f037@coco.lan>
References: <20191016164503.01b9f037@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds new file for describing new metadata format V4L2_META_FMT_VIVID added in vivid driver.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
Change in V3 - modified pixfmt-meta-vivid.rst to have dual GFDL and GPL license.
---
 Documentation/media/uapi/v4l/meta-formats.rst |  1 +
 .../media/uapi/v4l/pixfmt-meta-vivid.rst      | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
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
index 000000000000..eed20eaefe24
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
@@ -0,0 +1,60 @@
+.. This file is dual-licensed: you can use it either under the terms
+.. of the GPL 2.0 or the GFDL 1.1+ license, at your option. Note that this
+.. dual licensing only applies to this file, and not this project as a
+.. whole.
+..
+.. a) This file is free software; you can redistribute it and/or
+..    modify it under the terms of the GNU General Public License as
+..    published by the Free Software Foundation version 2 of
+..    the License.
+..
+..    This file is distributed in the hope that it will be useful,
+..    but WITHOUT ANY WARRANTY; without even the implied warranty of
+..    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+..    GNU General Public License for more details.
+..
+.. Or, alternatively,
+..
+.. b) Permission is granted to copy, distribute and/or modify this
+..    document under the terms of the GNU Free Documentation License,
+..    Version 1.1 or any later version published by the Free Software
+..    Foundation, with no Invariant Sections, no Front-Cover Texts
+..    and no Back-Cover Texts. A copy of the license is included at
+..    Documentation/media/uapi/fdl-appendix.rst.
+..
+.. TODO: replace it to GPL-2.0 OR GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _v4l2-meta-fmt-vivid:
+
+*******************************
+V4L2_META_FMT_VIVID ('VIVD')
+*******************************
+
+VIVID Metadata Format
+
+
+Description
+===========
+
+This describes metadata format used by the vivid driver.
+
+It sets Brightness, Saturation, Contrast and Hue, each of which maps to
+corresponding controls of the vivid driver with respect to the range and default values.
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
+      - Image brightness, the value is in the range 0 to 255, with the default value as 128.
+    * - u16 contrast;
+      - Image contrast, the value is in the range 0 to 255, with the default value as 128.
+    * - u16 saturation;
+      - Image color saturation, the value is in the range 0 to 255, with the default value as 128.
+    * - s16 hue;
+      - Image color balance, the value is in the range -128 to 128, with the default value as 0.
-- 
2.17.1

