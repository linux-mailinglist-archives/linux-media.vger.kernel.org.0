Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF00567AE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFZLdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:33:45 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55517 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZLdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:33:45 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 78036240005;
        Wed, 26 Jun 2019 11:33:41 +0000 (UTC)
Message-ID: <4dec37e985d160d2fe5b3b5e28eff0e081a860fa.camel@bootlin.com>
Subject: Re: [PATCH v2 3/3] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
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
Date:   Wed, 26 Jun 2019 13:33:41 +0200
In-Reply-To: <20190610085250.3255-4-boris.brezillon@collabora.com>
References: <20190610085250.3255-1-boris.brezillon@collabora.com>
         <20190610085250.3255-4-boris.brezillon@collabora.com>
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
> Those lists can be extracted from the dpb, let's simplify userspace
> life and build that list kernel-side (generic helpers will be provided
> for drivers that need this list).

I don't really have any clear idea about that, but there was a
discussion about DPB vs reference picture lists some weeks ago.

Is there some mail thread with a rationale about it, some IRC logs I
could look at or could the people involved in the discussion provide
some additional background at this point?

IIRC we also talked about removing the DPB or at least renaming it, but
I don't have a clear idea of the outcome as well.

Cheers,

Paul

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * None
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index e3b9ab73a588..8be0ca5c96ab 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1949,15 +1949,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> -    * - __u8
> -      - ``ref_pic_list_p0[32]``
> -      - Backward reference list used by P-frames in the original bitstream order
> -    * - __u8
> -      - ``ref_pic_list_b0[32]``
> -      - Backward reference list used by B-frames in the original bitstream order
> -    * - __u8
> -      - ``ref_pic_list_b1[32]``
> -      - Forward reference list used by B-frames in the original bitstream order
>      * - __s32
>        - ``top_field_order_cnt``
>        - Picture Order Count for the coded top field
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

