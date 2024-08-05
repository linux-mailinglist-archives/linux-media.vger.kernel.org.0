Return-Path: <linux-media+bounces-15781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A24947E7C
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 17:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC4D1F21DFA
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 15:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D9C15B966;
	Mon,  5 Aug 2024 15:46:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D544CDE0;
	Mon,  5 Aug 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722872794; cv=none; b=eAcGP9nOgMCsbXxPbqgsse92We94rwLEpHPA0cmX1hd6COm9aKSff6lwPe8n36962rZ/X3doMvaK9MeAtDo6lRq2WbVetBsA4TgjIofuTDeii/IsXW6PjPyTnpM9kGHM4AsdGKCwxNCb8mX7lANob10hL7cBwzmQPhG9ezC3Eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722872794; c=relaxed/simple;
	bh=obniZfSDW/k/GqDjUVIYlNk7TKGfBf5TeVHiB4wZLko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0OR76nogWKolK5kgJpdd1S50FHdBz4/9x1OJqOthQWzo1sPxCU8dYRuR40TTP8VjAukI7h8l0vuV8AlgpyUhQqubQIP/9CHSp6rqh5paQdApP2qkux7ugan1wJXy3V1+ZDdvVwTQwQEZ5K/VrV9eQoyvmH2647ot5Ce+NjjNWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 35C753FFBD;
	Mon, 05 Aug 2024 17:41:02 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v6 4/4 RESEND] media: admin-guide: mgb4: Outputs DV timings documentation update
Date: Mon,  5 Aug 2024 17:40:54 +0200
Message-ID: <20240805154054.8633-5-tumic@gpxsee.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240805154054.8633-1-tumic@gpxsee.org>
References: <20240805154054.8633-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Properly document the function of the mgb4 output "frame_rate" sysfs parameter
and update the default DV timings values according to the latest code changes.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 Documentation/admin-guide/media/mgb4.rst | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
index e434d4a9eeb3..b9da127c074d 100644
--- a/Documentation/admin-guide/media/mgb4.rst
+++ b/Documentation/admin-guide/media/mgb4.rst
@@ -227,8 +227,13 @@ Common FPDL3/GMSL output parameters
     open.*
 
 **frame_rate** (RW):
-    Output video frame rate in frames per second. The default frame rate is
-    60Hz.
+    Output video signal frame rate limit in frames per second. Due to
+    the limited output pixel clock steps, the card can not always generate
+    a frame rate perfectly matching the value required by the connected display.
+    Using this parameter one can limit the frame rate by "crippling" the signal
+    so that the lines are not equal (the porches of the last line differ) but
+    the signal appears like having the exact frame rate to the connected display.
+    The default frame rate limit is 60Hz.
 
 **hsync_polarity** (RW):
     HSYNC signal polarity.
@@ -253,33 +258,33 @@ Common FPDL3/GMSL output parameters
     and there is a non-linear stepping between two consecutive allowed
     frequencies. The driver finds the nearest allowed frequency to the given
     value and sets it. When reading this property, you get the exact
-    frequency set by the driver. The default frequency is 70000kHz.
+    frequency set by the driver. The default frequency is 61150kHz.
 
     *Note: This parameter can not be changed while the output v4l2 device is
     open.*
 
 **hsync_width** (RW):
-    Width of the HSYNC signal in pixels. The default value is 16.
+    Width of the HSYNC signal in pixels. The default value is 40.
 
 **vsync_width** (RW):
-    Width of the VSYNC signal in video lines. The default value is 2.
+    Width of the VSYNC signal in video lines. The default value is 20.
 
 **hback_porch** (RW):
     Number of PCLK pulses between deassertion of the HSYNC signal and the first
-    valid pixel in the video line (marked by DE=1). The default value is 32.
+    valid pixel in the video line (marked by DE=1). The default value is 50.
 
 **hfront_porch** (RW):
     Number of PCLK pulses between the end of the last valid pixel in the video
     line (marked by DE=1) and assertion of the HSYNC signal. The default value
-    is 32.
+    is 50.
 
 **vback_porch** (RW):
     Number of video lines between deassertion of the VSYNC signal and the video
-    line with the first valid pixel (marked by DE=1). The default value is 2.
+    line with the first valid pixel (marked by DE=1). The default value is 31.
 
 **vfront_porch** (RW):
     Number of video lines between the end of the last valid pixel line (marked
-    by DE=1) and assertion of the VSYNC signal. The default value is 2.
+    by DE=1) and assertion of the VSYNC signal. The default value is 30.
 
 FPDL3 specific input parameters
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.45.1


