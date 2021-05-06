Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185BF37547A
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 15:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhEFNMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 09:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbhEFNMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 09:12:31 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3001AC061574
        for <linux-media@vger.kernel.org>; Thu,  6 May 2021 06:11:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l2so5556506wrm.9
        for <linux-media@vger.kernel.org>; Thu, 06 May 2021 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=zLVLoCTZSwdGtIWCx1oxuHJ77KyosnHNt8+6TJIcliM=;
        b=mwcIAoYD9bw60tZhtCdcXNldYBx2EearFFTehyAs9iqn222cg8NMecuNxW0fPkCh4f
         5vItp1Rr75DpnXnO7H7tZcnrnWKua0e/wjVZD17WTc37h+vKMH2rICEDZkrzH6aBdRO/
         tI6A70RsA9biUwMn5TLQNlPdPyIobZ/u5GciHqAblW9ly9CIow1Ie9sF8K2iruSkSXTX
         CYij1rlm69oVBMeTn5LB7tKJAVVhwgyffHVaG8wXPLSJCpDbX2H9QGuZEDWHzbF2BsHi
         ywcMrlGFk1CW/fMA2G1cwJYOSJ9nhtPqgn99ih8scAmYp80KM2+biCGzISJb3bEW4zyl
         aqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=zLVLoCTZSwdGtIWCx1oxuHJ77KyosnHNt8+6TJIcliM=;
        b=iqoeGa0y+BJ1nuwoMCzuUZ21ZWaxIh9B8jNZDbf3hzbRrTjxhh0OZ4e3IiOnmcYxSf
         tIav0arCuopTxbX7sTIv3gaFuIWxy4gmfrWLXP8IaCcYh1kdx7qxYLok4YuyXEvWxy31
         6YL1T6b9f2vZx2UmnF3gUYLkJnsTU4eqGm7U02L3J6GYw1rTxgbcBsYiC93WKPBmDscx
         aQWErsMQzoqSyUClGOVoSSFyxOXkqym3fUdiiA4H+H9R8qC4x0qBMifWxQ0NW9DeacJ2
         X49ew70cyNZSFAyTnZkajAJhU79/0MwZdXwPrMdbbG6CRqav41beWRy7ZMnxBa6MxPnt
         SjXg==
X-Gm-Message-State: AOAM531kd+DknxVcbq/E0RFl/h7t9ZRo2zkjNYL3t1472H1Se7J3pnAn
        rO4E80zSmzjaLo1ymtThQX/NEw==
X-Google-Smtp-Source: ABdhPJy08fvoyofymLrgTx2HJxauv5qh8y5Pod7Fm4yzLYyhRzL+8NBXfEaygWMS1PPMEEwnRLiNCA==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr5231928wrr.63.1620306689920;
        Thu, 06 May 2021 06:11:29 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id q12sm8757823wmj.7.2021.05.06.06.11.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 06 May 2021 06:11:29 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
Date:   Thu, 06 May 2021 14:11:28 +0100
Message-ID: <n7q79gl86gvdo00sgsg1r5beittohsu4ta@4ax.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com> <20210420121046.181889-7-benjamin.gaignard@collabora.com> <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl> <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com> <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
In-Reply-To: <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>On 05/05/2021 17:20, Benjamin Gaignard wrote:
>>=20
>> Le 05/05/2021 =C3=A0 16:55, Hans Verkuil a =C3=A9crit=C2=A0:
>>> On 20/04/2021 14:10, Benjamin Gaignard wrote:
>>>> The HEVC HANTRO driver needs to know the number of bits to skip at
>>>> the beginning of the slice header.
>>>> That is a hardware specific requirement so create a dedicated =
control
>>>> for this purpose.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> ---
>>>>   .../userspace-api/media/drivers/hantro.rst    | 19 =
+++++++++++++++++++
>>>>   .../userspace-api/media/drivers/index.rst     |  1 +
>>>>   include/media/hevc-ctrls.h                    | 13 +++++++++++++
>>>>   3 files changed, 33 insertions(+)
>>>>   create mode 100644 =
Documentation/userspace-api/media/drivers/hantro.rst
>>>>
>>>> diff --git a/Documentation/userspace-api/media/drivers/hantro.rst =
b/Documentation/userspace-api/media/drivers/hantro.rst
>>>> new file mode 100644
>>>> index 000000000000..cd9754b4e005
>>>> --- /dev/null
>>>> +++ b/Documentation/userspace-api/media/drivers/hantro.rst
>>>> @@ -0,0 +1,19 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +Hantro video decoder driver
>>>> =
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>>> +
>>>> +The Hantro video decoder driver implements the following =
driver-specific controls:
>>>> +
>>>> +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
>>>> +    Specifies to Hantro HEVC video decoder driver the number of =
data (in bits) to
>>>> +    skip in the slice segment header.
>>>> +    If non-IDR, the bits to be skipped go from syntax element =
"pic_output_flag"
>>>> +    to before syntax element "slice_temporal_mvp_enabled_flag".
>>>> +    If IDR, the skipped bits are just "pic_output_flag"
>>>> +    (separate_colour_plane_flag is not supported).
>>> I'm not very keen on this. Without this information the video data =
cannot be
>>> decoded, or will it just be suboptimal?
>>=20
>> Without that information the video can't be decoded.
>>=20
>>>
>>> The problem is that a generic decoder would have to know that the HW =
is a hantro,
>>> and then call this control. If they don't (and are testing on =
non-hantro HW), then
>>> it won't work, thus defeating the purpose of the HW independent =
decoder API.
>>>
>>> Since hantro is widely used, and if there is no other way to do this =
beside explitely
>>> setting this control, then perhaps this should be part of the =
standard HEVC API.
>>> Non-hantro drivers that do not need this can just skip it.
>>=20
>> Even if I put this parameter in decode_params structure that would =
means that a generic
>> userland decoder will have to know how the compute this value for =
hantro HW since it
>> isn't something that could be done on kernel side.
>
>But since hantro is very common, any userland decoder will need to =
calculate this anyway.
>So perhaps it is better to have this as part of the decode_params?
>
>I'd like to know what others think about this.

I don't know exactly what I think on this - its all a bit of a mess. I
don't think this is going to be the last HEVC decoder that needs some
non-standard setup that can't be trivially extracted from a standard
slice header parse. So if future decoders are going to have to generate
custom attributes to cope with their quirks then Hantro probably should
too. And if Hantro is common then the userspace progs will at least have
a framework for dealing with this sort of thing so when the next oddity
comes along.

Regards

John Cox

>Regards,
>
>	Hans
>
>>=20
>>=20
>> Regards,
>> Benjamin
>>=20
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> +
>>>> +.. note::
>>>> +
>>>> +        This control is not yet part of the public kernel API and
>>>> +        it is expected to change.
>>>> diff --git a/Documentation/userspace-api/media/drivers/index.rst =
b/Documentation/userspace-api/media/drivers/index.rst
>>>> index 1a9038f5f9fa..12e3c512d718 100644
>>>> --- a/Documentation/userspace-api/media/drivers/index.rst
>>>> +++ b/Documentation/userspace-api/media/drivers/index.rst
>>>> @@ -33,6 +33,7 @@ For more details see the file COPYING in the =
source distribution of Linux.
>>>>  =20
>>>>   	ccs
>>>>   	cx2341x-uapi
>>>> +        hantro
>>>>   	imx-uapi
>>>>   	max2175
>>>>   	meye-uapi
>>>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>>>> index 8e0109eea454..b713eeed1915 100644
>>>> --- a/include/media/hevc-ctrls.h
>>>> +++ b/include/media/hevc-ctrls.h
>>>> @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
>>>>   	__u64	flags;
>>>>   };
>>>>  =20
>>>> +/*  MPEG-class control IDs specific to the Hantro driver as defined=
 by V4L2 */
>>>> +#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | =
0x1200)
>>>> +/*
>>>> + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
>>>> + * the number of data (in bits) to skip in the
>>>> + * slice segment header.
>>>> + * If non-IDR, the bits to be skipped go from syntax element =
"pic_output_flag"
>>>> + * to before syntax element "slice_temporal_mvp_enabled_flag".
>>>> + * If IDR, the skipped bits are just "pic_output_flag"
>>>> + * (separate_colour_plane_flag is not supported).
>>>> + */
>>>> +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	=
(V4L2_CID_CODEC_HANTRO_BASE + 0)
>>>> +
>>>>   #endif
>>>>
>>>
