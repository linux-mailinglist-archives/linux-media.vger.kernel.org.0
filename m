Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475382F4B30
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 13:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbhAMMTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 07:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbhAMMTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 07:19:43 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D359EC061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 04:18:56 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 190so1398862wmz.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=MvpMjQl+Wo3E3PoM3mkgMEGzaCAmhGM5PcsySzg6uVs=;
        b=inbGrK4QFkyM3hlo/hokZXLtBvZ4ezEoydFmHEAl9EWRlLHa9omnUj7SQLVC6CVC1p
         fYpV4UIFx/kC7fRAb+sZfYR8ZfgnG/B3xyN1aS0GPxKORc6Uhlx8bjds1phB83prct0r
         3ZCDU8gOoGQoEDC5coXfrt557gFPdr9d3eNoe/P0MBaoXvmoCFGNaCjBD+FbvssjVfKi
         988GchQfdUyH6dCI3/ymy3qe3QmavVQUuheYCQjAfuIAiY9J8KZn83vQ0eyvQZfP9uTy
         g+cd1SlGN/6oQdgPUVkAuyVQzlJIyP77djcFg3vN/5RxCHJdlrESoY2Y5NGkyYbGoXAi
         aidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MvpMjQl+Wo3E3PoM3mkgMEGzaCAmhGM5PcsySzg6uVs=;
        b=WYDs5aP9yp4aAiFZQBhwGXnz3fgFiY1yH4WgtbQMEwuWfExDrikv0sINSVTlUy0oQp
         L3qRvuq+arnxvZD/52w9V5vT4z1HC7Gb5pRjsIreql8PKGb7mWb3E2zNky1N1PHq6hKS
         w3xkqa/dYksUReF88U/tkyjLYlMFulKPL56+BUs6dn9bewLREmy6okhZ4YXCOSPlxxtS
         xxRf+UG5DKchLozzIyvd4fO4YNoKVdUIvaJd1kQoY/+pBAbkRLe0dZVvhWISkIe+gvzU
         SJUmL2jPsf40oCosdU3RIe2NlnAChCoYW6q7TeXvEm64ZA9Tk7336BpHu2RK4gMjIPkE
         HDoA==
X-Gm-Message-State: AOAM530P7DBIa57q8+qTweFv0ifRZtJpqcWrdRyslXf30nhaSMROqoE2
        E3Vcok8uTRUYdaDj2tcZs8sGE+KJokGcSw==
X-Google-Smtp-Source: ABdhPJz2/ib+l4aH3BefZbj+Q6eS8qUXydgmONIuho1iIqlkBLAIGxHj/E6c5etWXPrKdU3Go3VwDw==
X-Received: by 2002:a1c:608b:: with SMTP id u133mr1916666wmb.140.1610540335564;
        Wed, 13 Jan 2021 04:18:55 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g5sm3332482wro.60.2021.01.13.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 04:18:54 -0800 (PST)
Date:   Wed, 13 Jan 2021 12:18:52 +0000
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH 2/2] media: imx7: csi: Fix pad link validation
Message-ID: <20210113121852.rbmxwmy56le5xlqs@arch-thunder.localdomain>
References: <20210107104726.1294538-1-rmfrfs@gmail.com>
 <20210107104726.1294538-3-rmfrfs@gmail.com>
 <54f32ef2-3dbd-48b7-9b74-d6e5a6be3614@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54f32ef2-3dbd-48b7-9b74-d6e5a6be3614@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
On Wed, Jan 13, 2021 at 01:11:15PM +0100, Hans Verkuil wrote:
> On 07/01/2021 11:47, Rui Miguel Silva wrote:
> > We can not make the assumption that the bound subdev is always a CSI
> > mux, in i.MX6UL/i.MX6ULL that is not the case. So, just get the entity
> > selected by source directly upstream from the CSI.
> 
> scripts/checkpatch.pl --strict:
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Rui Miguel Silva <rui.silva@linaro.org>' != 'Signed-off-by: Rui Miguel Silva
> <rmfrfs@gmail.com>'
> 
> I can fix this if you let me know which email address I should pick.

Errr... Sorry about that, pick the gmail.com one please.
Thanks.

------
Cheers,
     Rui
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Fixes: 86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as a CSI mux")
> > Reported-by: Fabio Estevam <festevam@gmail.com>
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > Tested-by: Fabio Estevam <festevam@gmail.com>
> > Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index 31e36168f9d0..ac52b1daf991 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -499,6 +499,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
> >  				      struct v4l2_subdev_format *sink_fmt)
> >  {
> >  	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
> > +	struct media_entity *src;
> >  	struct media_pad *pad;
> >  	int ret;
> >  
> > @@ -509,11 +510,21 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
> >  	if (!csi->src_sd)
> >  		return -EPIPE;
> >  
> > +	src = &csi->src_sd->entity;
> > +
> > +	/*
> > +	 * if the source is neither a CSI MUX or CSI-2 get the one directly
> > +	 * upstream from this CSI
> > +	 */
> > +	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
> > +	    src->function != MEDIA_ENT_F_VID_MUX)
> > +		src = &csi->sd.entity;
> > +
> >  	/*
> > -	 * find the entity that is selected by the CSI mux. This is needed
> > +	 * find the entity that is selected by the source. This is needed
> >  	 * to distinguish between a parallel or CSI-2 pipeline.
> >  	 */
> > -	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
> > +	pad = imx_media_pipeline_pad(src, 0, 0, true);
> >  	if (!pad)
> >  		return -ENODEV;
> >  
> > 
> 
