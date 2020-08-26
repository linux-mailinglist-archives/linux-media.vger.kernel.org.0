Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C917A252851
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 09:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgHZHSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 03:18:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbgHZHSt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 03:18:49 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9AAA2071E;
        Wed, 26 Aug 2020 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598426328;
        bh=0x9ncJQIGlCkEuJhLzZ1EuCxyoWzRXNvdeYep6RQ+5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p6g7zIemwUgyTu6hyjK0M5mkDRULyfTJb3rysCmGquEowsshS1qwOsgKFtB/mvI/p
         vS9YgMe3RO+iAheZAuHPMMq8d4TgnqcqraQFSCdX5NdVGiNP5A70SmoOHFvbkBuAGq
         lqT4FU1+HbqsF9+KfPt/Q+vO+61XoG8KS/9QYAjw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAphl-001Raf-V6; Wed, 26 Aug 2020 09:18:45 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     linux-media@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/4] media: docs: use the new SPDX header for GFDL-1.1 on *.svg files
Date:   Wed, 26 Aug 2020 09:18:37 +0200
Message-Id: <f37dc4587f1adbf57c44c9e204c748d97c802fb8.1598426302.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <929df929283e38b388f601c2ba521257e38cc566.1598426302.git.mchehab+huawei@kernel.org>
References: <929df929283e38b388f601c2ba521257e38cc566.1598426302.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SPDX v3.10 gained support for GFDL-1.1 with no invariant sections:

	https://spdx.org/licenses/GFDL-1.1-no-invariants-or-later.html

So, remove the license text, replacing them by this new SPDX license.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/typical_media_device.svg      | 11 +----------
 Documentation/userspace-api/media/v4l/crop.svg        | 11 +----------
 Documentation/userspace-api/media/v4l/fieldseq_bt.svg | 11 +----------
 Documentation/userspace-api/media/v4l/fieldseq_tb.svg | 11 +----------
 .../media/v4l/subdev-image-processing-crop.svg        | 11 +----------
 .../media/v4l/subdev-image-processing-full.svg        | 11 +----------
 .../subdev-image-processing-scaling-multi-source.svg  | 11 +----------
 Documentation/userspace-api/media/v4l/vbi_525.svg     | 11 +----------
 Documentation/userspace-api/media/v4l/vbi_625.svg     | 11 +----------
 Documentation/userspace-api/media/v4l/vbi_hsync.svg   | 11 +----------
 10 files changed, 10 insertions(+), 100 deletions(-)

diff --git a/Documentation/userspace-api/media/typical_media_device.svg b/Documentation/userspace-api/media/typical_media_device.svg
index 3420341ff7b6..fca7af8e438b 100644
--- a/Documentation/userspace-api/media/typical_media_device.svg
+++ b/Documentation/userspace-api/media/typical_media_device.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg id="svg2" width="235mm" height="179mm" clip-path="url(#a)" fill-rule="evenodd" stroke-linejoin="round" stroke-width="28.222" preserveAspectRatio="xMidYMid" version="1.2" viewBox="0 0 22648.239 17899.829" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata id="metadata1533"><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata><defs id="defs4"><clipPath id="a"><rect id="rect7" width="28000" height="21000"/></clipPath></defs><path id="path11" d="m10146 2636c-518.06 0-1035.1 515-1035.1 1031v4124c0 516 517.06 1032 1035.1 1032h8572.2c518.06 0 1036.1-516 1036.1-1032v-4124c0-516-518.06-1031-1036.1-1031h-8572.2z"
 fill="#fcf" style=""/><path id="path15" d="m1505.5 13443c-293 0-585 292-585 585v2340c0 293 292 586 585 586h3275c293 0 586-293 586-586v-2340c0-293-293-585-586-585h-3275z" fill="#ffc" style=""/><path id="path19" d="m517.15 22.013c-461 0-922 461-922 922v11169c0 461 461 923 922 923h3692c461 0 922-462 922-923v-11169c0-461-461-922-922-922h-3692z" fill="#e6e6e6" style=""/><path id="path23" d="m2371.5 6438h-2260v-1086h4520v1086h-2260z" fill="#ff8080" style=""/><path id="path25" d="m2371.5 6438h-2260v-1086h4520v1086h-2260z" fill="none" stroke="#3465af" style=""/><text id="text27" class="TextShape" x="-2089.4541" y="-2163.9871" font-family="Serif, serif" font-size="493.88px"><tspan id="tspan29" class="TextParagraph" font-family="Serif, serif" font-size="493.88px"><tspan id="tspan31" class="TextPosition" x="489.5459" y="6111.0132" font-family="Serif, serif" font-size="493.88px"><tspan id="tspan33"
 fill="#000000" font-family="Serif, serif" font-size="493.88px">Audio decoder</tspan></tspan></tspan></text>
diff --git a/Documentation/userspace-api/media/v4l/crop.svg b/Documentation/userspace-api/media/v4l/crop.svg
index 4cd47f98e7c8..5483227757e7 100644
--- a/Documentation/userspace-api/media/v4l/crop.svg
+++ b/Documentation/userspace-api/media/v4l/crop.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/fieldseq_bt.svg b/Documentation/userspace-api/media/v4l/fieldseq_bt.svg
index b663f6fcb70b..91ac2813b454 100644
--- a/Documentation/userspace-api/media/v4l/fieldseq_bt.svg
+++ b/Documentation/userspace-api/media/v4l/fieldseq_bt.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/fieldseq_tb.svg b/Documentation/userspace-api/media/v4l/fieldseq_tb.svg
index f8b440a1cb60..7b4f8fb33757 100644
--- a/Documentation/userspace-api/media/v4l/fieldseq_tb.svg
+++ b/Documentation/userspace-api/media/v4l/fieldseq_tb.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg b/Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg
index 109bbcebd3b4..d92311281e01 100644
--- a/Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg
+++ b/Documentation/userspace-api/media/v4l/subdev-image-processing-crop.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg b/Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg
index cfdb7532d5b6..864a594ff8d0 100644
--- a/Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg
+++ b/Documentation/userspace-api/media/v4l/subdev-image-processing-full.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg b/Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg
index f7f1379d30a6..b75755d31f15 100644
--- a/Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg
+++ b/Documentation/userspace-api/media/v4l/subdev-image-processing-scaling-multi-source.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/vbi_525.svg b/Documentation/userspace-api/media/v4l/vbi_525.svg
index b7d09057617e..b01086d466a6 100644
--- a/Documentation/userspace-api/media/v4l/vbi_525.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_525.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/vbi_625.svg b/Documentation/userspace-api/media/v4l/vbi_625.svg
index e1f5e8552c37..41c1ce920d14 100644
--- a/Documentation/userspace-api/media/v4l/vbi_625.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_625.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
diff --git a/Documentation/userspace-api/media/v4l/vbi_hsync.svg b/Documentation/userspace-api/media/v4l/vbi_hsync.svg
index 77606a7b00a4..7fcf12a7ece0 100644
--- a/Documentation/userspace-api/media/v4l/vbi_hsync.svg
+++ b/Documentation/userspace-api/media/v4l/vbi_hsync.svg
@@ -1,14 +1,5 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
-<!--
-    Permission is granted to copy, distribute and/or modify this
-    document under the terms of the GNU Free Documentation License,
-    Version 1.1 or any later version published by the Free Software
-    Foundation, with no Invariant Sections, no Front-Cover Texts
-    and no Back-Cover Texts. A copy of the license is included at
-    Documentation/userspace-api/media/fdl-appendix.rst.
-
-    TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
--->
+<!-- SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later -->
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cc="http://creativecommons.org/ns#"
-- 
2.26.2

