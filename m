Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0BC3434EC
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 21:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhCUUxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 16:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhCUUxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 16:53:01 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73368C061574;
        Sun, 21 Mar 2021 13:53:01 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 161521B00046;
        Sun, 21 Mar 2021 22:52:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1616359977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2XRgUlb7NKEhKJeU8JI8swroZIl0jYCTbXWtgrWkwqk=;
        b=Cy+4tNL3ckwus/R0F6ywxNsEeDwDGYNCGpCyoD80tzqBpeMY8zTpeGFRj2vBVB6R+w4Xt4
        ItX5IVoJaAonp5GtVN1MB4rXaYyWf/Fgb5VR6P4DYlubOyvXdSqwygRFhuaqT+CeQzxiIL
        V50PdJW7Bbewj0f+jVBW4MLu6OU6AZaVLWPKT46H3G+PMoUDjAMTc5AM17/hcjukhN0voO
        dCJAH/zYcJJQxL18dHBPHXOboyYGOw5KqlrZp63RBEAWg59FF/InfrLSDmJbK6IhySbyKv
        cUAjgJ8FIKrBqlR9/TmfoCDfuvE1NGJOe10f7rV8Qk7hP1Qk0FQjRQwwTUSttw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1B654634C87;
        Sun, 21 Mar 2021 22:49:31 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lO54C-0004Fo-4k; Sun, 21 Mar 2021 22:52:56 +0200
Date:   Sun, 21 Mar 2021 22:52:56 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/19] media: v4l2-subdev: De-deprecate init() subdev
 op
Message-ID: <20210321205256.GE3@valkosipuli.retiisi.eu>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
 <20210319164148.199192-6-jacopo+renesas@jmondi.org>
 <YFYX1KHi74XPEWLi@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFYX1KHi74XPEWLi@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1616359977; a=rsa-sha256;
        cv=none;
        b=Jv7JMz9B3XXJ2/BOIwoQ6ks7O6AJdKkJP8YuayhiU1poSssNHKGg8KLPB/YpeRTxcGPLpl
        5ZQraxO6e3kH0ObEUJySyVuAS9qqRJ5zNrH1qKW8RZ0qm54ptDUEpt2rPUJM6bQ+VSB3hZ
        s+Sq94A4whlJ9PA4wZ2+5iWRKFwYaQTSXwcvDYZsaELORfxSDQXH6tQHecCZRi4q2EXFPg
        5+zALoIW4mSEgKmpY2QpKTZi4PrWjP6EmAnqZfPbaU9rg2PgqQqGHI9OaSSjpsBE9oBHMv
        jgegE1xL2pSKTfeduNRdZrg/c6gx6bEa7PZc9cYp9Ulu9uKZB1m5k6mv1zFvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1616359977;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2XRgUlb7NKEhKJeU8JI8swroZIl0jYCTbXWtgrWkwqk=;
        b=SwXBroY3ZVNUxwqpQD6DnMW4S8V+mo+02X/IL+mFQIVGQa4L+4zSPvIGHoEPoKPucuPGVR
        DEHbBObOhOVAKl8sjesSJ6w9nUOC7kt3ZjDKnOXXCmLuyMHjJG7R8xjuZJS2QhBeyRIJaz
        fcMvgo/T+09Q1YdqiUe4qfhF9mqiZyZCYIvq17wVs4JuA7ejR/gKk9kNrukClH9zLBtFwq
        TiB7oYQJjlbVcfs9X4egRUyj1sgNDK0fvmkPKwoU5MTuj3b2fe7vjh4oP6Bo+xTr6Ekyzw
        8pjBXTveng4wo8j6K0pTJ6ZXQkqgoGbEiPg7frbXYJrJy3MbKUnTWg/57msKiA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Jacopo,

Thanks for cc'ing me.

On Sat, Mar 20, 2021 at 05:42:12PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> CC'ing Sakari on v3 to get feedback.
> 
> On Fri, Mar 19, 2021 at 05:41:34PM +0100, Jacopo Mondi wrote:
> > The init() subdev core operation is deemed to be deprecated for new
> > subdevice drivers. However it could prove useful for complex
> > architectures to defer operation that require access to the
> > communication bus if said bus is not available (or fully configured)
> > at the time when the subdevice probe() function is run.
> > 
> > As an example, the GMSL architecture requires the GMSL configuration
> > link to be configured on the host side after the remote subdevice
> > has completed its probe function. After the configuration on the host
> > side has been performed, the subdevice registers can be accessed through
> > the communication bus.

What does the remote device's probe do that needs to be done before bus
config on the host side?

Alternatively, could the remote init() work be done at the time streaming
is started?

> > 
> > In particular:
> > 
> > 	HOST			REMOTE
> > 
> > 	probe()
> > 	   |
> > 	   ---------------------> |
> > 				  probe() {
> > 				     bus config()
> > 				  }
> > 	   |<--------------------|
> > 	v4l2 async bound {
> > 	    bus config()
> > 	    call subdev init()
> > 	   |-------------------->|
> > 				 init() {
> > 				     access register on the bus()
> > 				}
> > 	   |<-------------------
> > 	}
> > 
> > In the GMSL use case the bus configuration requires the enablement of the
> > noise immunity threshold on the remote side which ensures reliability
> > of communications in electrically noisy environments. After the subdevice
> > has enabled the threshold at the end of its probe() sequence the host
> > side shall compensate it with an higher signal amplitude. Once this
> > sequence has completed the bus can be accessed with noise protection
> > enabled and all the operations that require a considerable number of
> > transactions on the bus (such as the image sensor configuration
> > sequence) are run in the subdevice init() operation implementation.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d0e9a5bdb08b..3068d9940669 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -148,9 +148,18 @@ struct v4l2_subdev_io_pin_config {
> >   *	each pin being configured.  This function could be called at times
> >   *	other than just subdevice initialization.
> >   *
> > - * @init: initialize the sensor registers to some sort of reasonable default
> > - *	values. Do not use for new drivers and should be removed in existing
> > - *	drivers.
> > + * @init: initialize the subdevice registers to some sort of reasonable default
> > + *	values. Do not use for new drivers (and should be removed in existing
> > + *	ones) for regular architectures where the image sensor is connected to
> > + *	the host receiver. For more complex architectures where the subdevice
> > + *	initialization should be deferred to the completion of the probe
> > + *	sequence of some intermediate component, or the communication bus
> > + *	requires configurations on the host side that depend on the completion
> > + *	of the probe sequence of the remote subdevices, the usage of this
> > + *	operation could be considered to allow the devices along the pipeline to
> > + *	probe and register in the media graph and to defer any operation that
> > + *	require actual access to the communication bus to their init() function
> > + *	implementation.
> >   *
> >   * @load_fw: load firmware.
> >   *

-- 
Kind regards,

Sakari Ailus
