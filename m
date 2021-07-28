Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C83D93C8
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 19:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhG1RDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 13:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhG1RDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 13:03:55 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B624C061757;
        Wed, 28 Jul 2021 10:03:53 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D412D1B000A4;
        Wed, 28 Jul 2021 20:03:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1627491829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hLTlzQdC4bbZBLnDGcey9aboeLOU8xanzofot8ssD9c=;
        b=f8xdByFFBoyTcGXhi54obpd3BJEYr0a5HRo8e+Vpfa/6njH5wf6D6OXyJ69XNSFu+NOq+Z
        ExR040VkiK+jOIKnjJvZxyDdGiy+amZNdljaEFzVLW//mbGBrKrLDeId+YCq57Cf9YYAZT
        stZuDtTGl8l4/ivzzMU8fZ/A/GEoQluevKbr8Dh68KLrQI91YdBVjwDdXeu+EHHt/utPbY
        SHB/3/QfIgeoo3Kwtf2m4P6uCoclCgmN/65OJ+5y2mMcx2llH6OHJbz70JCaAtT1utU0od
        +g4HlZYP7XO5TjtTPnhOwppxx7p2md6z9O6w+LXzNkfNQo2lpEIWUnC/y/krRg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7E7D2634C87;
        Wed, 28 Jul 2021 20:03:05 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m8my1-0001X5-AF; Wed, 28 Jul 2021 20:03:37 +0300
Date:   Wed, 28 Jul 2021 20:03:37 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <20210728170337.GD3@valkosipuli.retiisi.eu>
References: <20210722075727.806572-1-niklas.soderlund+renesas@ragnatech.se>
 <20210727131627.GI3@valkosipuli.retiisi.eu>
 <YQALXnYpM+4jdH5r@oden.dyn.berto.se>
 <20210727171821.GN3@valkosipuli.retiisi.eu>
 <YQBIpRdwwd5hnMU+@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YQBIpRdwwd5hnMU+@oden.dyn.berto.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1627491829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hLTlzQdC4bbZBLnDGcey9aboeLOU8xanzofot8ssD9c=;
        b=ZVv56h69jgz5fXqxbZv9EjghONClh7dYEO2iKZbnLogitOenjJa5k0nroxeO8soTXDxx+f
        9uRVWOlT/jVhM9+gU8DQNxtHZDudf6+QCqs8EzoXXdHyHn5pBHDHAFRFCI7EmMFSNIDibB
        fPWRehx3JhKhLWbvWXyQgldaMoAXpi8CUV18geTLJqwX7xVIlOuCK0Xe/Lhne3eGBRW0uO
        3cLRcqKS/GTPho2PEPWWzoFOZXWxYpG2iAO39kg6s7K+h+fAJIGspOTSVZb+BJzdq5Lnx3
        zHjkeWtkhhUzIira2RbPvH3WA0e9lYxxejiNYQwBBzcoNFzC72szRvxShj3x7Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1627491829; a=rsa-sha256;
        cv=none;
        b=Kre0UXv+LsmyI8YLsZfESTk0WIZAPzk5czsENhj7xPxcnD/0IdWq7OyIV41rUWslQytnVX
        tEHEGSfJE5xaO/jDxmvnNoHp+X1gwPhDnJxq4mr3eREbQ5aD982CUYOz+z2+ZiW3UdDLza
        9OXMT8Zo5cR7w6fQQn7W3CwaIijPbNROUj3vYrSckysUc9IdPkbmpfuPdZv3CL+JbyPy8S
        BT/iVTBjBiddGo5tM8fS2F46f5Dp0uMczOKOkmA8CS2mkDM8PYpzqx718o/wRiApp2XVxI
        0UqEDcC2CtDFoqSjg7SKCX8g3feY9sD/UhvqvaQCatuYIwecTgKzef7IvuO2rg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hej Niklas,

On Tue, Jul 27, 2021 at 07:55:49PM +0200, Niklas Söderlund wrote:
...
> > > > > +static const struct v4l2_subdev_pad_ops risp_pad_ops = {
> > > > > +	.set_fmt = risp_set_pad_format,
> > > > > +	.get_fmt = risp_get_pad_format,
> > > > 
> > > > Maybe set link_validate to v4l2_subdev_link_validate_default?
> > > 
> > > I thought about that but with the multiplexed stream issue I thought it 
> > > best to not to add that yet. Do you think this make sens?
> > 
> > What would be the alternative? Without that, there's no guarantee
> > whatsoever what the input is. It may also enable writing user space that
> > breaks after fixing this in the driver.
> 
> We still still don't have any guarantees whatsoever as we can only 
> describe and validate one stream.
> 
> > 
> > Where in the pipeline would you have multiple streams over a single data
> > path?
> 
> On Gen3 platforms without an ISP we have it on the rcar-csi2 sink pad 
> and on Gen3 platforms with an ISP we have it on the rcar-isp sink pad.  
> In both cases it's the IP block that separates the CSI-2 buss to the 
> different capture engines.

Ok. In this case the driver may be better merged to the staging tree or
labelled experimental as its UAPI isn't stable. I wonder what Hans thinks.

-- 
Kind regards,

Sakari Ailus
