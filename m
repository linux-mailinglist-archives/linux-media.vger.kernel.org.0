Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A063220B0
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 21:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhBVUOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 15:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhBVUOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 15:14:20 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27358C061574;
        Mon, 22 Feb 2021 12:13:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id BEDC61F44AA3
Message-ID: <4a58c2122096b0ea43614e0ad44dbb1d77584782.camel@collabora.com>
Subject: Re: [PATCH v2 4/9] media: uapi: Add a control for HANTRO driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        John Cox <jc@kynesim.co.uk>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Mon, 22 Feb 2021 17:13:28 -0300
In-Reply-To: <6364fa8a-db6a-af43-3660-7f0a7a3e0b79@collabora.com>
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com>
         <20210218191844.297869-5-benjamin.gaignard@collabora.com>
         <9ql73glgbnjaqqsp8ulqenae5n82kfk0o3@4ax.com>
         <6364fa8a-db6a-af43-3660-7f0a7a3e0b79@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-02-22 at 17:28 +0100, Benjamin Gaignard wrote:
> 
> Le 22/02/2021 à 17:16, John Cox a écrit :
> > > The HEVC HANTRO driver needs to know the number of bits to skip at
> > > the beginning of the slice header.
> > > That is a hardware specific requirement so create a dedicated control
> > > that this purpose.
> > > 
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > include/uapi/linux/hantro-v4l2-controls.h | 20 ++++++++++++++++++++
> > > include/uapi/linux/v4l2-controls.h        |  5 +++++
> > > 2 files changed, 25 insertions(+)
> > > create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
> > > 
> > > diff --git a/include/uapi/linux/hantro-v4l2-controls.h b/include/uapi/linux/hantro-v4l2-controls.h
> > > new file mode 100644
> > > index 000000000000..30b1999b7af3
> > > --- /dev/null
> > > +++ b/include/uapi/linux/hantro-v4l2-controls.h
> > > @@ -0,0 +1,20 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +
> > > +#ifndef __UAPI_HANTRO_V4L2_CONYTROLS_H__
> > > +#define __UAPI_HANTRO_V4L2_CONYTROLS_H__
> > > +
> > > +#include <linux/v4l2-controls.h>
> > > +#include <media/hevc-ctrls.h>
> > > +
> > > +#define V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS       (V4L2_CID_USER_HANTRO_BASE + 0)
> > > +
> > > +/**
> > > + * struct hantro_hevc_extra_decode_params - extra decode parameters for hantro driver
> > > + * @hevc_hdr_skip_lenght:      header first bits offset
> > > + */
> > > +struct hantro_hevc_extra_decode_params {
> > > +       __u32   hevc_hdr_skip_lenght;
> > > +       __u8    padding[4];
> > > +};
> > Can you clarify how hevc_hdr_skip_length differs from
> > v4l2_ctrl_hevc_slice_params.data_bit_offset?  At first sight they would
> > appear to be very similar.
> 
> hevc_hdr_skip_length is the difference between the start positions of 2 nals.
> v4l2_ctrl_hevc_slice_params.data_bit_offset is the offset of the data in the nal.
> 

I think the hardware is weird enough that we should have detailed
documentation to the exact expectation for this control, i.e. detailing
exactly what syntax elements userspace is expected to pass the distance.

Maybe documenting this somewhere in Documentation/.../media/something,
and then linking that in the kernel-doc comment for hantro_hevc_extra_decode_params.

Thanks,
Ezequiel

