Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB6271FE34
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbjFBJqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbjFBJqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:46:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53DAB3
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:46:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25BA27FC;
        Fri,  2 Jun 2023 11:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685699190;
        bh=pu5YmV458TKIHs1h7hCh2cEcW8qesFSKiqcueUNRBWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CrBoO2NsDPyc1ikiB6II7gGvhY53QeIERKZBHdvAqsGZCrQMbFuwOaSMUCZCAMtu0
         Pe7W7dkrQ4Ci5seVaOWg5iQhFhMswWCyMWCxZrETSBPReP+DFrV/U/TlTjbeQkMhQe
         BaSyfSsB7Nb9iiqI0z+AfnEfw9fjpRSkxCxExpRI=
Date:   Fri, 2 Jun 2023 12:46:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 2/7] media: v4l: subdev: Support INTERNAL_SOURCE pads in
 routing IOCTLs
Message-ID: <20230602094650.GG19463@pendragon.ideasonboard.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-3-sakari.ailus@linux.intel.com>
 <691a9d35-218f-4eef-ddb0-5834f1e222c8@ideasonboard.com>
 <ZFjp6jtJk4WIeXCx@kekkonen.localdomain>
 <20230602094407.GF19463@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602094407.GF19463@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 02, 2023 at 12:44:12PM +0300, Laurent Pinchart wrote:
> On Mon, May 08, 2023 at 03:24:10PM +0300, Sakari Ailus wrote:
> > Moi,
> 
> こんにちは
> 
> > On Mon, May 08, 2023 at 01:14:07PM +0300, Tomi Valkeinen wrote:
> > > On 06/05/2023 00:52, Sakari Ailus wrote:
> > > > Take the new INTERNAL_SOURCE pad flag into account in validating routing
> > > > IOCTL argument. Effectively this is a SINK pad in this respect. Due to the
> > > > union there's no need to check for the particular name.
> > > 
> > > What union? The one you add in the next patch?
> > 
> > Oops. I think we can reorder the patches.
> > 
> > > As a concept the internal source pads sound good, and they work in practice
> > > in my tests. But this union is what grates me a bit. We have a flag,
> > > MEDIA_PAD_FL_INTERNAL_SOURCE, which tells which field of the union to use,
> > > and then we go and do not use the new union field. Well, and also the
> > > naming, as we normally have source and sink pads, but now we also have
> > > internal source pads, which are actually identical to sink pads...
> > 
> > The union still should be used by the user space. We're testing flags here
> > and those flags are the same independently of the INTERNAL_SOURCE flag.
> > 
> > I'm fine by not adding that union though, but for the user space I think
> > it's better we have it: explaining that the sink_pad has a different
> > meaning if that flag is set is harder than making it a union member.
> > 
> > > I understand the idea and reasoning, but the two points above do confuse me
> > > and I'm sure would confuse others also.
> > > 
> > > I wonder if it would be less or more confusing to simplify this by just
> > > adding a MEDIA_PAD_FL_INTERNAL, which could be applied to either a source or
> > > a sink pad, and would prevent linking to it. The flag would indicate that
> > > the stream from/to that pad is generated/consumed internally. (I don't know
> > > when you would need an internal pad to consume data, but... who knows, the
> > > need might pop up =).
> > 
> > This is another option. But I envision there will be more compatibility
> > issues. Although... generally using such hardware requires knowledge of the
> > device, and we haven't obviously had any support for devices needing this
> > functionality in the tree. So in the end it might not matter much.
> >
> > > That would mean that an "internal sink pad" would generate a data stream,
> > > i.e. it's a "source", but I think a normal sink pad is almost the same
> > > anyway: when considering entity's internal routing, the normal sink pad is a
> > > "source", and the same logic would apply with the internal pads too.
> > > 
> > > An internal sink pad that generates a stream is a bit more confusing than an
> > > internal source pad, but I think that confusion is less than the rest of the
> > > confusion in the code-side that comes with the internal source pads.
> > 
> > I prefer having the possible sources of the confusion in the framework than
> > in the drivers. Therefore I think INTERNAL_SOURCE flag is a (slightly)
> > better option.
> > 
> > I wonder what Llaurent thinks.
> 
> I like the idea of a MEDIA_PAD_FL_INTERNAL flag. That's actually how I
> read patch 1/7, I didn't notice it used MEDIA_PAD_FL_INTERNAL*_SOURCE*
> :-)
> 
> We could define MEDIA_PAD_FL_INTERNAL_SOURCE
> 
> #define MEDIA_PAD_FL_INTERNAL_SOURCE 	(MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL)

One option would be to find terms different from sink and source in this
case. It would generate less confusion to map (e.g., not a really good
name) MEDIA_PAD_FL_INTERNAL_PRODUCER to MEDIA_PAD_FL_SINK and to the
sink_pad field than using MEDIA_PAD_FL_INTERNAL_SOURCE.

> but I'm not sure it would be less confusing.
> 
> Regarding isolating the sources of confusion in the framework rather
> than spreading them through drivers, I can't disagree, but I think that,
> for raw camera sensors at least, the best option would be to create a
> new camera sensor object with a much more tailored API than v4l2_subdev
> (and of course wrapping that new object in a v4l2_subdev in the
> framework). This won't address the other types of drivers, but I'm not
> sure we'll get any in the foreseable future.

-- 
Regards,

Laurent Pinchart
