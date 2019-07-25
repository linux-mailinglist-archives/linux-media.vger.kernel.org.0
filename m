Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D7F757BD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 21:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfGYTUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 15:20:20 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55333 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfGYTUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 15:20:20 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 89BE440008;
        Thu, 25 Jul 2019 19:20:17 +0000 (UTC)
Date:   Thu, 25 Jul 2019 21:20:17 +0200
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
Subject: Re: [PATCH v3 2/3] media: uapi: h264: Add the concept of decoding
 mode
Message-ID: <20190725192017.GB14499@aptenodytes>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
 <20190703122849.6316-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190703122849.6316-3-boris.brezillon@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed 03 Jul 19, 14:28, Boris Brezillon wrote:
> @@ -125,6 +134,10 @@ struct v4l2_h264_pred_weight_table {
>  struct v4l2_ctrl_h264_slice_params {
>  	/* Size in bytes, including header */
>  	__u32 size;
> +
> +	/* Where the slice starts in the output buffer (expressed in bytes). */
> +	__u32 start_byte_offset;
> +

As I understood, we would also need to specify the beginning of the slice
relative to the beginning of the start code so we don't have to assume
fixed-size start codes or have to do the parsing in the kernel.

This can certainly be done as a subsequent patch/series, and definitely not
necessarily by you (don't want to add more on your shoulders at this point)!

Cheers,

Paul

>  	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
>  
> -- 
> 2.21.0
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
