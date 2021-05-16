Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156713821D9
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 01:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhEPXFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 19:05:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45132 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhEPXFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 19:05:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D03971F40F2E
Message-ID: <f46b9c889914360348f218b45f10a06bd1bd8595.camel@collabora.com>
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
Date:   Sun, 16 May 2021 20:04:05 -0300
In-Reply-To: <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
         <20210420121046.181889-7-benjamin.gaignard@collabora.com>
         <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
         <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com>
         <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, 2021-05-06 at 14:50 +0200, Hans Verkuil wrote:
> On 05/05/2021 17:20, Benjamin Gaignard wrote:
> > 
> > Le 05/05/2021 à 16:55, Hans Verkuil a écrit :
> > > On 20/04/2021 14:10, Benjamin Gaignard wrote:
> > > > The HEVC HANTRO driver needs to know the number of bits to skip at
> > > > the beginning of the slice header.
> > > > That is a hardware specific requirement so create a dedicated control
> > > > for this purpose.
> > > > 
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > ---
> > > >   .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
> > > >   .../userspace-api/media/drivers/index.rst     |  1 +
> > > >   include/media/hevc-ctrls.h                    | 13 +++++++++++++
> > > >   3 files changed, 33 insertions(+)
> > > >   create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
> > > > new file mode 100644
> > > > index 000000000000..cd9754b4e005
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> > > > @@ -0,0 +1,19 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +Hantro video decoder driver
> > > > +===========================
> > > > +
> > > > +The Hantro video decoder driver implements the following driver-specific controls:
> > > > +
> > > > +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
> > > > +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
> > > > +    skip in the slice segment header.
> > > > +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> > > > +    to before syntax element "slice_temporal_mvp_enabled_flag".
> > > > +    If IDR, the skipped bits are just "pic_output_flag"
> > > > +    (separate_colour_plane_flag is not supported).
> > > I'm not very keen on this. Without this information the video data cannot be
> > > decoded, or will it just be suboptimal?
> > 
> > Without that information the video can't be decoded.
> > 
> > > 
> > > The problem is that a generic decoder would have to know that the HW is a hantro,
> > > and then call this control. If they don't (and are testing on non-hantro HW), then
> > > it won't work, thus defeating the purpose of the HW independent decoder API.
> > > 
> > > Since hantro is widely used, and if there is no other way to do this beside explitely
> > > setting this control, then perhaps this should be part of the standard HEVC API.
> > > Non-hantro drivers that do not need this can just skip it.
> > 
> > Even if I put this parameter in decode_params structure that would means that a generic
> > userland decoder will have to know how the compute this value for hantro HW since it
> > isn't something that could be done on kernel side.
> 
> But since hantro is very common, any userland decoder will need to calculate this anyway.
> So perhaps it is better to have this as part of the decode_params?
> 
> I'd like to know what others think about this.
> 

As you know, I'm not a fan of carrying these "unstable" APIs around.
I know it's better than nothing, but I feel they create the illusion
of the interface being supported in mainline. Since it's unstable,
it's difficult for applications to adopt them.

As Nicolas mentioned, this means neither FFmpeg nor GStreamer will adopt
these APIs, which worries me, as that means we lose two major user bases.

My personal take from this, is that we need to find ways to stabilize
our stateless codec APIs in less time and perhaps with less effort.

IMO, a less stiff interface could help us here, and that's why I think
having hardware-specific controls can be useful. Hardware designers
can be so creative :)

I'm not against introducing this specific parameter in
v4l2_ctrl_hevc_codec_params, arguing that Hantro is widely used,
but I'd like us to be open to hardware-specific controls as a way
to extend the APIs seamlessly.

Applications won't have to _know_ what hardware they are running on,
they can just use VIDIOC_QUERYCTRL to find out which controls are needed.

Thanks,
Ezequiel

