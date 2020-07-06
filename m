Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288CE215F3F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 21:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgGFTTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 15:19:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51642 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGFTTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 15:19:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EA4022A4ECC
Message-ID: <bcbd94c1fb4eea06e9e6014c10d6993faa3e3d4f.camel@collabora.com>
Subject: Re: [PATCH 1/2] rkvdec: h264: Refuse to decode unsupported bitstream
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        kernel@collabora.com
Date:   Mon, 06 Jul 2020 16:19:33 -0300
In-Reply-To: <551304f5-88bd-a673-a0ef-47af65700fe7@kwiboo.se>
References: <20200626171130.27346-1-ezequiel@collabora.com>
         <20200626171130.27346-2-ezequiel@collabora.com>
         <551304f5-88bd-a673-a0ef-47af65700fe7@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-07-06 at 09:45 +0000, Jonas Karlman wrote:
> On 2020-06-26 19:11, Ezequiel Garcia wrote:
> > The hardware only supports 4:2:2, 4:2:0 or 4:0:0 (monochrome),
> > 8-bit or 10-bit depth content.
> > 
> > Verify that the PPS refers to a supported bitstream, and refuse
> 
> This should be SPS not PPS, same for hantro patch.
> 

Yup.

> > unsupported bitstreams by failing at TRY_EXT_CTRLS time.
> > 
> > The driver is currently broken on 10-bit and 4:2:2
> > so disallow those as well.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> > index 225eeca73356..0f81b47792f6 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec.c
> > @@ -27,6 +27,32 @@
> >  #include "rkvdec.h"
> >  #include "rkvdec-regs.h"
> >  
> > +static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
> > +		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_cur.p;
> 
> This should be p_new and not p_cur to validate the new ctrl value, same for hantro patch.
> 
> With both fixed this and the hantro patch is,
> 
> Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
> 

Ah, nice catch. Will fix.

Thanks,
Ezequiel

> Regards,
> Jonas
> 
> > +		/*
> > +		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
> > +		 * but it's currently broken in the driver.
> > +		 * Reject them for now, until it's fixed.
> > +		 */
> > +		if (sps->chroma_format_idc > 1)
> > +			/* Only 4:0:0 and 4:2:0 are supported */
> > +			return -EINVAL;
> > +		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> > +			/* Luma and chroma bit depth mismatch */
> > +			return -EINVAL;
> > +		if (sps->bit_depth_luma_minus8 != 0)
> > +			/* Only 8-bit is supported */
> > +			return -EINVAL;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
> > +	.try_ctrl = rkvdec_try_ctrl,
> > +};
> > +
> >  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> >  	{
> >  		.per_request = true,
> > @@ -42,6 +68,7 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> >  		.per_request = true,
> >  		.mandatory = true,
> >  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
> > +		.cfg.ops = &rkvdec_ctrl_ops,
> >  	},
> >  	{
> >  		.per_request = true,
> > 


