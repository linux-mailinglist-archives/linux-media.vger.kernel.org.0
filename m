Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3315355106
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhDFKiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:38:12 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42293 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229787AbhDFKiM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 06:38:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Tj5rl4Nwf43ycTj5ulNaHQ; Tue, 06 Apr 2021 12:38:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617705483; bh=NpJQVvhmZXIaNujCbwesCvhDE3nNP4eAhbKSxvEt16E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sJv9zcI8yL8a7iWYCs2W2pB3suMX23Nz2V5B/NsNuf0PG2zfYE2OJzYw8rZvwf2Iw
         G2t6uTib7AWFgMGc+OPwGhSld+yoeDA8Q2rzpM9OzkU5AMmbplsDmb+ZU3KZJJ2nHw
         41F4dBr91uOYV0Dn15MgMxPXo4ZhpWKqoVFnAALCuGAe3VxNImNBc9N36utx+seIce
         z8b4mBivdlZpwGrF2J1BotBolChvfeQlmccp8nLUCyl9FWbDh8qlRtHW57KpGUKAgY
         ySbKVjGolqezBsw79cuHsaFrNUg42qCeE85VUz22zMufwoLbLl49onCEUaznu9POXh
         QShc1nNs48ydQ==
Subject: Re: [PATCH v5 04/10] media: uapi: mpeg2: Split sequence and picture
 parameters
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>
References: <20210403180756.175881-1-ezequiel@collabora.com>
 <20210403180756.175881-5-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2f102d06-132e-722f-2856-0efe699569e2@xs4all.nl>
Date:   Tue, 6 Apr 2021 12:37:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210403180756.175881-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLI5QOFj/uTIv/n9nDCg/VsVrClo+gCuDkRpZ7zJz3Orm9dP+DVfPH+eDoWjROIwBniokcGdq0xD/5rm00ZM3Pos/7Y9W7flRctVD7s+pkbNt6dWHe+9
 Ay/bhV6xt04xdBIdoqs6F87bR3WY0BPK/4qsFqguVxLmf93jietdywjgYQQZszEogS1brz4nXDWV9IhTzVnhDGyzaHn6aMMZYuLBOzELFeobEA1WdeARwzKQ
 ecF4H44J8HMhSuu1VH7WR4TGBk32SL+1p0PVt6dqX/uR4KrviDiG3gVtbJQtMa5IUix0/QU2Si1PhkWTNqN5lnA/ECnAnN/HypgKcNaOW75Q6pNJjrYHiSkL
 O7Q8+fGYOKbwmrV2yv/jntBJPgQA9MU0KpsOR6sFdLkxEWybgy5buWp4cfdNqVMTCXLjYpvJtjccphSEftEiKjfH4iEAsUWPX35QWvdUcNlsDGqvgTpK4C95
 uvdkz9nBAyoa96H4V6mdFhzWLxKJ2e1sfHqUPeaKrKEW7gSDx/idSE2T4bDMgXBSEqwkA0nocwezef9cINf5aoL7pbFYl2jvZGF/VA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2021 20:07, Ezequiel Garcia wrote:
> Typically, bitstreams are composed of a sequence header,
> followed by a number of picture header and picture coding extension
> headers. Each picture can be composed by a number of slices.

by -> of

> 
> Let's split the MPEG-2 uAPI to follow these semantics more closely,
> allowing more usage flexibility. Having these controls splitted

splitted -> split up

> allows applications to set a sequence control at the beginning
> of a sequence, and then set a picture control for each frame.
> 
> While here add padding fields where needed, and document
> the uAPI header thoroughly.
> 
> Note that the V4L2_CTRL_TYPE_{} defines had to be moved because
> it clashes with existing ones. This is not really an issue
> since they will be re-defined when the controls are moved
> out of staging.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Tested-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 47 ++++++---
>  .../media/v4l/pixfmt-compressed.rst           |  5 +-
>  .../media/v4l/vidioc-queryctrl.rst            | 12 +++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 57 ++++++++---
>  drivers/staging/media/hantro/hantro_drv.c     | 10 ++
>  .../media/hantro/hantro_g1_mpeg2_dec.c        | 14 +--
>  .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    | 14 +--
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 12 +++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  4 +
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  8 +-
>  include/media/mpeg2-ctrls.h                   | 97 +++++++++++++++----
>  include/media/v4l2-ctrls.h                    |  4 +
>  14 files changed, 228 insertions(+), 60 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 7d5ac7fb6579..8a0d6139db34 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1603,14 +1603,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u32
>        - ``data_bit_offset``
>        - Offset (in bits) to the video data in the current slice data.
> -    * - struct :c:type:`v4l2_mpeg2_sequence`
> -      - ``sequence``
> -      - Structure with MPEG-2 sequence metadata, merging relevant fields from
> -	the sequence header and sequence extension parts of the bitstream.
> -    * - struct :c:type:`v4l2_mpeg2_picture`
> -      - ``picture``
> -      - Structure with MPEG-2 picture metadata, merging relevant fields from
> -	the picture header and picture coding extension parts of the bitstream.
>      * - __u64
>        - ``backward_ref_ts``
>        - Timestamp of the V4L2 capture buffer to use as backward reference, used
> @@ -1628,14 +1620,28 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u32
>        - ``quantiser_scale_code``
>        - Code used to determine the quantization scale to use for the IDCT.
> +    * - __u8
> +      - ``reserved``
> +      - Applications and drivers must set this to zero.
>  
> -.. c:type:: v4l2_mpeg2_sequence
> +``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE (struct)``
> +    Specifies the sequence parameters (as extracted from the bitstream) for the
> +    associated MPEG-2 slice data. This includes fields matching the syntax
> +    elements from the sequence header and sequence extension parts of the
> +    bitstream as specified by :ref:`mpeg2part2`.
> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_ctrl_mpeg2_sequence
>  
>  .. cssclass:: longtable
>  
>  .. tabularcolumns:: |p{1.4cm}|p{6.5cm}|p{9.4cm}|
>  
> -.. flat-table:: struct v4l2_mpeg2_sequence
> +.. flat-table:: struct v4l2_ctrl_mpeg2_sequence
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> @@ -1657,6 +1663,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u8
>        - ``chroma_format``
>        - The chrominance sub-sampling format (1: 4:2:0, 2: 4:2:2, 3: 4:4:4).
> +    * - __u8
> +      - ``reserved``
> +      - Applications and drivers must set this to zero.
>      * - __u32
>        - ``flags``
>        - See :ref:`MPEG-2 Sequence Flags <mpeg2_sequence_flags>`.
> @@ -1677,7 +1686,18 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - Indication that all the frames for the sequence are progressive instead
>  	of interlaced.
>  
> -.. c:type:: v4l2_mpeg2_picture
> +``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE (struct)``
> +    Specifies the picture parameters (as extracted from the bitstream) for the
> +    associated MPEG-2 slice data. This includes fields matching the syntax
> +    elements from the picture header and picture coding extension parts of the
> +    bitstream as specified by :ref:`mpeg2part2`.
> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_ctrl_mpeg2_picture
>  
>  .. raw:: latex
>  
> @@ -1687,7 +1707,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>  
>  .. tabularcolumns:: |p{1.0cm}|p{5.6cm}|p{10.7cm}|
>  
> -.. flat-table:: struct v4l2_mpeg2_picture
> +.. flat-table:: struct v4l2_ctrl_mpeg2_picture
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> @@ -1708,6 +1728,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``picture_structure``
>        - Picture structure (1: interlaced top field, 2: interlaced bottom field,
>  	3: progressive frame).
> +    * - __u8
> +      - ``reserved``
> +      - Applications and drivers must set this to zero.
>      * - __u32
>        - ``flags``
>        - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index cba607f789f0..bbbacbd65d6f 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -114,8 +114,9 @@ Compressed Formats
>  	This format is adapted for stateless video decoders that implement a
>  	MPEG-2 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
>  	Metadata associated with the frame to decode is required to be passed
> -	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS`` control and
> -	quantisation matrices can optionally be specified through the
> +	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE``,
> +        ``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE``, and ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS``
> +        controls. Quantisation matrices can optionally be specified through the
>  	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION`` control.
>  	See the :ref:`associated Codec Control IDs <v4l2-mpeg-mpeg2>`.
>  	Exactly one output and one capture buffer must be provided for use with
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 4362945fd39b..afc1505a3a7e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -429,6 +429,18 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_mpeg2_quantisation`, containing MPEG-2
>  	quantisation matrices for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_MPEG2_SEQUENCE``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_mpeg2_sequence`, containing MPEG-2
> +	sequence parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_MPEG2_PICTURE``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_mpeg2_picture`, containing MPEG-2
> +	picture parameters for stateless video decoders.
>      * - ``V4L2_CTRL_TYPE_AREA``
>        - n/a
>        - n/a
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index d14a807e8f9e..6bba3e6d3ef3 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -134,6 +134,8 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U16 :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U32 :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U8 :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_SPS :c:type:`v4l2_ctrl_type`
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 99064683cfb5..1145dec744e8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -973,6 +973,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
>  	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
> +	case V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE:		return "MPEG-2 Sequence Header";
> +	case V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
> @@ -1469,6 +1471,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_RDS_TX_ALT_FREQS:
>  		*type = V4L2_CTRL_TYPE_U32;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE:
> +		*type = V4L2_CTRL_TYPE_MPEG2_SEQUENCE;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE:
> +		*type = V4L2_CTRL_TYPE_MPEG2_PICTURE;
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS;
>  		break;
> @@ -1667,7 +1675,8 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
>  static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			      union v4l2_ctrl_ptr ptr)
>  {
> -	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> +	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
> +	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>  	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
>  	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>  	struct v4l2_ctrl_fwht_params *p_fwht_params;
> @@ -1684,13 +1693,18 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	 * v4l2_ctrl_type enum.
>  	 */
>  	switch ((u32)ctrl->type) {
> -	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> -		p_mpeg2_slice_params = p;
> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
> +		p_mpeg2_sequence = p;
> +
>  		/* 4:2:0 */
> -		p_mpeg2_slice_params->sequence.chroma_format = 1;
> +		p_mpeg2_sequence->chroma_format = 1;
> +		break;
> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
> +		p_mpeg2_picture = p;
> +
>  		/* interlaced top field */
> -		p_mpeg2_slice_params->picture.picture_structure = 1;
> -		p_mpeg2_slice_params->picture.picture_coding_type =
> +		p_mpeg2_picture->picture_structure = V4L2_MPEG2_PIC_TOP_FIELD;
> +		p_mpeg2_picture->picture_coding_type =
>  					V4L2_MPEG2_PIC_CODING_TYPE_I;
>  		break;
>  	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
> @@ -1862,6 +1876,8 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  				 union v4l2_ctrl_ptr ptr)
>  {
> +	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
> +	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>  	struct v4l2_ctrl_fwht_params *p_fwht_params;
> @@ -1878,10 +1894,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	unsigned int i;
>  
>  	switch ((u32)ctrl->type) {
> -	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> -		p_mpeg2_slice_params = p;
> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
> +		p_mpeg2_sequence = p;
>  
> -		switch (p_mpeg2_slice_params->sequence.chroma_format) {
> +		switch (p_mpeg2_sequence->chroma_format) {
>  		case 1: /* 4:2:0 */
>  		case 2: /* 4:2:2 */
>  		case 3: /* 4:4:4 */
> @@ -1889,8 +1905,13 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		default:
>  			return -EINVAL;
>  		}
> +		zero_reserved(*p_mpeg2_sequence);
> +		break;
> +
> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
> +		p_mpeg2_picture = p;
>  
> -		switch (p_mpeg2_slice_params->picture.intra_dc_precision) {
> +		switch (p_mpeg2_picture->intra_dc_precision) {
>  		case 0: /* 8 bits */
>  		case 1: /* 9 bits */
>  		case 2: /* 10 bits */
> @@ -1900,7 +1921,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		}
>  
> -		switch (p_mpeg2_slice_params->picture.picture_structure) {
> +		switch (p_mpeg2_picture->picture_structure) {
>  		case V4L2_MPEG2_PIC_TOP_FIELD:
>  		case V4L2_MPEG2_PIC_BOTTOM_FIELD:
>  		case V4L2_MPEG2_PIC_FRAME:
> @@ -1909,7 +1930,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		}
>  
> -		switch (p_mpeg2_slice_params->picture.picture_coding_type) {
> +		switch (p_mpeg2_picture->picture_coding_type) {
>  		case V4L2_MPEG2_PIC_CODING_TYPE_I:
>  		case V4L2_MPEG2_PIC_CODING_TYPE_P:
>  		case V4L2_MPEG2_PIC_CODING_TYPE_B:
> @@ -1917,7 +1938,13 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		default:
>  			return -EINVAL;
>  		}
> +		zero_reserved(*p_mpeg2_picture);
> +		break;
>  
> +	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> +		p_mpeg2_slice_params = p;
> +
> +		zero_reserved(*p_mpeg2_slice_params);
>  		break;
>  
>  	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
> @@ -2822,6 +2849,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_U32:
>  		elem_size = sizeof(u32);
>  		break;
> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
> +		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
> +		break;
> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
> +		elem_size = sizeof(struct v4l2_ctrl_mpeg2_picture);
> +		break;
>  	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_mpeg2_slice_params);
>  		break;
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 9e3552cd5cf8..067205fb89f6 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -286,6 +286,16 @@ static const struct hantro_ctrl controls[] = {
>  			.def = 50,
>  			.ops = &hantro_jpeg_ctrl_ops,
>  		},
> +	}, {
> +		.codec = HANTRO_MPEG2_DECODER,
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE,
> +		},
> +	}, {
> +		.codec = HANTRO_MPEG2_DECODER,
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
> +		},
>  	}, {
>  		.codec = HANTRO_MPEG2_DECODER,
>  		.cfg = {
> diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
> index 6ef7ded863b2..f3494a70aa12 100644
> --- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
> @@ -92,8 +92,8 @@ static void
>  hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
>  				struct vb2_buffer *src_buf,
>  				struct vb2_buffer *dst_buf,
> -				const struct v4l2_mpeg2_sequence *seq,
> -				const struct v4l2_mpeg2_picture *pic,
> +				const struct v4l2_ctrl_mpeg2_sequence *seq,
> +				const struct v4l2_ctrl_mpeg2_picture *pic,
>  				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
>  {
>  	dma_addr_t forward_addr = 0, backward_addr = 0;
> @@ -153,8 +153,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>  	struct hantro_dev *vpu = ctx->dev;
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
> -	const struct v4l2_mpeg2_sequence *seq;
> -	const struct v4l2_mpeg2_picture *pic;
> +	const struct v4l2_ctrl_mpeg2_sequence *seq;
> +	const struct v4l2_ctrl_mpeg2_picture *pic;
>  	u32 reg;
>  
>  	src_buf = hantro_get_src_buf(ctx);
> @@ -165,8 +165,10 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>  
>  	slice_params = hantro_get_ctrl(ctx,
>  				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
> -	seq = &slice_params->sequence;
> -	pic = &slice_params->picture;
> +	seq = hantro_get_ctrl(ctx,
> +			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
> +	pic = hantro_get_ctrl(ctx,
> +			      V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
>  
>  	reg = G1_REG_DEC_AXI_RD_ID(0) |
>  	      G1_REG_DEC_TIMEOUT_E(1) |
> diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
> index ff54398f6643..5b383906af59 100644
> --- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
> +++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
> @@ -95,8 +95,8 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
>  				 struct hantro_ctx *ctx,
>  				 struct vb2_buffer *src_buf,
>  				 struct vb2_buffer *dst_buf,
> -				 const struct v4l2_mpeg2_sequence *seq,
> -				 const struct v4l2_mpeg2_picture *pic,
> +				 const struct v4l2_ctrl_mpeg2_sequence *seq,
> +				 const struct v4l2_ctrl_mpeg2_picture *pic,
>  				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
>  {
>  	dma_addr_t forward_addr = 0, backward_addr = 0;
> @@ -156,8 +156,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
>  	struct hantro_dev *vpu = ctx->dev;
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
> -	const struct v4l2_mpeg2_sequence *seq;
> -	const struct v4l2_mpeg2_picture *pic;
> +	const struct v4l2_ctrl_mpeg2_sequence *seq;
> +	const struct v4l2_ctrl_mpeg2_picture *pic;
>  	u32 reg;
>  
>  	src_buf = hantro_get_src_buf(ctx);
> @@ -167,8 +167,10 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
>  
>  	slice_params = hantro_get_ctrl(ctx,
>  				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
> -	seq = &slice_params->sequence;
> -	pic = &slice_params->picture;
> +	seq = hantro_get_ctrl(ctx,
> +			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
> +	pic = hantro_get_ctrl(ctx,
> +			      V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
>  
>  	reg = VDPU_REG_DEC_ADV_PRE_DIS(0) |
>  	      VDPU_REG_DEC_SCMD_DIS(0) |
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index 62a5407664ae..878752b30c10 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -29,6 +29,18 @@
>  #include "cedrus_hw.h"
>  
>  static const struct cedrus_control cedrus_controls[] = {
> +	{
> +		.cfg = {
> +			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE,
> +		},
> +		.codec		= CEDRUS_CODEC_MPEG2,
> +	},
> +	{
> +		.cfg = {
> +			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
> +		},
> +		.codec		= CEDRUS_CODEC_MPEG2,
> +	},
>  	{
>  		.cfg = {
>  			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 6516bff3d319..989873ccb98c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -68,6 +68,8 @@ struct cedrus_h264_run {
>  };
>  
>  struct cedrus_mpeg2_run {
> +	const struct v4l2_ctrl_mpeg2_sequence		*sequence;
> +	const struct v4l2_ctrl_mpeg2_picture		*picture;
>  	const struct v4l2_ctrl_mpeg2_slice_params	*slice_params;
>  	const struct v4l2_ctrl_mpeg2_quantisation	*quantisation;
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index 238f779d2ba4..f4cc6aebfac9 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -40,6 +40,10 @@ void cedrus_device_run(void *priv)
>  
>  	switch (ctx->src_fmt.pixelformat) {
>  	case V4L2_PIX_FMT_MPEG2_SLICE:
> +		run.mpeg2.sequence = cedrus_find_control_data(ctx,
> +			V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
> +		run.mpeg2.picture = cedrus_find_control_data(ctx,
> +			V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
>  		run.mpeg2.slice_params = cedrus_find_control_data(ctx,
>  			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
>  		run.mpeg2.quantisation = cedrus_find_control_data(ctx,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index e39a17d28c7d..65a175c6a5c2 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -51,8 +51,8 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
>  static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  {
>  	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
> -	const struct v4l2_mpeg2_sequence *seq;
> -	const struct v4l2_mpeg2_picture *pic;
> +	const struct v4l2_ctrl_mpeg2_sequence *seq;
> +	const struct v4l2_ctrl_mpeg2_picture *pic;
>  	const struct v4l2_ctrl_mpeg2_quantisation *quantisation;
>  	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
>  	dma_addr_t fwd_luma_addr, fwd_chroma_addr;
> @@ -66,8 +66,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
>  	u32 reg;
>  
>  	slice_params = run->mpeg2.slice_params;
> -	seq = &slice_params->sequence;
> -	pic = &slice_params->picture;
> +	seq = run->mpeg2.sequence;
> +	pic = run->mpeg2.picture;
>  
>  	quantisation = run->mpeg2.quantisation;
>  
> diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
> index d3190979d574..2a26c03e3ead 100644
> --- a/include/media/mpeg2-ctrls.h
> +++ b/include/media/mpeg2-ctrls.h
> @@ -13,23 +13,45 @@
>  
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_CODEC_BASE+250)
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION		(V4L2_CID_CODEC_BASE+251)
> +#define V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE		(V4L2_CID_CODEC_BASE+252)
> +#define V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE		(V4L2_CID_CODEC_BASE+253)
>  
>  /* enum v4l2_ctrl_type type values */
> -#define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
> -#define	V4L2_CTRL_TYPE_MPEG2_QUANTISATION 0x0104
> +#define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0130
> +#define V4L2_CTRL_TYPE_MPEG2_QUANTISATION 0x0131
> +#define V4L2_CTRL_TYPE_MPEG2_SEQUENCE 0x0132
> +#define V4L2_CTRL_TYPE_MPEG2_PICTURE 0x0133
>  
>  #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE		0x0001
>  
> -struct v4l2_mpeg2_sequence {
> -	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence header */
> +/**
> + * struct v4l2_ctrl_mpeg2_sequence - MPEG-2 sequence header
> + *
> + * All the members on this structure match the sequence header and sequence
> + * extension syntaxes as specified by the MPEG-2 specification.
> + *
> + * Fields horizontal_size, vertical_size and vbv_buffer_size are a
> + * combination of respective _value and extension syntax elements,
> + * as described in section 6.3.3 "Sequence header".
> + *
> + * @horizontal_size: combination of elements horizontal_size_value and
> + * horizontal_size_extension.
> + * @vertical_size: combination of elements vertical_size_value and
> + * vertical_size_extension.
> + * @vbv_buffer_size: combination of elements vbv_buffer_size_value and
> + * vbv_buffer_size_extension.
> + * @profile_and_level_indication: see MPEG-2 specification.
> + * @chroma_format: see MPEG-2 specification.
> + * @reserved: padding field. Should be zeroed by applications.
> + * @flags: see V4L2_MPEG2_SEQ_FLAG_{}.
> + */
> +struct v4l2_ctrl_mpeg2_sequence {
>  	__u16	horizontal_size;
>  	__u16	vertical_size;
>  	__u32	vbv_buffer_size;
> -
> -	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence extension */
>  	__u16	profile_and_level_indication;
>  	__u8	chroma_format;
> -
> +	__u8	reserved;
>  	__u32	flags;

I really don't like to have 'reserved' in the middle of a struct.

Can we make flags a u8? There is just a single flag at the
moment, so it's not as if we are about to run out of bits.


>  };
>  
> @@ -51,33 +73,72 @@ struct v4l2_mpeg2_sequence {
>  #define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
>  #define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
>  
> -struct v4l2_mpeg2_picture {
> -	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Picture header */
> +/**
> + * struct v4l2_ctrl_mpeg2_picture - MPEG-2 picture header
> + *
> + * All the members on this structure match the picture header and picture
> + * coding extension syntaxes as specified by the MPEG-2 specification.
> + *
> + * @picture_coding_type: see MPEG-2 specification.
> + * @f_code[2][2]: see MPEG-2 specification.
> + * @intra_dc_precision: see MPEG-2 specification.
> + * @picture_structure: see V4L2_MPEG2_PIC_{}_FIELD.
> + * @reserved: padding field. Should be zeroed by applications.
> + * @flags: see V4L2_MPEG2_PIC_FLAG_{}.
> + */
> +struct v4l2_ctrl_mpeg2_picture {
>  	__u8	picture_coding_type;
> -
> -	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Picture coding extension */
>  	__u8	f_code[2][2];
>  	__u8	intra_dc_precision;
>  	__u8	picture_structure;
> -
> +	__u8	reserved;
>  	__u32	flags;

Here all the bits are in use, so changing u32 to u8 might not be an
option. But is it possible to move flags up in the struct to avoid
having a reserved field in the middle? I prefer to have reserved fields
at the end, if at all possible.

>  };
>  
> +/**
> + * struct v4l2_ctrl_mpeg2_slice_params - MPEG-2 slice header
> + *
> + * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as
> + * reference for backward prediction.
> + * @forward_ref_ts: timestamp of the V4L2 capture buffer to use as
> + * reference for forward prediction. These timestamp refers to the
> + * timestamp field in struct v4l2_buffer. Use v4l2_timeval_to_ns()
> + * to convert the struct timeval to a __u64.
> + * @quantiser_scale_code: quantiser scale integer matching an
> + * homonymous syntax element.
> + * @reserved: padding field. Should be zeroed by applications.
> + */
>  struct v4l2_ctrl_mpeg2_slice_params {
>  	__u32	bit_size;
>  	__u32	data_bit_offset;
>  	__u64	backward_ref_ts;
>  	__u64	forward_ref_ts;
> -
> -	struct v4l2_mpeg2_sequence sequence;
> -	struct v4l2_mpeg2_picture picture;
> -
> -	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Slice */
>  	__u32	quantiser_scale_code;
> +	__u32	reserved;
>  };
>  
> +/**
> + * struct v4l2_ctrl_mpeg2_quantisation - MPEG-2 quantisation
> + *
> + * Quantization matrices as specified by section 6.3.7
> + * "Quant matrix extension".
> + *
> + * @intra_quantiser_matrix: The quantisation matrix coefficients
> + * for intra-coded frames, in zigzag scanning order. It is relevant
> + * for both luma and chroma components, although it can be superseded
> + * by the chroma-specific matrix for non-4:2:0 YUV formats.
> + * @non_intra_quantiser_matrix: The quantisation matrix coefficients
> + * for non-intra-coded frames, in zigzag scanning order. It is relevant
> + * for both luma and chroma components, although it can be superseded
> + * by the chroma-specific matrix for non-4:2:0 YUV formats.
> + * @chroma_intra_quantiser_matrix: The quantisation matrix coefficients
> + * for the chominance component of intra-coded frames, in zigzag scanning
> + * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
> + * @chroma_non_intra_quantiser_matrix: The quantisation matrix coefficients
> + * for the chrominance component of non-intra-coded frames, in zigzag scanning
> + * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
> + */
>  struct v4l2_ctrl_mpeg2_quantisation {
> -	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Quant matrix extension */
>  	__u8	intra_quantiser_matrix[64];
>  	__u8	non_intra_quantiser_matrix[64];
>  	__u8	chroma_intra_quantiser_matrix[64];
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a560005c575a..6406cdc3f56d 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -40,6 +40,8 @@ struct video_device;
>   * @p_u16:			Pointer to a 16-bit unsigned value.
>   * @p_u32:			Pointer to a 32-bit unsigned value.
>   * @p_char:			Pointer to a string.
> + * @p_mpeg2_sequence:		Pointer to a MPEG2 sequence structure.
> + * @p_mpeg2_picture:		Pointer to a MPEG2 picture structure.
>   * @p_mpeg2_slice_params:	Pointer to a MPEG2 slice parameters structure.
>   * @p_mpeg2_quantisation:	Pointer to a MPEG2 quantisation data structure.
>   * @p_fwht_params:		Pointer to a FWHT stateless parameters structure.
> @@ -64,6 +66,8 @@ union v4l2_ctrl_ptr {
>  	u16 *p_u16;
>  	u32 *p_u32;
>  	char *p_char;
> +	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
> +	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quantisation;
>  	struct v4l2_ctrl_fwht_params *p_fwht_params;
> 

Regards,

	Hans
