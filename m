Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05607C778A
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 22:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442453AbjJLUA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 16:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347375AbjJLUA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 16:00:57 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B114B7
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 13:00:55 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163d.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S60r218jTzyYt;
        Thu, 12 Oct 2023 23:00:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697140851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7hOxSULt4XYNPxlF/p34C0DMDO9CIAdsYx1ItYjtoWw=;
        b=RF6EYaNDXKuC5iDeKABgDwMaiN43f5V6rVsvkp2/LvK0LJ2LjpprCUW8DoaTTfP3/rxCjh
        mzlID5TZPoEmZRf6KJeGhbNPb1/x9BXTMIK7iOXCTzDqps7dijPT0jYKLxaLJ4kiX/KXzq
        WTk8PBZJXCNC4mHqC9Kp9Xv+3YwAVgc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697140851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7hOxSULt4XYNPxlF/p34C0DMDO9CIAdsYx1ItYjtoWw=;
        b=wvsNwNayENnnUyIVl2hICDZUVRmWqUbDjVSEMJRst+Mc4J84Ova8g7bwB1ivwfPsrzp+D+
        J/wVs3lvPuGSs7ulKuPgzG9h0JgOAR0OmMsvd4Ywv2lruBCfXlbyfhlo7sHbyNLhLt3D0d
        X+3QZsuMjHvhhSWnVoOzUjCs8XaLkCQ=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697140851; a=rsa-sha256; cv=none;
        b=PDcr7/cgh/sa7hMLg8Gn3csSg1vy7ahMAk+gGvCAZ3wDVuB01MUv4q9j2RSTOuMCyyhZf7
        htbcy+R5+54XjOWwoUcC34lmOggroH2KhW28pWvmTBQNEraWBECXNN7Pg4vj9LNCzhbkD+
        HErwB1gynRtHLIQpyWjbo424pRTYerA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 282A8634CA4;
        Thu, 12 Oct 2023 23:00:45 +0300 (EEST)
Date:   Thu, 12 Oct 2023 20:00:45 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 11/28] media: Documentation: Document S_ROUTING
 behaviour
Message-ID: <ZShQbRECoaruDkpJ@valkosipuli.retiisi.eu>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-2-sakari.ailus@linux.intel.com>
 <f31d9f76-4156-c79b-0cbc-0c5450656312@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f31d9f76-4156-c79b-0cbc-0c5450656312@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Oct 05, 2023 at 03:59:05PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:07, Sakari Ailus wrote:
> > Document S_ROUTING behaviour for different devices.
> > 
> > Generally in devices that produce streams the streams are static and some
> 
> I'm not sure what "static" means here. "Generally in devices that produce
> streams there is a fixed amount of streams..."?

Perhaps this Wordnet definition fits:

     3: showing little if any change; "a static population" [syn:
         {static}, {stable}, {unchanging}]

Similarly, we have static links in MC.

> 
> > can be enabled and disabled, whereas in devices that just transport them
> > or write them to memory, more configurability is allowed. Document this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/v4l/dev-subdev.rst    | 21 +++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index fb73a95401c3..83993775237f 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -593,6 +593,27 @@ Any configurations of a stream within a pad, such as format or selections,
> >   are independent of similar configurations on other streams. This is
> >   subject to change in the future.
> > +Device types and routing setup
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Different kinds of sub-devices have differing behaviour for route inactivation,
> 
> Would "activation" convey the same, but be a bit clearer?

I'd think so.

> 
> > +depending on the hardware. Devices generating the streams may often allow
> 
> Maybe drop the "often".

Seems fine.

> 
> > +enabling and disabling some of these or the configuration is fixed. If these
> 
> "some of these" -> "some of the routes".

Yes.

> 
> > +routes can be disabled, not declaring these routes (or declaring them without
> 
> Here also, I think "the routes" is more readable than repeating "these
> routes".

Works for me.

> 
> > +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> 
> Why is the flag sentence in parenthesis? Aren't both options of the same
> value?

It's a long sentence. This is an alternative, indeed, and I think it's
easier to read this way.

> 
> > +disable the routes while the sub-device driver retain the streams and their
> 
> What does this mean? That even if the user disables a route, the driver must
> keep the configuration that was set earlier related to that route?

Yes. As the routes remain, so does the sub-device state.

Would you instead prefer to reset it to (some) defaults? I think driver
implementation will need some code in that case.

> 
> > +configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> > +back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> > +flag unset.
> 
> So a generating device should always return all its routes with both
> G_ROUTING and S_ROUTING, right? But with disabled routes not having

Correct.

> VIDIOC_SUBDEV_STREAM_FL_ACTIVE. The text doesn't mention G_ROUTING at all.

G_ROUTING is sort of trivial in this sense --- it just returns the routes
to the user, and this is documented in the IOCTL documentation.

> 
> > +Devices transporting the streams almost always have more configurability with
> > +respect to routing. Typically any route between the sub-device's sink and source
> > +pads is possible, and multiple routes (usually up to certain limited number) may
> > +be active simultaneously. For such devices, no routes are created by the driver
> > +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> > +called on the sub-device. Such newly created routes have the device's default
> > +configuration for format and selection rectangles.
> > +
> 
> I think this paragraph is ok. But could this whole section be restructured a
> bit, as the previous paragraph gets quite confusing. Maybe:
> 
> First paragraph to explain the two different kinds of devices, and perhaps a
> mention that a route is considered disabled if either it does not exist in
> the routing table or if VIDIOC_SUBDEV_STREAM_FL_ACTIVE is not set.

If there's no route, the route isn't disabled. Or did you mean the routes
array for S_ROUTING IOCTL?

> 
> Then a paragraph for generating devices, and then a paragraph for
> transporting devices.

I'll see what I can do.

-- 
Terveisin,

Sakari Ailus
