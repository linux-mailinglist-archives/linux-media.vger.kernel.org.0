Return-Path: <linux-media+bounces-11712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5F8CBCA4
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 10:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F29971C20FE4
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 08:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E117E56C;
	Wed, 22 May 2024 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samwein.com header.i=@samwein.com header.b="REea3sMh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39659B65E
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716365288; cv=none; b=iwluTxdxpUWv9UhMSUBos1UtwX5l2uM7n68mpsMIGI3umsJNcV8u9ByidFd5Qsad3FzFTWq69Vgt2brplPuYkcm1bMk4EMAlOyl5cm4Pp4knJs3zq4dz3Q5jwNMC27Nasi6Dd7/VeOK3lMQLKfqDprYqJNB4eAJmgpHVRtlrSKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716365288; c=relaxed/simple;
	bh=sDTAztFgeTDgNI/lV7aod8fZQ6HHeahRPgwWctRwUT8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=anNcmYZiHqcAFTIgw0bEU/55mPSoQRMQNAPSS1Qo7FGbFaY6riiovl4XG7bQsCHO10fJodMn9JPVqPxoujXhtKZUYyJCJLRcpcpLZBSzno0YMAYFvIwtvIRuEF3tCuFpFLH+yGMQ6N2muHFdzTu/tphMSJccINNT6o+Y0B3cusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=samwein.com; spf=pass smtp.mailfrom=samwein.com; dkim=pass (2048-bit key) header.d=samwein.com header.i=@samwein.com header.b=REea3sMh; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=samwein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samwein.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samwein.com;
	s=protonmail2; t=1716365275; x=1716624475;
	bh=3kw/TwD3MRsRzFbB1AVLRSRQej3KvNygx+QGkBFXWWk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=REea3sMhrvEcyeGbr4un60YNYof4r9kXTS5S7xd80Vmwtq+xGtl8OYYY7IB2RcTv4
	 N2CFzoialnght9rsDQsGfChmTPlwfPmsQyOj0vLf5w/UCrRCkCr866zZxQsoENf+YJ
	 WHUR1ymuET+e/3vdp7t27dAVtD2sDtkoUiKXc15ih4IDtJwMKtkxO+LdRhmh0LlvtJ
	 +fQ3Qn5nnxz8ho0hVQ5R1vog3x/UpxCByolnV//ZDrdMEfanTTHJEejMdrMwdWeCUH
	 7D4egIJIQy6pz31J8HxFga5DfcTrD0pvyxKaldSp8k6tmZNbaFmEk8ZJKUqqa1W38/
	 wDthckBzJntbw==
Date: Wed, 22 May 2024 08:07:51 +0000
To: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com
From: Samuel Wein <sam@samwein.com>
Cc: Samuel Wein <sam@samwein.com>
Subject: [PATCH] Fix flags in X1 Yoga example. MEDIA_LNK_FL_DYNAMIC (0x4 in the link flag)  was removed in V4 Intel IPU6 and IPU6 input system drivers. Added -V flag to media-ctl commands for X1 Yoga, lower-case v only makes it verbose upper-case V sets the format.
Message-ID: <20240522080710.16922-1-sam@samwein.com>
Feedback-ID: 2153553:user:proton
X-Pm-Message-ID: 2cd6b2ea6678878f47deb9568a4c277f6ac66aec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Samuel Wein <sam@samwein.com>
---
 Documentation/admin-guide/media/ipu6-isys.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/=
admin-guide/media/ipu6-isys.rst
index 0721e920b5e6..c8704ff63b45 100644
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
+    media-ctl -Vv "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
+    media-ctl -Vv "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
+    media-ctl -Vv "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
+    media-ctl -Vv "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
=20
     CAPTURE_DEV=3D$(media-ctl -e "Intel IPU6 ISYS Capture 0")
     ./yavta --data-prefix -c100 -n5 -I -s1932x1092 --file=3D/tmp/frame-#.b=
in \
--=20
2.34.1



