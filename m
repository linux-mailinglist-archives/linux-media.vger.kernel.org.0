Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D615171094
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 06:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgB0FjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 00:39:20 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40816 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgB0FjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 00:39:20 -0500
Received: by mail-pl1-f194.google.com with SMTP id y1so667026plp.7
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 21:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6H1VrqGl1iQGvDbdPvuIjgwqvDQO5S5ENNza/HfgzS4=;
        b=T3ew0FhJB1JRm41ADSXevvS66vXyeDmarW/IU8iAj594CgNAjsEDQw1eYfZCVXnMJK
         G5hfLOZK1hMaanBsHiTS2NtdUeTvVbp4LzT5CVenwsQvd0IXSa2OAEcAuFfVKlVmuJta
         qz13pMGPpgom/r+crMpBTar62Jo0eCXDyOs1EDboLGH2FceQrui0RCm2VPpijgR/OLpi
         YX2Bx4QygRN5az2a+5uQ+YUFS4DWZN8dMwaTpz9v+FzafyjDUOviA0bOLjsvsMiwdMjP
         z041PA8HMJG0lyZkM3Do+yHXKfhdnKFSUjNE8eR48w+p3juDqEzZzwrtLuam3duXm9cC
         ANOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6H1VrqGl1iQGvDbdPvuIjgwqvDQO5S5ENNza/HfgzS4=;
        b=cVYsFhH/3z5LuSpBA99tQ8Fc0y1d8ZbCWiARNt1ujGGqWh0URoSdLXvCPeduALG7ey
         aQaFI7Iobn9nyPfnoumPl0QHeMWhe+b10t0k8QZc7AZE9EGMIoASbwzGruSPAqxzkFEX
         h5KaQQaWQ0k4GxsKbl01TCSxcq46ooiiqx42oHjlSQrv18Bfd3jQ07xIlIdobEI8zmRW
         ZyCFtMJ7Wj3dQ6UFoIPz6WPovsLt70X4B53gZsNJFF9bbLZ7g70ia3QVptD3vBMkVKu3
         wpCBs83ThZlSbWk++ByqOsLxoEUwZKCaoD7qrWN+JPalWsG5yeFFbViBHFKycSkI/saJ
         vY4Q==
X-Gm-Message-State: APjAAAVVuwOEu4UpzGwtX/6nPXyIO21Cg7eUkQtoU2NgPlLlCSPsrUSC
        OpZrTdMV5IknCOpMEKpu6sk9vTuAta8=
X-Google-Smtp-Source: APXvYqzH3cy3pQ5qQPljEGIa6bl7D+Rkj+zo85gcYqoh0qU1NDL6hgBzeguRDL9DmvDUHAIo4TzkNA==
X-Received: by 2002:a17:90a:8a89:: with SMTP id x9mr3068865pjn.116.1582781958836;
        Wed, 26 Feb 2020 21:39:18 -0800 (PST)
Received: from localhost.localdomain ([223.186.219.95])
        by smtp.gmail.com with ESMTPSA id r6sm5146582pfh.91.2020.02.26.21.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 21:39:18 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        johan.korsnes@gmail.com
Cc:     bnvandana@gmail.com
Subject: [PATCH] media: Documentation:media:v4l-drivers: Update vivid documentation.
Date:   Thu, 27 Feb 2020 11:09:09 +0530
Message-Id: <20200227053909.25028-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add metadata capture/output and v4l-touch support in vivid
documentation.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 Documentation/media/v4l-drivers/vivid.rst | 63 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vivid.rst b/Documentation/media/v4l-drivers/vivid.rst
index 7082fec4075d..81e18f454b7c 100644
--- a/Documentation/media/v4l-drivers/vivid.rst
+++ b/Documentation/media/v4l-drivers/vivid.rst
@@ -4,9 +4,9 @@ The Virtual Video Test Driver (vivid)
 =====================================
 
 This driver emulates video4linux hardware of various types: video capture, video
-output, vbi capture and output, radio receivers and transmitters and a software
-defined radio receiver. In addition a simple framebuffer device is available for
-testing capture and output overlays.
+output, vbi capture and output, metadata capture and output, radio receivers and
+transmitters, touch capture and a software defined radio receiver. In addition a
+simple framebuffer device is available for testing capture and output overlays.
 
 Up to 64 vivid instances can be created, each with up to 16 inputs and 16 outputs.
 
@@ -36,6 +36,8 @@ This document describes the features implemented by this driver:
 - Radio receiver and transmitter support, including RDS support
 - Software defined radio (SDR) support
 - Capture and output overlay support
+- Metadata capture and output support
+- Touch capture support
 
 These features will be described in more detail below.
 
@@ -69,6 +71,9 @@ all configurable using the following module options:
 		- bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both
 		- bit 12: Radio Transmitter node
 		- bit 16: Framebuffer for testing overlays
+                - bit 17: Metadata Capture node
+		- bit 18: Metadata Output node
+		- bit 19: Touch Capture node
 
 	So to create four instances, the first two with just one video capture
 	device, the second two with just one video output device you would pass
@@ -175,6 +180,21 @@ all configurable using the following module options:
 	give the desired swradioX start number for each SDR capture device.
 	The default is -1 which will just take the first free number.
 
+- meta_cap_nr:
+
+        give the desired videoX start number for each metadata capture device.
+        The default is -1 which will just take the first free number.
+
+- meta_out_nr:
+
+        give the desired videoX start number for each metadata output device.
+        The default is -1 which will just take the first free number.
+
+- touch_cap_nr:
+
+        give the desired v4l-touchX start number for each touch capture device.
+        The default is -1 which will just take the first free number.
+
 - ccs_cap_mode:
 
 	specify the allowed video capture crop/compose/scaling combination
@@ -547,6 +567,33 @@ The generated data contains the In-phase and Quadrature components of a
 1 kHz tone that has an amplitude of sqrt(2).
 
 
+Metadata Capture
+----------------
+
+The Metadata capture generates UVC format metadata.The PTS and SCR is
+transmitted based on the values set in vivid contols.
+
+The Metadata device will only work for the Webcam input, it will give
+back an error for all other input.
+
+
+Metadata Output
+---------------
+
+The Metadata output can be used to set brightness, contrast, saturation and hue.
+
+The Metadata device will only work for the Webcam output, it will give
+back an error for all other output.
+
+
+Touch Capture
+-------------
+
+The Touch capture generates touch patterns simulating single tap, double tap,
+triple tap, move from left to right, zoom in, zoom out, palm press simulating
+large area being pressed on screen, and simulating 16 different simultaneous
+touch points.
+
 Controls
 --------
 
@@ -1049,6 +1096,16 @@ FM Radio Modulator Controls
 	to pass the RDS blocks to the driver, or "Controls" where the RDS data
 	is Provided by the RDS controls mentioned above.
 
+Metadata Capture Controls
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- Generate PTS
+
+        if set, then the generated metadata stream contains Presentation timestamp.
+
+- Generate SCR
+
+        if set, then the generated metadata stream contains Source Clock information.
 
 Video, VBI and RDS Looping
 --------------------------
-- 
2.17.1

