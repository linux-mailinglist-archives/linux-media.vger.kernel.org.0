Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95348325495
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 18:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhBYRgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 12:36:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45436 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBYRgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 12:36:02 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4512B1F4633D
Message-ID: <a227da5c0a7cda42aedf470fff34ae0e4227b626.camel@collabora.com>
Subject: Re: Re: [PATCH v3 1/9] media: hevc: Modify structures to follow
 H265 ITU spec
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        peng.fan@nxp.com, hverkuil-cisco@xs4all.nl,
        dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Thu, 25 Feb 2021 14:34:48 -0300
In-Reply-To: <233731323.ucs1DXFtIZ@kista>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
         <20210222122406.41782-2-benjamin.gaignard@collabora.com>
         <2109948614dc0e3f253d69ca92a4b63fe8828bfb.camel@collabora.com>
         <233731323.ucs1DXFtIZ@kista>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jernej,

On Thu, 2021-02-25 at 18:01 +0100, Jernej Škrabec wrote:
> Hi Ezequiel,
> 
> Dne četrtek, 25. februar 2021 ob 14:09:52 CET je Ezequiel Garcia napisal(a):
> > Hi Benjamin,
> > 
> > Thanks for the good work.
> > 
> > On Mon, 2021-02-22 at 13:23 +0100, Benjamin Gaignard wrote:
> > > The H.265 ITU specification (section 7.4) define the general
> > > slice segment header semantics.
> > > Modified/added fields are:
> > > - video_parameter_set_id: (7.4.3.1) identifies the VPS for
> > > reference by other syntax elements.
> > > - seq_parameter_set_id: (7.4.3.2.1) specifies the value of
> > > the vps_video_parameter_set_id of the active VPS.
> > > - chroma_format_idc: (7.4.3.2.1) specifies the chroma sampling
> > >  relative to the luma sampling
> > > - pic_parameter_set_id: (7.4.3.3.1) identifies the PPS for
> > > reference by other syntax elements
> > > - num_ref_idx_l0_default_active_minus1: (7.4.3.3.1) specifies
> > > the inferred value of num_ref_idx_l0_active_minus1
> > > - num_ref_idx_l1_default_active_minus1: (7.4.3.3.1) specifies
> > > the inferred value of num_ref_idx_l1_active_minus1
> > > - slice_segment_addr: (7.4.7.1) specifies the address of
> > > the first coding tree block in the slice segment
> > > - num_entry_point_offsets: (7.4.7.1) specifies the number of
> > > entry_point_offset_minus1[ i ] syntax elements in the slice header
> > > 
> > > Add HEVC decode params contains the information used in section
> > > "8.3 Slice decoding process" of the specification to let the hardware
> > > perform decoding of a slices.
> > > 
> > > Adapt Cedrus driver according to these changes.
> > > 
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > version 3:
> > > - Add documentation about the new structuers and fields.
> > > 
> > > version 2:
> > > - remove all change related to scaling
> > > - squash commits to a coherent split
> > > - be more verbose about the added fields
> > > 
> > >  .../media/v4l/ext-ctrls-codec.rst             | 126 +++++++++++++++---
> > >  .../media/v4l/vidioc-queryctrl.rst            |   6 +
> > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  26 +++-
> > >  drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
> > >  drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
> > >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
> > >  .../staging/media/sunxi/cedrus/cedrus_h265.c  |   6 +-
> > >  include/media/hevc-ctrls.h                    |  45 +++++--
> > >  8 files changed, 186 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/
> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > index 00944e97d638..5e6d77e858c0 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > @@ -3109,6 +3109,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      :stub-columns: 0
> > >      :widths:       1 1 2
> > >  
> > > +    * - __u8
> > > +      - ``video_parameter_set_id``
> > > +      - Identifies the VPS for reference by other syntax elements
> > > +    * - __u8
> > > +      - ``seq_parameter_set_id̀``
> > > +      - Specifies the value of the vps_video_parameter_set_id of the 
> active VPS
> > > +    * - __u8
> > > +      - ``chroma_format_idc``
> > > +      - Specifies the chroma sampling relative to the luma sampling
> > 
> > None of these fields seem needed for the Hantro G2 driver,
> > so I suggest you drop them for now.
> > 
> > >      * - __u16
> > >        - ``pic_width_in_luma_samples``
> > >        -
> > > @@ -3172,6 +3181,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      * - __u8
> > >        - ``chroma_format_idc``
> > >        -
> > > +    * - __u8
> > > +      - ``num_slices``
> > > +
> > 
> > Not used, but also doesn't seem part of the SPS syntax. If we have to
> > pass the number of slices, we'll need another mechanism.
> > 
> > >       -
> > >      * - __u64
> > >        - ``flags``
> > >        - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
> > > @@ -3231,9 +3243,18 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      :stub-columns: 0
> > >      :widths:       1 1 2
> > >  
> > > +    * - __u8
> > > +      - ``pic_parameter_set_id``
> > > +      - Identifies the PPS for reference by other syntax elements
> > 
> > Not used.
> > 
> > >      * - __u8
> > >        - ``num_extra_slice_header_bits``
> > >        -
> > > +    * - __u8
> > > +      - ``num_ref_idx_l0_default_active_minus1``
> > > +      - Specifies the inferred value of num_ref_idx_l0_active_minus1
> > > +    * - __u8
> > > +      - ``num_ref_idx_l1_default_active_minus1``
> > > +      - Specifies the inferred value of num_ref_idx_l1_active_minus1
> > >      * - __s8
> > >        - ``init_qp_minus26``
> > >        -
> > > @@ -3342,6 +3363,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      * - ``V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT``
> > >        - 0x00040000
> > >        -
> > > +    * - ``V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
> > > +      - 0x00080000
> > > +      -
> > > +    * - ``V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING``
> > > +      - 0x00100000
> > > +      -
> > >  
> > 
> > I suggest to do all the PPS control changes in a separate patch,
> > feels easier to review and cleaner as you can explain the
> > changes with more detail in the commit description.
> > 
> > Looking at the PPS syntax for tiles, I'm wondering if these
> > deserve their own control, which would be used if tiles are enabled,
> > i.e. V4L2_HEVC_PPS_FLAG_TILES_ENABLED is set.
> > 
> >         __u8    num_tile_columns_minus1;                                         
> >         __u8    num_tile_rows_minus1;                                            
> >         __u8    column_width_minus1[20];                                         
> >         __u8    row_height_minus1[22];    
> > 
> > Not something we necessarily have to tackle now.
> > 
> > >  ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
> > >      Specifies various slice-specific parameters, especially from the NAL 
> unit
> > > @@ -3366,6 +3393,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      * - __u32
> > >        - ``data_bit_offset``
> > >        - Offset (in bits) to the video data in the current slice data.
> > > +    * - __u32
> > > +      - ``slice_segment_addr``
> > > +      - Specifies the address of the first coding tree block in the slice 
> segment
> > 
> > Not used.
> > 
> > > +    * - __u32
> > > +      - ``num_entry_point_offsets``
> > > +      - Specifies the number of entry_point_offset_minus1[ i ] syntax 
> elements in the slice header
> > 
> > Not used.
> 
> While above two fields may not be used in Hantro, they are for sure useful for 
> Cedrus and RPi4. I would like to keep them, otherwise with such approach HEVC 
> will stay in staging for a long time. I'm still baffled why scaling matrix 
> control was dropped. It would fit well in Cedrus and RPi4 driver and after a 
> quick look, it seems that it was used in driver in later patch.
> 

I'd like to make sure each modification we are making to the uAPI
goes in the right direction, that is in the direction of moving
the API out of staging.

Since reviewing each field is quite hard, and opens some discussions,
I wanted to keep this patchset specific to what's needed for Hantro G2.

The Scaling matrix control is certainly a good one, as well as the ones
needed for Cedrus and RPi4. However, I feel it's better to discuss
them in their own "uAPI review" series so we can review all the changes
with an API hat.

This way we decouple the Hantro G2 discussion and work from the API work.

Also please feel free to submit RFC patches fo Cedrus and RPi4
(API and driver changes). We can certainly start the discussion around that,
with driver changes in context.

Hope I'm making sense here :)

Thanks,
Ezequiel

> Best regards,
> Jernej
> 
> > 
> > >      * - __u8
> > >        - ``nal_unit_type``
> > >        -
> > > @@ -3422,28 +3455,20 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      * - __u8
> > >        - ``pic_struct``
> > >        -
> > > -    * - __u8
> > > -      - ``num_active_dpb_entries``
> > > -      - The number of entries in ``dpb``.
> > 
> > Need to explain in the commit description why this field is moved.
> > 
> > >      * - __u8
> > >        - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > >        - The list of L0 reference elements as indices in the DPB.
> > >      * - __u8
> > >        - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > >        - The list of L1 reference elements as indices in the DPB.
> > > +    * - __u16
> > > +      - ``short_term_ref_pic_set_size``
> > > +
> > 
> > Not used.
> > 
> > >       -
> > > +    * - __u16
> > > +      - ``long_term_ref_pic_set_size``
> > > +      -
> > 
> > Not used.
> > 
> > >      * - __u8
> > > -      - ``num_rps_poc_st_curr_before``
> > > -      - The number of reference pictures in the short-term set that come 
> before
> > > -        the current frame.
> > 
> > If this matches NumPocStCurrBefore from section 8.3.2 "Decoding process for 
> reference picture set"
> > then I would document that. And perhaps rename it to num_poc_st_curr_before.
> > 
> > > -    * - __u8
> > > -      - ``num_rps_poc_st_curr_after``
> > > -      - The number of reference pictures in the short-term set that come 
> after
> > > -        the current frame.
> > 
> > Ditto.
> > 
> > > -    * - __u8
> > > -      - ``num_rps_poc_lt_curr``
> > > -      - The number of reference pictures in the long-term set.
> > 
> > Ditto.
> > 
> > Also, I'd like the changes that move fields from 
> V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS
> > to the new V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS control, to be in their
> > patch.
> > 
> > That will allow us to put in the commit description a proper
> > explanation of why are fields being moved. Nothing fancy, simply
> > explaining that these variables come from section 8.3.2
> > "Decoding process for reference picture set", which describes
> > a process invoked once per picture, so they are not per-slice.
> > 
> > > -    * - __u8
> > > -      - ``padding[7]``
> > > +      - ``padding``
> > >        - Applications and drivers must set this to zero.
> > >      * - struct :c:type:`v4l2_hevc_dpb_entry`
> > >        - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > @@ -3646,3 +3671,74 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> > >      so this has to come from client.
> > >      This is applicable to H264 and valid Range is from 0 to 63.
> > >      Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1.
> > > +
> > > +``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS (struct)``
> > > +    Specifies various decode parameters, especially the references picture 
> order
> > > +    count (POC) for all the lists (short, long, before, current, after) 
> and the
> > > +    number of entries for each of them.
> > > +    These parameters are defined according to :ref:`hevc`.
> > > +    They are described in section 8.3 "Slice decoding process" of the
> > > +    specification.
> > > +
> > > +.. c:type:: v4l2_ctrl_hevc_decode_params
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table:: struct v4l2_ctrl_hevc_decode_params
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - __s32
> > > +      - ``pic_order_cnt_val``
> > > +      -
> > 
> > Can be documented as:
> > 
> > """
> > PicOrderCntVal as described in section 8.3.1 "Decoding process
> > for picture order count" of the specification.
> > """
> > 
> > Note that snake case is used to match the kernel style,
> > but other than that we try to keep the HEVC spec variable
> > names.
> > 
> > > +    * - __u8
> > > +      - ``num_active_dpb_entries``
> > > +      - The number of entries in ``dpb``.
> > > +    * - struct :c:type:`v4l2_hevc_dpb_entry`
> > > +      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > +      - The decoded picture buffer, for meta-data about reference frames.
> > 
> > The DPB is here, but it seems it's also in the slice control?
> > 
> > > +    * - __u8
> > > +      - ``num_rps_poc_st_curr_before``
> > > +      - The number of reference pictures in the short-term set that come 
> before
> > > +        the current frame.
> > > +    * - __u8
> > > +      - ``num_rps_poc_st_curr_after``
> > > +      - The number of reference pictures in the short-term set that come 
> after
> > > +        the current frame.
> > > +    * - __u8
> > > +      - ``num_rps_poc_lt_curr``
> > > +      - The number of reference pictures in the long-term set.
> > > +    * - __u8
> > > +      - ``rps_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > +      -
> > > +    * - __u8
> > > +      - ``rps_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > +      -
> > > +    * - __u8
> > > +      - ``rps_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> > > +      -
> > 
> > Could you document these as well?
> > 
> > Thanks a lot,
> > Ezequiel
> > 
> > 
> 
> 


