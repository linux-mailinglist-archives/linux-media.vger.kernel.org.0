Return-Path: <linux-media+bounces-2386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D22812884
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55D34282A89
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 06:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80951DDD2;
	Thu, 14 Dec 2023 06:50:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AB5100;
	Wed, 13 Dec 2023 22:50:42 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 43CAE24E2CC;
	Thu, 14 Dec 2023 14:50:41 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:41 +0800
Received: from ubuntu.mshome.net (113.72.145.168) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:39 +0800
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
Subject: [PATCH v1 5/9] staging: media: starfive: camss: Add for StarFive ISP 3A
Date: Wed, 13 Dec 2023 22:50:23 -0800
Message-ID: <20231214065027.28564-6-changhuang.liang@starfivetech.com>
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

Add for StarFive ISP 3A.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-camss.c  |   8 +
 .../media/starfive/camss/stf-capture.c        |  89 ++++++++++-
 .../staging/media/starfive/camss/stf-isp.c    |  58 ++++++-
 .../staging/media/starfive/camss/stf-isp.h    |  14 ++
 .../staging/media/starfive/camss/stf-video.c  | 143 +++++++++++++++++-
 .../staging/media/starfive/camss/stf-video.h  |   2 +
 6 files changed, 295 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/s=
taging/media/starfive/camss/stf-camss.c
index a587f860101a..3175d0d9a05c 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -126,6 +126,7 @@ static int stfcamss_of_parse_ports(struct stfcamss *s=
tfcamss)
 static int stfcamss_register_devs(struct stfcamss *stfcamss)
 {
 	struct stf_capture *cap_yuv =3D &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd =3D &stfcamss->captures[STF_CAPTURE_SCD];
 	struct stf_isp_dev *isp_dev =3D &stfcamss->isp_dev;
 	int ret;
=20
@@ -150,6 +151,13 @@ static int stfcamss_register_devs(struct stfcamss *s=
tfcamss)
=20
 	cap_yuv->video.source_subdev =3D &isp_dev->subdev;
=20
+	ret =3D media_create_pad_link(&isp_dev->subdev.entity, STF_ISP_PAD_SRC_=
SCD,
+				    &cap_scd->video.vdev.entity, 0, 0);
+	if (ret)
+		goto err_cap_unregister;
+
+	cap_scd->video.source_subdev =3D &isp_dev->subdev;
+
 	return ret;
=20
 err_cap_unregister:
diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers=
/staging/media/starfive/camss/stf-capture.c
index 70c24b050a1b..6a137a273c8a 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -12,6 +12,7 @@
 static const char * const stf_cap_names[] =3D {
 	"capture_raw",
 	"capture_yuv",
+	"capture_scd",
 };
=20
 static const struct stfcamss_format_info stf_wr_fmts[] =3D {
@@ -55,6 +56,14 @@ static const struct stfcamss_format_info stf_isp_fmts[=
] =3D {
 	},
 };
=20
+/* 3A Statistics Collection Data */
+static const struct stfcamss_format_info stf_isp_scd_fmts[] =3D {
+	{
+		.code =3D MEDIA_BUS_FMT_METADATA_FIXED,
+		.pixelformat =3D V4L2_META_FMT_STF_ISP_STAT_3A,
+	},
+};
+
 static inline struct stf_capture *to_stf_capture(struct stfcamss_video *=
video)
 {
 	return container_of(video, struct stf_capture, video);
@@ -73,6 +82,49 @@ static void stf_set_yuv_addr(struct stfcamss *stfcamss=
,
 	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
 }
=20
+static enum stf_isp_type_scd stf_get_isp_scd_type(struct stfcamss *stfca=
mss)
+{
+	int val;
+
+	val =3D stf_isp_reg_read(stfcamss, ISP_REG_SC_CFG_1);
+	return (enum stf_isp_type_scd)(val & ISP_SC_SEL_MASK) >> 30;
+}
+
+static void stf_set_scd_addr(struct stfcamss *stfcamss,
+			     dma_addr_t yhist_addr, dma_addr_t scd_addr,
+			     enum stf_isp_type_scd type_scd)
+{
+	stf_isp_reg_set_bit(stfcamss, ISP_REG_SC_CFG_1, ISP_SC_SEL_MASK,
+			    SEL_TYPE(type_scd));
+	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_0, scd_addr);
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_4, yhist_addr);
+}
+
+static void stf_isp_fill_yhist(struct stfcamss *stfcamss, void *vaddr_sc=
)
+{
+	struct jh7110_isp_sc_buffer *sc =3D (struct jh7110_isp_sc_buffer *)vadd=
r_sc;
+	u32 reg_addr =3D ISP_REG_YHIST_ACC_0;
+	u32 i;
+
+	for (i =3D 0; i < 64; i++, reg_addr +=3D 4)
+		sc->y_histogram[i] =3D stf_isp_reg_read(stfcamss, reg_addr);
+}
+
+static void stf_isp_fill_flag(struct stfcamss *stfcamss, void *vaddr_sc,
+			      enum stf_isp_type_scd *type_scd)
+{
+	struct jh7110_isp_sc_buffer *sc =3D (struct jh7110_isp_sc_buffer *)vadd=
r_sc;
+
+	*type_scd =3D stf_get_isp_scd_type(stfcamss);
+	if (*type_scd =3D=3D TYPE_AWB) {
+		sc->flag =3D JH7110_ISP_SC_FALG_VALID;
+		*type_scd =3D TYPE_OECF;
+	} else {
+		sc->flag =3D JH7110_ISP_SC_FALG_INVALID;
+		*type_scd =3D TYPE_AWB;
+	}
+}
+
 static void stf_init_addrs(struct stfcamss_video *video)
 {
 	struct stf_capture *cap =3D to_stf_capture(video);
@@ -91,6 +143,8 @@ static void stf_init_addrs(struct stfcamss_video *vide=
o)
 		stf_set_raw_addr(video->stfcamss, addr0);
 	else if (cap->type =3D=3D STF_CAPTURE_YUV)
 		stf_set_yuv_addr(video->stfcamss, addr0, addr1);
+	else
+		stf_set_scd_addr(video->stfcamss, addr0, addr1, TYPE_AWB);
 }
=20
 static struct stfcamss_buffer *stf_buf_get_pending(struct stf_v_buf *out=
put)
@@ -248,18 +302,24 @@ static void stf_capture_init(struct stfcamss *stfca=
mss, struct stf_capture *cap)
 	INIT_LIST_HEAD(&cap->buffers.ready_bufs);
 	spin_lock_init(&cap->buffers.lock);
=20
-	cap->video.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	cap->video.stfcamss =3D stfcamss;
 	cap->video.bpl_alignment =3D 16 * 8;
=20
 	if (cap->type =3D=3D STF_CAPTURE_RAW) {
+		cap->video.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		cap->video.formats =3D stf_wr_fmts;
 		cap->video.nformats =3D ARRAY_SIZE(stf_wr_fmts);
 		cap->video.bpl_alignment =3D 8;
 	} else if (cap->type =3D=3D STF_CAPTURE_YUV) {
+		cap->video.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		cap->video.formats =3D stf_isp_fmts;
 		cap->video.nformats =3D ARRAY_SIZE(stf_isp_fmts);
 		cap->video.bpl_alignment =3D 1;
+	} else {
+		cap->video.type =3D V4L2_BUF_TYPE_META_CAPTURE;
+		cap->video.formats =3D stf_isp_scd_fmts;
+		cap->video.nformats =3D ARRAY_SIZE(stf_isp_scd_fmts);
+		cap->video.bpl_alignment =3D 16 * 8;
 	}
 }
=20
@@ -371,6 +431,7 @@ static void stf_buf_flush(struct stf_v_buf *output, e=
num vb2_buffer_state state)
 static void stf_buf_done(struct stf_v_buf *output)
 {
 	struct stfcamss_buffer *ready_buf;
+	struct stfcamss *stfcamss =3D cap->video.stfcamss;
 	u64 ts =3D ktime_get_ns();
 	unsigned long flags;
=20
@@ -381,6 +442,9 @@ static void stf_buf_done(struct stf_v_buf *output)
 	spin_lock_irqsave(&output->lock, flags);
=20
 	while ((ready_buf =3D stf_buf_get_ready(output))) {
+		if (cap->type =3D=3D STF_CAPTURE_SCD)
+			stf_isp_fill_yhist(stfcamss, ready_buf->vaddr_sc);
+
 		ready_buf->vb.vb2_buf.timestamp =3D ts;
 		ready_buf->vb.sequence =3D output->sequence++;
=20
@@ -399,6 +463,7 @@ static void stf_change_buffer(struct stf_v_buf *outpu=
t)
 	dma_addr_t *new_addr;
 	unsigned long flags;
 	u32 active_index;
+	enum stf_isp_type_scd type_scd;
=20
 	if (output->state =3D=3D STF_OUTPUT_OFF ||
 	    output->state =3D=3D STF_OUTPUT_STOPPING ||
@@ -437,10 +502,16 @@ static void stf_change_buffer(struct stf_v_buf *out=
put)
 	if (output->state =3D=3D STF_OUTPUT_STOPPING) {
 		output->last_buffer =3D ready_buf;
 	} else {
-		if (cap->type =3D=3D STF_CAPTURE_RAW)
+		if (cap->type =3D=3D STF_CAPTURE_RAW) {
 			stf_set_raw_addr(stfcamss, new_addr[0]);
-		else if (cap->type =3D=3D STF_CAPTURE_YUV)
+		} else if (cap->type =3D=3D STF_CAPTURE_YUV) {
 			stf_set_yuv_addr(stfcamss, new_addr[0], new_addr[1]);
+		} else {
+			stf_isp_fill_flag(stfcamss, ready_buf->vaddr_sc,
+					  &type_scd);
+			stf_set_scd_addr(stfcamss, new_addr[0],
+					 new_addr[1], type_scd);
+		}
=20
 		stf_buf_add_ready(output, ready_buf);
 	}
@@ -469,6 +540,7 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss =3D priv;
 	struct stf_capture *cap =3D &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd =3D &stfcamss->captures[STF_CAPTURE_SCD];
 	u32 status;
=20
 	status =3D stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
@@ -476,6 +548,9 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 		if (status & ISPC_ENUO)
 			stf_buf_done(&cap->buffers);
=20
+		if (status & ISPC_SC)
+			stf_buf_done(&cap_scd->buffers);
+
 		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
 				  (status & ~ISPC_INT_ALL_MASK) |
 				  ISPC_ISP | ISPC_CSI | ISPC_SC);
@@ -488,13 +563,19 @@ irqreturn_t stf_line_irq_handler(int irq, void *pri=
v)
 {
 	struct stfcamss *stfcamss =3D priv;
 	struct stf_capture *cap =3D &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd =3D &stfcamss->captures[STF_CAPTURE_SCD];
 	u32 status;
+	u32 value;
=20
 	status =3D stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
 	if (status & ISPC_LINE) {
 		if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
 			if ((status & ISPC_ENUO))
 				stf_change_buffer(&cap->buffers);
+
+			value =3D stf_isp_reg_read(stfcamss, ISP_REG_CSI_MODULE_CFG);
+			if (value & CSI_SC_EN)
+				stf_change_buffer(&cap_scd->buffers);
 		}
=20
 		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
@@ -571,9 +652,11 @@ void stf_capture_unregister(struct stfcamss *stfcams=
s)
 {
 	struct stf_capture *cap_raw =3D &stfcamss->captures[STF_CAPTURE_RAW];
 	struct stf_capture *cap_yuv =3D &stfcamss->captures[STF_CAPTURE_YUV];
+	struct stf_capture *cap_scd =3D &stfcamss->captures[STF_CAPTURE_SCD];
=20
 	stf_capture_unregister_one(cap_raw);
 	stf_capture_unregister_one(cap_yuv);
+	stf_capture_unregister_one(cap_scd);
 }
=20
 int stf_capture_register(struct stfcamss *stfcamss,
diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/sta=
ging/media/starfive/camss/stf-isp.c
index c3ae02cf6dd8..aaa17bfc2bb8 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -26,9 +26,14 @@ static const struct stf_isp_format isp_formats_source[=
] =3D {
 	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8 },
 };
=20
+static const struct stf_isp_format isp_formats_source_scd[] =3D {
+	{ MEDIA_BUS_FMT_METADATA_FIXED },
+};
+
 static const struct stf_isp_format_table isp_formats_st7110[] =3D {
 	{ isp_formats_sink, ARRAY_SIZE(isp_formats_sink) },
 	{ isp_formats_source, ARRAY_SIZE(isp_formats_source) },
+	{ isp_formats_source_scd, ARRAY_SIZE(isp_formats_source_scd) },
 };
=20
 static const struct stf_isp_format *
@@ -93,13 +98,20 @@ static void isp_try_format(struct stf_isp_dev *isp_de=
v,
 	}
=20
 	formats =3D &isp_dev->formats[pad];
-	fmt->width =3D clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
-			     STFCAMSS_FRAME_MAX_WIDTH);
-	fmt->height =3D clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
-			      STFCAMSS_FRAME_MAX_HEIGHT);
-	fmt->height &=3D ~0x1;
+
+	if (pad !=3D STF_ISP_PAD_SRC_SCD) {
+		fmt->width =3D clamp_t(u32, fmt->width, STFCAMSS_FRAME_MIN_WIDTH,
+				     STFCAMSS_FRAME_MAX_WIDTH);
+		fmt->height =3D clamp_t(u32, fmt->height, STFCAMSS_FRAME_MIN_HEIGHT,
+				      STFCAMSS_FRAME_MAX_HEIGHT);
+		fmt->height &=3D ~0x1;
+		fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
+	} else {
+		fmt->width =3D 1;
+		fmt->height =3D 1;
+	}
+
 	fmt->field =3D V4L2_FIELD_NONE;
-	fmt->colorspace =3D V4L2_COLORSPACE_SRGB;
 	fmt->flags =3D 0;
=20
 	if (!stf_g_fmt_by_mcode(formats, fmt->code))
@@ -119,7 +131,7 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd,
=20
 		formats =3D &isp_dev->formats[code->pad];
 		code->code =3D formats->fmts[code->index].code;
-	} else {
+	} else if (code->pad =3D=3D STF_ISP_PAD_SRC) {
 		struct v4l2_mbus_framefmt *sink_fmt;
=20
 		if (code->index >=3D ARRAY_SIZE(isp_formats_source))
@@ -131,6 +143,10 @@ static int isp_enum_mbus_code(struct v4l2_subdev *sd=
,
 		code->code =3D sink_fmt->code;
 		if (!code->code)
 			return -EINVAL;
+	} else {
+		if (code->index > 0)
+			return -EINVAL;
+		code->code =3D MEDIA_BUS_FMT_METADATA_FIXED;
 	}
 	code->flags =3D 0;
=20
@@ -151,6 +167,9 @@ static int isp_set_format(struct v4l2_subdev *sd,
 	isp_try_format(isp_dev, state, fmt->pad, &fmt->format);
 	*format =3D fmt->format;
=20
+	if (fmt->pad =3D=3D STF_ISP_PAD_SRC_SCD)
+		return 0;
+
 	isp_dev->current_fmt =3D stf_g_fmt_by_mcode(&isp_dev->formats[fmt->pad]=
,
 						  fmt->format.code);
=20
@@ -202,6 +221,9 @@ static int isp_get_selection(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt =3D { 0 };
 	struct v4l2_rect *rect;
=20
+	if (sel->pad =3D=3D STF_ISP_PAD_SRC_SCD)
+		return -EINVAL;
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		if (sel->pad =3D=3D STF_ISP_PAD_SINK) {
@@ -239,6 +261,9 @@ static int isp_set_selection(struct v4l2_subdev *sd,
 	struct stf_isp_dev *isp_dev =3D v4l2_get_subdevdata(sd);
 	struct v4l2_rect *rect;
=20
+	if (sel->pad =3D=3D STF_ISP_PAD_SRC_SCD)
+		return -EINVAL;
+
 	if (sel->target !=3D V4L2_SEL_TGT_CROP)
 		return -EINVAL;
=20
@@ -296,8 +321,24 @@ static int isp_init_formats(struct v4l2_subdev *sd,
 			.height =3D 1080
 		}
 	};
+	struct v4l2_subdev_format format_scd =3D {
+		.pad =3D STF_ISP_PAD_SRC_SCD,
+		.which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format =3D {
+			.code =3D MEDIA_BUS_FMT_METADATA_FIXED,
+			.width =3D 1,
+			.height =3D 1
+		}
+	};
+	int ret;
+
+	/* Init for STF_ISP_PAD_SINK and STF_ISP_PAD_SRC pad */
+	ret =3D isp_set_format(sd, sd_state, &format);
+	if (ret < 0)
+		return ret;
=20
-	return isp_set_format(sd, sd_state, &format);
+	/* Init for STF_ISP_PAD_SRC_SCD pad */
+	return isp_set_format(sd, sd_state, &format_scd);
 }
=20
 static const struct v4l2_subdev_core_ops isp_core_ops =3D {
@@ -631,6 +672,7 @@ int stf_isp_register(struct stf_isp_dev *isp_dev, str=
uct v4l2_device *v4l2_dev)
=20
 	pads[STF_ISP_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
 	pads[STF_ISP_PAD_SRC].flags =3D MEDIA_PAD_FL_SOURCE;
+	pads[STF_ISP_PAD_SRC_SCD].flags =3D MEDIA_PAD_FL_SOURCE;
=20
 	sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
 	sd->entity.ops =3D &isp_media_ops;
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/sta=
ging/media/starfive/camss/stf-isp.h
index 1d98754964ce..bfb7196cefff 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -417,6 +417,10 @@
 #define DNRM_F(n)				((n) << 16)
 #define CCM_M_DAT(n)				((n) << 0)
=20
+#define ISP_REG_YHIST_CFG_4			0xcd8
+
+#define ISP_REG_YHIST_ACC_0			0xd00
+
 #define ISP_REG_GAMMA_VAL0			0xe00
 #define ISP_REG_GAMMA_VAL1			0xe04
 #define ISP_REG_GAMMA_VAL2			0xe08
@@ -501,10 +505,20 @@
 #define IMAGE_MAX_WIDTH				1920
 #define IMAGE_MAX_HEIGH				1080
=20
+#define ISP_YHIST_BUFFER_SIZE			(64 * sizeof(__u32))
+
+enum stf_isp_type_scd {
+	TYPE_DEC =3D 0,
+	TYPE_OBC,
+	TYPE_OECF,
+	TYPE_AWB,
+};
+
 /* pad id for media framework */
 enum stf_isp_pad_id {
 	STF_ISP_PAD_SINK =3D 0,
 	STF_ISP_PAD_SRC,
+	STF_ISP_PAD_SRC_SCD,
 	STF_ISP_PAD_MAX
 };
=20
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/s=
taging/media/starfive/camss/stf-video.c
index 0b305f21eb53..f617b7b00491 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -125,6 +125,14 @@ static int stf_video_init_format(struct stfcamss_vid=
eo *video)
 	return 0;
 }
=20
+static int stf_video_scd_init_format(struct stfcamss_video *video)
+{
+	video->active_fmt.fmt.meta.dataformat =3D video->formats[0].pixelformat=
;
+	video->active_fmt.fmt.meta.buffersize =3D sizeof(struct jh7110_isp_sc_b=
uffer);
+
+	return 0;
+}
+
 /* ---------------------------------------------------------------------=
--------
  * Video queue operations
  */
@@ -330,6 +338,75 @@ static const struct vb2_ops stf_video_vb2_q_ops =3D =
{
 	.stop_streaming  =3D video_stop_streaming,
 };
=20
+static int video_scd_queue_setup(struct vb2_queue *q,
+				 unsigned int *num_buffers,
+				 unsigned int *num_planes,
+				 unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	*num_planes =3D 1;
+	sizes[0] =3D sizeof(struct jh7110_isp_sc_buffer);
+
+	return 0;
+}
+
+static int video_scd_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+	struct stfcamss_buffer *buffer =3D to_stfcamss_buffer(vbuf);
+	dma_addr_t *paddr;
+
+	paddr =3D vb2_plane_cookie(vb, 0);
+	buffer->addr[0] =3D *paddr;
+	buffer->addr[1] =3D buffer->addr[0] + ISP_YHIST_BUFFER_SIZE;
+	buffer->vaddr_sc =3D vb2_plane_vaddr(vb, 0);
+
+	return 0;
+}
+
+static int video_scd_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
+
+	if (sizeof(struct jh7110_isp_sc_buffer) > vb2_plane_size(vb, 0))
+		return -EINVAL;
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct jh7110_isp_sc_buffer));
+
+	vbuf->field =3D V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int video_scd_start_streaming(struct vb2_queue *q, unsigned int c=
ount)
+{
+	struct stfcamss_video *video =3D vb2_get_drv_priv(q);
+
+	video->ops->start_streaming(video);
+
+	return 0;
+}
+
+static void video_scd_stop_streaming(struct vb2_queue *q)
+{
+	struct stfcamss_video *video =3D vb2_get_drv_priv(q);
+
+	video->ops->stop_streaming(video);
+
+	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops stf_video_scd_vb2_q_ops =3D {
+	.queue_setup     =3D video_scd_queue_setup,
+	.wait_prepare    =3D vb2_ops_wait_prepare,
+	.wait_finish     =3D vb2_ops_wait_finish,
+	.buf_init        =3D video_scd_buf_init,
+	.buf_prepare     =3D video_scd_buf_prepare,
+	.buf_queue       =3D video_buf_queue,
+	.start_streaming =3D video_scd_start_streaming,
+	.stop_streaming  =3D video_scd_stop_streaming,
+};
+
 /* ---------------------------------------------------------------------=
--------
  * V4L2 ioctls
  */
@@ -448,6 +525,37 @@ static const struct v4l2_ioctl_ops stf_vid_ioctl_ops=
 =3D {
 	.vidioc_streamoff               =3D vb2_ioctl_streamoff,
 };
=20
+static int video_scd_g_fmt(struct file *file, void *fh, struct v4l2_form=
at *f)
+{
+	struct stfcamss_video *video =3D video_drvdata(file);
+	struct v4l2_meta_format *meta =3D &f->fmt.meta;
+
+	if (f->type !=3D video->type)
+		return -EINVAL;
+
+	meta->dataformat =3D video->active_fmt.fmt.meta.dataformat;
+	meta->buffersize =3D video->active_fmt.fmt.meta.buffersize;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops stf_vid_scd_ioctl_ops =3D {
+	.vidioc_querycap                =3D video_querycap,
+	.vidioc_enum_fmt_meta_cap       =3D video_enum_fmt,
+	.vidioc_g_fmt_meta_cap          =3D video_scd_g_fmt,
+	.vidioc_s_fmt_meta_cap          =3D video_scd_g_fmt,
+	.vidioc_try_fmt_meta_cap        =3D video_scd_g_fmt,
+	.vidioc_reqbufs                 =3D vb2_ioctl_reqbufs,
+	.vidioc_querybuf                =3D vb2_ioctl_querybuf,
+	.vidioc_qbuf                    =3D vb2_ioctl_qbuf,
+	.vidioc_expbuf                  =3D vb2_ioctl_expbuf,
+	.vidioc_dqbuf                   =3D vb2_ioctl_dqbuf,
+	.vidioc_create_bufs             =3D vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
+	.vidioc_streamon                =3D vb2_ioctl_streamon,
+	.vidioc_streamoff               =3D vb2_ioctl_streamoff,
+};
+
 /* ---------------------------------------------------------------------=
--------
  * V4L2 file operations
  */
@@ -473,6 +581,9 @@ static int stf_link_validate(struct media_link *link)
 	struct stfcamss_video *video =3D video_get_drvdata(vdev);
 	int ret;
=20
+	if (video->type =3D=3D V4L2_BUF_TYPE_META_CAPTURE)
+		return 0;
+
 	ret =3D stf_video_check_format(video);
=20
 	return ret;
@@ -506,7 +617,11 @@ int stf_video_register(struct stfcamss_video *video,
 	q =3D &video->vb2_q;
 	q->drv_priv =3D video;
 	q->mem_ops =3D &vb2_dma_contig_memops;
-	q->ops =3D &stf_video_vb2_q_ops;
+
+	if (video->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		q->ops =3D &stf_video_vb2_q_ops;
+	else
+		q->ops =3D &stf_video_scd_vb2_q_ops;
 	q->type =3D video->type;
 	q->io_modes =3D VB2_DMABUF | VB2_MMAP;
 	q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
@@ -529,16 +644,28 @@ int stf_video_register(struct stfcamss_video *video=
,
 		goto err_mutex_destroy;
 	}
=20
-	ret =3D stf_video_init_format(video);
-	if (ret < 0) {
-		dev_err(video->stfcamss->dev,
-			"Failed to init format: %d\n", ret);
-		goto err_media_cleanup;
+	if (video->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		ret =3D stf_video_init_format(video);
+		if (ret < 0) {
+			dev_err(video->stfcamss->dev,
+				"Failed to init format: %d\n", ret);
+			goto err_media_cleanup;
+		}
+		vdev->ioctl_ops =3D &stf_vid_ioctl_ops;
+		vdev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE;
+	} else {
+		ret =3D stf_video_scd_init_format(video);
+		if (ret < 0) {
+			dev_err(video->stfcamss->dev,
+				"Failed to init format: %d\n", ret);
+			goto err_media_cleanup;
+		}
+		vdev->ioctl_ops =3D &stf_vid_scd_ioctl_ops;
+		vdev->device_caps =3D V4L2_CAP_META_CAPTURE;
 	}
=20
 	vdev->fops =3D &stf_vid_fops;
-	vdev->ioctl_ops =3D &stf_vid_ioctl_ops;
-	vdev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->device_caps |=3D V4L2_CAP_STREAMING;
 	vdev->entity.ops =3D &stf_media_ops;
 	vdev->vfl_dir =3D VFL_DIR_RX;
 	vdev->release =3D stf_video_release;
diff --git a/drivers/staging/media/starfive/camss/stf-video.h b/drivers/s=
taging/media/starfive/camss/stf-video.h
index 8052b77e3ad8..30d54853777e 100644
--- a/drivers/staging/media/starfive/camss/stf-video.h
+++ b/drivers/staging/media/starfive/camss/stf-video.h
@@ -37,12 +37,14 @@ enum stf_v_line_id {
 enum stf_capture_type {
 	STF_CAPTURE_RAW =3D 0,
 	STF_CAPTURE_YUV,
+	STF_CAPTURE_SCD,
 	STF_CAPTURE_NUM,
 };
=20
 struct stfcamss_buffer {
 	struct vb2_v4l2_buffer vb;
 	dma_addr_t addr[2];
+	void *vaddr_sc;		/* Use for isp sc data */
 	struct list_head queue;
 };
=20
--=20
2.25.1


