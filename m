Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F6E102256
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfKSKvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:51:25 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56431 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727638AbfKSKvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X16MiClSQcs92X16OiynYB; Tue, 19 Nov 2019 11:51:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574160680; bh=QJNKgbqqLCwOtr7xCFAGFzv4hgqLTxUBrVvrdQHGMME=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=N4VhK+l1V+TvOGKicGsIS/OBvgf6NQqbuE5MqzJLeAUYSlPo8s7Ou62PA174UH+RQ
         9ixD+zkEOPLyn8yien5tDCEio2qb0AKuATJ3GHhTivI21ZHR0h/60U+sFRwXGkIii9
         wHHKEsunvj5mEMxgAGCYsGfsCDAphPn+2Xw2+iRwy2pc8oyZ9VDMhPrEf+75MNisDS
         iwf75u894wZI6dwi6CRf//XQxMMVqKdk/aTaGWVEjdudNRLJWx1E4tux974ihC5AVS
         DFdtl9BiTsmWK2Ic4KXMxAHa/VadN8jdH9qcoBmel28LNGU8xoGrd5F4lK90FUC/Qo
         RaYpS6objA6Ag==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/5] pixfmt-tch-td16/tu16.rst: document that this is little endian
Date:   Tue, 19 Nov 2019 11:51:16 +0100
Message-Id: <20191119105118.54285-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITl6e8i82InOTHwXM3kdwYO2AxR8EsKQ3NIN50rAHb0nE7+NpDfx3mE0aarPKfcSasr0Ef93osdW5It+tibHUdNgekdaia7RnK1JLNhQe9ASaSRaj5Y
 01ScKcty+LNeFJk7S1KoU3uHCHNR/+GdaMmzWBexrnJQPZUBleqd1VFwyAiHcrwbjijryb0SIzJh+/W2xGnIofAyh8nccKoptJ2IxRw+4eHaVoINciU5/fmh
 uQYCUsTe1oqd//1y1LMgbJZpGVxy/vx86+7G1kdQdSKiTkDO09acp4XttZL7PEBZSHHh/y2lgAWQWtk1xlr2rXqF1UXKshBJgGpyjlzb0etJDqBE0XPFq7y+
 tUhSg0KxnAq6nkJf2uQFDKq+b2McMvnzVWvHUFmD+tVqsN7xzqyGGlKKlH+6JsKJXhVQ9hpSAkrXbw+FAUBtInmWE7pekAYhRS/+AbkWgAIru+kBPUm5qThf
 olwcCYk9h6xgzTBzYbBaB+ImNTreFf8npd3UDT5T+dh67J53wJ2Cu5wS9q4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Testing with the rmi_f54 driver on the Lenovo X1 Carbon 6th gen
laptop showed that the data is in little endian format. Update
the documentation accordingly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/uapi/v4l/pixfmt-tch-td16.rst        | 34 +++++++++----------
 .../media/uapi/v4l/pixfmt-tch-tu16.rst        | 34 +++++++++----------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst b/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
index 4031b175257c..6f1be873bec1 100644
--- a/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
@@ -15,7 +15,7 @@ V4L2_TCH_FMT_DELTA_TD16 ('TD16')
 
 *man V4L2_TCH_FMT_DELTA_TD16(2)*
 
-16-bit signed Touch Delta
+16-bit signed little endian Touch Delta
 
 
 Description
@@ -37,38 +37,38 @@ Each cell is one byte.
     :widths:       2 1 1 1 1 1 1 1 1
 
     * - start + 0:
-      - D'\ :sub:`00high`
       - D'\ :sub:`00low`
-      - D'\ :sub:`01high`
+      - D'\ :sub:`00high`
       - D'\ :sub:`01low`
-      - D'\ :sub:`02high`
+      - D'\ :sub:`01high`
       - D'\ :sub:`02low`
-      - D'\ :sub:`03high`
+      - D'\ :sub:`02high`
       - D'\ :sub:`03low`
+      - D'\ :sub:`03high`
     * - start + 8:
-      - D'\ :sub:`10high`
       - D'\ :sub:`10low`
-      - D'\ :sub:`11high`
+      - D'\ :sub:`10high`
       - D'\ :sub:`11low`
-      - D'\ :sub:`12high`
+      - D'\ :sub:`11high`
       - D'\ :sub:`12low`
-      - D'\ :sub:`13high`
+      - D'\ :sub:`12high`
       - D'\ :sub:`13low`
+      - D'\ :sub:`13high`
     * - start + 16:
-      - D'\ :sub:`20high`
       - D'\ :sub:`20low`
-      - D'\ :sub:`21high`
+      - D'\ :sub:`20high`
       - D'\ :sub:`21low`
-      - D'\ :sub:`22high`
+      - D'\ :sub:`21high`
       - D'\ :sub:`22low`
-      - D'\ :sub:`23high`
+      - D'\ :sub:`22high`
       - D'\ :sub:`23low`
+      - D'\ :sub:`23high`
     * - start + 24:
-      - D'\ :sub:`30high`
       - D'\ :sub:`30low`
-      - D'\ :sub:`31high`
+      - D'\ :sub:`30high`
       - D'\ :sub:`31low`
-      - D'\ :sub:`32high`
+      - D'\ :sub:`31high`
       - D'\ :sub:`32low`
-      - D'\ :sub:`33high`
+      - D'\ :sub:`32high`
       - D'\ :sub:`33low`
+      - D'\ :sub:`33high`
diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst b/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
index 8278543be99a..cb3da6687a58 100644
--- a/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
@@ -15,7 +15,7 @@ V4L2_TCH_FMT_TU16 ('TU16')
 
 *man V4L2_TCH_FMT_TU16(2)*
 
-16-bit unsigned raw touch data
+16-bit unsigned little endian raw touch data
 
 
 Description
@@ -36,38 +36,38 @@ Each cell is one byte.
     :widths:       2 1 1 1 1 1 1 1 1
 
     * - start + 0:
-      - R'\ :sub:`00high`
       - R'\ :sub:`00low`
-      - R'\ :sub:`01high`
+      - R'\ :sub:`00high`
       - R'\ :sub:`01low`
-      - R'\ :sub:`02high`
+      - R'\ :sub:`01high`
       - R'\ :sub:`02low`
-      - R'\ :sub:`03high`
+      - R'\ :sub:`02high`
       - R'\ :sub:`03low`
+      - R'\ :sub:`03high`
     * - start + 8:
-      - R'\ :sub:`10high`
       - R'\ :sub:`10low`
-      - R'\ :sub:`11high`
+      - R'\ :sub:`10high`
       - R'\ :sub:`11low`
-      - R'\ :sub:`12high`
+      - R'\ :sub:`11high`
       - R'\ :sub:`12low`
-      - R'\ :sub:`13high`
+      - R'\ :sub:`12high`
       - R'\ :sub:`13low`
+      - R'\ :sub:`13high`
     * - start + 16:
-      - R'\ :sub:`20high`
       - R'\ :sub:`20low`
-      - R'\ :sub:`21high`
+      - R'\ :sub:`20high`
       - R'\ :sub:`21low`
-      - R'\ :sub:`22high`
+      - R'\ :sub:`21high`
       - R'\ :sub:`22low`
-      - R'\ :sub:`23high`
+      - R'\ :sub:`22high`
       - R'\ :sub:`23low`
+      - R'\ :sub:`23high`
     * - start + 24:
-      - R'\ :sub:`30high`
       - R'\ :sub:`30low`
-      - R'\ :sub:`31high`
+      - R'\ :sub:`30high`
       - R'\ :sub:`31low`
-      - R'\ :sub:`32high`
+      - R'\ :sub:`31high`
       - R'\ :sub:`32low`
-      - R'\ :sub:`33high`
+      - R'\ :sub:`32high`
       - R'\ :sub:`33low`
+      - R'\ :sub:`33high`
-- 
2.23.0

