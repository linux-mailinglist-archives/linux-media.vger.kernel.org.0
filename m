Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B768117FE87
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgCJNf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:35:56 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41956 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgCJMnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 08:43:37 -0400
Received: by mail-lf1-f67.google.com with SMTP id q10so10000356lfo.8
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 05:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Tp+WhRfe9z22I0aaYb5f/5sPZ49iEEX8/N9J9TsNd2w=;
        b=rfZJpdeNgql+QKTxeU9+HkLjBN+sAmAviwgdRh9H3Nr6vaQlmtvlR+i/mTv2GBMcgk
         xcNterp+0uZG9sodb8zYciNObXS63itCz17iqreChxalm3xFrSZjp6LDolF/Dz6KZZ65
         3aAHu5WVqZFRZ3KaK0JfuhienTlG2tDlDqRPeFeowO12IfE3f2Tkw2aN6+g6C4JhzQGj
         MzaJJz5hbckDPLEFQXw4eF5RWQvw7MQPb2bVoD8PziVtGHHQ0coNgFiykvMLyr39QzxS
         CaV+ZQbuVIYuy/1/VYk+eUqV8Js6GJYAQs7so+lxpHROh+H7HS/vUnlweTEpIRFZqE5u
         fXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Tp+WhRfe9z22I0aaYb5f/5sPZ49iEEX8/N9J9TsNd2w=;
        b=fz3ofS0FaW/tWRLPJuLPHgChVTsjFQ9KRnfJsTJb9J5QAdcDQtN+rEbOCvDKSQbcgh
         vsgULi4mZIn32SYM1w0gZyenIxZQvcePtfzvJvlo9WShFw1dTNbeK/BWKWDCGVeL59kt
         zAVDPGt7ukVprorfByEX+RGX2BGC7yvW1UVwM/URq+pp+8P26JE/q5/bd8ePtTLLfvaV
         Lm+oX6sS/6mALWDh6x15e0PUHNrz0qSK6sc40BY8qMAVQSX9FF8KHqhs8ToweWx2H2dF
         03n0PgKPTxEdTCzCYthqmKCRTJauiUUOvxtYNzbG4RKh/WSqwalHhIiGGoZwXMgBHNmz
         4GiA==
X-Gm-Message-State: ANhLgQ00son0a2vqZfNZUgl4FgPbKlfroVfFEVRJckR0Mg+nSBX5ryk3
        DK+sKxXaqgzyttLSNxmINzRLKK09P8o=
X-Google-Smtp-Source: ADFU+vuUMVtzCh5rITN78eoNDvgLskHfJdescsUwVQx5LjTGLLf9ct9Mzy4IiFelaJLtgrDUUHo4cg==
X-Received: by 2002:a19:ad47:: with SMTP id s7mr12520609lfd.165.1583844215572;
        Tue, 10 Mar 2020 05:43:35 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id g14sm685589lfb.48.2020.03.10.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 05:43:34 -0700 (PDT)
Date:   Tue, 10 Mar 2020 13:43:34 +0100
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 1/3] media: rcar-csi2: Add support to match fwnode
 against remote or parent port
Message-ID: <20200310124334.GN2975348@oden.dyn.berto.se>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1583838364-12932-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-03-10 11:06:02 +0000, Lad Prabhakar wrote:
> The rcar-csi2 driver uses the v4l2-async framework to do endpoint matching
> instead of node matching. This is needed as it needs to work with the
> adv748x driver which register it self in v4l2-async using endpoints
> instead of nodes. The reason for this is that from a single DT node it
> creates multiple subdevices, one for each endpoint.
> 
> But when using subdevs which register itself in v4l2-async using nodes,
> the rcar-csi2 driver failed to find the matching endpoint because the
> match.fwnode was pointing to remote endpoint instead of remote parent
> port.
> 
> This commit adds support in rcar-csi2 driver to handle both the cases
> where subdev registers in v4l2-async using endpoints/nodes, by using
> match_type as V4L2_ASYNC_MATCH_CUSTOM and implementing the match()
> callback to compare the fwnode of either remote/parent.

This is a novel approach to the solution, and I won't object to it out 
right. But I think the proper solution is to move this logic into 
v4l2-async instead of adding a custom match handler in rcar-csi2.

Think of the reveres use-case, a different CSI-2 receiver who wish to 
use the ADV748x would still have this node vs. endpoint issue.

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 41 ++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index faa9fb2..39e1639 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -808,6 +808,41 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
>  	return 0;
>  }
>  
> +static bool rcsi2_asd_match(struct device *dev,
> +			    struct v4l2_async_subdev *async_sd)
> +{
> +	struct rcar_csi2 *priv = (struct rcar_csi2 *)
> +				  async_sd->match.custom.priv;
> +	struct fwnode_handle *endpoint;
> +	struct fwnode_handle *remote;
> +	struct fwnode_handle *parent;
> +	struct device_node *np;
> +	bool matched = false;
> +
> +	np = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
> +	if (!np) {
> +		dev_err(priv->dev, "Not connected to subdevice\n");
> +		return -EINVAL;

You can't return -EINVAL here as it will be interpreted as a match by 
the caller ;-).  You should not even register a device with v4l2-async 
if it's not connected to an endpoint.

> +	}
> +
> +	endpoint = of_fwnode_handle(np);
> +	remote = fwnode_graph_get_remote_endpoint(endpoint);
> +	parent = fwnode_graph_get_remote_port_parent(endpoint);
> +	if (parent) {

This is wrong, we will always have a parent and will always take this 
code path. Hence reducing this to the equivalent of node only matching.  
I applied this patch and tried on M3-N with a ADv748x and the wrong 
endpoints of the ADV7482 is routed to the two CSI-2 receivers, breaking 
it.

I added some debug printouts to explain whats going on:

    * First call
        dev: rcar-csi2 fea80000.csi2
        endpoint: /soc/csi2@feaa0000/ports/port@0/endpoint
        remote: /soc/i2c@e66d8000/video-receiver@70/port@a/endpoint
        parent: /soc/i2c@e66d8000/video-receiver@70
        dev->fwnode: /soc/csi2@fea80000
        dev->of_node: /soc/csi2@fea80000
        match: false

    * Second call
        dev: adv748x 4-0070
        endpoint: /soc/csi2@feaa0000/ports/port@0/endpoint
        remote: /soc/i2c@e66d8000/video-receiver@70/port@a/endpoint
        parent: /soc/i2c@e66d8000/video-receiver@70
        dev->fwnode: /soc/i2c@e66d8000/video-receiver@70
        dev->of_node: /soc/i2c@e66d8000/video-receiver@70
        match: true

    * Third call
        dev: adv748x 4-0070
        endpoint: /soc/csi2@fea80000/ports/port@0/endpoint
        remote: /soc/i2c@e66d8000/video-receiver@70/port@b/endpoint
        parent: /soc/i2c@e66d8000/video-receiver@70
        dev->fwnode: /soc/i2c@e66d8000/video-receiver@70
        dev->of_node: /soc/i2c@e66d8000/video-receiver@70
        match: true

Now we have a media graph that is completely probed and video devices 
register in the system but you are not able to stream video as the wrong 
CSI-2 transmitter is described in the graph to be connected to the wrong 
receiver.

This only strengthens my view that this should not be fixed with a 
custom matcher in rcar-csi2 but directly in v4l-async. Please see if you 
can't address the issue in the framework to allow node and endpoint 
matching to co-exists.

> +		if (parent == dev->fwnode ||
> +		    parent == &dev->of_node->fwnode)
> +			matched = true;
> +	} else if (remote && !matched) {

No need to check !matched here ;-)

> +		if (remote == dev->fwnode ||
> +		    remote == &dev->of_node->fwnode)
> +			matched = true;
> +	}



> +
> +	of_node_put(np);
> +
> +	return matched;
> +}
> +
>  static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  {
>  	struct device_node *ep;
> @@ -833,9 +868,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  		return ret;
>  	}
>  
> -	priv->asd.match.fwnode =
> -		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> -	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	priv->asd.match.custom.match = &rcsi2_asd_match;
> +	priv->asd.match.custom.priv = priv;
> +	priv->asd.match_type = V4L2_ASYNC_MATCH_CUSTOM;
>  
>  	of_node_put(ep);
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
