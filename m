Return-Path: <linux-media+bounces-25319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E6A20222
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 01:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 514493A4014
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 00:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EA0208A0;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLGdotL+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6563D3C14;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=QtOHjc34sgrrH0xYAkqZ73tJy0S8vLib8ZaB73Czl8/5YWQCd5Ag8fvDZv1Yv9+jlVb+qhtkqhH5OubvIaXf0Nb8U7NfK6IQ/rzhQ+wtYeISf+jQAmtz33x9PW3knFejPvttdHcVtBDdnJCy0uX70b67zmudgUZuvFQneuxSFjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=Tm8FYhaC26HmjBWtbEkupMtvOAviwlbF24h5AUzFGQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQjZ1J8pgb2t5KQ4tPu5Jf3ZVti0DlaInI8eYB6yJ84hRxEjkvy+QIxAIw2G4cV4sKhiA/jxpSGF2V+SamXoIabu9NelLCvOjnSZr0bCinGwbGgCEGh/ssX9Da0omP1acJgwKG4Pwx6GQBvxYDflEAqqYp7oM1sJolgn+oKz0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLGdotL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942C5C4CED2;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=Tm8FYhaC26HmjBWtbEkupMtvOAviwlbF24h5AUzFGQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLGdotL+XCu9jL2FPU4TWspY5DIYMPMF64MLQyxkAbdh/dY/drz0LqySm5L1BgFgp
	 F0b2VITGBA+K9a78K/SSXC381bnoJesEl+SfA525A8jw8277woBvicYzIaVc7X3wiS
	 RYuaBWQDGiE0IF2JXCm+9n0ZXpZCmIafLp1eYIuQYiYCtLFEUDD7N7Tb6Lrp4VZl99
	 gnaEZ0kGMIz+qdO0jlBpSDTVRQqATzD0tB2c7Ro+9Kd2ADQyQdDNUfpx08RdgMW5kR
	 acsiVkh6t7i9XeXfyP+zDzh8b6JkDtziQRrPda3JbVBRLpNKrvKsxlls9NUI6KRQfe
	 x45whh4RyNbqQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRKV-2ac5;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC v2 02/38] docs: media: ipu3: fix two footnote references
Date: Tue, 28 Jan 2025 01:05:51 +0100
Message-ID: <bed775ecc34a9261bdf672acd51073c4f2115550.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sphinx doesn't process references inside a code block. They need
to be before that.

Also, one of the refrences is missing a footnote origin. Add it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/ipu3.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 83b3cd03b35c..b0d42cea5391 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -87,8 +87,8 @@ raw Bayer format that is specific to IPU3.
 Let us take the example of ov5670 sensor connected to CSI2 port 0, for a
 2592x1944 image capture.
 
-Using the media controller APIs, the ov5670 sensor is configured to send
-frames in packed raw Bayer format to IPU3 CSI2 receiver.
+Using the media controller APIs\ [#f3]_, the ov5670 sensor is configured to
+send frames in packed raw Bayer format to IPU3 CSI2 receiver.
 
 .. code-block:: none
 
@@ -98,7 +98,7 @@ frames in packed raw Bayer format to IPU3 CSI2 receiver.
     # and that ov5670 sensor is connected to i2c bus 10 with address 0x36
     export SDEV=$(media-ctl -d $MDEV -e "ov5670 10-0036")
 
-    # Establish the link for the media devices using media-ctl [#f3]_
+    # Establish the link for the media devices using media-ctl
     media-ctl -d $MDEV -l "ov5670:0 -> ipu3-csi2 0:0[1]"
 
     # Set the format for the media devices
@@ -248,9 +248,9 @@ hence "STILL" mode will need more power and memory bandwidth than "VIDEO" mode.
 TNR will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is
 running at "VIDEO" mode by default, the user can use v4l2 control
 V4L2_CID_INTEL_IPU3_MODE (currently defined in
-drivers/staging/media/ipu3/include/uapi/intel-ipu3.h) to query and set the
-running mode. For user, there is no difference for buffer queueing between the
-"VIDEO" and "STILL" mode, mandatory input and main output node should be
+drivers/staging/media/ipu3/include/uapi/intel-ipu3.h\ [#f5]_) to query and set
+the running mode. For user, there is no difference for buffer queueing between
+the "VIDEO" and "STILL" mode, mandatory input and main output node should be
 enabled and buffers need be queued, the statistics and the view-finder queues
 are optional.
 
-- 
2.48.1


