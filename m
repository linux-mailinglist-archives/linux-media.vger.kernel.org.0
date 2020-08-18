Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7353024903F
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 23:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgHRVi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 17:38:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34574 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgHRViT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 17:38:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9FAF129480C
Message-ID: <57e324f9e3e7e56aa634bcfa0aeebf08c118776d.camel@collabora.com>
Subject: Re: [PATCH v3 16/19] media: rkvdec: Drop unneeded per_request
 driver-specific control flag
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Tue, 18 Aug 2020 18:38:07 -0300
In-Reply-To: <7ce53e65-1a05-bef7-afe7-9a5113d5bd4f@kwiboo.se>
References: <20200814133634.95665-1-ezequiel@collabora.com>
         <20200814133634.95665-17-ezequiel@collabora.com>
         <7ce53e65-1a05-bef7-afe7-9a5113d5bd4f@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-08-18 at 20:17 +0000, Jonas Karlman wrote:
> Hi Ezequiel,
> 
> On 2020-08-14 15:36, Ezequiel Garcia wrote:
> > Currently, the drivers makes no distinction between per_request
> > and mandatory, as both are used in the same request validate check.
> > 
> > The driver only cares to know if a given control is
> > required to be part of a request, so only one flag is needed.
> 
> This patch cause decoding issues with ffmpeg.
> 
> The removal of per_request makes DECODE_MODE and START_CODE ctrls
> mandatory to be included in the request.
> 

Ugh, I just failed boolean logic 101.

Yeah, we those controls shouldn't be mandatory.

I'll send a fix for that. Other than this, can I add your tested-by to the series?

Thanks,
Ezequiel

> Best regards,
> Jonas
> 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/rkvdec/rkvdec.c | 6 +-----
> >  drivers/staging/media/rkvdec/rkvdec.h | 1 -
> >  2 files changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> > index 7c5129593921..cd720d726d7f 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.c
> > +++ b/drivers/staging/media/rkvdec/rkvdec.c
> > @@ -55,23 +55,19 @@ static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
> >  
> >  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> >  	{
> > -		.per_request = true,
> >  		.mandatory = true,
> >  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> >  	},
> >  	{
> > -		.per_request = true,
> >  		.mandatory = true,
> >  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
> >  		.cfg.ops = &rkvdec_ctrl_ops,
> >  	},
> >  	{
> > -		.per_request = true,
> >  		.mandatory = true,
> >  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
> >  	},
> >  	{
> > -		.per_request = true,
> >  		.mandatory = true,
> >  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> >  	},
> > @@ -615,7 +611,7 @@ static int rkvdec_request_validate(struct media_request *req)
> >  		u32 id = ctrls->ctrls[i].cfg.id;
> >  		struct v4l2_ctrl *ctrl;
> >  
> > -		if (!ctrls->ctrls[i].per_request || !ctrls->ctrls[i].mandatory)
> > +		if (!ctrls->ctrls[i].mandatory)
> >  			continue;
> >  
> >  		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
> > diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> > index 2fc9f46b6910..77a137cca88e 100644
> > --- a/drivers/staging/media/rkvdec/rkvdec.h
> > +++ b/drivers/staging/media/rkvdec/rkvdec.h
> > @@ -25,7 +25,6 @@
> >  struct rkvdec_ctx;
> >  
> >  struct rkvdec_ctrl_desc {
> > -	u32 per_request : 1;
> >  	u32 mandatory : 1;
> >  	struct v4l2_ctrl_config cfg;
> >  };
> > 


