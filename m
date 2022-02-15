Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594D14B72FA
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 17:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241572AbiBOQcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 11:32:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiBOQcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 11:32:01 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55C3887AE
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 08:31:49 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id k41so10506351wms.0
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 08:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=rUwreRqO0tVMH6VkC75xMK5CoRdxtk3pC1I5Ne6nMAs=;
        b=SB2uxaaD/2Xljqp+3gDi32W4A5JO/GB7BadlAi+eCURU+vNHBLGThFLDaVZ9RbKBTC
         mbytfucYE+/h55WNDNHtpkieseFaVsdDXyyCKHCIdwOfmD5i+OIgKkyLUR4Pp5zLygF5
         USIrvTVKHTS2ch4bjaTu9dVOvT7bIfU1ktfKD/x7axSnsRqddjk0LpdKIgQ9v0ReNRy2
         svaL1ImGdZWFc5ZpnogLxTey4RvQVobNnqSQBakY++Q5PHkozOEL+Qyf/7SUUpvU8/xY
         1BS+jY/5INTn6mNLAdMJltvIGev6YhOEqFmTzCVoybj5TrJb0mt9eEzB0/lk2YxO0ebW
         aFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=rUwreRqO0tVMH6VkC75xMK5CoRdxtk3pC1I5Ne6nMAs=;
        b=4XeP72iOZ0P11VFSnQgx8jvrvMp95j/5d9oUyq2ZMOVDcMkS4Z/lZ8oS1WvTe4k6+S
         BwUQHX/7SQThwrlMW1NVofz3nbcU5+JChthsCCP5ZZh2mIaNkRijepgvrF0pGFVDZc0N
         ohHkUeOD1ylR0tLL6p9V91S5pwlMVEpH5clUq49G34amLD2yq9Vqh5Eh3gMjYMkAKBqX
         bmoXhBK6SOObJsNk/V1O1/bu2ENCaiZ9ljyPNUQ1htCVlRA6odMdWACTmBgpyl0QVX1m
         fNlkvfRpOZEFTocgtuhqKCv+KcMgdadEqe3JgNpC3LBQOmPN+PkFIe2FzDdV4la9otGT
         8TWA==
X-Gm-Message-State: AOAM530zihAlc2ew1WP4KE7Vah0nGopuurpXQiQK3Zf1CH4INUzpNkVU
        rTSwHbLBJZK6QRvN2XGvVHj9vw==
X-Google-Smtp-Source: ABdhPJzXlo6XOtaMWMg+VOiF0gqABAVLFKG2MV/n4EzvqTnlz2Btd7i/Tuxd0fxVen9VXjSXqqzXbg==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr3889285wmi.18.1644942708273;
        Tue, 15 Feb 2022 08:31:48 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id 20sm13905027wmk.26.2022.02.15.08.31.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 15 Feb 2022 08:31:37 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        hverkuil-cisco@xs4all.nl, jonas@kwiboo.se,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com, knaerzche@gmail.com
Subject: Re: [RFC v2 6/8] media: uapi: Remove bit_size field from v4l2_ctrl_hevc_slice_params
Date:   Tue, 15 Feb 2022 16:31:28 +0000
Message-ID: <3tkn0ht1cjbpr3meuputqpuvpfcq3gkrd5@4ax.com>
References: <20220215110103.241297-1-benjamin.gaignard@collabora.com> <9a78eb88f8690d43d34d8140420dae3f5f043637.camel@ndufresne.ca> <48in0h5qq4ea87gcnmtkpsfqdk1r4tipid@4ax.com> <2071229.OBFZWjSADL@kista>
In-Reply-To: <2071229.OBFZWjSADL@kista>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 15 Feb 2022 17:11:12 +0100, you wrote:

>Dne torek, 15. februar 2022 ob 17:00:33 CET je John Cox napisal(a):
>> On Tue, 15 Feb 2022 10:28:55 -0500, you wrote:
>>=20
>> >Le mardi 15 f=C3=A9vrier 2022 =C3=A0 14:50 +0000, John Cox a =
=C3=A9crit :
>> >> On Tue, 15 Feb 2022 15:35:12 +0100, you wrote:
>> >>=20
>> >> >=20
>> >> > Le 15/02/2022 =C3=A0 15:17, John Cox a =C3=A9crit :
>> >> > > Hi
>> >> > >=20
>> >> > > > The bit size of the slice could be deduced from the buffer =
payload
>> >> > > > so remove bit_size field to avoid duplicated the information.
>> >> > > I think this is a bad idea. In the future we are (I hope) going=
 to=20
>want
>> >> > > to have an array (variable) of slice headers all referring to =
the=20
>same
>> >> > > bit buffer.  When we do that we will need this field.
>> >> >=20
>> >> > I wonder if that could be considering like another decode mode =
and so
>> >> > use an other control ?
>> >>=20
>> >> I, personally, would be in favour of making the slice header =
control a
>> >> variable array just as it is.  If userland can't cope with multiple
>> >> entries then just send them one at a time and the code looks =
exactly
>> >> like it does at the moment and if the driver can't then set max =
array
>> >> entries to 1.
>> >>=20
>> >> Having implemented this in rpi port of ffmpeg and the RPi V4L2 =
driver I
>> >> can say with experience that the code and effort overhead is very =
low.
>> >>=20
>> >> Either way having a multiple slice header control in the UAPI is
>> >> important for efficiency.
>> >
>> >Just to clarify the idea, we would have a single slice controls, =
always=20
>dynamic:
>> >
>> >1. For sliced based decoder
>> >
>> >The dynamic array slice control is implemented by the driver and its =
size=20
>must
>> >be 1.
>>=20
>> Yes
>>=20
>> >2. For frame based decoder that don't care for slices
>> >
>> >The dynamic array slice controls is not implement. Userland detects =
that at
>> >runtime, similar to the VP9 compressed headers.
>>=20
>> If the driver parses all the slice header then that seems plausible
>>=20
>> >3. For frame based decoders that needs slices (or driver that =
supports=20
>offset
>> >and can gain performance with such mode)
>> >
>> >The dynamic array slice controls is implemented, and should contain =
all the
>> >slices found in the OUTPUT buffer.
>> >
>> >So the reason for this bit_size (not sure why its bits though, =
perhaps=20
>someone
>> >can educate me ?)
>>=20
>> RPi doesn't need bits and would be happy with bytes however
>> slice_segment data isn't byte aligned at the end so its possible that
>> there might be decoders out there that want an accurate length for =
that.
>
>There are two fields, please don't mix them up:
>
>__u32	bit_size;
>__u32	data_bit_offset; (changed to data_byte_offset in this series)
>
>data_bit_offset/data_byte_offset is useful, while bit_size is IMO not. =
If you=20
>have multiple slices in array, you only need to know start of the slice =
data=20
>and that offset is always offset from start of the buffer (absolute, =
it's not=20
>relative to previous slice data).

No... or at least I think not. RPi needs the start and end of the
slice_segment_data elements of each slice. If slices are arranged in the
buffer with slice_segment_headers attached then I don't see how I get to
know that.  Also if the OUTPUT buffer is just a bit of bitstream, which
might well be very convienient for some userspace, then it is legitimate
to have SEIs between slice headers so you can't even guarantee that your
coded slice segments are contiguous.

Regards

JC

>Best regards,
>Jernej
>
>>=20
>> > Would be to let the driver offset inside the the single
>> >OUTPUT/bitstream buffer in case this is not automatically found by =
the=20
>driver
>> >(or that no start-code is needed). Is that last bit correct ? If so, =
should=20
>we
>> >change it to an offset rather then a size ? Shall we allow using =
offesets=20
>inside
>> >larger buffer (e.g. to avoid some memory copies) for the Sliced Base =
cases ?
>>=20
>> I use (in the current structure) data_bit_offset to find the start of
>> each slice's slice_segment_data within the OUTPUT buffer and bit_size =
to
>> find the end.  RPi doesn't / can't parse the slice_header and so wants
>> all of that.  Decoders that do parse the header might plausably want
>> header offsets too and it would facilitate zero copy of the bit =
buffer.
>>=20
>> =20
>> >> Regards
>> >>=20
>> >> John Cox
>> >>=20
>> >> > > > Signed-off-by: Benjamin Gaignard =
<benjamin.gaignard@collabora.com>
>> >> > > > ---
>> >> > > > .../userspace-api/media/v4l/ext-ctrls-codec.rst       |  3 =
---
>> >> > > > drivers/staging/media/sunxi/cedrus/cedrus_h265.c      | 11 =
+++
>+-------
>> >> > > > include/uapi/linux/v4l2-controls.h                    |  3 =
+--
>> >> > > > 3 files changed, 5 insertions(+), 12 deletions(-)
>> >> > > >=20
>> >> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-
>codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> >> > > > index 3296ac3b9fca..c3ae97657fa7 100644
>> >> > > > --- =
a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> >> > > > +++ =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> >> > > > @@ -2965,9 +2965,6 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field=20
>-
>> >> > > >      :stub-columns: 0
>> >> > > >      :widths:       1 1 2
>> >> > > >=20
>> >> > > > -    * - __u32
>> >> > > > -      - ``bit_size``
>> >> > > > -      - Size (in bits) of the current slice data.
>> >> > > >      * - __u32
>> >> > > >        - ``data_bit_offset``
>> >> > > >        - Offset (in bits) to the video data in the current =
slice=20
>data.
>> >> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c=
 b/
>drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>> >> > > > index 8ab2d9c6f048..db8c7475eeb8 100644
>> >> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>> >> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>> >> > > > @@ -312,8 +312,8 @@ static void cedrus_h265_setup(struct =
cedrus_ctx=20
>*ctx,
>> >> > > > 	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
>> >> > > > 	unsigned int width_in_ctb_luma, ctb_size_luma;
>> >> > > > 	unsigned int log2_max_luma_coding_block_size;
>> >> > > > +	size_t slice_bytes;
>> >> > > > 	dma_addr_t src_buf_addr;
>> >> > > > -	dma_addr_t src_buf_end_addr;
>> >> > > > 	u32 chroma_log2_weight_denom;
>> >> > > > 	u32 output_pic_list_index;
>> >> > > > 	u32 pic_order_cnt[2];
>> >> > > > @@ -370,8 +370,8 @@ static void cedrus_h265_setup(struct =
cedrus_ctx=20
>*ctx,
>> >> > > >=20
>> >> > > > 	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, 0);
>> >> > > >=20
>> >> > > > -	reg =3D slice_params->bit_size;
>> >> > > > -	cedrus_write(dev, VE_DEC_H265_BITS_LEN, reg);
>> >> > > > +	slice_bytes =3D vb2_get_plane_payload(&run->src->vb2_buf, =
0);
>> >> > > > +	cedrus_write(dev, VE_DEC_H265_BITS_LEN, slice_bytes);
>> >> > > I think one of these must be wrong. bit_size is in bits,
>> >> > > vb2_get_plane_payload is in bytes?
>> >> >=20
>> >> > You are right it should be vb2_get_plane_payload() * 8 to get the=
 size=20
>in bits.
>> >> >=20
>> >> > I will change that in v3.
>> >> >=20
>> >> > >=20
>> >> > > Regards
>> >> > >=20
>> >> > > John Cox
>> >> > >  =20
>> >> > > > 	/* Source beginning and end addresses. */
>> >> > > >=20
>> >> > > > @@ -384,10 +384,7 @@ static void cedrus_h265_setup(struct=20
>cedrus_ctx *ctx,
>> >> > > >=20
>> >> > > > 	cedrus_write(dev, VE_DEC_H265_BITS_ADDR, reg);
>> >> > > >=20
>> >> > > > -	src_buf_end_addr =3D src_buf_addr +
>> >> > > > -			   DIV_ROUND_UP(slice_params->bit_size,=20
>8);
>> >> > > > -
>> >> > > > -	reg =3D VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
>> >> > > > +	reg =3D VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_addr + =
slice_bytes);
>> >> > > > 	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
>> >> > > >=20
>> >> > > > 	/* Coding tree block address */
>> >> > > > diff --git a/include/uapi/linux/v4l2-controls.h =
b/include/uapi/
>linux/v4l2-controls.h
>> >> > > > index b1a3dc05f02f..27f5d272dc43 100644
>> >> > > > --- a/include/uapi/linux/v4l2-controls.h
>> >> > > > +++ b/include/uapi/linux/v4l2-controls.h
>> >> > > > @@ -2457,7 +2457,6 @@ struct v4l2_hevc_pred_weight_table {
>> >> > > > #define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT=09
>(1ULL << 9)
>> >> > > >=20
>> >> > > > struct v4l2_ctrl_hevc_slice_params {
>> >> > > > -	__u32	bit_size;
>> >> > > > 	__u32	data_bit_offset;
>> >> > > >=20
>> >> > > > 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
>> >> > > > @@ -2484,7 +2483,7 @@ struct v4l2_ctrl_hevc_slice_params {
>> >> > > > 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture timing SEI =
message=20
>*/
>> >> > > > 	__u8	pic_struct;
>> >> > > >=20
>> >> > > > -	__u8	reserved;
>> >> > > > +	__u8	reserved[5];
>> >> > > >=20
>> >> > > > 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment=20
>header */
>> >> > > > 	__u32	slice_segment_addr;
>>=20
>
