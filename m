Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D7558A6D
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfF0S5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48110 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF0S5z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A478B28A23E
Message-ID: <b57852cb1f4ade29a83ab3e223ea7582134322a2.camel@collabora.com>
Subject: Re: [RFC] media: uapi: Add VP8 low-level decoder API compound
 controls.
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Pawel Osciak <posciak@chromium.org>
Date:   Thu, 27 Jun 2019 15:57:46 -0300
In-Reply-To: <20190627093315.GA26629@aptenodytes>
References: <20190213211557.17696-1-ezequiel@collabora.com>
         <20190627093315.GA26629@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-27 at 11:33 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Wed 13 Feb 19, 18:15, Ezequiel Garcia wrote:
> > From: Pawel Osciak <posciak@chromium.org>
> > 
> > These controls are to be used with the new low-level decoder API for VP8
> > to provide additional parameters for the hardware that cannot parse the
> > input stream.
> > 
> > Signed-off-by: Pawel Osciak <posciak@chromium.org>
> > [ezequiel: rebased]
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> > As the H.264 interface is hopefully close to be merged,
> > I'm sending the VP8 interface to start this discussion.
> > 
> >  drivers/media/v4l2-core/v4l2-ctrls.c |   7 ++
> >  drivers/media/v4l2-core/v4l2-ioctl.c |   1 +
> >  include/media/v4l2-ctrls.h           |   3 +
> >  include/media/vp8-ctrls.h            | 104 +++++++++++++++++++++++++++
> >  include/uapi/linux/videodev2.h       |   1 +
> >  5 files changed, 116 insertions(+)
> >  create mode 100644 include/media/vp8-ctrls.h
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 366200d31bc0..c77a56c3e2aa 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -869,6 +869,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
> >  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
> >  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
> > +	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR:			return "VP8 Frame Header";
> 
> Could we call this _FRAME_HEADER to match the control name?
> 
> I find it quite handy to have the ctrl definitions and associated
> structures named in sync.
> 

Yeah, makes sense. And also get rid of similar names such as "SEGMNT".

> >  
> >  	/* HEVC controls */
> >  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
> > @@ -1323,6 +1324,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
> >  		*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
> >  		break;
> > +	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR:
> > +		*type = V4L2_CTRL_TYPE_VP8_FRAME_HDR;
> > +		break;
> >  	default:
> >  		*type = V4L2_CTRL_TYPE_INTEGER;
> >  		break;
> > @@ -1694,6 +1698,7 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> >  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
> >  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> > +	case V4L2_CTRL_TYPE_VP8_FRAME_HDR:
> >  		return 0;
> >  
> >  	default:
> > @@ -2290,6 +2295,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >  		break;
> >  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> >  		elem_size = sizeof(struct v4l2_ctrl_h264_decode_param);
> > +	case V4L2_CTRL_TYPE_VP8_FRAME_HDR:
> > +		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
> >  		break;
> >  	default:
> >  		if (type < V4L2_CTRL_COMPOUND_TYPES)
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index c765c7c7c562..ea295aa9d0b6 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1324,6 +1324,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
> >  		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
> >  		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
> > +		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 FRAME"; break;
> 
> I'm not familiar with VP8 at all, but are we guaranteed that only
> per-frame decoding mode is possible?
> 
> >  		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
> >  		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
> >  		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 22b6d09c4764..183c7fc5d18d 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -28,6 +28,7 @@
> >   */
> >  #include <media/mpeg2-ctrls.h>
> >  #include <media/h264-ctrls.h>
> > +#include <media/vp8-ctrls.h>
> >  
> >  /* forward references */
> >  struct file;
> > @@ -55,6 +56,7 @@ struct poll_table_struct;
> >   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
> >   * @p_h264_slice_param:		Pointer to a struct v4l2_ctrl_h264_slice_param.
> >   * @p_h264_decode_param:	Pointer to a struct v4l2_ctrl_h264_decode_param.
> > + * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
> >   * @p:				Pointer to a compound value.
> >   */
> >  union v4l2_ctrl_ptr {
> > @@ -71,6 +73,7 @@ union v4l2_ctrl_ptr {
> >  	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
> >  	struct v4l2_ctrl_h264_slice_param *p_h264_slice_param;
> >  	struct v4l2_ctrl_h264_decode_param *p_h264_decode_param;
> > +	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> >  	void *p;
> >  };
> >  
> > diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
> > new file mode 100644
> > index 000000000000..95b63a0cb239
> > --- /dev/null
> > +++ b/include/media/vp8-ctrls.h
> > @@ -0,0 +1,104 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * TODO: Make sure structs have no holes and are 4-byte aligned.
> > + */
> > +
> > +#ifndef _VP8_CTRLS_H_
> > +#define _VP8_CTRLS_H_
> > +
> > +#include <linux/v4l2-controls.h>
> > +
> > +#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR (V4L2_CID_MPEG_BASE + 260)
> > +
> > +#define V4L2_CTRL_TYPE_VP8_FRAME_HDR		0x220
> > +
> > +#define V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED              0x01
> > +#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_MAP           0x02
> > +#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_FEATURE_DATA  0x04
> > +
> > +struct v4l2_vp8_segment_header {
> > +	__u8 segment_feature_mode;
> > +	__s8 quant_update[4];
> > +	__s8 lf_update[4];
> > +	__u8 segment_probs[3];
> > +	__u32 flags;
> > +};
> > +
> > +#define V4L2_VP8_LF_HDR_ADJ_ENABLE	0x01
> > +#define V4L2_VP8_LF_HDR_DELTA_UPDATE	0x02
> > +struct v4l2_vp8_loopfilter_header {
> > +	__u16 type;
> > +	__u8 level;
> > +	__u8 sharpness_level;
> > +	__s8 ref_frm_delta_magnitude[4];
> > +	__s8 mb_mode_delta_magnitude[4];
> > +	__u16 flags;
> > +};
> > +
> > +struct v4l2_vp8_quantization_header {
> > +	__u8 y_ac_qi;
> > +	__s8 y_dc_delta;
> > +	__s8 y2_dc_delta;
> > +	__s8 y2_ac_delta;
> > +	__s8 uv_dc_delta;
> > +	__s8 uv_ac_delta;
> > +	__u16 dequant_factors[4][3][2];
> > +};
> > +
> > +struct v4l2_vp8_entropy_header {
> > +	__u8 coeff_probs[4][8][3][11];
> > +	__u8 y_mode_probs[4];
> > +	__u8 uv_mode_probs[3];
> > +	__u8 mv_probs[2][19];
> > +};
> > +
> > +#define V4L2_VP8_FRAME_HDR_FLAG_EXPERIMENTAL		0x01
> > +#define V4L2_VP8_FRAME_HDR_FLAG_SHOW_FRAME		0x02
> > +#define V4L2_VP8_FRAME_HDR_FLAG_MB_NO_SKIP_COEFF	0x04
> > +struct v4l2_ctrl_vp8_frame_header {
> > +	/* 0: keyframe, 1: not a keyframe */
> > +	__u8 key_frame; // could be a flag?
> > +	__u8 version;
> > +
> > +	/* Populated also if not a key frame */
> > +	__u16 width;
> > +	__u16 height;
> > +	__u8 horizontal_scale;
> > +	__u8 vertical_scale;
> > +
> > +	struct v4l2_vp8_segment_header segment_header;
> > +	struct v4l2_vp8_loopfilter_header lf_header;
> > +	struct v4l2_vp8_quantization_header quant_header;
> > +	struct v4l2_vp8_entropy_header entropy_header;
> > +
> > +	__u8 sign_bias_golden;
> > +	__u8 sign_bias_alternate;
> > +
> > +	__u8 prob_skip_false;
> > +	__u8 prob_intra;
> > +	__u8 prob_last;
> > +	__u8 prob_gf;
> > +
> > +	__u32 first_part_size;
> > +	__u32 first_part_offset; // this needed? it's always 3 + 7 * s->keyframe;
> > +	/*
> > +	 * Offset in bits of MB data in first partition,
> > +	 * i.e. bit offset starting from first_part_offset.
> > +	 */
> > +	__u32 macroblock_bit_offset;
> > +
> > +	__u8 num_dct_parts;
> > +	__u32 dct_part_sizes[8];
> > +
> > +	__u8 bool_dec_range;
> > +	__u8 bool_dec_value;
> > +	__u8 bool_dec_count;
> > +
> > +	__u64 last_frame_ts;
> > +	__u64 golden_frame_ts;
> > +	__u64 alt_frame_ts;
> > +
> > +	__u8 flags;
> > +};
> > +
> > +#endif
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index f6a484017208..a906bfc0c8f0 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -664,6 +664,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_VC1_ANNEX_G v4l2_fourcc('V', 'C', '1', 'G') /* SMPTE 421M Annex G compliant stream */
> >  #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPTE 421M Annex L compliant stream */
> >  #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
> > +#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frames */
> 
> Could we have this as part of the private API for now?
> 

Sure, see the new version of this patch: https://patchwork.kernel.org/patch/10992145/
which is part of https://patchwork.kernel.org/cover/10992139/.

Thanks,
Eze

