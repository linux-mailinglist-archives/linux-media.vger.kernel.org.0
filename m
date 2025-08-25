Return-Path: <linux-media+bounces-40870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DFB336D3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F403BAD99
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFA4288513;
	Mon, 25 Aug 2025 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGSYG0h2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E228850B
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104793; cv=none; b=HBn4LTDZO3tXzqiZilcsv/ejY89whgtwMgscudbhyHwoZ61ekwXh4H8eZNIrB64QYnT2TJmsabURKdod74i/ehnGsu4HMCNYh8moA1HeYgceQ8QRvFPMVfQ9fcz0LZb2o+/314DL1T0SZ3qTUjiqWnzMDfSjSg9x7wkZAeXDCQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104793; c=relaxed/simple;
	bh=jg7sxuChbLkLCfuZwAdzNg+OV/94TkwLlZNm5Tk3HSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZz1MZCk+sgVB2zG8jTHUdOeg9uMEWPoLfJ1KPpbIwNXtm66VzFCPw5GJBOEdSPJ6QJ1wgFcRz/bJ7rsSM6HuzmHMqEiPuRXhQLCyzhg2CFR+7ASPDuIWXpVU8u1NxKxpl6Um6GieRCHwGAsSpReWuJpYZYIX38bVNXhgdi7LQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGSYG0h2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC476C116C6;
	Mon, 25 Aug 2025 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756104792;
	bh=jg7sxuChbLkLCfuZwAdzNg+OV/94TkwLlZNm5Tk3HSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SGSYG0h2qYcC1vdbIORXQHyKGfRwDJMM8PL0uEwwZ5Wi3Mc0edbU/VfZ/kjjBCvKZ
	 VUmhb7o9365F4OUzc67NcgymP8QzM7kX/Vf7g91MCBJQ4npDu15MkmmxKjM8fXP09+
	 bKFzyerMzjv9EBOnowzyT+YMhQ2XJ3Z4ouCMvyP3UngR6CsqBLvyszCvgh58lsSDb3
	 NJKjvZAbDDfbeGSt4vJIRs2fWtf/wIub3+sLCeIXBAZ8IdlHgetotKOYaVWhJGwYYV
	 2W+gK3lnIpQdQOPokP3+zhfQOzkOQoB1gtUt4YZWOlMdw/MN58v86uHyi1xz4LDA4Y
	 50z0JbCaiO1TQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 5/8] Documentation: update Hans Verkuil's email address
Date: Mon, 25 Aug 2025 08:51:52 +0200
Message-ID: <2bc93b75f4aba5ab11519f010f62f2a812a241fc.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
---
 Documentation/admin-guide/bug-hunting.rst                    | 2 +-
 Documentation/admin-guide/media/ivtv.rst                     | 2 +-
 Documentation/devicetree/bindings/media/cec/cec-common.yaml  | 2 +-
 Documentation/devicetree/bindings/media/silabs,si470x.yaml   | 2 +-
 Documentation/driver-api/media/maintainer-entry-profile.rst  | 4 ++--
 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst | 2 +-
 Documentation/translations/zh_TW/admin-guide/bug-hunting.rst | 2 +-
 Documentation/userspace-api/media/drivers/cx2341x-uapi.rst   | 2 +-
 Documentation/userspace-api/media/v4l/v4l2.rst               | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index 30858757c9f2..7da0504388ec 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -252,7 +252,7 @@ For example, if you find a bug at the gspca's sonixj.c file, you can get
 its maintainers with::
 
 	$ ./scripts/get_maintainer.pl --bug -f drivers/media/usb/gspca/sonixj.c
-	Hans Verkuil <hverkuil@xs4all.nl> (odd fixer:GSPCA USB WEBCAM DRIVER,commit_signer:1/1=100%)
+	Hans Verkuil <hverkuil@kernel.org> (odd fixer:GSPCA USB WEBCAM DRIVER,commit_signer:1/1=100%)
 	Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:MEDIA INPUT INFRASTRUCTURE (V4L/DVB),commit_signer:1/1=100%)
 	Tejun Heo <tj@kernel.org> (commit_signer:1/1=100%)
 	Bhaktipriya Shridhar <bhaktipriya96@gmail.com> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:4/4=100%,removed_lines:9/9=100%)
diff --git a/Documentation/admin-guide/media/ivtv.rst b/Documentation/admin-guide/media/ivtv.rst
index 101f16d0263e..8b65ac3f5321 100644
--- a/Documentation/admin-guide/media/ivtv.rst
+++ b/Documentation/admin-guide/media/ivtv.rst
@@ -3,7 +3,7 @@
 The ivtv driver
 ===============
 
-Author: Hans Verkuil <hverkuil@xs4all.nl>
+Author: Hans Verkuil <hverkuil@kernel.org>
 
 This is a v4l2 device driver for the Conexant cx23415/6 MPEG encoder/decoder.
 The cx23415 can do both encoding and decoding, the cx23416 can only do MPEG
diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
index af6ee5f1c73f..6d5017d9bf55 100644
--- a/Documentation/devicetree/bindings/media/cec/cec-common.yaml
+++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: HDMI CEC Adapters Common Properties
 
 maintainers:
-  - Hans Verkuil <hverkuil@xs4all.nl>
+  - Hans Verkuil <hverkuil@kernel.org>
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/media/silabs,si470x.yaml b/Documentation/devicetree/bindings/media/silabs,si470x.yaml
index a3d19c562ca3..db22b88fc5bb 100644
--- a/Documentation/devicetree/bindings/media/silabs,si470x.yaml
+++ b/Documentation/devicetree/bindings/media/silabs,si470x.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Silicon Labs Si470x FM Radio Receiver
 
 maintainers:
-  - Hans Verkuil <hverkuil@xs4all.nl>
+  - Hans Verkuil <hverkuil@kernel.org>
   - Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
 
 properties:
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ad96a89ee916..2127e5b15e8f 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -75,7 +75,7 @@ The media maintainers that work on specific areas of the subsystem are:
     Sean Young <sean@mess.org>
 
 - HDMI CEC:
-    Hans Verkuil <hverkuil@xs4all.nl>
+    Hans Verkuil <hverkuil@kernel.org>
 
 - Media controller drivers:
     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
@@ -84,7 +84,7 @@ The media maintainers that work on specific areas of the subsystem are:
     Sakari Ailus <sakari.ailus@linux.intel.com>
 
 - V4L2 drivers and core V4L2 frameworks:
-    Hans Verkuil <hverkuil@xs4all.nl>
+    Hans Verkuil <hverkuil@kernel.org>
 
 The subsystem maintainer is:
   Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
index 4b3432753eb9..f20bf5be4cf9 100644
--- a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
@@ -239,7 +239,7 @@ objdump
 例如，您在gspca的sonixj.c文件中发现一个缺陷，则可以通过以下方法找到它的维护者::
 
 	$ ./scripts/get_maintainer.pl -f drivers/media/usb/gspca/sonixj.c
-	Hans Verkuil <hverkuil@xs4all.nl> (odd fixer:GSPCA USB WEBCAM DRIVER,commit_signer:1/1=100%)
+	Hans Verkuil <hverkuil@kernel.org> (odd fixer:GSPCA USB WEBCAM DRIVER,commit_signer:1/1=100%)
 	Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:MEDIA INPUT INFRASTRUCTURE (V4L/DVB),commit_signer:1/1=100%)
 	Tejun Heo <tj@kernel.org> (commit_signer:1/1=100%)
 	Bhaktipriya Shridhar <bhaktipriya96@gmail.com> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:4/4=100%,removed_lines:9/9=100%)
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
index 80ea5677ee52..c677dff826f5 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
@@ -242,7 +242,7 @@ objdump
 例如，您在gspca的sonixj.c文件中發現一個缺陷，則可以通過以下方法找到它的維護者::
 
 	$ ./scripts/get_maintainer.pl -f drivers/media/usb/gspca/sonixj.c
-	Hans Verkuil <hverkuil@xs4all.nl> (odd fixer:GSPCA USB WEBCAM DRIVER,commit_signer:1/1=100%)
+	Hans Verkuil <hverkuil@kernel.org> (odd fixer:GSPCA USB WEBCAM DRIVER,commit_signer:1/1=100%)
 	Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:MEDIA INPUT INFRASTRUCTURE (V4L/DVB),commit_signer:1/1=100%)
 	Tejun Heo <tj@kernel.org> (commit_signer:1/1=100%)
 	Bhaktipriya Shridhar <bhaktipriya96@gmail.com> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:4/4=100%,removed_lines:9/9=100%)
diff --git a/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
index debde65fb8cd..b617c988b915 100644
--- a/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
+++ b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
@@ -130,7 +130,7 @@ Raw format c example
 Format of embedded V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data
 ---------------------------------------------------------
 
-Author: Hans Verkuil <hverkuil@xs4all.nl>
+Author: Hans Verkuil <hverkuil@kernel.org>
 
 
 This section describes the V4L2_MPEG_STREAM_VBI_FMT_IVTV format of the VBI data
diff --git a/Documentation/userspace-api/media/v4l/v4l2.rst b/Documentation/userspace-api/media/v4l/v4l2.rst
index cf8ae56a008c..64fb264fb6c4 100644
--- a/Documentation/userspace-api/media/v4l/v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2.rst
@@ -86,7 +86,7 @@ Authors, in alphabetical order:
 
   - Documented the fielded V4L2_MPEG_STREAM_VBI_FMT_IVTV MPEG stream embedded, sliced VBI data format in this specification.
 
-- Verkuil, Hans <hverkuil@xs4all.nl>
+- Verkuil, Hans <hverkuil@kernel.org>
 
   - Designed and documented the VIDIOC_LOG_STATUS ioctl, the extended control ioctls, major parts of the sliced VBI API, the MPEG encoder and decoder APIs and the DV Timings API.
 
-- 
2.47.2


