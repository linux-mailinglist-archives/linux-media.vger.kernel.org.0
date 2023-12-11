Return-Path: <linux-media+bounces-2081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A580C4F8
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 10:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C31CB20F6E
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 09:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB032137F;
	Mon, 11 Dec 2023 09:43:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102ABD1;
	Mon, 11 Dec 2023 01:43:32 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C4AA624DC33;
	Mon, 11 Dec 2023 17:43:30 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 17:43:30 +0800
Received: from ubuntu.localdomain (183.27.97.57) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 17:43:29 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] media: cadence: csi2rx: Add enum_mbus_code pad ops
Date: Mon, 11 Dec 2023 01:43:29 -0800
Message-ID: <20231211094329.9090-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add enum_mbus_code ioctl so that user space can know what
formats are supported to csi2rx.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
index 889f4fbbafb3..7788ce0e3171 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -389,6 +389,18 @@ static int csi2rx_s_stream(struct v4l2_subdev *subde=
v, int enable)
 	return ret;
 }
=20
+static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >=3D ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	code_enum->code =3D formats[code_enum->index].code;
+
+	return 0;
+}
+
 static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
@@ -439,6 +451,7 @@ static int csi2rx_init_cfg(struct v4l2_subdev *subdev=
,
 }
=20
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops =3D {
+	.enum_mbus_code	=3D csi2rx_enum_mbus_code,
 	.get_fmt	=3D v4l2_subdev_get_fmt,
 	.set_fmt	=3D csi2rx_set_fmt,
 	.init_cfg	=3D csi2rx_init_cfg,
--=20
2.25.1


