Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952B93C1562
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 16:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhGHOpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 10:45:11 -0400
Received: from meesny.iki.fi ([195.140.195.201]:49864 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229738AbhGHOpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Jul 2021 10:45:10 -0400
Received: from hillosipuli.retiisi.eu (dbdx-ftd5cf51mv6xr7xy-3.rev.dnainternet.fi [IPv6:2001:14ba:8e7:f240:7911:3355:4753:76e6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4FD2120076;
        Thu,  8 Jul 2021 17:42:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1625755347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=65IxwOJHhj1SDcZAxRPR3MD+lPtIExnpnKEzvBCh0VU=;
        b=vMm2qs9MygzwNwC8q/dQ/KX0UmikFKHd6i6fDJ/BeIPZN7WLeJtLym5kS0Fy5lpEbi3ULD
        +aYxOHOOX4mWHQukHJ+9EgyDj4Npeiv+CFTHwfUjEXoNI5pTLL6DsudLAVM3Mp4jSK0vyn
        OLeSSGYoRK2I3k6z4lQ4/kY+WQKXBDg=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B391E634C87;
        Thu,  8 Jul 2021 17:41:47 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m1VEQ-000215-9U; Thu, 08 Jul 2021 17:42:26 +0300
Date:   Thu, 8 Jul 2021 17:42:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <20210708144226.GC3@valkosipuli.retiisi.eu>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160401.xssshab7nkxroxnp@uno.localdomain>
 <YOSBxLV86PX63AWm@oden.dyn.berto.se>
 <20210706165803.jepqksw4slo3xkyc@uno.localdomain>
 <20210708134040.GB3@valkosipuli.retiisi.eu>
 <YOcGN3n7w0NAobdo@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOcGN3n7w0NAobdo@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1625755347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=65IxwOJHhj1SDcZAxRPR3MD+lPtIExnpnKEzvBCh0VU=;
        b=SnXRsb7aR6iRz7VC0hTnp3Tq4E4FCd4SfZqfwuza7xYhfvRx1zOvnrGITnmQVi34TqFxTP
        c4FwCcwqyzxiqgPagBEMvuF7tFBhyku11ByzXcxhKFLsNzofGsz9gqPfrqfomYyr0UO3gE
        vgnp6Z6Y5EtDg3ogdvSy8nhA44O81oM=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1625755347; a=rsa-sha256; cv=none;
        b=xw0IV3qaPtrZuKFJvCE0Tf11OgDW0LzE1WO1mzAguFc18/9pkg6a2n9Qm3ZU0xCdJZPwJ1
        pFr/U/rzOXodAu9QXqHkmFVFFVd9yhyFTkf/lcHvWS/9KcCgmdOFQ2CQDJbANKHkwzfOY0
        O2oa7oUFnBe4NB+DabshzGtz8YAUHBA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 08, 2021 at 04:05:43PM +0200, Niklas Söderlund wrote:
> Hi Sakari,
> 
> On 2021-07-08 16:40:40 +0300, Sakari Ailus wrote:
> > Hi Niklas, Jacopo,
> > 
> > On Tue, Jul 06, 2021 at 06:58:03PM +0200, Jacopo Mondi wrote:
> > > > > > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> > > > > >  	rvin_v4l2_unregister(vin);
> > > > > >  	vin->parallel.subdev = NULL;
> > > > > >
> > > > > > -	if (!vin->info->use_mc) {
> > > > > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > > > > -		vin->vdev.ctrl_handler = NULL;
> > > > > > -	}
> > > > > > +	if (!vin->info->use_mc)
> > > > >
> > > > > I know it was there already, but give that rvin_parallel_notify_unbind()
> > > > > is only registered for parallel, can this happen ?
> > > >
> > > > Yes, on Gen2 where we don't use a media-graph.
> > > >
> > > 
> > > Ah correct, for gen3 the controls are freed elsewhere, right!
> > > 
> > > Thanks for the clarification
> > 
> > I already had the set in my tree but I can throw it out if you'd prefer to
> > send v2 instead. At least I noticed only minor matters in the comments.
> 
> There is one small issue in a cleanup path in 4/11 that should be fixed 
> and it's always good to get the small things fixed. If I have a v2 out 
> before end of day tomorrow could you refresh what you have in your tree?

Certainly. There's no urgency --- we don't have even rc1 yet.

-- 
Sakari Ailus
