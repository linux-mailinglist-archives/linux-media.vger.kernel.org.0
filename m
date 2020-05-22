Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136491DDC52
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 02:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgEVAuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 20:50:17 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:39653 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgEVAuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 20:50:17 -0400
X-Halon-ID: 274cec5b-9bc6-11ea-a73e-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 274cec5b-9bc6-11ea-a73e-0050569116f7;
        Fri, 22 May 2020 02:49:59 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] doc-rst: Fix typos in packed Bayer raw14 pixel formats diagram
Date:   Fri, 22 May 2020 02:50:07 +0200
Message-Id: <20200522005007.314491-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two typos in the byte order diagram. On row 1 and 3 the low
bits for the 3rd pixel B02 and B22 are labeled as R02 and R22. On row 2
the row index is 0 for all pixels where it should be 1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../media/v4l/pixfmt-srggb14p.rst             | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
index ec1239ada316fa49..e2f5a2b360921315 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
@@ -69,37 +69,37 @@ Each cell is one byte.
 
 	  B\ :sub:`00low bits 5--0`\ (bits 5--0)
 
-       -  R\ :sub:`02low bits 3--0`\ (bits 7--4)
+       -  B\ :sub:`02low bits 3--0`\ (bits 7--4)
 
 	  G\ :sub:`01low bits 5--2`\ (bits 3--0)
 
        -  G\ :sub:`03low bits 5--0`\ (bits 7--2)
 
-	  R\ :sub:`02low bits 5--4`\ (bits 1--0)
+	  B\ :sub:`02low bits 5--4`\ (bits 1--0)
 
     -  .. row 2
 
        -  start + 7
 
-       -  G\ :sub:`00high`
+       -  G\ :sub:`10high`
 
-       -  R\ :sub:`01high`
+       -  R\ :sub:`11high`
 
-       -  G\ :sub:`02high`
+       -  G\ :sub:`12high`
 
-       -  R\ :sub:`03high`
+       -  R\ :sub:`13high`
 
-       -  R\ :sub:`01low bits 1--0`\ (bits 7--6)
+       -  R\ :sub:`11low bits 1--0`\ (bits 7--6)
 
-	  G\ :sub:`00low bits 5--0`\ (bits 5--0)
+	  G\ :sub:`10low bits 5--0`\ (bits 5--0)
 
-       -  G\ :sub:`02low bits 3--0`\ (bits 7--4)
+       -  G\ :sub:`12low bits 3--0`\ (bits 7--4)
 
-	  R\ :sub:`01low bits 5--2`\ (bits 3--0)
+	  R\ :sub:`11low bits 5--2`\ (bits 3--0)
 
-       -  R\ :sub:`03low bits 5--0`\ (bits 7--2)
+       -  R\ :sub:`13low bits 5--0`\ (bits 7--2)
 
-	  G\ :sub:`02low bits 5--4`\ (bits 1--0)
+	  G\ :sub:`12low bits 5--4`\ (bits 1--0)
 
     -  .. row 3
 
@@ -117,13 +117,13 @@ Each cell is one byte.
 
 	  B\ :sub:`20low bits 5--0`\ (bits 5--0)
 
-       -  R\ :sub:`22low bits 3--0`\ (bits 7--4)
+       -  B\ :sub:`22low bits 3--0`\ (bits 7--4)
 
 	  G\ :sub:`21low bits 5--2`\ (bits 3--0)
 
        -  G\ :sub:`23low bits 5--0`\ (bits 7--2)
 
-	  R\ :sub:`22low bits 5--4`\ (bits 1--0)
+	  B\ :sub:`22low bits 5--4`\ (bits 1--0)
 
     -  .. row 4
 
-- 
2.26.2

