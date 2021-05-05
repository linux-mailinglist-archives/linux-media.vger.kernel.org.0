Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19643749C7
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 23:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbhEEVCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 17:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235097AbhEEVCi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 17:02:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63799C061574;
        Wed,  5 May 2021 14:01:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D21551F4322A
Message-ID: <f5d194db2bb70237c8b3b5072daac2d7ad404b84.camel@collabora.com>
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
Date:   Wed, 05 May 2021 18:01:25 -0300
In-Reply-To: <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
         <20210420121046.181889-7-benjamin.gaignard@collabora.com>
         <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-05-05 at 16:55 +0200, Hans Verkuil wrote:
> On 20/04/2021 14:10, Benjamin Gaignard wrote:
> > The HEVC HANTRO driver needs to know the number of bits to skip at
> > the beginning of the slice header.
> > That is a hardware specific requirement so create a dedicated control
> > for this purpose.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> >  .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
> >  .../userspace-api/media/drivers/index.rst     |  1 +
> >  include/media/hevc-ctrls.h                    | 13 +++++++++++++
> >  3 files changed, 33 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
> > new file mode 100644
> > index 000000000000..cd9754b4e005
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> > @@ -0,0 +1,19 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Hantro video decoder driver
> > +===========================
> > +
> > +The Hantro video decoder driver implements the following driver-specific controls:
> > +
> > +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
> > +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
> > +    skip in the slice segment header.
> > +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> > +    to before syntax element "slice_temporal_mvp_enabled_flag".
> > +    If IDR, the skipped bits are just "pic_output_flag"
> > +    (separate_colour_plane_flag is not supported).
> 
> I'm not very keen on this. Without this information the video data cannot be
> decoded, or will it just be suboptimal?
> 
> The problem is that a generic decoder would have to know that the HW is a hantro,

Applications can just query which controls are exposed by a video device,
and if this control is found, then it means it needs to be set.

> and then call this control. If they don't (and are testing on non-hantro HW), then
> it won't work, thus defeating the purpose of the HW independent decoder API.
> 
> Since hantro is widely used, and if there is no other way to do this beside explitely
> setting this control, then perhaps this should be part of the standard HEVC API.
> Non-hantro drivers that do not need this can just skip it.
> 

The decision to move it out of the HEVC API is not really to avoid setting it.
In the end, most/all applications will end up required to set this 

