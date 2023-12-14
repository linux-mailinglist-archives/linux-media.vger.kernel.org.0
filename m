Return-Path: <linux-media+bounces-2382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0235E81287B
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25A051C21494
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 06:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94306D505;
	Thu, 14 Dec 2023 06:50:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2596E8;
	Wed, 13 Dec 2023 22:50:39 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9D252814B;
	Thu, 14 Dec 2023 14:50:38 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:38 +0800
Received: from ubuntu.mshome.net (113.72.145.168) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:35 +0800
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
Subject: [PATCH v1 4/9] staging: media: starfive: camss: Replace format index with pad
Date: Wed, 13 Dec 2023 22:50:22 -0800
Message-ID: <20231214065027.28564-5-changhuang.liang@starfivetech.com>
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

Replace format index with pad.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-isp.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/sta=
ging/media/starfive/camss/stf-isp.c
index ac83f23842df..c3ae02cf6dd8 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -11,9 +11,6 @@
=20
 #include "stf-camss.h"
=20
-#define SINK_FORMATS_INDEX	0
-#define SOURCE_FORMATS_INDEX	1
-
 static int isp_set_selection(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
@@ -95,11 +92,7 @@ static void isp_try_format(struct stf_isp_dev *isp_dev=
,
 		return;
 	}
=20
-	if (pad =3D=3D STF_ISP_PAD_SINK)
-		formats =3D &isp_dev->formats[SINK_FORMATS_INDEX];
-	else if (pad =3D=3D STF_ISP_PAD_SRC)
-		formats =3D &isp_dev->formats[SOURCE_FORMATS_INDEX];
-
+	formats =3D &isp_dev->formats[pad];
 	fmt->width =3D clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
 			     STFCAMSS_FRAME_MAX_WIDTH);
 	fmt->height =3D clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
@@ -124,7 +117,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index >=3D ARRAY_SIZE(isp_formats_sink))
 			return -EINVAL;
=20
-		formats =3D &isp_dev->formats[SINK_FORMATS_INDEX];
+		formats =3D &isp_dev->formats[code->pad];
 		code->code =3D formats->fmts[code->index].code;
 	} else {
 		struct v4l2_mbus_framefmt *sink_fmt;
--=20
2.25.1


