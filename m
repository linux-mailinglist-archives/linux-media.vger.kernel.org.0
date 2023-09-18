Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C667A4E10
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 18:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjIRQGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 12:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjIRQGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 12:06:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385314EFF
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:05:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E7FF87F3;
        Mon, 18 Sep 2023 15:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695044258;
        bh=pybjrW1S19prpfdFtFJV7ogIit4PT+O9BWgluUsQQo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KuNldx6eTyVaV509aWl7SMDPv4GrBwPgxHlcV/ZvYzb59zIwuP2kCOfCXNKk31DXL
         ezECHvrG887SLQqpbeqBNhwgasNfGuT7BZOTwR6VC5cyIs0g0RlCWFBB6YhdbPeVhI
         gUzCjtO3GxAZBsP2MI+lv/9m18NgdjwEfEDTk0m8=
Date:   Mon, 18 Sep 2023 16:39:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Message-ID: <20230918133926.GG28874@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-12-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918125138.90002-12-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 18, 2023 at 03:51:37PM +0300, Sakari Ailus wrote:
> Print debug level information on returned frame descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 35 ++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7b087be3ff4f..abd9275febdb 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -309,9 +309,42 @@ static int call_set_selection(struct v4l2_subdev *sd,
>  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  			       struct v4l2_mbus_frame_desc *fd)
>  {
> +	unsigned int i;
> +	int ret;
> +
>  	memset(fd, 0, sizeof(*fd));
>  
> -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(sd->dev, "Frame descriptor\n");
> +	dev_dbg(sd->dev, "\ttype %s\n",
> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> +		"unknown");
> +	dev_dbg(sd->dev, "\tentries %u\n", fd->num_entries);

You could skip this line, it's implied by the entries that you print
below.

> +
> +	for (i = 0; i < fd->num_entries; i++) {
> +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> +
> +		dev_dbg(sd->dev, "\tentry %u\n", i);
> +		dev_dbg(sd->dev, "\tflags%s%s\n",
> +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
> +			" LEN_MAX" : "",
> +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
> +			" BLOB" : "");
> +		dev_dbg(sd->dev, "\t\tstream %u\n", entry->stream);
> +		dev_dbg(sd->dev, "\t\tpixelcode 0x%4.4x\n", entry->pixelcode);
> +		dev_dbg(sd->dev, "\t\tlength %u\n", entry->length);
> +
> +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> +			dev_dbg(sd->dev, "\t\tvc %u\n", entry->bus.csi2.vc);
> +			dev_dbg(sd->dev, "\t\tdt 0x%2.2x\n", entry->bus.csi2.dt);

I'd merge those two in a single line.

> +		}
> +	}

All this is a bit verbose. If it was in a hot path I would be annoyed,
but in this case I suppose it can be useful for debugging and won't
affect runtime too much.

It would be nice if we could have a single check and return early. That
should be possible by using DEFINE_DYNAMIC_DEBUG_METADATA() and
DYNAMIC_DEBUG_BRANCH(), like done in alloc_contig_dump_pages() for
instance. It has the additional upside of being able to control all the
messages with a single flag. I'm not sure it's worth it though, I'll let
you decide.

> +
> +	return 0;
>  }
>  
>  static inline int check_edid(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
