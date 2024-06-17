Return-Path: <linux-media+bounces-13480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AEE90BA28
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 20:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87103282FC9
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E96A198E84;
	Mon, 17 Jun 2024 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=samwein.com header.i=@samwein.com header.b="CUTMd0QC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2B198E77
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650405; cv=none; b=m+IbHSgAWavlFu5mn03qS55Chjrk0sBID/rCYNia6Oiw3inC9bnnB6cKzTSebBqoFS6p/Ksy2fRh7PK05bswk6WfhsRvLCc/AMYTq4DwG6xBR96Pr9wdFG7L1NaD3Uf3J/B+5ZjDUReScrhA24w1U4aSaM947Mx9s3pdT4L8DPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650405; c=relaxed/simple;
	bh=/+c6Murei3LGgtDG7wSqDCOVu0K9tdO2tL/dyX7B5so=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gss3b+SjC0gsxZSX51HrL9avWOGan/UZsfiLXiFnqq7WFGV1SfXRmSQO2il2WHlLnIjc4SLkTmjqn2nQRlDMTCS8gsZhWl+iJDlbHAQmjr8ksKkPTY0uwRWGHXnbIjPGhZTPu51koSFs5ihEhGfFO2B8x0S++y2yPBexNtOi41M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=samwein.com; spf=pass smtp.mailfrom=samwein.com; dkim=pass (2048-bit key) header.d=samwein.com header.i=@samwein.com header.b=CUTMd0QC; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=samwein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samwein.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samwein.com;
	s=protonmail2; t=1718650395; x=1718909595;
	bh=0U8OttajX9ITswcxmQmgSiPEx1Zre4DJ8QWk3cIeKUc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CUTMd0QCJaKozEh0F20crGlxyM5yct/PL0ZTAjLmNzEdbWC71qySRhc6M+bjEMinc
	 rNw7NtMeWdWn7H7pZrKDlBZF8Ik6bSWbp0+G79G5PAiVNOGV25D+EavsN6+qMQBOEb
	 rcg6FYZyZX3tY2XPAH8RftSPT9c6p6J/kTj3+MPxCbadvGwJp+1wHDAmfqW/lpsYek
	 6YwL5+DB3xn/WovleOZoSRl2uwr46oI7QV1mj9obUMnHKKR8nN8ntHTXBR7DfBxxa2
	 yfA9t/UvNpF1T8sdl0fG5qhzFLX6CEg/LA7s03q1VhRCNEGf5xeA6dqsdjGh3kpC27
	 WOqqwTTjbde+A==
Date: Mon, 17 Jun 2024 18:53:09 +0000
To: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com
From: Samuel Wein <sam@samwein.com>
Cc: Samuel Wein <sam@samwein.com>
Subject: [PATCH v3] media: Fix examples in ipu6-isys admin-guide
Message-ID: <20240617185243.12517-1-sam@samwein.com>
Feedback-ID: 2153553:user:proton
X-Pm-Message-ID: 733161ef395061d576b6af21aa0be81cb72b9698
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
 Documentation/admin-guide/media/ipu6-isys.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/=
admin-guide/media/ipu6-isys.rst
index 0721e920b5e6..d05086824a74 100644
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
-    media-ctl -v -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"
+    media-ctl -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"
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



