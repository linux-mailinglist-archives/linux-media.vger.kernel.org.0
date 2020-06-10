Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65411F5A4D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgFJR3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgFJR3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:29:00 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BC1C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:29:00 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u13so2586668wml.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E/OpYtkdJhBuYsHSJhq676XvJqjKjlf+gMoabLS0g4A=;
        b=nYUpGKBs4xEHPwNFak20lPLO9cHto5Hm28yV7rMIpULXEx9LOCq282m5wJn8aspYyf
         deotVxLT/l5bQk1UdN/3Rkf/mR5CKcy25daHDqFrqa81Iy5I8EqC2cNLcOvG8y48WaMF
         CAHmtDsJZD52OQM43AQ5C0AJyEjuSwD/nw0oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E/OpYtkdJhBuYsHSJhq676XvJqjKjlf+gMoabLS0g4A=;
        b=gBc8aeuDbn9Z7on2r8qB/A1zW90PUJEMXScytct70P0oVDQtnHucCuUMl2CAxCRbyY
         yGvy6fc0BAFK6s8ySzrmlsv7+90FqwE/pZ0RouB8Fn3M7jIz3GO0jY1vSKSMUyEX7pAp
         7kXOXIsTjCrlblmUayFFFbBN06dfOZ43qJ95PckpXhC7DahIaMwYZMwIfMeIo0gneuxB
         Jn3RlDqeLxl3LrnE38elTNcqtvZleZnYTtLkFHDRjOvmqBJGiSoMtdGkZXQSRx6gLuvA
         goc8VXHIk9D+vqyl8vaqTjzwoVFv985EscXza5mYkC/wMVtZiNVLLMEKXMBqlzTqVPFi
         se0g==
X-Gm-Message-State: AOAM532Cg51RKusMad+ZofDIbHQqTwaa/XDahPFSqXOjCgo61dklpADe
        ccNHHqxGcNdbF9sVCe+Sf1NJ9A==
X-Google-Smtp-Source: ABdhPJzkHS+OI1HGIrKjMxe9yNET80vIiPkjUOxBkrzk8eds2xaarln9Q8zxhAniA4Pm9pxWM6Lc7A==
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr4188276wmi.30.1591810139023;
        Wed, 10 Jun 2020 10:28:59 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id c5sm678037wrb.72.2020.06.10.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:28:58 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:28:57 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: Re: [PATCH v4 4/5] media: staging: rkisp1: cap: use
 v4l2_pipeline_stream_{enable,disable} helpers
Message-ID: <20200610172857.GH201868@chromium.org>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <20200522075522.6190-5-dafna.hirschfeld@collabora.com>
 <20200610170344.GC201868@chromium.org>
 <02c8bd4a-0fc1-fcc5-4d8b-63ff1d406988@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02c8bd4a-0fc1-fcc5-4d8b-63ff1d406988@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 07:22:04PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 10.06.20 19:03, Tomasz Figa wrote:
> > Hi Dafna,
> > 
> > On Fri, May 22, 2020 at 09:55:21AM +0200, Dafna Hirschfeld wrote:
> > > From: Helen Koike <helen.koike@collabora.com>
> > > 
> > > Use v4l2_pipeline_stream_{enable,disable} to call .s_stream()
> > > subdevice callbacks through the pipeline.
> > > Those helpers are called only if the other capture is not streaming.
> > > 
> > > If the other capture is streaming then he already did that for us
> > > so we call s_stream only on the resizer that is connected to the
> > > capture node.
> > > 
> > > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > ---
> > >   drivers/staging/media/rkisp1/rkisp1-capture.c | 104 ++++++------------
> > >   1 file changed, 32 insertions(+), 72 deletions(-)
> > > 
> > 
> > Thank you for the patch. Please see my comments inline.
> > 
> > [snip]
> > > +static int rkisp1_s_stream_subdev(struct rkisp1_capture *cap, int enable)
> > > +{
> > > +	struct rkisp1_device *rkisp1 = cap->rkisp1;
> > > +	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * if the other capture is already streaming then we only need to
> > > +	 * call s_stream of our reszier
> > > +	 */
> > > +	if (other->is_streaming) {
> > > +		struct v4l2_subdev *rsz_sd  = &rkisp1->resizer_devs[cap->id].sd;
> > > +
> > > +		ret = v4l2_subdev_call(rsz_sd, video, s_stream, enable);
> > > +		if (ret && ret != -ENOIOCTLCMD)
> > > +			dev_err(rkisp1->dev,
> > > +				"stream %s resizer '%s' failed (%d)\n",
> > > +				enable ? "on" : "off", rsz_sd->name, ret);
> > 
> > Do we need this special case? Wouldn't v4l2_pipeline_stream_*() simply
> > increment reference counters for the other entities?
> 
> I removed the stream count in v4 of the patchset since I thought it
> might be problematic/confusing to add a field "stream_count" in
> "struct v4l2_subdev" that is used and updated only by those helper functions
> 
> What do you think?
> 
> There is also the issue that both you and Sakari Ailus mentioned that
> an isp driver can't know the subtopology of a sensor driver and how it handle the
> s_stream callback on it's entities.

Ah, okay, so we settled on removing the refcounting from the helpers.
Fair enough. Sorry for the noise.

Feel free to add my Reviewed-by.

Best regards,
Tomasz
