Return-Path: <linux-media+bounces-37540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79EB0292A
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 05:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3421BC2623
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 03:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5541A1EF38E;
	Sat, 12 Jul 2025 03:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q27WHixS"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892EE1B95B
	for <linux-media@vger.kernel.org>; Sat, 12 Jul 2025 03:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752291657; cv=none; b=bQnVPmByOYBYxF7SzheJDw6+6qI1uu1VL8KNa0dWgIp0dHMImqDB7w4+f/EuFRAs/kUQtxBZu+qOzfUdwNmQt/zPcqc1Me9WeXQKJLUVy/Mo7+Wk1u8vVl2dUeI9ziZc6KzEbX8/4PnRLTqVjED5lQep6pula98SKFS//CRKzp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752291657; c=relaxed/simple;
	bh=D0qAQ55bYi7rTrCHjcV5HRgRoMjPoXFxvJdiPguyScY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RjddARPxTeH5tE2Zo+9U9f6RiejOClMXOlZuR2tH6wNt4eRJ/bdoL0D2Z0pOSybsZ0ui2hdXocVEK/VHDkE7NXvqdnc1p2/sAsQFQFC0ZEH9WMMFiCp2+/2oyfXN4cY8ItzOpoDDoPzFBArz2Qa3DrMgVZ+KOuQK8/tJFToG05k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Q27WHixS; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250712034052epoutp028f93d668c47039b6f2c76ca71b7874f5~RY-lCyWJ32108321083epoutp02a
	for <linux-media@vger.kernel.org>; Sat, 12 Jul 2025 03:40:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250712034052epoutp028f93d668c47039b6f2c76ca71b7874f5~RY-lCyWJ32108321083epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752291652;
	bh=N/c5hghha+9UIfheH73lEwvF3nKdgG2uy6qz8YjGSl0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Q27WHixSi3jO301qMTqEXat3S7O1lBsk3TU2Cvfhl/siu7Ho3qukDytgFOlI1qRDd
	 LbE+G3Y+qFkK1BYWO7EM7kcNUKGNiwM3147GVvjkpldtDfgwaacB0z5Gc30XXSDhHg
	 loGPnGT+o+YpHbtJrlWlSDzx21itvQlOZ5NNPhW8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250712034051epcas5p19b1ae481e18dab36a306ca3a3996a034~RY-kgQq3o0081500815epcas5p1w;
	Sat, 12 Jul 2025 03:40:51 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.180]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bfDrK5jpwz2SSKY; Sat, 12 Jul
	2025 03:40:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250711110258epcas5p31b63da99019958cdbf9ed03818d7f573~RLYTpwGFr0548005480epcas5p3W;
	Fri, 11 Jul 2025 11:02:58 +0000 (GMT)
Received: from FDSFTE308 (unknown [107.122.81.79]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250711110257epsmtip2465d0b0f74561d47cb193d7c71f639f2~RLYSfQ7mE0137501375epsmtip2D;
	Fri, 11 Jul 2025 11:02:57 +0000 (GMT)
From: "Aakarsh Jain/Aakarsh Jain" <aakarsh.jain@samsung.com>
To: "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
	<linux-media@vger.kernel.org>
Cc: "'Mauro Carvalho Chehab'" <mchehab@kernel.org>, "'Hans Verkuil'"
	<hverkuil@kernel.org>, <linux-fsd@tesla.com>, "'Smitha T Murthy'"
	<smithatmurthy@gmail.com>, "'Nicolas Dufresne'" <nicolas@ndufresne.ca>
In-Reply-To: <20250711094159.144293-1-m.szyprowski@samsung.com>
Subject: RE: [PATCH v2] media: v4l2: Add support for NV12M tiled variants to
 v4l2_format_info()
Date: Fri, 11 Jul 2025 16:32:56 +0530
Message-ID: <000001dbf253$5c9270f0$15b752d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQECo7QjHBA6XIZXQP1wxF9dAC82SAHVR2SGtdC023A=
Content-Language: en-in
X-CMS-MailID: 20250711110258epcas5p31b63da99019958cdbf9ed03818d7f573
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785
References: <CGME20250711094214eucas1p2223ae658fe0d43cc6a9925f68ce71785@eucas1p2.samsung.com>
	<20250711094159.144293-1-m.szyprowski@samsung.com>



-----Original Message-----
From: Marek Szyprowski <m.szyprowski=40samsung.com>=20
Sent: 11 July 2025 15:12
To: linux-media=40vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski=40samsung.com>; Mauro Carvalho Chehab <m=
chehab=40kernel.org>; Hans Verkuil <hverkuil=40kernel.org>; linux-fsd=40tes=
la.com; Smitha T Murthy <smithatmurthy=40gmail.com>; Aakarsh Jain <aakarsh.=
jain=40samsung.com>; Nicolas Dufresne <nicolas=40ndufresne.ca>
Subject: =5BPATCH v2=5D media: v4l2: Add support for NV12M tiled variants t=
o v4l2_format_info()

Commit 6f1466123d73 (=22media: s5p-mfc: Add YV12 and I420 multiplanar forma=
t support=22) added support for the new formats to s5p-mfc driver, what in =
turn required some internal calls to the v4l2_format_info() function while =
setting up formats. This in turn broke support for the =22old=22 tiled NV12=
MT* formats, which are not recognized by this function.
Fix this by adding those variants of NV12M pixel format to
v4l2_format_info() function database.

Fixes: 6f1466123d73 (=22media: s5p-mfc: Add YV12 and I420 multiplanar forma=
t support=22)
Signed-off-by: Marek Szyprowski <m.szyprowski=40samsung.com>
Reviewed-by: Aakarsh Jain <aakarsh.jain=40samsung.com>
---
v2:
- added Fixes tag and block_w/h restrictions as suggested by Nicolas
---
 drivers/media/v4l2-core/v4l2-common.c =7C 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-cor=
e/v4l2-common.c
index df40756ac8f6..c8bd8e5697d4 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
=40=40 -323,6 +323,12 =40=40 const struct v4l2_format_info *v4l2_format_inf=
o(u32 format)
 		=7B .format =3D V4L2_PIX_FMT_NV61M,   .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D =7B 1, 2, 0, 0 =7D, .bpp_d=
iv =3D =7B 1, 1, 1, 1 =7D, .hdiv =3D 2, .vdiv =3D 1 =7D,
 		=7B .format =3D V4L2_PIX_FMT_P012M,   .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D =7B 2, 4, 0, 0 =7D, .bpp_d=
iv =3D =7B 1, 1, 1, 1 =7D, .hdiv =3D 2, .vdiv =3D 2 =7D,
=20
+		/* Tiled YUV formats, non contiguous variant */
+		=7B .format =3D V4L2_PIX_FMT_NV12MT,        .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D =7B 1, 2, 0, 0 =7D, =
.bpp_div =3D =7B 1, 1, 1, 1 =7D, .hdiv =3D 2, .vdiv =3D 2,
+		  .block_w =3D =7B 64, 32, 0, 0 =7D,	.block_h =3D =7B 32, 16, 0, 0 =7D=
=7D,
+		=7B .format =3D V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D =7B 1, 2, 0, 0 =7D, =
.bpp_div =3D =7B 1, 1, 1, 1 =7D, .hdiv =3D 2, .vdiv =3D 2,
+		  .block_w =3D =7B 16,  8, 0, 0 =7D,	.block_h =3D =7B 16,  8, 0, 0 =7D=
=7D,
+
 		/* Bayer RGB formats */
 		=7B .format =3D V4L2_PIX_FMT_SBGGR8,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D =7B 1, 0, 0, 0 =7D, .bpp_=
div =3D =7B 1, 1, 1, 1 =7D, .hdiv =3D 1, .vdiv =3D 1 =7D,
 		=7B .format =3D V4L2_PIX_FMT_SGBRG8,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYER=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D =7B 1, 0, 0, 0 =7D, .bpp_=
div =3D =7B 1, 1, 1, 1 =7D, .hdiv =3D 1, .vdiv =3D 1 =7D,
--
2.34.1



