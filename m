Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F89CBA43
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 14:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbfJDMWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 08:22:02 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:37676 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729844AbfJDMWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 08:22:01 -0400
Received: by mail-pf1-f173.google.com with SMTP id y5so3818240pfo.4
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=01yVsoKoYq7ZPKYAtyMMFcSk++LgCexu03pTs4V/dbc=;
        b=tZijpD5FwU0e/HhfbN4auOuNlbqzPeBMH6Co7/RCeHC1YcZxhKI8yV7APXRwto39Ok
         EW3Enu9ZR5np/FUrrKIkU26nSELpIXFX8o7ju3nnSaezC6xZoQ4QmDOobSCEozTqn7yW
         5eZfRpiwa5xL9DyQslgZ0s8MWFaJI0tni2u1Y8p3viyf967rkXebtpcXoOymIdquSqTg
         gGMEWz1bc0obKiHFp0lGGteY8bmV1Esv3xsmclKrbibJxTAY0Guxi7TPuMaqdFo5pTD3
         t1fuls2wMU6hzTlUmX5+FGI8BPxPgzgiMwJtM7ddABCKn3YszWgeQ/M+9G2UA+ev3D7H
         wHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=01yVsoKoYq7ZPKYAtyMMFcSk++LgCexu03pTs4V/dbc=;
        b=kKMRMSCWBdyh0DDxZbWSOS0f9Ls4feKFue07vUqsjBKz6Z79IWHWtmXWx0zJkSueHQ
         qFxCxaULD5gwj2VEaHZL8CeJ9A0YQDBm1p1Iupm24Nq6iDDyhu0VAA/8p3r2lwXfRAVz
         88xooeU/tffHlrX1yTHV4pKe8MqE8P95hQafl6W9IJWhkhPDUas/9oJhow4wr1H3Gn8/
         WkJZuQJLoYvm2mrd3EYqjGu1QjbUIJjFgFQGWDRRL48VWhzn8zNUkcy/k6BpqtBQDzC9
         /pjUi3iyW0nOj3RmaSn4DY1lYP3eoI6nD5ksz3Zu/xf8JF12H1RH4Qy1/mMp8qeIjHu1
         Cf6A==
X-Gm-Message-State: APjAAAX9F/GgLznBy3rNkytyFp1alFevrsW0+KC1xclcggBgE1yqIqE/
        mCA6GNNJQPvRpU2RNntAiegNcAr7
X-Google-Smtp-Source: APXvYqyYwvGxyiPtpl48EDsmkP8/VDB0ZoSfLinJKch1oPiCxcoceZR1rwmaV2wFCxJ1Bay7m8ifVw==
X-Received: by 2002:a63:1c65:: with SMTP id c37mr14939955pgm.31.1570191720381;
        Fri, 04 Oct 2019 05:22:00 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.195.107])
        by smtp.gmail.com with ESMTPSA id c11sm8420096pfj.114.2019.10.04.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 05:21:59 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] Documentation:media:v4l2:Add vivid metadata doc
Date:   Fri,  4 Oct 2019 17:51:52 +0530
Message-Id: <20191004122152.32378-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3db91bd0-cfdd-6453-6e70-8567ac94d68e@xs4all.nl>
References: <3db91bd0-cfdd-6453-6e70-8567ac94d68e@xs4all.nl>
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
index 000000000000..68f9df623064
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
+V4L2_META_FMT_VIVID ('VIVD')
+*******************************
+
+VIVID Metadata Format
+
+
+Description
+===========
+
+This describes the metadata format used by the vivid driver.
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

