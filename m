Return-Path: <linux-media+bounces-14042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DE9146D0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3E5E1F2488C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC59E13699F;
	Mon, 24 Jun 2024 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hInH4rlg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54765136648
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223042; cv=none; b=VW5T64XgnlaJnvTLJdR3PBpR8y29JHPOf9R6L5PPq0Rso+TYai2X0mPyGOZXlB+ytl0A5KvKPfbf1mNmd9AjOOeCIiDLpxUhpOZb761xDZXU0hV/QtRBBe4t7bmDuXzhzw8OvbN1mVt7hmBGT/TeoRRl//NtFEj7cT0PXSVvCmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223042; c=relaxed/simple;
	bh=9Il19TztdfXyRoKrswHodEJ+VKwzT0MEaQtGa0maJ9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WxYtHBjpQr9/ZtLteMfdEuVgLSczBoO3lCvZvvUgNR6VQsfbgUrUqh/zSPUrdNJsWC7FXQdhsdoiPdTIIl5BVKFeyPWJKLIJMFAr/f8KviCKnfd2yCT1HSP5omhnLNKDm3NIaOHBCTMsy3dfkFnVhLVsjgzuUWrkqkc1DeqKBEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hInH4rlg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42138eadf64so34951415e9.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719223038; x=1719827838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjmAUQlI0yN8wHAFxugwKKhltzjfu3xepdY0Ohl71K0=;
        b=hInH4rlgbUOWpPm47TOl6WGHQwovvcMIxHUG+69c7bFxjY9Dhj2m1tPqGY6F0aJy2r
         gVCIlgVewx2WruKJsuYAcbtTFcILkRWNcFmddjptM8ACEZcgNrflXZqOqMS3XPF89LT1
         1xzp2z0tMPrZHl/vtzM4ERxGxg5UYUZuaiDYZBWm6Vn8JPiGeFld/c+6coHQnc9h7YnB
         NyACBckpjzN0/2vfirIjbZQ6luliCIZCUVdvVWj+agM767rLzxl0C6utWVm2hpfg+2/h
         aEeUmymOF3G9+4AcBuil12niY6oghemgKLj/vA90Eo9SY3MHiy4jysdrzbyPD/u8+Kxj
         LVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719223038; x=1719827838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjmAUQlI0yN8wHAFxugwKKhltzjfu3xepdY0Ohl71K0=;
        b=GJHOZ5YwN1affvK8kt4UrxQTuRyp4X8XSaSOBPEtD/k0zpGRLJn3BGIzhZPD5h4gaC
         QwNU9tS4TwnN9Nh03ZLG2uAdCRPqozxjln2UhtlAdwDgBO8WqbkgIggiEUw8bRnSd6nP
         blxYM13t1XM0XPjizov+WxQem7Gd+ZxAxezVIFGhAHY1AN1W6SkuKbgRVnzLET8hLvz0
         xYIHo0SfmfQDWs1+u6bZB5xaGpCCBU951fh0ufI5vDXAN7jXHtUb6RKEU7fcjyoSv33D
         E5/Zjei+6wnhU8ji68EwagqSztThcoK83s3iVOgmdegLDyh8I2jVsNn6Ae3O3DSyT3o6
         /Qmg==
X-Gm-Message-State: AOJu0Yx1P4gb5CQFakRwYBh9Va9z5pPnoFVTZHovmH4ph+Prz2y3IiEs
	cGpE7Il3C2GWobJMA6ToccdLnQmYYP9BI0oa9puSZUe1+gcunlPv8YwlEFg=
X-Google-Smtp-Source: AGHT+IGqvdRz0hA24pIOIUtxXlEHh3LB6ZFprCT3o9yTpNFg7lZlVxuqFJAodUaqCjgA427pVjEXZA==
X-Received: by 2002:a05:600c:3b9c:b0:424:8d33:5c45 with SMTP id 5b1f17b1804b1-4248d335d0emr26045605e9.30.1719223038412;
        Mon, 24 Jun 2024 02:57:18 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:57:18 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com
Subject: [PATCH 10/10] documentation: media: vivid: Update documentation on vivid loopback support
Date: Mon, 24 Jun 2024 12:53:06 +0300
Message-Id: <20240624095300.745567-11-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify section "Video and Sliced VBI Looping" in Documentation to explain
the vivid loopback support for video across multiple vivid instances.
Previous documentation is out-of-date as it was explaining looping in a
single vivid instance only.

Also, in "Some Future Improvements" the item "Add support to loop
from a specific output to a specific input across vivid instances"
can be dropped since that's now implemented.

Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst | 52 +++++++++++++----------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 29481241d7cb..1306f19ecb5a 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -1135,27 +1135,33 @@ Metadata Capture Controls
         if set, then the generated metadata stream contains Source Clock information.
 
 
-Video and Sliced VBI Looping
-----------------------------
-
-The vivid driver supports looping of video output to video input, and VBI
-output to VBI input. For video/VBI looping this emulates as if a cable was
-hooked up between the output and input connector. So video and VBI looping
-is only supported between S-Video and HDMI inputs and outputs.
-VBI is only valid for S-Video as it makes no sense for HDMI.
-
-Looping is currently supported only between devices created by the same
-vivid driver instance.
-
-The way to enable video/VBI looping is currently fairly crude. A 'Loop Video'
-control is available in the "Vivid" control class of the video
-capture and VBI capture devices. When checked the video looping will be enabled.
-Once enabled any video S-Video or HDMI input will show a static test pattern
-until the video output has started. At that time the video output will be
-looped to the video input provided that:
-
-- the input type matches the output type. So the HDMI input cannot receive
-  video from the S-Video output.
+Video, Sliced VBI and HDMI CEC Looping
+--------------------------------------
+
+Video Looping functionality is supported for devices created by the same
+vivid driver instance, as well as across multiple instances of the vivid driver.
+The vivid driver supports looping of video and Sliced VBI data between an S-Video output
+and an S-Video input. It also supports looping of video and HDMI CEC data between an
+HDMI output and an HDMI input.
+
+To enable looping, set the 'HDMI/S-Video XXX-N Is Connected To' control(s) to select
+whether an input uses the Test Pattern Generator, or is disconnected, or is connected
+to an output. An input can be connected to an output from any vivid instance.
+The inputs and outputs are numbered XXX-N where XXX is the vivid instance number
+(see module option n_devs). If there is only one vivid instance (the default), then
+XXX will be 000. And N is the Nth S-Video/HDMI input or output of that instance.
+If vivid is loaded without module options, then you can connect the S-Video 000-0 input
+to the S-Video 000-0 output, or the HDMI 000-0 input to the HDMI 000-0 output.
+This is the equivalent of connecting or disconnecting a cable between an input and an
+output in a physical device.
+
+If an 'HDMI/S-Video XXX-N Is Connected To' control selected an output, then the video
+output will be looped to the video input provided that:
+
+- the currently selected input matches the input indicated by the control name.
+
+- in the vivid instance of the output connector, the currently selected output matches
+  the output indicated by the control's value.
 
 - the video resolution of the video input must match that of the video output.
   So it is not possible to loop a 50 Hz (720x576) S-Video output to a 60 Hz
@@ -1182,6 +1188,8 @@ looped to the video input provided that:
   "DV Timings Signal Mode" for the HDMI input should be configured so that a
   valid signal is passed to the video input.
 
+If any condition is not valid, then the 'Noise' test pattern is shown.
+
 The framerates do not have to match, although this might change in the future.
 
 By default you will see the OSD text superimposed on top of the looped video.
@@ -1344,8 +1352,6 @@ Just as a reminder and in no particular order:
 - Add ARGB888 overlay support: better testing of the alpha channel
 - Improve pixel aspect support in the tpg code by passing a real v4l2_fract
 - Use per-queue locks and/or per-device locks to improve throughput
-- Add support to loop from a specific output to a specific input across
-  vivid instances
 - The SDR radio should use the same 'frequencies' for stations as the normal
   radio receiver, and give back noise if the frequency doesn't match up with
   a station frequency
-- 
2.34.1


