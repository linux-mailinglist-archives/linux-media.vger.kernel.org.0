Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0C82114B4
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 23:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgGAVDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 17:03:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGAVDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 17:03:55 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66530556;
        Wed,  1 Jul 2020 23:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593637432;
        bh=TyqOYY5bPX6PzpPTn6UuigSjdI+MbC4/QJcZTARm6N8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GYz8WtwAmke1VrHccMfs4aFu+eIxZX/GXFJkN9TBdI4OIF5PRSP/I3pt66ZpnTmgw
         TS1JCmC/ILwY7ExuPfVRafdCRtn+b9wbvJ7kKuEDMZ241gX3dsPFPq4nC+9c3r4ypM
         AL2qyhMKjZFIz0SXshFmO1zpwXh5sDOshF5HlLAg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 1/4] device property: Add a function to test is a
 fwnode is a graph endpoint
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c5087cd5-ff4f-3c62-2b38-2dee549e47bb@ideasonboard.com>
Date:   Wed, 1 Jul 2020 22:03:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 01/07/2020 07:21, Laurent Pinchart wrote:
> Drivers may need to test if a fwnode is a graph endpoint. To avoid
> hand-written solutions that wouldn't work for all fwnode types, add a
> new fwnode_graph_is_endpoint() function for this purpose. We don't need
> to wire it up to different backends for OF and ACPI for now, as the
> implementation can simply be based on checkout the presence of a
> remote-endpoint property.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Great, this makes the usage in [2/4] much more readable, and isolates
the internal knowledge of fw_node_properties where it should be.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  include/linux/property.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 10d03572f52e..9f805c442819 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -389,6 +389,11 @@ struct fwnode_handle *
>  fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
>  			     u32 endpoint);
>  
> +static inline bool fwnode_graph_is_endpoint(struct fwnode_handle *fwnode)
> +{
> +	return fwnode_property_present(fwnode, "remote-endpoint");
> +}
> +
>  /*
>   * Fwnode lookup flags
>   *
> 

