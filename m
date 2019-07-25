Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8BB3757D0
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 21:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfGYT0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 15:26:14 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56089 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfGYT0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 15:26:14 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4692D240009;
        Thu, 25 Jul 2019 19:26:11 +0000 (UTC)
Date:   Thu, 25 Jul 2019 21:26:10 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
Message-ID: <20190725192610.GC14499@aptenodytes>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
 <20190703122849.6316-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190703122849.6316-2-boris.brezillon@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 03 Jul 19, 14:28, Boris Brezillon wrote:
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

After thinking a bit about this, I'd rather be in favor of having offsets
in the control structures rather than forcing the start code type or having a
dedicated control for that, as I've mentionned on the other patch.

What do you think?

Cheers,

Paul

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
>      .. note::
>  
> -- 
> 2.21.0
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
