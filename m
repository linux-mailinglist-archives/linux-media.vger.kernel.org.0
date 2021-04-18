Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BB1363751
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 21:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhDRT2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 15:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRT2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 15:28:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373C9C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 12:27:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73B4E4AB;
        Sun, 18 Apr 2021 21:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618774050;
        bh=I0nj/hLbaSuLl0pExblew7p6Y+sniwsMYx0ZTobMIQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uSjk1HPnExMAVAcw8tCF4ZkWqLQjGXig+54QM+7YIIYvC5ucrku+QFcPv17Fmf545
         L2w7Tj5kuMXVpsvWMuF1hRdWsH1syrvdpS6DgVb+ul4bCzHPMavqIA44lGlEpfTtHf
         D8Cord5quGcext511kkBMFVEhvFkQZZbwzbzptz0=
Date:   Sun, 18 Apr 2021 22:27:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 17/24] v4l: Add stream to frame descriptor
Message-ID: <YHyIHyJpxvwMf6rZ@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-18-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-18-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:43PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> The stream field identifies the stream this frame descriptor applies to in
> routing configuration across a multiplexed link.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 30ec011d31e3..436d0445aafd 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -338,6 +338,7 @@ enum v4l2_mbus_frame_desc_flags {
>   * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
>   *
>   * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
> + * @stream:	stream in routing configuration
>   * @pixelcode:	media bus pixel code, valid if @flags
>   *		%FRAME_DESC_FL_BLOB is not set.
>   * @length:	number of octets per frame, valid if @flags
> @@ -347,6 +348,7 @@ enum v4l2_mbus_frame_desc_flags {
>   */
>  struct v4l2_mbus_frame_desc_entry {
>  	enum v4l2_mbus_frame_desc_flags flags;
> +	u32 stream;

As this isn't used in this series, I can't really tell how it will be
used, so it's hard to review the patch. Should we postpone it to the
next patch series ?

>  	u32 pixelcode;
>  	u32 length;
>  	union {

-- 
Regards,

Laurent Pinchart
