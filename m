Return-Path: <linux-media+bounces-5414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8F85A103
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 11:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84BB51C21B5E
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 10:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F67E288AE;
	Mon, 19 Feb 2024 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cooAbhKy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62E28DA4
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708338584; cv=none; b=lh6l5I6qnz5Bdp9S3b6+0C0+cBfnNMUIAmHY0fS0uRaTaZkQ+VU89REees0wU4wlZx+KSuAZozq4JpSaI/IK2DR8MG0NqYYdXY8+XYFpSP4Vk41SxPwp9Ynmc4qQdtDMwXTK+d9t/ZzRMdYX0DFBcC1PdIq0HJQwPDUJXIstp8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708338584; c=relaxed/simple;
	bh=3cvAy+UWGB27ignTvrLbcdb+ID/48LvZLU3RV+8lrKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1q4/ownBTvODH1u4vYMYqAkaeZ2Qo/sEU8yiMNAg0slrM+11j5dTmoLY7ksDeZBV47YQ8wdCf9gL06Yo+LVTq+U8/XUQYPHZ6Z4oAsafw6bymZWFs/lY+GLgXxX4yl8ldOG++UZ4hF7bhENjluKy6ZqSzZymZUySr2eivAluco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cooAbhKy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECF5866F;
	Mon, 19 Feb 2024 11:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708338573;
	bh=3cvAy+UWGB27ignTvrLbcdb+ID/48LvZLU3RV+8lrKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cooAbhKy5SjCe1Y1YMjpUS50EZZUhGLDKXG5+vjYzy2KVzm2CuhkWlHNcBYqu4WJY
	 Mhi13tfsNVR6VHNkOdaK0l2NlDdDNXG53FdqqOlQsPmyKRi4TU1sBYG1I4aTWNg59T
	 d46nnlBYzQ0gR58GiY4/yknq+t24dul2J7TSUmP0=
Date: Mon, 19 Feb 2024 12:29:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 11/12] media: rkisp1: Fix endianness on raw streams
 on i.MX8MP
Message-ID: <20240219102944.GA25664@pendragon.ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
 <20240218204350.10916-12-laurent.pinchart@ideasonboard.com>
 <ZdMl68AeA8jAF8Sg@pyrite.rasen.tech>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZdMl68AeA8jAF8Sg@pyrite.rasen.tech>

On Mon, Feb 19, 2024 at 06:56:59PM +0900, Paul Elder wrote:
> On Sun, Feb 18, 2024 at 10:43:49PM +0200, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The i.MX8MP has extra register fields in the memory interface control
> > register for setting the output format, which work with the output
> > alignment format register for byte-swapping and LSB/MSB alignment.
> > 
> > With processed and 8-bit raw streams, it doesn't cause any problems to
> > not set these, but with raw streams of higher bit depth the endianness
> > is swapped and the data is not aligned properly.
> > 
> > Add support for setting these registers and plumb them in to fix this.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v12:
> > 
> > - Merge the output_format_mp and output_format_sp fields
> > - Set the MP output format in rkisp1_mp_config()
> > - Fix typo in commit message
> > 
> > Changes since v6:
> > 
> > - replace MP_OUTPUT_FORMAT feature flag with MAIN_STRIDE
> > 
> > New in v6
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c | 52 +++++++++++++++++--
> >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  8 +++
> >  2 files changed, 56 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index 0efdf8513de0..accc16ad1432 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -48,14 +48,17 @@ enum rkisp1_plane {
> >   * @fmt_type: helper filed for pixel format
> >   * @uv_swap: if cb cr swapped, for yuv
> >   * @yc_swap: if y and cb/cr swapped, for yuv
> > + * @byte_swap: if byte pairs are swapped, for raw
> >   * @write_format: defines how YCbCr self picture data is written to memory
> > - * @output_format: defines sp output format
> > + * @output_format: defines the output format (RKISP1_CIF_MI_INIT_MP_OUTPUT_* for
> > + *	the main path and RKISP1_MI_CTRL_SP_OUTPUT_* for the self path)
> >   * @mbus: the mbus code on the src resizer pad that matches the pixel format
> >   */
> >  struct rkisp1_capture_fmt_cfg {
> >  	u32 fourcc;
> >  	u32 uv_swap : 1;
> >  	u32 yc_swap : 1;
> > +	u32 byte_swap : 1;
> >  	u32 write_format;
> >  	u32 output_format;
> >  	u32 mbus;
> > @@ -96,42 +99,50 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >  		.fourcc = V4L2_PIX_FMT_YUYV,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_UYVY,
> >  		.uv_swap = 0,
> >  		.yc_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_YUV422P,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV16,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV61,
> >  		.uv_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV16M,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV61M,
> >  		.uv_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_YVU422M,
> >  		.uv_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	},
> >  	/* yuv400 */
> > @@ -139,6 +150,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >  		.fourcc = V4L2_PIX_FMT_GREY,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV400,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >  	},
> >  	/* yuv420 */
> > @@ -146,81 +158,107 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >  		.fourcc = V4L2_PIX_FMT_NV21,
> >  		.uv_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV12,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV21M,
> >  		.uv_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_NV12M,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_YUV420,
> >  		.uv_swap = 0,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_YVU420,
> >  		.uv_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420,
> >  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >  	},
> >  	/* raw */
> >  	{
> >  		.fourcc = V4L2_PIX_FMT_SRGGB8,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW8,
> >  		.mbus = MEDIA_BUS_FMT_SRGGB8_1X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SGRBG8,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW8,
> >  		.mbus = MEDIA_BUS_FMT_SGRBG8_1X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SGBRG8,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW8,
> >  		.mbus = MEDIA_BUS_FMT_SGBRG8_1X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SBGGR8,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW8,
> >  		.mbus = MEDIA_BUS_FMT_SBGGR8_1X8,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SRGGB10,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW10,
> >  		.mbus = MEDIA_BUS_FMT_SRGGB10_1X10,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SGRBG10,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW10,
> >  		.mbus = MEDIA_BUS_FMT_SGRBG10_1X10,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SGBRG10,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW10,
> >  		.mbus = MEDIA_BUS_FMT_SGBRG10_1X10,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SBGGR10,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW10,
> >  		.mbus = MEDIA_BUS_FMT_SBGGR10_1X10,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SRGGB12,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW12,
> >  		.mbus = MEDIA_BUS_FMT_SRGGB12_1X12,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SGRBG12,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW12,
> >  		.mbus = MEDIA_BUS_FMT_SGRBG12_1X12,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SGBRG12,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW12,
> >  		.mbus = MEDIA_BUS_FMT_SGBRG12_1X12,
> >  	}, {
> >  		.fourcc = V4L2_PIX_FMT_SBGGR12,
> > +		.byte_swap = 1,
> >  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> > +		.output_format = RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW12,
> >  		.mbus = MEDIA_BUS_FMT_SBGGR12_1X12,
> >  	},
> >  };
> > @@ -484,10 +522,12 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
> >  	 */
> >  	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
> >  		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT);
> > -		if (cap->pix.cfg->yc_swap)
> > +		if (cap->pix.cfg->yc_swap || cap->pix.cfg->byte_swap)
> >  			reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES;
> >  		else
> >  			reg &= ~RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES;
> > +
> > +		reg |= RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_LSB_ALIGNMENT;
> >  		rkisp1_write(rkisp1, RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT, reg);
> >  	}
> >  
> > @@ -557,6 +597,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
> >  		   cap->pix.cfg->output_format |
> >  		   RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE;
> >  	rkisp1_write(rkisp1, RKISP1_CIF_MI_CTRL, mi_ctrl);
> > +
> > +	rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT, cap->pix.cfg->output_format);
> 
> I think you're missing the analogous register setting for the main path.

How did this end up in rkisp1_sp_config() instead of
rkisp1_mp_config()... Thanks for catching my mistake. I'll send a new
version of this patch.

> >  }
> >  
> >  static void rkisp1_mp_disable(struct rkisp1_capture *cap)
> > @@ -943,6 +985,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
> >  	struct rkisp1_device *rkisp1 = cap->rkisp1;
> >  	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> >  	bool has_self_path = rkisp1_has_feature(rkisp1, SELF_PATH);
> > +	u32 reg;
> >  
> >  	cap->ops->set_data_path(cap);
> >  	cap->ops->config(cap);
> > @@ -962,8 +1005,9 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
> >  	 */
> >  	if (!has_self_path || !other->is_streaming) {
> >  		/* force cfg update */
> > -		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT,
> > -			     RKISP1_CIF_MI_INIT_SOFT_UPD);
> > +		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_INIT);
> > +		reg |= RKISP1_CIF_MI_INIT_SOFT_UPD;
> > +		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT, reg);
> >  		rkisp1_set_next_buf(cap);
> >  	}
> >  	spin_unlock_irq(&cap->buf.lock);
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > index 3b19c8411360..762243016f05 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > @@ -144,6 +144,14 @@
> >  /* MI_INIT */
> >  #define RKISP1_CIF_MI_INIT_SKIP				BIT(2)
> >  #define RKISP1_CIF_MI_INIT_SOFT_UPD			BIT(4)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV400		(0 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV420		(1 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV422		(2 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_YUV444		(3 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW12		(4 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW8		(5 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_JPEG		(6 << 5)
> > +#define RKISP1_CIF_MI_INIT_MP_OUTPUT_RAW10		(7 << 5)
> >  
> >  /* MI_CTRL_SHD */
> >  #define RKISP1_CIF_MI_CTRL_SHD_MP_IN_ENABLED		BIT(0)

-- 
Regards,

Laurent Pinchart

