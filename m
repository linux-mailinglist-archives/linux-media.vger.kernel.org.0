Return-Path: <linux-media+bounces-45668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A9C0E350
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE1414F6838
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A472304976;
	Mon, 27 Oct 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGcT2vNX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA8302CC7
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573100; cv=none; b=uvnwK6w+ZMnAEXk7AR4SC3AHzA5UD1y3qMV/ZqT45oM7iGO92+CwcCHhLZnJNJ9RPR4pVQigE4AHHoerJZz3q+wq+pWaCAFhy/KKr/QoWydwZRcHvF/BRGlptoBSEjkf/GcfU1yHUYXew7rrEKvsS33BnB2ln6RewsUIi8a3/2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573100; c=relaxed/simple;
	bh=S7GYNEuZeCylTERvjpgp3ur1jHMc1v6MvQ8iYwOgHS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQKHDVEyD8jBeQdOv4OCdJNK0JxFLlXJ24P7l5fcbMQLxXClfOsccwAVZ2LWkR5cbyma+EbEAPZfdV2tmT2+piL3sJW73SXWYHb0P1VW4Zzvd5VWz/gTYDDG4C/B4dIzY2YodvwBsogKt6FLSDDKdZCeIwbNDqUUPKjFTuYVMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGcT2vNX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F111C116B1;
	Mon, 27 Oct 2025 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573100;
	bh=S7GYNEuZeCylTERvjpgp3ur1jHMc1v6MvQ8iYwOgHS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lGcT2vNXxPFmEBgc4uTGo5iE6Q3xGK3rwLz+pQ5HDmKIPb8Z494a9Na2MDBkBZqc6
	 FUDl8PRk2qyTK7jcpQSk+2jaP70iwbmkI6ttkYCkTv7MGpkK4T/vRS2bd38WnpWSZm
	 w2+OsQZMSvyf3wKPLMJFBYA2f8dzAU2v26/FY7fK1I9GrwfX7kP7Qulm/beVRkN7qb
	 yrl+t5V7da+HVYgOu8I0gxH6H779u/N5CMi7cFyStZ1g5L4Jcobegg4NdPyRDaTxyu
	 /gZ8zLJX6NGwTe1pJOzu8IH9vNUL7pfTTznQXMEPMU9/PhVftYSKecyjJUDaHxJ8Dn
	 /DH7y/u7Pu7zg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv6 3/3] docs: media: document Media Maintainers
Date: Mon, 27 Oct 2025 14:28:33 +0100
Message-ID: <43bafef3389817a8fde1d5051351df59c1a65c55.1761571713.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761571713.git.hverkuil+cisco@kernel.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document who the Media Maintainers are and what their
responsibilities are.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/maintainer-entry-profile.rst        | 40 +++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 8238b4c36e62..09ccd3e6626a 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -348,13 +348,47 @@ Maintaining media maintainer status
 
 See :ref:`Maintain Media Status`.
 
-Subsystem Media Maintainers
----------------------------
+List of Media Maintainers
+-------------------------
 
-The subsystem maintainers are:
+The Media Subsystem Maintainers are:
   - Mauro Carvalho Chehab <mchehab@kernel.org>
   - Hans Verkuil <hverkuil@kernel.org>
 
+The Media Core Maintainers are:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+
+    - ISP
+    - sensor drivers
+    - v4l2-async and v4l2-fwnode core frameworks
+    - v4l2-flash-led-class core framework
+
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+
+    - DVB
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+    - Media controller drivers
+    - Core media controller framework
+  - Hans Verkuil <hverkuil@kernel.org>
+
+    - V4L2 drivers
+    - V4L2 and videobuf2 core frameworks
+    - HDMI CEC drivers
+    - HDMI CEC core framework
+  - Sean Young <sean@mess.org>
+
+    - Remote Controller (infrared) drivers
+    - Remote Controller (infrared) core framework
+
+The Media Maintainers are:
+  - Nicolas Dufresne <nicolas.dufresne@collabora.com>
+
+    - Codec drivers
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+    - Qualcomm drivers
+
 Submit Checklist Addendum
 -------------------------
 
-- 
2.51.0


