Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4158E277A14
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 22:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgIXUVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 16:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgIXUVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 16:21:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9615BC0613CE;
        Thu, 24 Sep 2020 13:21:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 34D8E29D2B2
Message-ID: <21ef619f142d4b0b70351b9b5a2530f9f2424383.camel@collabora.com>
Subject: Re: [PATCH] media: uapi: h264: Add documentation to the interface
 header
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com
Date:   Thu, 24 Sep 2020 16:21:29 -0400
In-Reply-To: <5049b19f-cb31-6e6e-2667-c63b7adf997b@xs4all.nl>
References: <20200921193851.50752-1-ezequiel@collabora.com>
         <5049b19f-cb31-6e6e-2667-c63b7adf997b@xs4all.nl>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-mdLlfN9WHnjf1emaT7Qq"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-mdLlfN9WHnjf1emaT7Qq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 24 septembre 2020 =C3=A0 10:29 +0200, Hans Verkuil a =C3=A9crit :
> Hi Ezequiel,
>=20
> On 21/09/2020 21:38, Ezequiel Garcia wrote:
> > In preparation for making the interface public,
> > document all the structures. Special care is taken to
> > annotate those fields that depart from the H264 syntax.
> >=20
> > This commit only adds documentation and doesn't affect
> > functionality in any way.
> >=20
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  include/media/h264-ctrls.h | 138 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 128 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > index ec4799154438..afc8e7c05c18 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/media/h264-ctrls.h
> > @@ -46,11 +46,38 @@
> >  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
> >  #define V4L2_CTRL_TYPE_H264_PRED_WEIGHTS	0x0115
> > =20
> > +/**
> > + * enum v4l2_mpeg_video_h264_decode_mode - Decoding mode
> > + *
> > + * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED: indicates that decod=
ing
> > + * is performed one slice at a time. In this mode,
> > + * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS must contain the parsed slice
> > + * parameters and the OUTPUT buffer must contain a single slice.
> > + * V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature is used
> > + * in order to support multislice frames.
> > + * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED: indicates that
> > + * decoding is performed per frame. The OUTPUT buffer must contain
> > + * all slices and also both fields. This mode is typically supported
> > + * by device drivers that are able to parse the slice(s) header(s)
> > + * in hardware. When this mode is selected,
> > + * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS is not used.
> > + */
> >  enum v4l2_mpeg_video_h264_decode_mode {
> >  	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
> >  	V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
> >  };
> > =20
> > +/**
> > + * enum v4l2_mpeg_video_h264_start_code - Start code
> > + *
> > + * @V4L2_MPEG_VIDEO_H264_START_CODE_NONE: slices are passed
> > + * to the driver without any start code.
> > + * @V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B: slices are passed
> > + * to the driver with an Annex B start code prefix
> > + * (legal start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001).
> > + * This mode is typically supported by device drivers that parse
> > + * the start code in hardware.
> > + */
> >  enum v4l2_mpeg_video_h264_start_code {
> >  	V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
> >  	V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > @@ -71,6 +98,12 @@ enum v4l2_mpeg_video_h264_start_code {
> >  #define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
> >  #define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
> > =20
> > +/**
> > + * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
> > + *
> > + * All the members on this sequence parameter set structure match the
> > + * sequence parameter set syntax as specified by the H264 specificatio=
n.
> > + */
> >  struct v4l2_ctrl_h264_sps {
> >  	__u8 profile_idc;
> >  	__u8 constraint_set_flags;
> > @@ -101,6 +134,20 @@ struct v4l2_ctrl_h264_sps {
> >  #define V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE				0x0040
> >  #define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT			0x0080
> > =20
> > +/**
> > + * struct v4l2_ctrl_h264_pps - H264 picture parameter set
> > + *
> > + * Except where noted, all the members on this picture parameter set
> > + * structure match the sequence parameter set syntax as specified
> > + * by the H264 specification.
> > + *
> > + * In particular, V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT flag
> > + * has a specific meaning. This flag should be set if a non-flat
> > + * scaling matrix applies to the picture. In this case, applications
> > + * are expected to use V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX.
> > + * This will be the case if SPS scaling_matrix_present_flag or
> > + * PPS pic_scaling_matrix_present_flag syntax elements are set.
>=20
> This is a bit confusing. 'This will be the case': what does 'This' refer
> to?
>=20
> > + */
> >  struct v4l2_ctrl_h264_pps {
> >  	__u8 pic_parameter_set_id;
> >  	__u8 seq_parameter_set_id;
> > @@ -115,6 +162,18 @@ struct v4l2_ctrl_h264_pps {
> >  	__u16 flags;
> >  };
> > =20
> > +/**
> > + * struct v4l2_ctrl_h264_scaling_matrix - H264 scaling matrices
> > + *
> > + * @scaling_list_4x4: scaling matrix after applying the inverse
> > + * scanning process. Expected list order is Intra Y, Intra Cb,
> > + * Intra Cr, Inter Y, Inter Cb, Inter Cr. The values on each
> > + * scaling list are expected in raster scan order.
> > + * @scaling_list_8x8: scaling matrix after applying the inverse
> > + * scanning process. Expected list order is Intra Y, Inter Y,
> > + * Intra Cb, Inter Cb, Intra Cr, Inter Cr. The values on each
> > + * scaling list are expected in raster scan order.
>=20
> The list order is different for the 4x4 and 8x8 matrices. Is that
> correct?
>=20
> If it is correct, then there should perhaps be a sentence like this
> at the start:
>=20
> "Note that the list order is different for the 4x4 and 8x8 matrices
> as per the H264 specification."
>=20
> (I assume that the order is based on the H264 spec)

That table I think:

Table 7-2 =E2=80=93 Assignment of mnemonic names to scaling list indices an=
d
specification of fall-back rule

>=20
> > + */
> >  struct v4l2_ctrl_h264_scaling_matrix {
> >  	__u8 scaling_list_4x4[6][16];
> >  	__u8 scaling_list_8x8[6][64];
> > @@ -134,6 +193,12 @@ struct v4l2_h264_weight_factors {
> >  	 ((pps)->weighted_bipred_idc =3D=3D 1 && \
> >  	  (slice)->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B))
> > =20
> > +/**
> > + * struct v4l2_ctrl_h264_pred_weights - Prediction weight table
> > + *
> > + * Prediction weight table, which matches the syntax specified
> > + * by the H264 specification.
> > + */
> >  struct v4l2_ctrl_h264_pred_weights {
> >  	__u16 luma_log2_weight_denom;
> >  	__u16 chroma_log2_weight_denom;
> > @@ -153,19 +218,41 @@ struct v4l2_ctrl_h264_pred_weights {
> >  #define V4L2_H264_BOTTOM_FIELD_REF			0x2
> >  #define V4L2_H264_FRAME_REF				0x3
> > =20
> > +/**
> > + * struct v4l2_h264_reference - H264 picture reference
> > + *
> > + * @fields: indicates how the picture is referenced.
> > + * Valid values are V4L2_H264_{}_REF.
> > + * @index: index into v4l2_ctrl_h264_decode_params.dpb[].
> > + */
> >  struct v4l2_h264_reference {
> >  	__u8 fields;
> > -
> > -	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
> >  	__u8 index;
> >  };
> > =20
> > +/**
> > + * struct v4l2_ctrl_h264_slice_params - H264 slice parameters
> > + *
> > + * This structure holds the H264 syntax elements that are specified
> > + * as non-invariant for the slices in a given frame.
> > + *
> > + * Slice invariant syntax elements are contained in struct
> > + * v4l2_ctrl_h264_decode_params. This is done to reduce the API surfac=
e
> > + * on frame-based decoders, where slice header parsing is done by the
> > + * hardware.
> > + *
> > + * Slice invariant syntax elements are specified in specification sect=
ion
> > + * "7.4.3 Slice header semantics".
> > + *
> > + * Except where noted, the members on this struct match the slice head=
er syntax.
> > + *
> > + * @header_bit_size: offset in bits to slice_data() from the beginning=
 of this slice.
> > + * @ref_pic_list0: reference picture list 0 after applying the per-sli=
ce modifications.
> > + * @ref_pic_list1: reference picture list 1 after applying the per-sli=
ce modifications.
>=20
> There are a lot more fields here that are not mentioned.
>=20
> In order to prevent the doc checker to issue warnings about undocumented =
field,
> I would suggest adding them all, but just keep the description simple:
>=20
> @slice_type: see H264 specification.
>=20
> You should also document @reserved since that's obviously not part of the=
 h264 spec.
>=20
> > + */
> >  struct v4l2_ctrl_h264_slice_params {
> > -	/* Offset in bits to slice_data() from the beginning of this slice. *=
/
> >  	__u32 header_bit_size;
> > -
> >  	__u32 first_mb_in_slice;
> > -
> >  	__u8 slice_type;
> >  	__u8 colour_plane_id;
> >  	__u8 redundant_pic_cnt;
> > @@ -191,22 +278,55 @@ struct v4l2_ctrl_h264_slice_params {
> >  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
> >  #define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
> > =20
> > +/**
> > + * struct v4l2_h264_dpb_entry - H264 decoded picture buffer entry
> > + *
> > + * @reference_ts: timestamp of the V4L2 capture buffer to use as refer=
ence.
> > + * The timestamp refers to the timestamp field in struct v4l2_buffer.
> > + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
> > + * @pic_num: matches PicNum variable assigned during the reference
> > + * picture lists construction process.
> > + * @frame_num: frame identifier which matches frame_num syntax element=
.
> > + * @fields: indicates how the DPB entry is referenced. Valid values ar=
e
> > + * V4L2_H264_{}_REF.
> > + * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
> > + * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
> > + * Note that picture field is indicated by v4l2_buffer.field.
>=20
> @flags and @reserved are missing.
>=20
> > + */
> >  struct v4l2_h264_dpb_entry {
> >  	__u64 reference_ts;
> >  	__u32 pic_num;
> >  	__u16 frame_num;
> >  	__u8 fields;
> >  	__u8 reserved[5];
> > -	/* Note that field is indicated by v4l2_buffer.field */
> >  	__s32 top_field_order_cnt;
> >  	__s32 bottom_field_order_cnt;
> > -	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
> > +	__u32 flags;
> >  };
> > =20
> >  #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
> >  #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
> >  #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
> > =20
> > +/**
> > + * struct v4l2_ctrl_h264_decode_params - H264 decoding parameters
> > + *
> > + * @dpb: decoded picture buffer.
> > + * @nal_ref_idc: slice header syntax element.
> > + * @frame_num: slice header syntax element.
> > + * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
> > + * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
> > + * Note that picture field is indicated by v4l2_buffer.field.
> > + * @idr_pic_id: slice header syntax element.
> > + * @pic_order_cnt_lsb: slice header syntax element.
> > + * @delta_pic_order_cnt_bottom: slice header syntax element.
> > + * @delta_pic_order_cnt0: slice header syntax element.
> > + * @delta_pic_order_cnt1: slice header syntax element.
> > + * @dec_ref_pic_marking_bit_size: size in bits of dec_ref_pic_marking(=
)
> > + * syntax element.
> > + * @pic_order_cnt_bit_size: size in bits of pic order count syntax.
> > + * @slice_group_change_cycle: slice header syntax element.
>=20
> @reserved and @flags are missing.
>=20
> > + */
> >  struct v4l2_ctrl_h264_decode_params {
> >  	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
> >  	__u16 nal_ref_idc;
> > @@ -218,14 +338,12 @@ struct v4l2_ctrl_h264_decode_params {
> >  	__s32 delta_pic_order_cnt_bottom;
> >  	__s32 delta_pic_order_cnt0;
> >  	__s32 delta_pic_order_cnt1;
> > -	/* Size in bits of dec_ref_pic_marking() syntax element. */
> >  	__u32 dec_ref_pic_marking_bit_size;
> > -	/* Size in bits of pic order count syntax. */
> >  	__u32 pic_order_cnt_bit_size;
> >  	__u32 slice_group_change_cycle;
> > =20
> >  	__u32 reserved;
> > -	__u32 flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
> > +	__u32 flags;
> >  };
> > =20
> >  #endif
> >=20
>=20
> Regards,
>=20
> 	Hans

--=-mdLlfN9WHnjf1emaT7Qq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCX2z/yQAKCRBxUwItrAao
HCZHAKCPSoaDnLZPHnWKgUaPjj59/ux9LQCgqn/p62KfzJMnbit+ku3jzH1Ize4=
=Uc13
-----END PGP SIGNATURE-----

--=-mdLlfN9WHnjf1emaT7Qq--

