Return-Path: <linux-media+bounces-2384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F07812880
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BA681F21B7D
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 06:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC43D536;
	Thu, 14 Dec 2023 06:50:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07608106;
	Wed, 13 Dec 2023 22:50:43 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 72E308175;
	Thu, 14 Dec 2023 14:50:36 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:36 +0800
Received: from ubuntu.mshome.net (113.72.145.168) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:33 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"Marvin Lin" <milkfafa@gmail.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, "Ming Qian" <ming.qian@nxp.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: [PATCH v1 3/9] media: videodev2.h, v4l2-ioctl: Add StarFive ISP meta buffer format
Date: Wed, 13 Dec 2023 22:50:21 -0800
Message-ID: <20231214065027.28564-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
References: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add the StarFive ISP specific metadata format
V4L2_META_FMT_STF_ISP_STAT_3A for 3A.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
index 33076af4dfdb..dfc031e575e9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1445,6 +1445,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
 	case V4L2_META_FMT_VIVID:       descr =3D "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr =3D "Rockchip ISP1 3A Paramete=
rs"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr =3D "Rockchip ISP1 3A Statist=
ics"; break;
+	case V4L2_META_FMT_STF_ISP_STAT_3A:	descr =3D "StarFive ISP 3A Statisti=
cs"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr =3D "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr =3D "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr =3D "10-bit NV12 (8x128 Linear=
, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
index 68e7ac178cc2..0c3d19a1c8cf 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -839,6 +839,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* =
Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /*=
 Rockchip ISP1 3A Statistics */
=20
+/* Vendor specific - used for StarFive JH7110 ISP camera sub-system */
+#define V4L2_META_FMT_STF_ISP_STAT_3A	v4l2_fourcc('S', 'T', 'F', 'S') /*=
 StarFive ISP 3A Statistics */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
=20
--=20
2.25.1


