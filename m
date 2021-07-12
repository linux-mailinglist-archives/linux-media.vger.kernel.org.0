Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D283C6653
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 00:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhGLWY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 18:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhGLWY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 18:24:28 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF64C0613DD;
        Mon, 12 Jul 2021 15:21:39 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 520EA1F42053
Message-ID: <043580ca84a9f3bf38ee633eda910a19781e9e76.camel@collabora.com>
Subject: Re: [PATCH v4 8/9] media: hevc: Add scaling matrix control
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca, cphealy@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 12 Jul 2021 19:21:25 -0300
In-Reply-To: <20210625141143.577998-9-benjamin.gaignard@collabora.com>
References: <20210625141143.577998-1-benjamin.gaignard@collabora.com>
         <20210625141143.577998-9-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

I believe the scaling matrix uAPI patch(es) and the support
in Hantro G2 could be moved to its own series and maybe
merged sooner than the rest (which may need more discussion).

Couple remarks below.
 
On Fri, 2021-06-25 at 16:11 +0200, Benjamin Gaignard wrote:
> HEVC scaling lists are used for the scaling process for transform
> coefficients.
> V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED has to set when they are
> encoded in the bitstream.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> Note: V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED is not change by this
> patch. There is a thread about the naming/usage of this flag here:
> https://lore.kernel.org/linux-arm-kernel/20210610154442.806107-8-benjamin.gaignard@collabora.com/
> but that doesn't concern the scaling matrix control by itself.
> 

If I am reading the spec correctly, we have fields in
SPS (scaling_list_enabled_flag, scaling_list_data_present_flag)
and PPS (scaling_list_data_present_flag).

We don't need all that, since all a driver needs to know
is whether a scaling list is to be applied for the current frame.
  
Would you mind adding a patch moving the flag to the PPS?

> version 2:
>  - Fix structure name in ext-ctrls-codec.rst
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 45 +++++++++++++++++++
>  .../media/v4l/vidioc-queryctrl.rst            |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  6 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++
>  include/media/hevc-ctrls.h                    | 11 +++++
>  5 files changed, 72 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index dc096a5562cd..3865acb9e0fd 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3071,6 +3071,51 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>  
>      \normalsize
>  
> +``V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX (struct)``
> +    Specifies the HEVC scaling matrix parameters used for the scaling process
> +    for transform coefficients.
> +    These matrix and parameters are defined according to :ref:`hevc`.
> +    They are described in section 7.4.5 "Scaling list data semantics" of
> +    the specification.
> +

This needs some additional documentation about the order of the lists.
See the docs that we've added for the scaling_list_{} fields in
V4L2_CID_STATELESS_H264_SCALING_MATRIX.

Thanks!
-- 
Kindly,
Ezequiel


