Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10FD1D3063
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 14:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgENMzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 08:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726094AbgENMy7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 08:54:59 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6134C061A0F
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:54:58 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id hi11so12500717pjb.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ykYESektuuAs4fxdwhpS+W2PEu4CUUWNtuOBpOz6IO0=;
        b=A5wxChtja0zyfIlgljKfQi2T5xChb36u8VARHty8k3274zIco0RA7tU28L2B/5VrVB
         yYI9nURQGStHKFRoz/htHb9OGEzWay7IWLZ+09QlGCucCxuJAYrbMq0pppggCVy0rM9T
         qwAqo065ulpi4cV9763sscVDXmR+li+EDCIsG1nKgF+UfleptXvrrvrCtH9yANt4Jj0R
         UJvQK+xtQOOtOxTRYrZ5pwZwVXWT1du6WY8BWagxIsETvtstrDsGvJ2NWD+xsxv1dhot
         FUh6ZRu7xiddX304QQfIj32PCbTlgscDPnnBrqMazk1H1yAMQB33IlsZ8Qq7+myiQo8m
         hvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ykYESektuuAs4fxdwhpS+W2PEu4CUUWNtuOBpOz6IO0=;
        b=Z/Ea48T7T+q1hjJsy/1z62yXInxcM9jDWJ6Ruboo5t0pHeRIRa+ckQGBiJByTjRDSF
         sJ0peygf0tuo9snrTaLKKrfwZsBSbcJ+tc0PkYf/qJ+FCfVHYv6z87HyCrXjkGw7Az/N
         RPo8t+KvzELWEyd+v+v99lgARWATzWxzCdIxxvK45Eq6L9HDI8Yrnb2OZfvWvuuiY+Jx
         /FQgRxGbXRmoIohOdWkox8vX9uvvf5suCH5x57hLgE3VR8AOggS9M11TnhKotgtZushH
         KU5Il+7SURFeYhKzaYQpTKKoFP78djv4vNMDtGDLJ20eW+JV3enTrQPRdJJqa9vIiexU
         jXNw==
X-Gm-Message-State: AOAM531Bk9nyicOUSIMT+moGQT9DKLog1A3rrJA7rTctH1LXoguB5ohz
        BNhl7jue9+P5r4wgXoAIhAVA
X-Google-Smtp-Source: ABdhPJw2mf6FeDCXmZdPz9l80fNlBw60RDF/xOoU3YnqKuL68gEvJMskLv5lSUbduGaKdF7FroE9Rg==
X-Received: by 2002:a17:90a:4d4a:: with SMTP id l10mr14743092pjh.0.1589460898132;
        Thu, 14 May 2020 05:54:58 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:406:efde:ac17:556c:1ce3:639f])
        by smtp.gmail.com with ESMTPSA id j23sm17910016pjz.13.2020.05.14.05.54.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:54:57 -0700 (PDT)
Date:   Thu, 14 May 2020 18:24:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        y@Mani-XPS-13-9360
Cc:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
Message-ID: <20200514125445.GH2877@Mani-XPS-13-9360>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512181706.GA21014@Mani-XPS-13-9360>
 <11aca587-9438-4fba-081c-b82631e96989@ideasonboard.com>
 <20200514101356.GF2877@Mani-XPS-13-9360>
 <f46ed5fc-4eb0-8841-25b8-ef6c45e7ac87@ideasonboard.com>
 <d4d0e298-b863-8c6e-c9d7-ba861a98359e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4d0e298-b863-8c6e-c9d7-ba861a98359e@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 01:27:01PM +0100, Kieran Bingham wrote:
> Hi Mani,
> 
> On 14/05/2020 12:47, Kieran Bingham wrote:
> > On 14/05/2020 11:13, Manivannan Sadhasivam wrote:
> >> Hi Kieran,
> <snip>
> 
> >>>>> +static int max9286_parse_dt(struct max9286_priv *priv)
> >>>>> +{
> >>>>> +	struct device *dev = &priv->client->dev;
> >>>>> +	struct device_node *i2c_mux;
> >>>>> +	struct device_node *node = NULL;
> >>>>> +	unsigned int i2c_mux_mask = 0;
> >>>>> +
> >>>>> +	of_node_get(dev->of_node);
> >>>>
> >>>> Why this is needed?
> >>>
> >>> Hrm .. I recall adding it to solve dt reference balancing.
> >>>
> >>> I wish I'd added a comment at the time ... as I can't recall the details
> >>> now.
> >>>
> >>
> >> I understand that it is for the refcount balancing but I certainly don't see
> >> a need for it.
> > 
> > I'll go through and try to validate this again now.
> 
> Aha, that's why:
> 
>  *	of_find_node_by_name - Find a node by its "name" property
>  *	@from:	The node to start searching from or NULL; the node
>  *		you pass will not be searched, only the next one
>  *		will. Typically, you pass what the previous call
>  *		returned. of_node_put() will be called on @from.
>  *	@name:	The name string to match against
> 
> I'll add a comment to state that it is to balance the of_node_put during
> of_find_node_by_name().
> 

Ah, right. I mostly use of_find_node_by_name() with NULL, so didn't realize
this.

And yeah, a comment would be helpful.

Thanks,
Mani

> --
> Kieran
> 
> 
> >>>>> +	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
> >>>>> +	if (!i2c_mux) {
> >>>>> +		dev_err(dev, "Failed to find i2c-mux node\n");
> >>>>> +		of_node_put(dev->of_node);
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>>>> +
> >> [...]
> >>>>
> -- 
> Regards
> --
> Kieran
