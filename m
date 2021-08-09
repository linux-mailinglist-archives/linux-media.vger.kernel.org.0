Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D073E4C36
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 20:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbhHISgz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 9 Aug 2021 14:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhHISgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 14:36:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D34C0613D3;
        Mon,  9 Aug 2021 11:36:34 -0700 (PDT)
Received: from chickenburger.collabora.co.uk (chickenburger.collabora.co.uk [46.235.227.242])
        by bhuna.collabora.co.uk (Postfix) with ESMTP id 139CC1F42E7E;
        Mon,  9 Aug 2021 19:36:31 +0100 (BST)
From:   "Ezequiel Garcia" <ezequiel.garcia@collabora.com>
In-Reply-To: <5154683.x8GX3iSW2O@kista>
Content-Type: text/plain; charset="utf-8"
X-Forward: 181.95.8.213
Date:   Mon, 09 Aug 2021 19:36:30 +0100
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>,
        "Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
        "Boris Brezillon" <boris.brezillon@collabora.com>,
        "Ezequiel Garcia" <elezegarcia@gmail.com>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        "Heiko Stuebner" <heiko@sntech.de>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Nicolas Dufresne" <nicolas.dufresne@collabora.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Shawn Guo" <shawnguo@kernel.org>, kernel@collabora.com,
        "Adrian Ratiu" <adrian.ratiu@collabora.com>,
        "Daniel Almeida" <daniel.almeida@collabora.com>
To:     =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
MIME-Version: 1.0
Message-ID: <3ce7-61117580-f1-4ae96900@79504131>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 05/10] =?utf-8?q?media=3A?==?utf-8?q?_uapi=3A?= 
 Add VP9 stateless decoder controls
User-Agent: SOGoMail 5.0.1
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Monday, August 09, 2021 15:04 -03, Jernej Škrabec <jernej.skrabec@gmail.com> wrote: 
 
> Hi Andrzej!
> 
> Dne četrtek, 05. avgust 2021 ob 16:42:41 CEST je Andrzej Pietrasiewicz 
> napisal(a):
> > Add the VP9 stateless decoder controls plus the documentation that goes
> > with it.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/biblio.rst        |  10 +
> >  .../media/v4l/ext-ctrls-codec-stateless.rst   | 545 ++++++++++++++++++
> >  .../media/v4l/pixfmt-compressed.rst           |  15 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   8 +
> >  .../media/v4l/vidioc-queryctrl.rst            |  12 +
> >  .../media/videodev2.h.rst.exceptions          |   2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 174 ++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   8 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/media/v4l2-ctrls.h                    |   4 +
> >  include/uapi/linux/v4l2-controls.h            | 433 ++++++++++++++
> >  include/uapi/linux/videodev2.h                |   6 +
> >  12 files changed, 1218 insertions(+)
> > 
> 
> <snip>
> 
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
> controls.h
> > index 5532b5f68493..8f8c3c1ad885 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -2010,6 +2010,439 @@ struct v4l2_ctrl_hdr10_mastering_display {
> >  	__u32 min_display_mastering_luminance;
> >  };
> >  
> > +/* Stateless VP9 controls */
> > +
> > +/**
> > + * enum v4l2_vp9_loop_filter_flags - VP9 loop filter flags
> > + *
> > + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED: the filter level depends on
> > + *	the mode and reference frame used to predict a block
> > + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE: the bitstream contains 
> additional
> > + *	syntax elements that specify which mode and reference frame deltas 
> are to be updated
> > + *
> > + * Those are the flags that may be passed to &v4l2_vp9_loop_filter.flags. See
> > + * section '7.2.8 Loop filter semantics' of the VP9 specification for more
> > + * details.
> > + */
> > +enum v4l2_vp9_loop_filter_flags {
> > +	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED = 1 << 0,
> > +	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE = 1 << 1,
> > +};
> > +
> > +/**
> > + * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
> > + *
> > + * @ref_deltas: contains the adjustment needed for the filter level based on 
> the chosen
> > + *	reference frame. If this syntax element is not present in the 
> bitstream, users
> > + *	should pass its last value.
> > + * @mode_deltas: contains the adjustment needed for the filter level based 
> on the chosen mode.
> > + *	If this syntax element is not present in the bitstream, users
> > + *	should pass its last value.
> > + * @level: indicates the loop filter strength
> > + * @sharpness: indicates the sharpness level
> > + * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags
> > + * @reserved: padding field. Should be zeroed by applications.
> > + *
> > + * This structure contains all loop filter related parameters. See sections
> > + * '7.2.8 Loop filter semantics' of the VP9 specification for more details.
> > + */
> > +struct v4l2_vp9_loop_filter {
> > +	__s8 ref_deltas[4];
> > +	__s8 mode_deltas[2];
> > +	__u8 level;
> > +	__u8 sharpness;
> > +	__u8 flags;
> > +	__u8 reserved[7];
> > +};
> > +
> > +/**
> > + * struct v4l2_vp9_quantization - VP9 quantization parameters
> > + *
> > + * @base_q_idx: indicates the base frame qindex
> > + * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx
> > + * @delta_q_uv_dc: indicates the UV DC quantizer relative to base_q_idx
> > + * @delta_q_uv_ac: indicates the UV AC quantizer relative to base_q_idx
> > + * @reserved: padding field. Should be zeroed by applications.
> > + *
> > + * Encodes the quantization parameters. See section '7.2.9 Quantization 
> params
> > + * syntax' of the VP9 specification for more details.
> > + */
> > +struct v4l2_vp9_quantization {
> > +	__u8 base_q_idx;
> > +	__s8 delta_q_y_dc;
> > +	__s8 delta_q_uv_dc;
> > +	__s8 delta_q_uv_ac;
> > +	__u8 reserved[4];
> > +};
> > +
> > +/**
> > + * enum v4l2_vp9_segmentation_flags - VP9 segmentation flags
> > + *
> > + * @V4L2_VP9_SEGMENTATION_FLAG_ENABLED: indicates that this frame makes use 
> of
> > + *	the segmentation tool
> > + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP: indicates that the segmentation 
> map
> > + *	should be updated during the decoding of this frame
> > + * @V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE: indicates that the updates 
> to
> > + *	the segmentation map are coded relative to the existing 
> segmentation map
> > + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA: indicates that new parameters 
> are
> > + *	about to be specified for each segment
> > + * @V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE: indicates that the
> > + *	segmentation parameters represent the actual values to be used
> > + *
> > + * Those are the flags that may be passed to &v4l2_vp9_segmentation.flags. 
> See
> > + * section '7.2.10 Segmentation params syntax' of the VP9 specification for
> > + * more details.
> > + */
> > +enum v4l2_vp9_segmentation_flags {
> > +	V4L2_VP9_SEGMENTATION_FLAG_ENABLED = 1 << 0,
> > +	V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP = 1 << 1,
> > +	V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE = 1 << 2,
> > +	V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA = 1 << 3,
> > +	V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE = 1 << 4,
> > +};
> > +
> > +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
> > +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK	0xf
> > +
> > +/**
> > + * enum v4l2_vp9_segment_feature - VP9 segment feature IDs
> > + *
> > + * @V4L2_VP9_SEG_LVL_ALT_Q: quantizer segment feature
> > + * @V4L2_VP9_SEG_LVL_ALT_L: loop filter segment feature
> > + * @V4L2_VP9_SEG_LVL_REF_FRAME reference frame segment feature
> > + * @V4L2_VP9_SEG_LVL_SKIP: skip segment feature
> > + * @V4L2_VP9_SEG_LVV_MAX: number of segment features
> > + *
> > + * Segment feature IDs. See section '7.2.10 Segmentation params syntax' of 
> the
> > + * VP9 specification for more details.
> > + */
> > +enum v4l2_vp9_segment_feature {
> > +	V4L2_VP9_SEG_LVL_ALT_Q,
> > +	V4L2_VP9_SEG_LVL_ALT_L,
> > +	V4L2_VP9_SEG_LVL_REF_FRAME,
> > +	V4L2_VP9_SEG_LVL_SKIP,
> > +	V4L2_VP9_SEG_LVL_MAX,
> > +};
> 
> What is the reason not to assign values like 1 << 0, 1 << 1, etc. and instead 
> provide separate macro V4L2_VP9_SEGMENT_FEATURE_ENABLED()? This is a departure 
> from current practice.
> 

Fully agreed.

Thanks,
Ezequiel

