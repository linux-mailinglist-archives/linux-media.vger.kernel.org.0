Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACB53386F2
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhCLH4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:56:33 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:56592 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231707AbhCLH4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:56:08 -0500
X-UUID: 05599909a2664fc1804f3beb8c1669ed-20210312
X-UUID: 05599909a2664fc1804f3beb8c1669ed-20210312
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1378997603; Fri, 12 Mar 2021 15:55:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 15:55:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 15:55:56 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>, <yong.wu@mediatek.com>
CC:     Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2,5/5] media: mtk-vcodec: Support H264 4K encoding on MT8192
Date:   Fri, 12 Mar 2021 15:55:42 +0800
Message-ID: <20210312075542.5503-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210312075542.5503-1-irui.wang@mediatek.com>
References: <20210312075542.5503-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supports H264 4K (3840x2176) and level 5.1 encoding on MT8192.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 58 ++++++++++++++-----
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 ++
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 4831052f475d..707db06abf9b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -21,12 +21,16 @@
 #define MTK_VENC_MIN_H	128U
 #define MTK_VENC_MAX_W	1920U
 #define MTK_VENC_MAX_H	1088U
+#define MTK_VENC_4K_MAX_W	3840U
+#define MTK_VENC_4K_MAX_H	2176U
+
 #define DFT_CFG_WIDTH	MTK_VENC_MIN_W
 #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
 #define MTK_MAX_CTRLS_HINT	20
 
 #define MTK_DEFAULT_FRAMERATE_NUM 1001
 #define MTK_DEFAULT_FRAMERATE_DENOM 30000
+#define MTK_VENC_4K_CAPABILITY_ENABLE BIT(0)
 
 static void mtk_venc_worker(struct work_struct *work);
 
@@ -151,18 +155,23 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
 	const struct mtk_video_fmt *fmt;
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(fh);
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
 	fmt = mtk_venc_find_format(fsize->pixel_format,
-				   fh_to_ctx(fh)->dev->venc_pdata);
+			ctx->dev->venc_pdata);
 	if (!fmt)
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 	fsize->stepwise = mtk_venc_framesizes;
 
+	if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
+		fsize->stepwise.max_width = MTK_VENC_4K_MAX_W;
+		fsize->stepwise.max_height = MTK_VENC_4K_MAX_H;
+	}
 	return 0;
 }
 
@@ -248,7 +257,7 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
 /* V4L2 specification suggests the driver corrects the format struct if any of
  * the dimensions is unsupported
  */
-static int vidioc_try_fmt(struct v4l2_format *f,
+static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
 			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
@@ -260,13 +269,22 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		int tmp_w, tmp_h;
+		unsigned int max_width, max_height;
+
+		if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
+			max_width = MTK_VENC_4K_MAX_W;
+			max_height = MTK_VENC_4K_MAX_H;
+		} else {
+			max_width = MTK_VENC_MAX_W;
+			max_height = MTK_VENC_MAX_H;
+		}
 
 		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
 					MTK_VENC_MIN_H,
-					MTK_VENC_MAX_H);
+					max_height);
 		pix_fmt_mp->width = clamp(pix_fmt_mp->width,
 					MTK_VENC_MIN_W,
-					MTK_VENC_MAX_W);
+					max_width);
 
 		/* find next closer width align 16, heign align 32, size align
 		 * 64 rectangle
@@ -275,16 +293,16 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		tmp_h = pix_fmt_mp->height;
 		v4l_bound_align_image(&pix_fmt_mp->width,
 					MTK_VENC_MIN_W,
-					MTK_VENC_MAX_W, 4,
+					max_width, 4,
 					&pix_fmt_mp->height,
 					MTK_VENC_MIN_H,
-					MTK_VENC_MAX_H, 5, 6);
+					max_height, 5, 6);
 
 		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 16) <= MTK_VENC_MAX_W)
+			(pix_fmt_mp->width + 16) <= max_width)
 			pix_fmt_mp->width += 16;
 		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 32) <= MTK_VENC_MAX_H)
+			(pix_fmt_mp->height + 32) <= max_height)
 			pix_fmt_mp->height += 32;
 
 		mtk_v4l2_debug(0,
@@ -405,7 +423,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	}
 
 	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(f, q_data->fmt);
+	ret = vidioc_try_fmt(ctx, f, q_data->fmt);
 	if (ret)
 		return ret;
 
@@ -478,7 +496,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	q_data->visible_width = f->fmt.pix_mp.width;
 	q_data->visible_height = f->fmt.pix_mp.height;
 	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(f, q_data->fmt);
+	ret = vidioc_try_fmt(ctx, f, q_data->fmt);
 	if (ret)
 		return ret;
 
@@ -553,7 +571,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 	f->fmt.pix_mp.quantization = ctx->quantization;
 	f->fmt.pix_mp.xfer_func = ctx->xfer_func;
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(ctx, f, fmt);
 }
 
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -575,7 +593,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(ctx, f, fmt);
 }
 
 static int vidioc_venc_g_selection(struct file *file, void *priv,
@@ -1247,9 +1265,19 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
 			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 			0, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
-	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-			V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
-			0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
+	if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
+		v4l2_ctrl_new_std_menu(handler, ops,
+				       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				       V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+				       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+	} else {
+		v4l2_ctrl_new_std_menu(handler, ops,
+				       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				       V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+				       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+	}
+
 	if (handler->error) {
 		mtk_v4l2_err("Init control handler fail %d",
 				handler->error);
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index d0123dfc5f93..b6a4f2074fa5 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -215,6 +215,10 @@ static unsigned int h264_get_level(struct venc_h264_inst *inst,
 		return 41;
 	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
 		return 42;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 50;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		return 51;
 	default:
 		mtk_vcodec_debug(inst, "unsupported level %d", level);
 		return 31;
-- 
2.18.0

