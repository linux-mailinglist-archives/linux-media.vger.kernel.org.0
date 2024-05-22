Return-Path: <linux-media+bounces-11718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6C8CC08A
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4491F2845B3
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 11:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8708C13D51F;
	Wed, 22 May 2024 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samwein.com header.i=@samwein.com header.b="Et9j8HaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917BE13D524
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716378471; cv=none; b=eTHpEyqtfemsgAxIFfwsEUWzHl0wcwSZXoM/QP5PFfKSeFQ60BUcf/fNQwMeg0icYCieeBzeA0PWqplyUmqETmxBNmXNVkdHor7m+C35nXbRK5tdKtULjmNoWfgy/wfF8fxW3G8mUleFqvt92QWTQTTgpt2VZQljzJJ+H1IBYz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716378471; c=relaxed/simple;
	bh=AlIfxaJpb+3MrfgyyWy6QGg2POP+3aZ5g+/ZEsI86Rw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C1Ei7a4uCPb2mTlXRxr8T7y5lHffdWl1jBNG5GVvTXCjO5N2+Yr7QD6U6mWAigFv47yFnfmv3tPodfOXS3xgz7j4bXdK/YXB+E9IC6jXn0MB3dTMEv2FeCPh25i5LsBajx7Fx3amsrp+pCSB0h6RP91rnDFqLjyfIVpmODtIBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=samwein.com; spf=pass smtp.mailfrom=samwein.com; dkim=pass (2048-bit key) header.d=samwein.com header.i=@samwein.com header.b=Et9j8HaQ; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=samwein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samwein.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samwein.com;
	s=protonmail2; t=1716378452; x=1716637652;
	bh=XzW57l/kEm2kXLSwIZctFjfQ2OiIvgR/A2+LblwUq5Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Et9j8HaQGaVAYsJYywW+y4lHWAY1lwPbEy55WChMOCAsollY19852z0SneoTvdlVr
	 51CbHcs1XsnFZA/OwMzKwM8uM09fk5F0YXsgg8QkwcSe1735RdV/eX4Sw0hh1Zq7pc
	 hfiGCOSOqVbyfvS8X3lWI4Z5CPUYvfczdr4kWFltLzy5CIeAums+xlkxiSSw+EdeQ0
	 OFAlw8m3UxSiPZ53SrCXd84CicftAHA5pL2sfkl2uK6o+4H6wPmfsSPWGwr5gui0TI
	 6HsIahxspsyCBQ+Wn3GI9QVORuX+iHNM1HI3+4gLvfG3ipXoio8FC9Fbkcy+mWpF8k
	 YdR0+jpq0BgUw==
Date: Wed, 22 May 2024 11:47:26 +0000
To: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com
From: Samuel Wein <sam@samwein.com>
Cc: Samuel Wein <sam@samwein.com>
Subject: [PATCH v2] media: Fix examples in ipu6-isys admin-guide
Message-ID: <20240522114656.30472-1-sam@samwein.com>
Feedback-ID: 2153553:user:proton
X-Pm-Message-ID: 5778174900c6ffe8ed2844a563b261693af897f8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix flags in X1 Yoga example. MEDIA_LNK_FL_DYNAMIC (0x4 in the link flag)
was removed in V4 Intel IPU6 and IPU6 input system drivers.
Added -V flag to media-ctl commands for X1 Yoga, lower-case v only makes it=
 verbose
upper-case V sets the format.

Signed-off-by: Samuel Wein <sam@samwein.com>
---
 Documentation/admin-guide/media/ipu6-isys.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/=
admin-guide/media/ipu6-isys.rst
index 0721e920b5e6..ac7595a876f1 100644
--- a/Documentation/admin-guide/media/ipu6-isys.rst
+++ b/Documentation/admin-guide/media/ipu6-isys.rst
@@ -135,16 +135,16 @@ sensor ov2740 on Lenovo X1 Yoga laptop.
 .. code-block:: none
=20
     media-ctl -l "\"ov2740 14-0036\":0 -> \"Intel IPU6 CSI2 1\":0[1]"
-    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\"=
:0[5]"
-    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\"=
:0[5]"
+    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\"=
:0[1]"
+    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\"=
:0[1]"
=20
     # set routing
     media-ctl -v -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"
=20
-    media-ctl -v "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
-    media-ctl -v "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
-    media-ctl -v "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
-    media-ctl -v "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
+    media-ctl -V "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
+    media-ctl -V "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
+    media-ctl -V "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
+    media-ctl -V "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
=20
     CAPTURE_DEV=3D$(media-ctl -e "Intel IPU6 ISYS Capture 0")
     ./yavta --data-prefix -c100 -n5 -I -s1932x1092 --file=3D/tmp/frame-#.b=
in \
--=20
2.34.1



