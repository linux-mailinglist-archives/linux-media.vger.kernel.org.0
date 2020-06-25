Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E548320A43C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406884AbgFYRn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406882AbgFYRn0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:43:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819B2C08C5C1;
        Thu, 25 Jun 2020 10:43:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4C2FD2A576A
Message-ID: <e477f42cd537c6e6e1f707492f6ad8ab6a510e3a.camel@collabora.com>
Subject: Re: [RFC 2/7] fixup! media: uapi: h264: update reference lists
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 14:42:47 -0300
In-Reply-To: <27c646c790d6b00b29f4a61c58eb761ceb56179a.camel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-3-ezequiel@collabora.com>
         <27c646c790d6b00b29f4a61c58eb761ceb56179a.camel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Adding Jernej, seems I haven't Cced him!)

On Thu, 2020-06-25 at 10:53 -0400, Nicolas Dufresne wrote:
> Le mardi 23 juin 2020 à 15:28 -0300, Ezequiel Garcia a écrit :
> > Align v4l2_h264_reference to 32-bits, giving some room
> > for future extensions.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-codec.rst  |  3 +++
> >  drivers/media/v4l2-core/v4l2-ctrls.c             | 16 ++++++++++++++++
> >  include/media/h264-ctrls.h                       |  7 +++++--
> >  3 files changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index 6c36d298db20..7af12447a5b0 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1943,6 +1943,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >      * - __u8
> >        - ``index``
> >        -
> > +    * - __u32
> > +      - ``reserved``
> > +      - Applications and drivers must set this to zero.
> 
> Is that really appropriate ? There was some effort to keep the controls
> small. Also, as these are fixed size, they could be extended with
> supplementary C arrays of the same size, set in separate control.
> 

That's a very valid concern.

Currently, each of these v4l2_h264_reference take 64 bytes
(32 x 2 bytes). So it's 128 bytes of references.

Having the reserved field means 256 bytes instead.

Without the reserved field v4l2_ctrl_h264_slice_params is 936 bytes,
the majority of the space taken by v4l2_h264_weight_factors.
So, the reserved field accounts for a small increment there.

Another option would be to split the v4l2_h264_reference lists
to its own control.

However, given the above, it would have more impact to consider
splitting v4l2_h264_pred_weight_table. This table
being used or not depends on the bitstream, so there might be
some value here.

What do you think? 

> Also, H264 HW is unlikely to evolve, and that covers what DXVA2 and
> VAAPI covers already. So it is quite unlikely to ever have to be
> extended.
> 

That may be true indeed. Perhaps we can then agree that references
only need an index and a flag.

Thanks!
Ezequiel

> >  
> >  .. _h264_reference_flags:
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 3f3fbcd60cc6..6abd023f10c7 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -1721,6 +1721,8 @@ static void std_log(const struct v4l2_ctrl *ctrl)
> >  
> >  #define zero_padding(s) \
> >  	memset(&(s).padding, 0, sizeof((s).padding))
> > +#define zero_reserved(s) \
> > +	memset(&(s).reserved, 0, sizeof((s).reserved))
> >  
> >  /*
> >   * Compound controls validation requires setting unused fields/flags to zero
> > @@ -1731,6 +1733,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >  {
> >  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> >  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> > +	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
> >  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> >  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> >  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> > @@ -1790,7 +1793,20 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	case V4L2_CTRL_TYPE_H264_SPS:
> >  	case V4L2_CTRL_TYPE_H264_PPS:
> >  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> > +		break;
> >  	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
> > +		p_h264_slice_params = p;
> > +
> > +		for (i = 0; i < V4L2_H264_REF_PIC_LIST_LEN; i++) {
> > +			struct v4l2_h264_reference *ref0 =
> > +				&p_h264_slice_params->ref_pic_list0[i];
> > +			struct v4l2_h264_reference *ref1 =
> > +				&p_h264_slice_params->ref_pic_list1[i];
> > +
> > +			zero_reserved(*ref0);
> > +			zero_reserved(*ref1);
> > +		}
> > +		break;
> >  	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> >  		break;
> >  
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index 9b1cbc9bc38e..c6cbf178c1c9 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -19,6 +19,8 @@
> >   */
> >  #define V4L2_H264_NUM_DPB_ENTRIES 16
> >  
> > +#define V4L2_H264_REF_PIC_LIST_LEN 32
> > +
> >  /* Our pixel format isn't stable at the moment */
> >  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
> >  
> > @@ -146,6 +148,7 @@ struct v4l2_h264_pred_weight_table {
> >  struct v4l2_h264_reference {
> >  	__u8 flags;
> >  	__u8 index;
> > +	__u16 reserved;
> >  };
> >  
> >  struct v4l2_ctrl_h264_slice_params {
> > @@ -190,8 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
> >  	 * Entries on each list are indices into
> >  	 * v4l2_ctrl_h264_decode_params.dpb[].
> >  	 */
> > -	struct v4l2_h264_reference ref_pic_list0[32];
> > -	struct v4l2_h264_reference ref_pic_list1[32];
> > +	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_PIC_LIST_LEN];
> > +	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_PIC_LIST_LEN];
> >  
> >  	__u32 flags;
> >  };


