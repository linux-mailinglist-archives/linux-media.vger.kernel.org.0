Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA2139DC25
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 14:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhFGMZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 08:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhFGMZp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 08:25:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF1BC061766
        for <linux-media@vger.kernel.org>; Mon,  7 Jun 2021 05:23:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7218A8DB;
        Mon,  7 Jun 2021 14:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623068632;
        bh=zdt+mP8+L+Ytnqty8is5XmWo59+MVh2hXWXe7Gm4faM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jg3nAZq0YbJRfup/ad1SejwpS2+k0xCcITueg6aot6sOjy2r3n/vCXmew+rm0dXJq
         hiFRI9mSWvRBm89aYJ4ZpdGX+kAQ+txMyqmDNPnktPxWrspXuG4AVr74XkEIe1s+zS
         sgGr9eM9MZZpJxWXmXF9mPWgkK1l3X2KbFyDHcLE=
Date:   Mon, 7 Jun 2021 15:23:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 37/38] media: ti-vpe: cal: use frame desc to get vc
 and dt
Message-ID: <YL4PyTkKNTwIoB8o@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-38-tomi.valkeinen@ideasonboard.com>
 <YLo30o5EJczdH2mq@pendragon.ideasonboard.com>
 <cc71b4b5-4ed1-f655-445c-02cb89dc4fa1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc71b4b5-4ed1-f655-445c-02cb89dc4fa1@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jun 07, 2021 at 03:07:42PM +0300, Tomi Valkeinen wrote:
> On 04/06/2021 17:25, Laurent Pinchart wrote:
> > On Mon, May 24, 2021 at 02:09:08PM +0300, Tomi Valkeinen wrote:
> >> Use get_frame_desc() to get the frame desc from the connected source,
> >> and use the provided virtual channel and datatype instead of hardcoded
> >> ones.
> >>
> >> get_frame_desc() works per stream, but as we don't support multiple
> >> streams yet, we will just always use stream 0.
> >>
> >> If the source doesn't support get_frame_desc(), fall back to the
> >> previous method of always capturing virtual channel 0 and any datatype.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal-camerarx.c | 26 +++++++++++
> >>   drivers/media/platform/ti-vpe/cal.c          | 49 +++++++++++++++++++-
> >>   drivers/media/platform/ti-vpe/cal.h          |  3 ++
> >>   3 files changed, 76 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> index e3a4c20be1e6..cb6a37f47432 100644
> >> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> >> @@ -583,6 +583,32 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
> >>   	return ret;
> >>   }
> >>   
> >> +int cal_camerarx_get_remote_frame_desc(struct cal_camerarx *phy,
> >> +				       struct v4l2_mbus_frame_desc *fd)
> > 
> > Maybe s/fd/desc/ to avoid the confusion with file descriptor ?
> 
> Good point.
> 
> >> +{
> >> +	struct media_pad *pad;
> >> +	int ret;
> >> +
> >> +	if (!phy->source)
> >> +		return -ENODEV;
> > 
> > Would EPIPE (here and below) be a better error ? It will be returned to
> > userspace from VIDIOC_STREAMON(), which already uses EPIPE to indicate
> > that the links are not correctly set up.
> 
> Sound fine to me.
> 
> >> +
> >> +	pad = media_entity_remote_pad(&phy->pads[CAL_CAMERARX_PAD_SINK]);
> >> +	if (!pad)
> >> +		return -ENODEV;
> >> +
> >> +	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc, pad->index,
> >> +			       fd);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> >> +		dev_err(phy->cal->dev, "Frame desc do not describe CSI-2 link");
> > 
> > s/do not/does not/ and maybe s/desc/descriptor/
> 
> Yep.
> 
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>   /* ------------------------------------------------------------------
> >>    *	V4L2 Subdev Operations
> >>    * ------------------------------------------------------------------
> >> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> >> index fcc81024ae18..7975bb449acd 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.c
> >> +++ b/drivers/media/platform/ti-vpe/cal.c
> >> @@ -469,10 +469,56 @@ static bool cal_ctx_wr_dma_stopped(struct cal_ctx *ctx)
> >>   	return stopped;
> >>   }
> >>   
> >> +static int
> >> +cal_get_remote_frame_desc_entry(struct cal_camerarx *phy, u32 stream,
> >> +				struct v4l2_mbus_frame_desc_entry *entry)
> >> +{
> >> +	struct v4l2_mbus_frame_desc fd;
> >> +	unsigned int i;
> >> +	int ret;
> >> +
> >> +	ret = cal_camerarx_get_remote_frame_desc(phy, &fd);
> >> +	if (ret) {
> >> +		if (ret != -ENOIOCTLCMD)
> >> +			dev_err(phy->cal->dev,
> >> +				"Failed to get remote frame desc: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	for (i = 0; i < fd.num_entries; i++) {
> >> +		if (stream == fd.entry[i].stream) {
> >> +			*entry = fd.entry[i];
> >> +			return 0;
> >> +		}
> >> +	}
> >> +
> > 
> > A dev_dbg() would be good here, in which case you could drop the
> > ctx_err() in cal_ctx_prepare() as all error paths will print a message.
> 
> Hmm, yes, or maybe the other way around: remove the dev_err above, and 
> let the cal_ctx_prepare handle the printing (as it already does).
> 
> But perhaps it's better to add a dev_err (did you mean dev_err, when you 
> said dev_dbg?) above before the return -ENODEV to make it clear if the 
> error is coming from get_remote_frame_desc or from trying to find the 
> stream.

I usually prefer debug messages for anything that can be triggered by
userspace and isn't a kernel error. Not sure which one it is here :-)

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >> +	return -ENODEV;
> >> +}
> >> +
> >>   int cal_ctx_prepare(struct cal_ctx *ctx)
> >>   {
> >> +	struct v4l2_mbus_frame_desc_entry entry;
> >>   	int ret;
> >>   
> >> +	ret = cal_get_remote_frame_desc_entry(ctx->phy, ctx->stream, &entry);
> >> +
> >> +	if (ret == -ENOIOCTLCMD) {
> >> +		ctx->vc = 0;
> >> +		ctx->datatype = CAL_CSI2_CTX_DT_ANY;
> >> +	} else if (!ret) {
> >> +		ctx_dbg(2, ctx, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
> >> +		       entry.stream,
> >> +		       entry.length,
> >> +		       entry.bus.csi2.vc,
> >> +		       entry.bus.csi2.dt);
> > 
> > You can group multiple variables on the same line.
> 
> Yep.

-- 
Regards,

Laurent Pinchart
