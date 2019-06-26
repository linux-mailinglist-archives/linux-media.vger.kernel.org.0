Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C070156782
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfFZLXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:23:20 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56837 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZLXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:23:20 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7B06920002;
        Wed, 26 Jun 2019 11:23:08 +0000 (UTC)
Message-ID: <bba2714fbedda77fb46d0c55b7c89045d9c85dbd.camel@bootlin.com>
Subject: Re: [PATCH v2 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 26 Jun 2019 13:23:08 +0200
In-Reply-To: <20190610085250.3255-2-boris.brezillon@collabora.com>
References: <20190610085250.3255-1-boris.brezillon@collabora.com>
         <20190610085250.3255-2-boris.brezillon@collabora.com>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, 2019-06-10 at 10:52 +0200, Boris Brezillon wrote:
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

Looks good to me:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
> Changes in v2:
> * None
> 
> Note: we might want to add a nal_header_size field to allow drivers to
> quickly find where the actual payload start. That'd be particularly
> useful here since ANNEX B start codes can be of arbitrary size
> (2+(0x00 bytes) + 1(0x01 byte)). The other option would be to enforce
> the number of leading 0x00 bytes (a minimum of 2 is required).
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index d6ea2ffd65c5..82547d5de250 100644
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
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

