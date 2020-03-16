Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240031874DD
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 22:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732685AbgCPVkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 17:40:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35300 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732636AbgCPVkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 17:40:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id 5so8287995lfr.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XIb0HywwZSGGeXEBFDR2OGd+0Gx/iAYi9lxh7npWhWc=;
        b=LeLFDQpM521goGky/u7FJOx5IX4DOfcauaTtbE2qR0ZHEOUs9oDhe9MlPJUYeXxncn
         prm58VZ3nt9zZf2xRc2JUef2xyg/gyqu9/gtH1NsqTeJvKVMPUz2UuabkRwhaU73hunV
         Ic3SB0YfV8DdrB/+ilFNP1psgRh0bd+pcvQu5KeGlJvuInJZhpnjgjUPVxkckC//Nafd
         /TtEGvfFIoarZefKxd67pTsSlpA7cL94Ped/pTeiLYJ/s/b9KS3NpkLQx3H99jISnCzx
         /MfyQ3gDj809pDPZQiS6s6VUja899LEoYNlyKS6M5YCgfdLFDascz6Xo1eISiC/ZE6sQ
         KFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XIb0HywwZSGGeXEBFDR2OGd+0Gx/iAYi9lxh7npWhWc=;
        b=jZ3rBL5948Rll6Jx2KISOQeZ5VIcvSOh7mtNaIe57fBElOnrBj1rb4RNhKYwH0O134
         y2twG6SGWeMaqZ9VSgSADP6x6XwX56D79+yenJxCoKq9BERiSLGryOdiv8YpOjxL3oIj
         u6CAww/zG87H0VBpm4H35B8hbSolnaBD+4Mi5+1Dtx8IWZmJTv+t9MaitqI3BTBUNQw8
         YgPDqPzbMeyWLoOlQqOYkibzTCoRpd6hKGwiggUYP1rb82N5mvUg2rFPHSEi9Il1xpcO
         MzZhq0Km7P4Y2bw3zr5P3Cro9CM4PFb/qKv7JLHGJoaKv4vlnWBzajpz9dlAoDuuOLWH
         8UXQ==
X-Gm-Message-State: ANhLgQ23pIJqqoBG2o5ywTUcE+P8B8HVHydIZO1npd35xBI2RPfOU9nz
        ECkDHcp1F2QvzXq8KrJXtiCThGdUfMY=
X-Google-Smtp-Source: ADFU+vuz178uc+hRVspar7u0Lg03x5XDZub3SRouy29SI6+Ug+/7NytLEmkypA/iAEZXz20jdUMOFw==
X-Received: by 2002:a19:ac41:: with SMTP id r1mr835957lfc.113.1584394814037;
        Mon, 16 Mar 2020 14:40:14 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id u21sm778611lfo.37.2020.03.16.14.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 14:40:13 -0700 (PDT)
Date:   Mon, 16 Mar 2020 22:40:12 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
Message-ID: <20200316214012.GB2324872@oden.dyn.berto.se>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2020-03-15 14:55:11 +0200, Laurent Pinchart wrote:
> fwnode matching was designed to match on nodes corresponding to a
> device. Some drivers, however, needed to match on endpoints, and have
> passed endpoint fwnodes to v4l2-async. This works when both the subdev
> and the notifier use the same fwnode types (endpoint or device), but
> makes drivers that use different types incompatible.
> 
> Fix this by extending the fwnode match to handle fwnodes of different
> types. When the types (deduced from the node name) are different,
> retrieve the device fwnode for the side that provides an endpoint
> fwnode, and compare it with the device fwnode provided by the other
> side. This allows interoperability between all drivers, regardless of
> which type of fwnode they use for matching.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I tested this on R-Car CSI-2 and ADV748x without any regressions. As 
Jacopo already pointed out it's similar to what have been tried before 
and have the potential problem for new transmitters registering multiple 
endpoints (like ADV748x) being used together with older receivers who 
register a single device node in v4l-async. But this do not introduce 
any regressions and is a good first step to move everything to endpoint 
matching.

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Maybe a info message should be logged if a match is made between 
endpoint and node? It would make it easy to spot if one needs to debug a 
miss match and would be a clear message one driver should be moved to 
endpoint matching. Maybe adding such a log message would count as a 
regression for some.

> ---
> This has been compile-tested only. Prabhakar, could you check if it
> fixes your issue ?
> 
>  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..995e5464cba7 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
>  
>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
> -	return sd->fwnode == asd->match.fwnode;
> +	struct fwnode_handle *other_fwnode;
> +	struct fwnode_handle *dev_fwnode;
> +	bool asd_fwnode_is_ep;
> +	bool sd_fwnode_is_ep;
> +	const char *name;
> +
> +	/*
> +	 * Both the subdev and the async subdev can provide either an endpoint
> +	 * fwnode or a device fwnode. Start with the simple case of direct
> +	 * fwnode matching.
> +	 */
> +	if (sd->fwnode == asd->match.fwnode)
> +		return true;
> +
> +	/*
> +	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> +	 * endpoint or a device. If they're of the same type, there's no match.
> +	 */
> +	name = fwnode_get_name(sd->fwnode);
> +	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +	name = fwnode_get_name(asd->match.fwnode);
> +	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +
> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> +		return false;
> +
> +	/*
> +	 * The sd and asd fwnodes are of different types. Get the device fwnode
> +	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> +	 */
> +	if (sd_fwnode_is_ep) {
> +		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> +		other_fwnode = asd->match.fwnode;
> +	} else {
> +		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> +		other_fwnode = sd->fwnode;
> +	}
> +
> +	fwnode_handle_put(dev_fwnode);
> +
> +	return dev_fwnode == other_fwnode;
>  }
>  
>  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
