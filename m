Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9897230A94
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 14:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgG1Msh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 08:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbgG1Msh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 08:48:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27776C0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 05:48:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z188so3060881pfc.6
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5oyTQCyX/ciYl48/sUrXDUPmcBZA+8gagBY19IdeyQw=;
        b=mJv4cRJaHTSRd26v0XPCC6OuEb27899p3vFDZAeLGdTP7DB4aEi6p5eF4+a8cnzKCw
         5MwzSIznTSTpJJEC8dSCLzxBxhoW/EEzSkUCb/25q+Kc2Wf+Wj9wbZlM4F9ZaOTtEvk4
         JL4/iNFN4axOYYA7a4Q+eKkAsBX/zEWROJ1tKgCi1uGgxmSanormQNDOFwJupIAw66YV
         e6GHp2BKmHKRPLOmx0Eii+TgpPoWFFV81GQjyAAr5WuNE9sFvLEspzkfC1PGo/MgKQmL
         +Wcb43qgmCJAYtoO7vfJu3RtxoxWmHB/IVQAWVnuyxbHjudvAgEUR3OWIAyOI09otZxe
         GajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5oyTQCyX/ciYl48/sUrXDUPmcBZA+8gagBY19IdeyQw=;
        b=cJhbgjkBEFcoh5Q73H/CMdvGC+tFR4Eez6vdby1VstJV5viGZsXdQhbP//bHc3ggpC
         7rzBcyOzpOal/yeAxUwZuctIJ2c/goELyBIX1dYFCD1Yg8LMrlpx7PPYX7Rnnd3+Uibu
         gf08/NPsiIXoNalnp3pQlRvJZJZX7y1A9iwSiBky8ONc+TC6yEVXLMb6HUx/lSMKWA84
         wNQq8izfztun5zfp/2YPeuWQUVzvY/3kN7lK82OGi70plguEjvoYR7xCrphuhp8z47Je
         lLYSqZyf0g7h+/p8SEb+fObJSYVcz+VRrMQq6s5euZBZeWVCuz52T7GKBxWEb406ERMa
         8kGA==
X-Gm-Message-State: AOAM532Xti1GNMmb1uqpioDslSvMMzwMdThQbwjOxa0ghWfZI6kwnbWt
        TajvkXn0g7v1IjuhPW1xdbVvLQ==
X-Google-Smtp-Source: ABdhPJwrNO3hVD9ncE6nw0POJPiH56DghiizCxZUSEDMPelQ3RnDZcitu5WJ+CzfU0hAcmqtp/xbpw==
X-Received: by 2002:a63:aa42:: with SMTP id x2mr23554140pgo.361.1595940516634;
        Tue, 28 Jul 2020 05:48:36 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id w4sm17943294pfd.39.2020.07.28.05.48.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 05:48:35 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Tue, 28 Jul 2020 18:18:28 +0530
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v2 3/3] media: vimc: Join pipeline if one already exists
Message-ID: <20200728124828.GA8928@kaaira-HP-Pavilion-Notebook>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724120213.17119-4-kgupta@es.iitr.ac.in>
 <e70ecfa2-695f-70ca-eccc-841477700445@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e70ecfa2-695f-70ca-eccc-841477700445@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 02:24:37PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 24.07.20 14:02, Kaaira Gupta wrote:
> > An output which is running is already part of a pipeline and trying to
> > start a new pipeline is not possible. This prevents two capture devices
> > from streaming at the same time.
> > 
> > Instead of failing to start the second capture device allow it to join
> > the already running pipeline. This allows two (or more) capture devices
> > to independently be started and stopped.
> > 
> > [Kaaira: Changed the search for an existing connected sensor, to search
> > for a non-NULL pipe instead, this helps to terminate the search at
> > output itself instead of going till the sensor, changed variable names,
> > commit message and conditions accordingly]
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >   .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
> >   1 file changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> > index c63496b17b9a..423d5e5a508d 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> > @@ -237,16 +237,49 @@ static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
> >   	spin_unlock(&vcap->qlock);
> >   }
> > +static struct media_entity *vimc_cap_get_output(struct vimc_cap_device *vcap)
> > +{
> > +	struct media_entity *entity = &vcap->vdev.entity;
> > +	struct media_device *mdev = entity->graph_obj.mdev;
> > +	struct media_graph graph;
> > +
> > +	mutex_lock(&mdev->graph_mutex);
> > +	if (media_graph_walk_init(&graph, mdev)) {
> > +		mutex_unlock(&mdev->graph_mutex);
> > +		return NULL;
> > +	}
> > +
> > +	media_graph_walk_start(&graph, entity);
> > +
> > +	while ((entity = media_graph_walk_next(&graph)))
> > +		if (entity->pipe)
> > +			break;
> > +
> > +	mutex_unlock(&mdev->graph_mutex);
> > +
> > +	media_graph_walk_cleanup(&graph);
> > +
> > +	return entity;
> > +}
> > +
> >   static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
> >   {
> >   	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
> >   	struct media_entity *entity = &vcap->vdev.entity;
> > +	struct media_pipeline *pipe = NULL;
> > +	struct media_entity *oent;
> >   	int ret;
> >   	vcap->sequence = 0;
> >   	/* Start the media pipeline */
> > -	ret = media_pipeline_start(entity, &vcap->stream.pipe);
> > +	oent = vimc_cap_get_output(vcap);
> > +	if (oent)
> > +		pipe = oent->pipe;
> > +	else
> > +		pipe = &vcap->stream.pipe;
> > +
> > +	ret = media_pipeline_start(entity, pipe);
> >   	if (ret) {
> >   		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
> >   		return ret;
> > 
> 
> I think there is actually no need to iterate the graph. If the capture is already connected to another capture
> that streams, it means that they both have the same pipe in the media core.
> So actually the code can just be:

Hi,
iterating the graph takes care of the case when output already exists.
So in case where an output is needed from both Capture1 and RGB capture,
don't they represent two different pipes?

> 
> if (vcap->ved.ent->pipe)
> 	pipe = vcap->ved.ent->pipe;
> else
> 	pipe = &vcap->stream.pipe;
> 
> 
> (and no need the function vimc_cap_get_output)
> 
> Thanks,
> Dafna
