Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A805348E7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfFDNe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:34:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42196 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbfFDNeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 09:34:24 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 411D3285328;
        Tue,  4 Jun 2019 14:34:21 +0100 (BST)
Date:   Tue, 4 Jun 2019 15:34:18 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v6 2/2] media: v4l2: Get rid of
 ->vidioc_enum_fmt_vid_{cap,out}_mplane
Message-ID: <20190604153418.63e6893b@collabora.com>
In-Reply-To: <20190604070625.7664-2-boris.brezillon@collabora.com>
References: <20190604070625.7664-1-boris.brezillon@collabora.com>
        <20190604070625.7664-2-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue,  4 Jun 2019 09:06:25 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Support for multiplanar and singleplanar formats is mutually exclusive,
> at least in practice. In our attempt to unify support for support for

				s/support for support for/support for/

> mplane and !mplane in v4l, let's get rid of the
> ->vidioc_enum_fmt_{vid,out}_cap_mplane() hooks and call
> ->vidioc_enum_fmt_{vid,out}_cap() instead.  
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v6:
> - Add missing parens in a test
> 
> Changes in v5:
> - None
> 
> Changes in v4:
> - None
> 
> Changes in v3:
> - Send this patch separately (was previously part of the EXT_BUF/FMT
>   rework)
> 
> Changes in v2:
> - None
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  2 +-
>  drivers/media/platform/exynos-gsc/gsc-core.c  |  2 +-
>  drivers/media/platform/exynos-gsc/gsc-core.h  |  2 +-
>  drivers/media/platform/exynos-gsc/gsc-m2m.c   | 10 ++++-----
>  .../media/platform/exynos4-is/fimc-capture.c  |  6 +++---
>  .../platform/exynos4-is/fimc-isp-video.c      |  6 +++---
>  drivers/media/platform/exynos4-is/fimc-lite.c |  6 +++---
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |  8 +++----
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  4 ++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  | 18 ++++++++--------
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 12 +++++------
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 12 +++++------
>  .../media/platform/qcom/camss/camss-video.c   |  2 +-
>  drivers/media/platform/qcom/venus/vdec.c      |  4 ++--
>  drivers/media/platform/qcom/venus/venc.c      |  4 ++--
>  drivers/media/platform/rcar_fdp1.c            |  4 ++--
>  drivers/media/platform/rcar_jpu.c             |  4 ++--
>  drivers/media/platform/renesas-ceu.c          |  2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 12 +++++------
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  | 12 +++++------
>  drivers/media/platform/ti-vpe/vpe.c           |  4 ++--
>  drivers/media/platform/vicodec/vicodec-core.c |  2 --
>  drivers/media/platform/vivid/vivid-core.c     |  6 ++----
>  .../media/platform/vivid/vivid-vid-common.c   | 20 ------------------
>  .../media/platform/vivid/vivid-vid-common.h   |  2 --
>  drivers/media/v4l2-core/v4l2-dev.c            |  2 --
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 21 ++++++++++---------
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  4 ++--
>  .../media/rockchip/vpu/rockchip_vpu_v4l2.c    | 12 +++++------
>  include/media/v4l2-ioctl.h                    | 14 ++-----------
>  30 files changed, 91 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 2a52a393fe74..c1d133e17e4b 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1174,7 +1174,7 @@ static const struct v4l2_file_operations cio2_v4l2_fops = {
>  
>  static const struct v4l2_ioctl_ops cio2_v4l2_ioctl_ops = {
>  	.vidioc_querycap = cio2_v4l2_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = cio2_v4l2_enum_fmt,
> +	.vidioc_enum_fmt_vid_cap = cio2_v4l2_enum_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane = cio2_v4l2_g_fmt,
>  	.vidioc_s_fmt_vid_cap_mplane = cio2_v4l2_s_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane = cio2_v4l2_try_fmt,
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 0fa3ec04ab7b..f1d555f47ce3 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -331,7 +331,7 @@ void gsc_check_src_scale_info(struct gsc_variant *var,
>  	}
>  }
>  
> -int gsc_enum_fmt_mplane(struct v4l2_fmtdesc *f)
> +int gsc_enum_fmt(struct v4l2_fmtdesc *f)
>  {
>  	const struct gsc_fmt *fmt;
>  
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.h b/drivers/media/platform/exynos-gsc/gsc-core.h
> index c81f0a17d286..8ea49ca004fd 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.h
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.h
> @@ -387,7 +387,7 @@ void gsc_m2m_job_finish(struct gsc_ctx *ctx, int vb_state);
>  u32 get_plane_size(struct gsc_frame *fr, unsigned int plane);
>  const struct gsc_fmt *get_format(int index);
>  const struct gsc_fmt *find_fmt(u32 *pixelformat, u32 *mbus_code, u32 index);
> -int gsc_enum_fmt_mplane(struct v4l2_fmtdesc *f);
> +int gsc_enum_fmt(struct v4l2_fmtdesc *f);
>  int gsc_try_fmt_mplane(struct gsc_ctx *ctx, struct v4l2_format *f);
>  void gsc_set_frame_size(struct gsc_frame *frame, int width, int height);
>  int gsc_g_fmt_mplane(struct gsc_ctx *ctx, struct v4l2_format *f);
> diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> index cd02e3c233fc..6346694f7de8 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> @@ -301,10 +301,10 @@ static int gsc_m2m_querycap(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int gsc_m2m_enum_fmt_mplane(struct file *file, void *priv,
> -				struct v4l2_fmtdesc *f)
> +static int gsc_m2m_enum_fmt(struct file *file, void *priv,
> +			    struct v4l2_fmtdesc *f)
>  {
> -	return gsc_enum_fmt_mplane(f);
> +	return gsc_enum_fmt(f);
>  }
>  
>  static int gsc_m2m_g_fmt_mplane(struct file *file, void *fh,
> @@ -560,8 +560,8 @@ static int gsc_m2m_s_selection(struct file *file, void *fh,
>  
>  static const struct v4l2_ioctl_ops gsc_m2m_ioctl_ops = {
>  	.vidioc_querycap		= gsc_m2m_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane	= gsc_m2m_enum_fmt_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane	= gsc_m2m_enum_fmt_mplane,
> +	.vidioc_enum_fmt_vid_cap	= gsc_m2m_enum_fmt,
> +	.vidioc_enum_fmt_vid_out	= gsc_m2m_enum_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane	= gsc_m2m_g_fmt_mplane,
>  	.vidioc_g_fmt_vid_out_mplane	= gsc_m2m_g_fmt_mplane,
>  	.vidioc_try_fmt_vid_cap_mplane	= gsc_m2m_try_fmt_mplane,
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index ecfa6ab4a19d..84b91e248c5a 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -732,8 +732,8 @@ static int fimc_cap_querycap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int fimc_cap_enum_fmt_mplane(struct file *file, void *priv,
> -				    struct v4l2_fmtdesc *f)
> +static int fimc_cap_enum_fmt(struct file *file, void *priv,
> +			     struct v4l2_fmtdesc *f)
>  {
>  	struct fimc_fmt *fmt;
>  
> @@ -1360,7 +1360,7 @@ static int fimc_cap_s_selection(struct file *file, void *fh,
>  static const struct v4l2_ioctl_ops fimc_capture_ioctl_ops = {
>  	.vidioc_querycap		= fimc_cap_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane	= fimc_cap_enum_fmt_mplane,
> +	.vidioc_enum_fmt_vid_cap	= fimc_cap_enum_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= fimc_cap_try_fmt_mplane,
>  	.vidioc_s_fmt_vid_cap_mplane	= fimc_cap_s_fmt_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane	= fimc_cap_g_fmt_mplane,
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index ad8dd672d4a7..2226a13ac89b 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -353,8 +353,8 @@ static int isp_video_querycap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int isp_video_enum_fmt_mplane(struct file *file, void *priv,
> -					struct v4l2_fmtdesc *f)
> +static int isp_video_enum_fmt(struct file *file, void *priv,
> +			      struct v4l2_fmtdesc *f)
>  {
>  	const struct fimc_fmt *fmt;
>  
> @@ -551,7 +551,7 @@ static int isp_video_reqbufs(struct file *file, void *priv,
>  
>  static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
>  	.vidioc_querycap		= isp_video_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane	= isp_video_enum_fmt_mplane,
> +	.vidioc_enum_fmt_vid_cap	= isp_video_enum_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= isp_video_try_fmt_mplane,
>  	.vidioc_s_fmt_vid_cap_mplane	= isp_video_s_fmt_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane	= isp_video_g_fmt_mplane,
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index a16b5bed59bb..e71342756d88 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -661,8 +661,8 @@ static int fimc_lite_querycap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int fimc_lite_enum_fmt_mplane(struct file *file, void *priv,
> -				     struct v4l2_fmtdesc *f)
> +static int fimc_lite_enum_fmt(struct file *file, void *priv,
> +			      struct v4l2_fmtdesc *f)
>  {
>  	const struct fimc_fmt *fmt;
>  
> @@ -951,7 +951,7 @@ static int fimc_lite_s_selection(struct file *file, void *fh,
>  
>  static const struct v4l2_ioctl_ops fimc_lite_ioctl_ops = {
>  	.vidioc_querycap		= fimc_lite_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane	= fimc_lite_enum_fmt_mplane,
> +	.vidioc_enum_fmt_vid_cap	= fimc_lite_enum_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= fimc_lite_try_fmt_mplane,
>  	.vidioc_s_fmt_vid_cap_mplane	= fimc_lite_s_fmt_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane	= fimc_lite_g_fmt_mplane,
> diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
> index 17e5bf4810f4..0d1d8b717d9a 100644
> --- a/drivers/media/platform/exynos4-is/fimc-m2m.c
> +++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
> @@ -241,8 +241,8 @@ static int fimc_m2m_querycap(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int fimc_m2m_enum_fmt_mplane(struct file *file, void *priv,
> -				    struct v4l2_fmtdesc *f)
> +static int fimc_m2m_enum_fmt(struct file *file, void *priv,
> +			     struct v4l2_fmtdesc *f)
>  {
>  	struct fimc_fmt *fmt;
>  
> @@ -532,8 +532,8 @@ static int fimc_m2m_s_selection(struct file *file, void *fh,
>  
>  static const struct v4l2_ioctl_ops fimc_m2m_ioctl_ops = {
>  	.vidioc_querycap		= fimc_m2m_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane	= fimc_m2m_enum_fmt_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane	= fimc_m2m_enum_fmt_mplane,
> +	.vidioc_enum_fmt_vid_cap	= fimc_m2m_enum_fmt,
> +	.vidioc_enum_fmt_vid_out	= fimc_m2m_enum_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane	= fimc_m2m_g_fmt_mplane,
>  	.vidioc_g_fmt_vid_out_mplane	= fimc_m2m_g_fmt_mplane,
>  	.vidioc_try_fmt_vid_cap_mplane	= fimc_m2m_try_fmt_mplane,
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f761e4d8bf2a..3b199662cb34 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -536,8 +536,8 @@ static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>  
>  static const struct v4l2_ioctl_ops mtk_jpeg_ioctl_ops = {
>  	.vidioc_querycap                = mtk_jpeg_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = mtk_jpeg_enum_fmt_vid_cap,
> -	.vidioc_enum_fmt_vid_out_mplane = mtk_jpeg_enum_fmt_vid_out,
> +	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= mtk_jpeg_enum_fmt_vid_out,
>  	.vidioc_try_fmt_vid_cap_mplane	= mtk_jpeg_try_fmt_vid_cap_mplane,
>  	.vidioc_try_fmt_vid_out_mplane	= mtk_jpeg_try_fmt_vid_out_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane    = mtk_jpeg_g_fmt_vid_mplane,
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index 7d15c06e9db9..365d3f92fd9e 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -620,7 +620,7 @@ static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int mtk_mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f, u32 type)
> +static int mtk_mdp_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
>  {
>  	const struct mtk_mdp_fmt *fmt;
>  
> @@ -633,16 +633,16 @@ static int mtk_mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f, u32 type)
>  	return 0;
>  }
>  
> -static int mtk_mdp_m2m_enum_fmt_mplane_vid_cap(struct file *file, void *priv,
> -				       struct v4l2_fmtdesc *f)
> +static int mtk_mdp_m2m_enum_fmt_vid_cap(struct file *file, void *priv,
> +					struct v4l2_fmtdesc *f)
>  {
> -	return mtk_mdp_enum_fmt_mplane(f, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	return mtk_mdp_enum_fmt(f, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>  }
>  
> -static int mtk_mdp_m2m_enum_fmt_mplane_vid_out(struct file *file, void *priv,
> -				       struct v4l2_fmtdesc *f)
> +static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file, void *priv,
> +					struct v4l2_fmtdesc *f)
>  {
> -	return mtk_mdp_enum_fmt_mplane(f, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	return mtk_mdp_enum_fmt(f, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  }
>  
>  static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
> @@ -935,8 +935,8 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
>  
>  static const struct v4l2_ioctl_ops mtk_mdp_m2m_ioctl_ops = {
>  	.vidioc_querycap		= mtk_mdp_m2m_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane	= mtk_mdp_m2m_enum_fmt_mplane_vid_cap,
> -	.vidioc_enum_fmt_vid_out_mplane	= mtk_mdp_m2m_enum_fmt_mplane_vid_out,
> +	.vidioc_enum_fmt_vid_cap	= mtk_mdp_m2m_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= mtk_mdp_m2m_enum_fmt_vid_out,
>  	.vidioc_g_fmt_vid_cap_mplane	= mtk_mdp_m2m_g_fmt_mplane,
>  	.vidioc_g_fmt_vid_out_mplane	= mtk_mdp_m2m_g_fmt_mplane,
>  	.vidioc_try_fmt_vid_cap_mplane	= mtk_mdp_m2m_try_fmt_mplane,
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 851903867bc9..af25189306bb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -957,14 +957,14 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
>  	return 0;
>  }
>  
> -static int vidioc_vdec_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
> -					       struct v4l2_fmtdesc *f)
> +static int vidioc_vdec_enum_fmt_vid_cap(struct file *file, void *pirv,
> +					struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(f, false);
>  }
>  
> -static int vidioc_vdec_enum_fmt_vid_out_mplane(struct file *file, void *priv,
> -					       struct v4l2_fmtdesc *f)
> +static int vidioc_vdec_enum_fmt_vid_out(struct file *file, void *priv,
> +					struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(f, true);
>  }
> @@ -1461,8 +1461,8 @@ const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops = {
>  
>  	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane	= vidioc_vdec_enum_fmt_vid_cap_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane	= vidioc_vdec_enum_fmt_vid_out_mplane,
> +	.vidioc_enum_fmt_vid_cap	= vidioc_vdec_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= vidioc_vdec_enum_fmt_vid_out,
>  	.vidioc_enum_framesizes	= vidioc_enum_framesizes,
>  
>  	.vidioc_querycap		= vidioc_vdec_querycap,
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 50351adafc47..c3c7aeba543c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -207,14 +207,14 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
>  	return -EINVAL;
>  }
>  
> -static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
> -					  struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_cap(struct file *file, void *pirv,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(f, false);
>  }
>  
> -static int vidioc_enum_fmt_vid_out_mplane(struct file *file, void *prov,
> -					  struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_out(struct file *file, void *prov,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(f, true);
>  }
> @@ -725,8 +725,8 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
>  	.vidioc_dqbuf			= vidioc_venc_dqbuf,
>  
>  	.vidioc_querycap		= vidioc_venc_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_cap_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_out_mplane,
> +	.vidioc_enum_fmt_vid_cap	= vidioc_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= vidioc_enum_fmt_vid_out,
>  	.vidioc_enum_framesizes		= vidioc_enum_framesizes,
>  
>  	.vidioc_try_fmt_vid_cap_mplane	= vidioc_try_fmt_vid_cap_mplane,
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 58aebe7114cd..1d50dfbbb762 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -703,7 +703,7 @@ static int video_s_input(struct file *file, void *fh, unsigned int input)
>  
>  static const struct v4l2_ioctl_ops msm_vid_ioctl_ops = {
>  	.vidioc_querycap		= video_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane	= video_enum_fmt,
> +	.vidioc_enum_fmt_vid_cap	= video_enum_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane	= video_g_fmt,
>  	.vidioc_s_fmt_vid_cap_mplane	= video_s_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= video_try_fmt,
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 282de21cf2e1..2a47b9b8c5bc 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -491,8 +491,8 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>  
>  static const struct v4l2_ioctl_ops vdec_ioctl_ops = {
>  	.vidioc_querycap = vdec_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = vdec_enum_fmt,
> -	.vidioc_enum_fmt_vid_out_mplane = vdec_enum_fmt,
> +	.vidioc_enum_fmt_vid_cap = vdec_enum_fmt,
> +	.vidioc_enum_fmt_vid_out = vdec_enum_fmt,
>  	.vidioc_s_fmt_vid_cap_mplane = vdec_s_fmt,
>  	.vidioc_s_fmt_vid_out_mplane = vdec_s_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane = vdec_g_fmt,
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 32cff294582f..406a47923996 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -616,8 +616,8 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>  
>  static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>  	.vidioc_querycap = venc_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = venc_enum_fmt,
> -	.vidioc_enum_fmt_vid_out_mplane = venc_enum_fmt,
> +	.vidioc_enum_fmt_vid_cap = venc_enum_fmt,
> +	.vidioc_enum_fmt_vid_out = venc_enum_fmt,
>  	.vidioc_s_fmt_vid_cap_mplane = venc_s_fmt,
>  	.vidioc_s_fmt_vid_out_mplane = venc_s_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane = venc_g_fmt,
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 6a90bc4c476e..6f9a4c69f620 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -1730,8 +1730,8 @@ static const char * const fdp1_ctrl_deint_menu[] = {
>  static const struct v4l2_ioctl_ops fdp1_ioctl_ops = {
>  	.vidioc_querycap	= fdp1_vidioc_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane = fdp1_enum_fmt_vid_cap,
> -	.vidioc_enum_fmt_vid_out_mplane = fdp1_enum_fmt_vid_out,
> +	.vidioc_enum_fmt_vid_cap	= fdp1_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= fdp1_enum_fmt_vid_out,
>  	.vidioc_g_fmt_vid_cap_mplane	= fdp1_g_fmt,
>  	.vidioc_g_fmt_vid_out_mplane	= fdp1_g_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= fdp1_try_fmt,
> diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
> index 9b6eadef6858..1c3f507acfc9 100644
> --- a/drivers/media/platform/rcar_jpu.c
> +++ b/drivers/media/platform/rcar_jpu.c
> @@ -946,8 +946,8 @@ static int jpu_streamon(struct file *file, void *priv, enum v4l2_buf_type type)
>  static const struct v4l2_ioctl_ops jpu_ioctl_ops = {
>  	.vidioc_querycap		= jpu_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane = jpu_enum_fmt_cap,
> -	.vidioc_enum_fmt_vid_out_mplane = jpu_enum_fmt_out,
> +	.vidioc_enum_fmt_vid_cap	= jpu_enum_fmt_cap,
> +	.vidioc_enum_fmt_vid_out	= jpu_enum_fmt_out,
>  	.vidioc_g_fmt_vid_cap_mplane	= jpu_g_fmt,
>  	.vidioc_g_fmt_vid_out_mplane	= jpu_g_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= jpu_try_fmt,
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index 150196f7cf96..57d0c0f9fa4b 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1339,7 +1339,7 @@ static int ceu_enum_frameintervals(struct file *file, void *fh,
>  static const struct v4l2_ioctl_ops ceu_ioctl_ops = {
>  	.vidioc_querycap		= ceu_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane	= ceu_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_cap	= ceu_enum_fmt_vid_cap,
>  	.vidioc_try_fmt_vid_cap_mplane	= ceu_try_fmt_vid_cap,
>  	.vidioc_s_fmt_vid_cap_mplane	= ceu_s_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_cap_mplane	= ceu_g_fmt_vid_cap,
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index d29e5bc73651..51ab2e38a270 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -306,14 +306,14 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
>  	return 0;
>  }
>  
> -static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
> -							struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_cap(struct file *file, void *pirv,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(file, f, false);
>  }
>  
> -static int vidioc_enum_fmt_vid_out_mplane(struct file *file, void *priv,
> -							struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(file, f, true);
>  }
> @@ -880,8 +880,8 @@ static int vidioc_subscribe_event(struct v4l2_fh *fh,
>  /* v4l2_ioctl_ops */
>  static const struct v4l2_ioctl_ops s5p_mfc_dec_ioctl_ops = {
>  	.vidioc_querycap = vidioc_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_cap_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_out_mplane,
> +	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt_vid_out,
>  	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt,
>  	.vidioc_g_fmt_vid_out_mplane = vidioc_g_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt,
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> index 5ab1231b4189..7485eded5c5d 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> @@ -1347,14 +1347,14 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
>  	return -EINVAL;
>  }
>  
> -static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
> -					  struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_cap(struct file *file, void *pirv,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(file, f, false);
>  }
>  
> -static int vidioc_enum_fmt_vid_out_mplane(struct file *file, void *prov,
> -					  struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_out(struct file *file, void *prov,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(file, f, true);
>  }
> @@ -2336,8 +2336,8 @@ static int vidioc_subscribe_event(struct v4l2_fh *fh,
>  
>  static const struct v4l2_ioctl_ops s5p_mfc_enc_ioctl_ops = {
>  	.vidioc_querycap = vidioc_querycap,
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_cap_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_out_mplane,
> +	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt_vid_out,
>  	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt,
>  	.vidioc_g_fmt_vid_out_mplane = vidioc_g_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt,
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> index a61ac426853a..3f90f9413da1 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -1971,12 +1971,12 @@ static const struct v4l2_ctrl_ops vpe_ctrl_ops = {
>  static const struct v4l2_ioctl_ops vpe_ioctl_ops = {
>  	.vidioc_querycap		= vpe_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane	= vpe_enum_fmt,
> +	.vidioc_enum_fmt_vid_cap	= vpe_enum_fmt,
>  	.vidioc_g_fmt_vid_cap_mplane	= vpe_g_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane	= vpe_try_fmt,
>  	.vidioc_s_fmt_vid_cap_mplane	= vpe_s_fmt,
>  
> -	.vidioc_enum_fmt_vid_out_mplane	= vpe_enum_fmt,
> +	.vidioc_enum_fmt_vid_out	= vpe_enum_fmt,
>  	.vidioc_g_fmt_vid_out_mplane	= vpe_g_fmt,
>  	.vidioc_try_fmt_vid_out_mplane	= vpe_try_fmt,
>  	.vidioc_s_fmt_vid_out_mplane	= vpe_s_fmt,
> diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
> index 89961257f03f..03acdf86176e 100644
> --- a/drivers/media/platform/vicodec/vicodec-core.c
> +++ b/drivers/media/platform/vicodec/vicodec-core.c
> @@ -1297,7 +1297,6 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
>  	.vidioc_try_fmt_vid_cap	= vidioc_try_fmt_vid_cap,
>  	.vidioc_s_fmt_vid_cap	= vidioc_s_fmt_vid_cap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_cap_mplane	= vidioc_g_fmt_vid_cap,
>  	.vidioc_try_fmt_vid_cap_mplane	= vidioc_try_fmt_vid_cap,
>  	.vidioc_s_fmt_vid_cap_mplane	= vidioc_s_fmt_vid_cap,
> @@ -1307,7 +1306,6 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
>  	.vidioc_try_fmt_vid_out	= vidioc_try_fmt_vid_out,
>  	.vidioc_s_fmt_vid_out	= vidioc_s_fmt_vid_out,
>  
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_out,
>  	.vidioc_g_fmt_vid_out_mplane	= vidioc_g_fmt_vid_out,
>  	.vidioc_try_fmt_vid_out_mplane	= vidioc_try_fmt_vid_out,
>  	.vidioc_s_fmt_vid_out_mplane	= vidioc_s_fmt_vid_out,
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index 7047df6f0e0e..beb2e566a43c 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -500,20 +500,18 @@ static const struct v4l2_file_operations vivid_radio_fops = {
>  static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
>  	.vidioc_querycap		= vidioc_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap	= vidioc_enum_fmt_vid,
> +	.vidioc_enum_fmt_vid_cap	= vivid_enum_fmt_vid,
>  	.vidioc_g_fmt_vid_cap		= vidioc_g_fmt_vid_cap,
>  	.vidioc_try_fmt_vid_cap		= vidioc_try_fmt_vid_cap,
>  	.vidioc_s_fmt_vid_cap		= vidioc_s_fmt_vid_cap,
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane	= vidioc_g_fmt_vid_cap_mplane,
>  	.vidioc_try_fmt_vid_cap_mplane	= vidioc_try_fmt_vid_cap_mplane,
>  	.vidioc_s_fmt_vid_cap_mplane	= vidioc_s_fmt_vid_cap_mplane,
>  
> -	.vidioc_enum_fmt_vid_out	= vidioc_enum_fmt_vid,
> +	.vidioc_enum_fmt_vid_out	= vivid_enum_fmt_vid,
>  	.vidioc_g_fmt_vid_out		= vidioc_g_fmt_vid_out,
>  	.vidioc_try_fmt_vid_out		= vidioc_try_fmt_vid_out,
>  	.vidioc_s_fmt_vid_out		= vidioc_s_fmt_vid_out,
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_mplane,
>  	.vidioc_g_fmt_vid_out_mplane	= vidioc_g_fmt_vid_out_mplane,
>  	.vidioc_try_fmt_vid_out_mplane	= vidioc_try_fmt_vid_out_mplane,
>  	.vidioc_s_fmt_vid_out_mplane	= vidioc_s_fmt_vid_out_mplane,
> diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
> index 74b83bcc6119..9307ce1cdd16 100644
> --- a/drivers/media/platform/vivid/vivid-vid-common.c
> +++ b/drivers/media/platform/vivid/vivid-vid-common.c
> @@ -797,26 +797,6 @@ int vivid_enum_fmt_vid(struct file *file, void  *priv,
>  	return 0;
>  }
>  
> -int vidioc_enum_fmt_vid_mplane(struct file *file, void  *priv,
> -					struct v4l2_fmtdesc *f)
> -{
> -	struct vivid_dev *dev = video_drvdata(file);
> -
> -	if (!dev->multiplanar)
> -		return -ENOTTY;
> -	return vivid_enum_fmt_vid(file, priv, f);
> -}
> -
> -int vidioc_enum_fmt_vid(struct file *file, void  *priv,
> -					struct v4l2_fmtdesc *f)
> -{
> -	struct vivid_dev *dev = video_drvdata(file);
> -
> -	if (dev->multiplanar)
> -		return -ENOTTY;
> -	return vivid_enum_fmt_vid(file, priv, f);
> -}
> -
>  int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
>  {
>  	struct vivid_dev *dev = video_drvdata(file);
> diff --git a/drivers/media/platform/vivid/vivid-vid-common.h b/drivers/media/platform/vivid/vivid-vid-common.h
> index 29b6c0b40a1b..d908d9725283 100644
> --- a/drivers/media/platform/vivid/vivid-vid-common.h
> +++ b/drivers/media/platform/vivid/vivid-vid-common.h
> @@ -28,8 +28,6 @@ void vivid_send_source_change(struct vivid_dev *dev, unsigned type);
>  int vivid_vid_adjust_sel(unsigned flags, struct v4l2_rect *r);
>  
>  int vivid_enum_fmt_vid(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
> -int vidioc_enum_fmt_vid_mplane(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
> -int vidioc_enum_fmt_vid(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
>  int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id);
>  int vidioc_g_dv_timings(struct file *file, void *_fh, struct v4l2_dv_timings *timings);
>  int vidioc_enum_dv_timings(struct file *file, void *_fh, struct v4l2_enum_dv_timings *timings);
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index d7528f82a66a..29946a2b2752 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -593,11 +593,9 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	if (is_vid || is_tch) {
>  		/* video and metadata specific ioctls */
>  		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
> -			       ops->vidioc_enum_fmt_vid_cap_mplane ||
>  			       ops->vidioc_enum_fmt_vid_overlay ||
>  			       ops->vidioc_enum_fmt_meta_cap)) ||
>  		    (is_tx && (ops->vidioc_enum_fmt_vid_out ||
> -			       ops->vidioc_enum_fmt_vid_out_mplane ||
>  			       ops->vidioc_enum_fmt_meta_out)))
>  			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
>  		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0fbee3caef5d..b4c73e8f23c5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1382,6 +1382,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	struct video_device *vdev = video_devdata(file);
>  	struct v4l2_fmtdesc *p = arg;
>  	int ret = check_fmt(file, p->type);
>  
> @@ -1391,30 +1392,30 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  
>  	switch (p->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
> +		    (p->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))
> +			break;
> +
>  		if (unlikely(!ops->vidioc_enum_fmt_vid_cap))
>  			break;
>  		ret = ops->vidioc_enum_fmt_vid_cap(file, fh, arg);
>  		break;
> -	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (unlikely(!ops->vidioc_enum_fmt_vid_cap_mplane))
> -			break;
> -		ret = ops->vidioc_enum_fmt_vid_cap_mplane(file, fh, arg);
> -		break;
>  	case V4L2_BUF_TYPE_VIDEO_OVERLAY:
>  		if (unlikely(!ops->vidioc_enum_fmt_vid_overlay))
>  			break;
>  		ret = ops->vidioc_enum_fmt_vid_overlay(file, fh, arg);
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		if (!!(vdev->device_caps & V4L2_CAP_VIDEO_OUTPUT_MPLANE) !=
> +		    (p->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
> +			break;
> +
>  		if (unlikely(!ops->vidioc_enum_fmt_vid_out))
>  			break;
>  		ret = ops->vidioc_enum_fmt_vid_out(file, fh, arg);
>  		break;
> -	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (unlikely(!ops->vidioc_enum_fmt_vid_out_mplane))
> -			break;
> -		ret = ops->vidioc_enum_fmt_vid_out_mplane(file, fh, arg);
> -		break;
>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>  		if (unlikely(!ops->vidioc_enum_fmt_sdr_cap))
>  			break;
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index a7bc22040ed8..3c7ad1eed434 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -955,12 +955,12 @@ static const struct v4l2_file_operations imgu_v4l2_fops = {
>  static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
>  	.vidioc_querycap = imgu_vidioc_querycap,
>  
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_cap_mplane = imgu_vidioc_g_fmt,
>  	.vidioc_s_fmt_vid_cap_mplane = imgu_vidioc_s_fmt,
>  	.vidioc_try_fmt_vid_cap_mplane = imgu_vidioc_try_fmt,
>  
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_out,
> +	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt_vid_out,
>  	.vidioc_g_fmt_vid_out_mplane = imgu_vidioc_g_fmt,
>  	.vidioc_s_fmt_vid_out_mplane = imgu_vidioc_s_fmt,
>  	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
> diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
> index 1b80a45df8fe..8bc709ab13be 100644
> --- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
> +++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
> @@ -153,14 +153,14 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
>  	return -EINVAL;
>  }
>  
> -static int vidioc_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
> -					  struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(file, priv, f, true);
>  }
>  
> -static int vidioc_enum_fmt_vid_out_mplane(struct file *file, void *priv,
> -					  struct v4l2_fmtdesc *f)
> +static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
> +				   struct v4l2_fmtdesc *f)
>  {
>  	return vidioc_enum_fmt(file, priv, f, false);
>  }
> @@ -494,8 +494,8 @@ const struct v4l2_ioctl_ops rockchip_vpu_ioctl_ops = {
>  	.vidioc_s_fmt_vid_cap_mplane = vidioc_s_fmt_cap_mplane,
>  	.vidioc_g_fmt_vid_out_mplane = vidioc_g_fmt_out_mplane,
>  	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt_cap_mplane,
> -	.vidioc_enum_fmt_vid_out_mplane = vidioc_enum_fmt_vid_out_mplane,
> -	.vidioc_enum_fmt_vid_cap_mplane = vidioc_enum_fmt_vid_cap_mplane,
> +	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt_vid_out,
> +	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_vid_cap,
>  
>  	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
>  	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 8533ece5026e..400f2e46c108 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -26,19 +26,13 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_QUERYCAP <vidioc_querycap>` ioctl
>   * @vidioc_enum_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> - *	for video capture in single plane mode
> + *	for video capture in single and multi plane mode
>   * @vidioc_enum_fmt_vid_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
>   *	for video overlay
>   * @vidioc_enum_fmt_vid_out: pointer to the function that implements
>   *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> - *	for video output in single plane mode
> - * @vidioc_enum_fmt_vid_cap_mplane: pointer to the function that implements
> - *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> - *	for video capture in multiplane mode
> - * @vidioc_enum_fmt_vid_out_mplane: pointer to the function that implements
> - *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> - *	for video output in multiplane mode
> + *	for video output in single and multi plane mode
>   * @vidioc_enum_fmt_sdr_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
>   *	for Software Defined Radio capture
> @@ -313,10 +307,6 @@ struct v4l2_ioctl_ops {
>  					   struct v4l2_fmtdesc *f);
>  	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *fh,
>  				       struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_vid_cap_mplane)(struct file *file, void *fh,
> -					      struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_vid_out_mplane)(struct file *file, void *fh,
> -					      struct v4l2_fmtdesc *f);
>  	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *fh,
>  				       struct v4l2_fmtdesc *f);
>  	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *fh,

