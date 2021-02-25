Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADBC3255A1
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 19:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhBYSgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 13:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbhBYSfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 13:35:21 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558D0C06121D
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 10:34:50 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id f12so2438447wrx.8
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 10:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=XqEmaiF4fdloBE0PtgqJZA08jNunGa6dywJvJa69qxU=;
        b=dUvmO0E/gAW5FystOLPbklpzFKWNZRVkH/JO2kktkKrkhSSOLBikaLHrsKLBakexex
         EjDXIs/nLL4/qnq/nz39tomfzwGKFv/FoBhmOeCeu7DQ7/hPNABIPoEa6ruXAhhfox3o
         +YYatKutn7qAotHwSNkW9be9DWYcpfTqZRPRZG8aaE3b01E/80xITQjgiDFoMm3nxEnx
         vHqyj7X849IxKvI2QzMMfev+hZJzebJDZCq+ESLGJhGYMS8vOMhQhU5ovPNxrDKFC+xc
         TTHB74x2jrnoqFqpch8TvqV69SanweP42MtT/zbFFOpi+A5ycfTams20JpPpgOCgOnco
         Cmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=XqEmaiF4fdloBE0PtgqJZA08jNunGa6dywJvJa69qxU=;
        b=t7KCBe6n74kCfL2QRe8zWeeMsC3SohrInYlO6Agg/om9CcyADUmQFE95p/yfNXYruc
         ATYrq1wMFIJ9LNl1YBKIil/Leu792ui3wzKzTIUZqW5OQyOW+bkjywsPGyyo2a69qRlt
         o3mC0jzfxzmEQqyCszziEhnhQ319YqZcnLX1bIBfCixYx29FfMvO2RxlrkXkJiDLFOg/
         xKCxp/eF0kGebQjzyzXvNTOV7X3ZVYT1cInvEqzLhOYwupHhx3mSq20bGY1u0Q8+LH53
         uQJ4qAU3fj+5aOkR2VJgBMNYm+o/WOTnOKm/rb6b3/9vtGGaY0t5BeR0Cn/miF2dJEDk
         4W3g==
X-Gm-Message-State: AOAM533Hi2nVTgtWR0isu39ytLB/h+6pOQv320biQnVt/Ege9FhnpvMq
        plkJl3vG5v9lmE3pnYsfZ5dBwQ==
X-Google-Smtp-Source: ABdhPJx1KahEMKzMa9zqPQsN3E5Js3QiIJ3akKTpS6WUvuyk/EluvkrvxEEs8OrwiCGzk+b+leugiQ==
X-Received: by 2002:adf:fe0d:: with SMTP id n13mr4831508wrr.224.1614278088979;
        Thu, 25 Feb 2021 10:34:48 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id h10sm7076268wrp.22.2021.02.25.10.34.47
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 25 Feb 2021 10:34:48 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        peng.fan@nxp.com, hverkuil-cisco@xs4all.nl,
        dan.carpenter@oracle.com, Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/9] media: hevc: Modify structures to follow H265 ITU spec
Date:   Thu, 25 Feb 2021 18:34:47 +0000
Message-ID: <bnqf3ghrqnrh02e1hr1q42ilsb84guag5p@4ax.com>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com> <233731323.ucs1DXFtIZ@kista> <a227da5c0a7cda42aedf470fff34ae0e4227b626.camel@collabora.com> <5861676.snnbt3pK2g@kista>
In-Reply-To: <5861676.snnbt3pK2g@kista>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 25 Feb 2021 19:05:55 +0100, you wrote:

>Dne ?etrtek, 25. februar 2021 ob 18:34:48 CET je Ezequiel Garcia =
napisal(a):
>> Hey Jernej,
>>=20
>> On Thu, 2021-02-25 at 18:01 +0100, Jernej =C5=A0krabec wrote:
>> > Hi Ezequiel,
>> >=20
>> > Dne ?etrtek, 25. februar 2021 ob 14:09:52 CET je Ezequiel Garcia=20
>napisal(a):
>> > > Hi Benjamin,
>> > >=20
>> > > Thanks for the good work.
>> > >=20
>> > > On Mon, 2021-02-22 at 13:23 +0100, Benjamin Gaignard wrote:
>> > > > The H.265 ITU specification (section 7.4) define the general
>> > > > slice segment header semantics.
>> > > > Modified/added fields are:
>> > > > - video_parameter_set_id: (7.4.3.1) identifies the VPS for
>> > > > reference by other syntax elements.
>> > > > - seq_parameter_set_id: (7.4.3.2.1) specifies the value of
>> > > > the vps_video_parameter_set_id of the active VPS.
>> > > > - chroma_format_idc: (7.4.3.2.1) specifies the chroma sampling
>> > > >  relative to the luma sampling
>> > > > - pic_parameter_set_id: (7.4.3.3.1) identifies the PPS for
>> > > > reference by other syntax elements
>> > > > - num_ref_idx_l0_default_active_minus1: (7.4.3.3.1) specifies
>> > > > the inferred value of num_ref_idx_l0_active_minus1
>> > > > - num_ref_idx_l1_default_active_minus1: (7.4.3.3.1) specifies
>> > > > the inferred value of num_ref_idx_l1_active_minus1
>> > > > - slice_segment_addr: (7.4.7.1) specifies the address of
>> > > > the first coding tree block in the slice segment
>> > > > - num_entry_point_offsets: (7.4.7.1) specifies the number of
>> > > > entry_point_offset_minus1[ i ] syntax elements in the slice =
header
>> > > >=20
>> > > > Add HEVC decode params contains the information used in section
>> > > > "8.3 Slice decoding process" of the specification to let the =
hardware
>> > > > perform decoding of a slices.
>> > > >=20
>> > > > Adapt Cedrus driver according to these changes.
>> > > >=20
>> > > > Signed-off-by: Benjamin Gaignard =
<benjamin.gaignard@collabora.com>
>> > > > ---
>> > > > version 3:
>> > > > - Add documentation about the new structuers and fields.
>> > > >=20
>> > > > version 2:
>> > > > - remove all change related to scaling
>> > > > - squash commits to a coherent split
>> > > > - be more verbose about the added fields
>> > > >=20
>> > > >  .../media/v4l/ext-ctrls-codec.rst             | 126 =
++++++++++++++
>+---
>> > > >  .../media/v4l/vidioc-queryctrl.rst            |   6 +
>> > > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  26 +++-
>> > > >  drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
>> > > >  drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
>> > > >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
>> > > >  .../staging/media/sunxi/cedrus/cedrus_h265.c  |   6 +-
>> > > >  include/media/hevc-ctrls.h                    |  45 +++++--
>> > > >  8 files changed, 186 insertions(+), 32 deletions(-)
>> > > >=20
>> > > > diff --git =
a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst=20
>b/
>> > Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > index 00944e97d638..5e6d77e858c0 100644
>> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > @@ -3109,6 +3109,15 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>> > > >      :stub-columns: 0
>> > > >      :widths:       1 1 2
>> > > > =20
>> > > > +    * - __u8
>> > > > +      - ``video_parameter_set_id``
>> > > > +      - Identifies the VPS for reference by other syntax =
elements
>> > > > +    * - __u8
>> > > > +      - ``seq_parameter_set_id?``
>> > > > +      - Specifies the value of the vps_video_parameter_set_id =
of the=20
>> > active VPS
>> > > > +    * - __u8
>> > > > +      - ``chroma_format_idc``
>> > > > +      - Specifies the chroma sampling relative to the luma =
sampling
>> > >=20
>> > > None of these fields seem needed for the Hantro G2 driver,
>> > > so I suggest you drop them for now.
>> > >=20
>> > > >      * - __u16
>> > > >        - ``pic_width_in_luma_samples``
>> > > >        -
>> > > > @@ -3172,6 +3181,9 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>> > > >      * - __u8
>> > > >        - ``chroma_format_idc``
>> > > >        -
>> > > > +    * - __u8
>> > > > +      - ``num_slices``
>> > > > +
>> > >=20
>> > > Not used, but also doesn't seem part of the SPS syntax. If we have=
 to
>> > > pass the number of slices, we'll need another mechanism.
>> > >=20
>> > > >       -
>> > > >      * - __u64
>> > > >        - ``flags``
>> > > >        - See :ref:`Sequence Parameter Set Flags =
<hevc_sps_flags>`
>> > > > @@ -3231,9 +3243,18 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>> > > >      :stub-columns: 0
>> > > >      :widths:       1 1 2
>> > > > =20
>> > > > +    * - __u8
>> > > > +      - ``pic_parameter_set_id``
>> > > > +      - Identifies the PPS for reference by other syntax =
elements
>> > >=20
>> > > Not used.
>> > >=20
>> > > >      * - __u8
>> > > >        - ``num_extra_slice_header_bits``
>> > > >        -
>> > > > +    * - __u8
>> > > > +      - ``num_ref_idx_l0_default_active_minus1``
>> > > > +      - Specifies the inferred value of =
num_ref_idx_l0_active_minus1
>> > > > +    * - __u8
>> > > > +      - ``num_ref_idx_l1_default_active_minus1``
>> > > > +      - Specifies the inferred value of =
num_ref_idx_l1_active_minus1
>> > > >      * - __s8
>> > > >        - ``init_qp_minus26``
>> > > >        -
>> > > > @@ -3342,6 +3363,12 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>> > > >      * - =
``V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT``
>> > > >        - 0x00040000
>> > > >        -
>> > > > +    * - =
``V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
>> > > > +      - 0x00080000
>> > > > +      -
>> > > > +    * - ``V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING``
>> > > > +      - 0x00100000
>> > > > +      -
>> > > > =20
>> > >=20
>> > > I suggest to do all the PPS control changes in a separate patch,
>> > > feels easier to review and cleaner as you can explain the
>> > > changes with more detail in the commit description.
>> > >=20
>> > > Looking at the PPS syntax for tiles, I'm wondering if these
>> > > deserve their own control, which would be used if tiles are =
enabled,
>> > > i.e. V4L2_HEVC_PPS_FLAG_TILES_ENABLED is set.
>> > >=20
>> > >         __u8   =20
>num_tile_columns_minus1;                                        =20
>> > >         __u8   =20
>num_tile_rows_minus1;                                           =20
>> > >         __u8   =20
>column_width_minus1[20];                                        =20
>> > >         __u8    row_height_minus1[22];   =20
>> > >=20
>> > > Not something we necessarily have to tackle now.
>> > >=20
>> > > >  ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
>> > > >      Specifies various slice-specific parameters, especially =
from the=20
>NAL=20
>> > unit
>> > > > @@ -3366,6 +3393,12 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>> > > >      * - __u32
>> > > >        - ``data_bit_offset``
>> > > >        - Offset (in bits) to the video data in the current slice=
 data.
>> > > > +    * - __u32
>> > > > +      - ``slice_segment_addr``
>> > > > +      - Specifies the address of the first coding tree block in=
 the=20
>slice=20
>> > segment
>> > >=20
>> > > Not used.
>> > >=20
>> > > > +    * - __u32
>> > > > +      - ``num_entry_point_offsets``
>> > > > +      - Specifies the number of entry_point_offset_minus1[ i ] =
syntax=20
>> > elements in the slice header
>> > >=20
>> > > Not used.
>> >=20
>> > While above two fields may not be used in Hantro, they are for sure =
useful=20
>for=20
>> > Cedrus and RPi4. I would like to keep them, otherwise with such =
approach=20
>HEVC=20
>> > will stay in staging for a long time. I'm still baffled why scaling =
matrix=20
>> > control was dropped. It would fit well in Cedrus and RPi4 driver and=
 after=20
>a=20
>> > quick look, it seems that it was used in driver in later patch.
>> >=20
>>=20
>> I'd like to make sure each modification we are making to the uAPI
>> goes in the right direction, that is in the direction of moving
>> the API out of staging.
>>=20
>> Since reviewing each field is quite hard, and opens some discussions,
>> I wanted to keep this patchset specific to what's needed for Hantro =
G2.
>>=20
>> The Scaling matrix control is certainly a good one, as well as the =
ones
>> needed for Cedrus and RPi4. However, I feel it's better to discuss
>> them in their own "uAPI review" series so we can review all the =
changes
>> with an API hat.
>>=20
>> This way we decouple the Hantro G2 discussion and work from the API =
work.
>>=20
>> Also please feel free to submit RFC patches fo Cedrus and RPi4
>> (API and driver changes). We can certainly start the discussion around=
 that,
>> with driver changes in context.
>
>I don't know much about RPi4 driver, only few implementation details, so=
=20
>you'll have to ping developer who wrote it. Regarding HEVC on Cedrus - =
it has=20
>one pain point - it needs entry point table which in turn needs support =
for=20
>variable arrays in order to be feasable AFAIK. I don't plan to develop =
that.=20
>Patches for scaling matrix and segment address were sent a bit more than=
 a=20
>year ago but were turned down because they change control structures =
(among=20
>other things). Sorry to say, but I work on other things now, so Cedrus =
will=20
>have to wait. Alternatively, someone can take my patches from LibreELEC,=
=20
>update and submit them. They are in use for a long time.

It seems to me that H.265 should be the source for what fields are
needed in the uapi - not whatever happens to be supported by current
h/w. The standard defines the list of fields that can occur in the
parameter sets and headers, and everything that is needed to decode=20
any slice_seqgment_data should be in the upai.  Eventually all those
fields are going to be needed (they aren't in the standard just to look
pretty) and given the reluctance I've observed to change the uapi once
released they should be there from the start.

Now some hardware requires more fields that aren't in the standard -
those can (and should) be added in h/w specific extensions.

Regards

JC

>Best regards,
>Jernej
>
>>=20
>> Hope I'm making sense here :)
>>=20
>> Thanks,
>> Ezequiel
>>=20
>> > Best regards,
>> > Jernej
>> >=20
>> > >=20
>> > > >      * - __u8
>> > > >        - ``nal_unit_type``
>> > > >        -
>> > > > @@ -3422,28 +3455,20 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field=20
>-
>> > > >      * - __u8
>> > > >        - ``pic_struct``
>> > > >        -
>> > > > -    * - __u8
>> > > > -      - ``num_active_dpb_entries``
>> > > > -      - The number of entries in ``dpb``.
>> > >=20
>> > > Need to explain in the commit description why this field is moved.
>> > >=20
>> > > >      * - __u8
>> > > >        - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > >        - The list of L0 reference elements as indices in the =
DPB.
>> > > >      * - __u8
>> > > >        - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > >        - The list of L1 reference elements as indices in the =
DPB.
>> > > > +    * - __u16
>> > > > +      - ``short_term_ref_pic_set_size``
>> > > > +
>> > >=20
>> > > Not used.
>> > >=20
>> > > >       -
>> > > > +    * - __u16
>> > > > +      - ``long_term_ref_pic_set_size``
>> > > > +      -
>> > >=20
>> > > Not used.
>> > >=20
>> > > >      * - __u8
>> > > > -      - ``num_rps_poc_st_curr_before``
>> > > > -      - The number of reference pictures in the short-term set =
that=20
>come=20
>> > before
>> > > > -        the current frame.
>> > >=20
>> > > If this matches NumPocStCurrBefore from section 8.3.2 "Decoding =
process=20
>for=20
>> > reference picture set"
>> > > then I would document that. And perhaps rename it to=20
>num_poc_st_curr_before.
>> > >=20
>> > > > -    * - __u8
>> > > > -      - ``num_rps_poc_st_curr_after``
>> > > > -      - The number of reference pictures in the short-term set =
that=20
>come=20
>> > after
>> > > > -        the current frame.
>> > >=20
>> > > Ditto.
>> > >=20
>> > > > -    * - __u8
>> > > > -      - ``num_rps_poc_lt_curr``
>> > > > -      - The number of reference pictures in the long-term set.
>> > >=20
>> > > Ditto.
>> > >=20
>> > > Also, I'd like the changes that move fields from=20
>> > V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS
>> > > to the new V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS control, to be =
in=20
>their
>> > > patch.
>> > >=20
>> > > That will allow us to put in the commit description a proper
>> > > explanation of why are fields being moved. Nothing fancy, simply
>> > > explaining that these variables come from section 8.3.2
>> > > "Decoding process for reference picture set", which describes
>> > > a process invoked once per picture, so they are not per-slice.
>> > >=20
>> > > > -    * - __u8
>> > > > -      - ``padding[7]``
>> > > > +      - ``padding``
>> > > >        - Applications and drivers must set this to zero.
>> > > >      * - struct :c:type:`v4l2_hevc_dpb_entry`
>> > > >        - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > > @@ -3646,3 +3671,74 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>> > > >      so this has to come from client.
>> > > >      This is applicable to H264 and valid Range is from 0 to 63.
>> > > >      Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1.
>> > > > +
>> > > > +``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS (struct)``
>> > > > +    Specifies various decode parameters, especially the =
references=20
>picture=20
>> > order
>> > > > +    count (POC) for all the lists (short, long, before, =
current,=20
>after)=20
>> > and the
>> > > > +    number of entries for each of them.
>> > > > +    These parameters are defined according to :ref:`hevc`.
>> > > > +    They are described in section 8.3 "Slice decoding process" =
of the
>> > > > +    specification.
>> > > > +
>> > > > +.. c:type:: v4l2_ctrl_hevc_decode_params
>> > > > +
>> > > > +.. cssclass:: longtable
>> > > > +
>> > > > +.. flat-table:: struct v4l2_ctrl_hevc_decode_params
>> > > > +    :header-rows:  0
>> > > > +    :stub-columns: 0
>> > > > +    :widths:       1 1 2
>> > > > +
>> > > > +    * - __s32
>> > > > +      - ``pic_order_cnt_val``
>> > > > +      -
>> > >=20
>> > > Can be documented as:
>> > >=20
>> > > """
>> > > PicOrderCntVal as described in section 8.3.1 "Decoding process
>> > > for picture order count" of the specification.
>> > > """
>> > >=20
>> > > Note that snake case is used to match the kernel style,
>> > > but other than that we try to keep the HEVC spec variable
>> > > names.
>> > >=20
>> > > > +    * - __u8
>> > > > +      - ``num_active_dpb_entries``
>> > > > +      - The number of entries in ``dpb``.
>> > > > +    * - struct :c:type:`v4l2_hevc_dpb_entry`
>> > > > +      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > > +      - The decoded picture buffer, for meta-data about =
reference=20
>frames.
>> > >=20
>> > > The DPB is here, but it seems it's also in the slice control?
>> > >=20
>> > > > +    * - __u8
>> > > > +      - ``num_rps_poc_st_curr_before``
>> > > > +      - The number of reference pictures in the short-term set =
that=20
>come=20
>> > before
>> > > > +        the current frame.
>> > > > +    * - __u8
>> > > > +      - ``num_rps_poc_st_curr_after``
>> > > > +      - The number of reference pictures in the short-term set =
that=20
>come=20
>> > after
>> > > > +        the current frame.
>> > > > +    * - __u8
>> > > > +      - ``num_rps_poc_lt_curr``
>> > > > +      - The number of reference pictures in the long-term set.
>> > > > +    * - __u8
>> > > > +      - ``rps_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > > +      -
>> > > > +    * - __u8
>> > > > +      - ``rps_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > > +      -
>> > > > +    * - __u8
>> > > > +      - ``rps_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> > > > +      -
>> > >=20
>> > > Could you document these as well?
>> > >=20
>> > > Thanks a lot,
>> > > Ezequiel
>> > >=20
>> > >=20
>> >=20
>> >=20
>>=20
>>=20
>>=20
>
