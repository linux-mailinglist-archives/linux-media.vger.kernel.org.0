Return-Path: <linux-media+bounces-2391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220681288E
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E861C214BA
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 06:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FCB12E52;
	Thu, 14 Dec 2023 06:50:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AEDE8;
	Wed, 13 Dec 2023 22:50:52 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BE20A24E303;
	Thu, 14 Dec 2023 14:50:50 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:50 +0800
Received: from ubuntu.mshome.net (113.72.145.168) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:49 +0800
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
Subject: [PATCH v1 9/9] admin-guide: media: Update documents for StarFive Camera Subsystem
Date: Wed, 13 Dec 2023 22:50:27 -0800
Message-ID: <20231214065027.28564-10-changhuang.liang@starfivetech.com>
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

Add ISP 3A statistisc collection data video device for documents.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../admin-guide/media/starfive_camss.rst      |  9 ++++++---
 .../media/starfive_camss_graph.dot            | 20 ++++++++++---------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/media/starfive_camss.rst b/Documen=
tation/admin-guide/media/starfive_camss.rst
index ca42e9447c47..970ae20140d1 100644
--- a/Documentation/admin-guide/media/starfive_camss.rst
+++ b/Documentation/admin-guide/media/starfive_camss.rst
@@ -58,15 +58,18 @@ The media controller pipeline graph is as follows:
     :alt:   starfive_camss_graph.dot
     :align: center
=20
-The driver has 2 video devices:
+The driver has 3 video devices:
=20
 - capture_raw: The capture device, capturing image data directly from a =
sensor.
 - capture_yuv: The capture device, capturing YUV frame data processed by=
 the
-  ISP module
+  ISP module.
+- capture_scd: The meta capture device, capturing 3A statistics collecti=
on data
+  processed by the ISP module.
=20
 The driver has 3 subdevices:
=20
-- stf_isp: is responsible for all the isp operations, outputs YUV frames=
.
+- stf_isp: is responsible for all the isp operations, outputs YUV frames
+  and 3A statistics collection data.
 - cdns_csi2rx: a CSI-2 bridge supporting up to 4 CSI lanes in input, and=
 4
   different pixel streams in output.
 - imx219: an image sensor, image data is sent through MIPI CSI-2.
diff --git a/Documentation/admin-guide/media/starfive_camss_graph.dot b/D=
ocumentation/admin-guide/media/starfive_camss_graph.dot
index 8eff1f161ac7..3fd42e3cc0f6 100644
--- a/Documentation/admin-guide/media/starfive_camss_graph.dot
+++ b/Documentation/admin-guide/media/starfive_camss_graph.dot
@@ -1,12 +1,14 @@
 digraph board {
 	rankdir=3DTB
-	n00000001 [label=3D"{{<port0> 0} | stf_isp\n/dev/v4l-subdev0 | {<port1>=
 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
-	n00000001:port1 -> n00000008 [style=3Ddashed]
-	n00000004 [label=3D"capture_raw\n/dev/video0", shape=3Dbox, style=3Dfil=
led, fillcolor=3Dyellow]
-	n00000008 [label=3D"capture_yuv\n/dev/video1", shape=3Dbox, style=3Dfil=
led, fillcolor=3Dyellow]
-	n0000000e [label=3D"{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n | =
{<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=3DMrecord, style=
=3Dfilled, fillcolor=3Dgreen]
-	n0000000e:port1 -> n00000001:port0 [style=3Ddashed]
-	n0000000e:port1 -> n00000004 [style=3Ddashed]
-	n00000018 [label=3D"{{} | imx219 6-0010\n/dev/v4l-subdev1 | {<port0> 0}=
}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
-	n00000018:port0 -> n0000000e:port0 [style=3Dbold]
+	n00000001 [label=3D"{{<port0> 0} | stf_isp\n/dev/v4l-subdev0 | {<port1>=
 1 | <port2> 2}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
+	n00000001:port1 -> n00000009 [style=3Ddashed]
+	n00000001:port2 -> n0000000d [style=3Ddashed]
+	n00000005 [label=3D"capture_raw\n/dev/video0", shape=3Dbox, style=3Dfil=
led, fillcolor=3Dyellow]
+	n00000009 [label=3D"capture_yuv\n/dev/video1", shape=3Dbox, style=3Dfil=
led, fillcolor=3Dyellow]
+	n0000000d [label=3D"capture_scd\n/dev/video2", shape=3Dbox, style=3Dfil=
led, fillcolor=3Dyellow]
+	n00000015 [label=3D"{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n/de=
v/v4l-subdev1 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=3D=
Mrecord, style=3Dfilled, fillcolor=3Dgreen]
+	n00000015:port1 -> n00000001:port0 [style=3Ddashed]
+	n00000015:port1 -> n00000005 [style=3Ddashed]
+	n0000001f [label=3D"{{} | imx219 6-0010\n/dev/v4l-subdev2 | {<port0> 0}=
}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
+	n0000001f:port0 -> n00000015:port0 [style=3Dbold]
 }
--=20
2.25.1


