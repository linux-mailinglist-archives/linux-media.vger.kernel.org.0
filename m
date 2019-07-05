Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3442260A60
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 18:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfGEQkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 12:40:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37108 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfGEQkO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 12:40:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 07F7828B64B
Message-ID: <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
Subject: Re: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Fri, 05 Jul 2019 13:40:03 -0300
In-Reply-To: <20190703122849.6316-2-boris.brezillon@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
         <20190703122849.6316-2-boris.brezillon@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris, Paul,

On Wed, 2019-07-03 at 14:28 +0200, Boris Brezillon wrote:
> Looks like some stateless decoders expect slices to be prefixed with
> ANNEX B start codes (they most likely do some kind of bitstream parsing
> and/or need that to delimit slices when doing per frame decoding).
> Since skipping those start codes for dummy stateless decoders (those
> expecting all params to be passed through controls) should be pretty
> easy, let's mandate that all slices be prepended with ANNEX B start
> codes.
> 
> If we ever need to support AVC headers, we can add a new menu control
> to select the type of NAL header to use.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
> Changes in v3:
> * Add Paul's R-b
> 
> Changes in v2:
> * None
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index 7a1947f5be96..3ae1367806cf 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1726,6 +1726,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      :ref:`h264`, section 7.4.3 "Slice Header Semantics". For further
>      documentation, refer to the above specification, unless there is
>      an explicit comment stating otherwise.
> +    All slices should be prepended with an ANNEX B start code.
>  

Currently, the H264 slice V4L2_PIX_FMT_H264_SLICE_RAW,
is specified to _not_ contain the ANNEX B start code.

As you know, this is used in the cedrus driver, which is not
expecting the start code.

What's the plan regarding that?

Thanks,
Ezequiel

