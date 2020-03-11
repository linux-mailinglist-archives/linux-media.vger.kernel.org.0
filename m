Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FACA1812B6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 09:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgCKIP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 04:15:26 -0400
Received: from mga04.intel.com ([192.55.52.120]:60039 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgCKIPZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 04:15:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:15:24 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="236352943"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:15:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0FA612096B; Wed, 11 Mar 2020 10:15:19 +0200 (EET)
Date:   Wed, 11 Mar 2020 10:15:19 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 04/19] media: v4l2-fwnode: add endpoint id field to
 v4l2_fwnode_link
Message-ID: <20200311081518.GE5379@paasikivi.fi.intel.com>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
 <20200309101428.15267-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309101428.15267-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Mon, Mar 09, 2020 at 11:14:13AM +0100, Marco Felsch wrote:
> A link is between two endpoints not between two ports to be more
> precise. Add the local_id/remote_id field which stores the endpoint
> reg/port property to the link. Now the link holds all necessary
> information about a link.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> 
> v12:
> - New in this serie
> 
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 ++
>  include/media/v4l2-fwnode.h           | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 6ece4320e1d2..78c32aebbe03 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -565,6 +565,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
>  
>  	memset(link, 0, sizeof(*link));
>  
> +	fwnode_property_read_u32(__fwnode, "reg", &link->local_id);
>  	fwnode = fwnode_get_parent(__fwnode);
>  	fwnode_property_read_u32(fwnode, port_prop, &link->local_port);
>  	fwnode = fwnode_get_next_parent(fwnode);
> @@ -578,6 +579,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
>  		return -ENOLINK;
>  	}
>  
> +	fwnode_property_read_u32(fwnode, "reg", &link->remote_id);

This code really should use fwnode_graph_parse_endpoint(), and not
implement the parsing locally.

I do think the end result would be better if the code using this function
would be calling the fwnode graph APIs directly.

>  	fwnode = fwnode_get_parent(fwnode);
>  	fwnode_property_read_u32(fwnode, port_prop, &link->remote_port);
>  	fwnode = fwnode_get_next_parent(fwnode);
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index f6a7bcd13197..7bba6dfa3fd6 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -113,14 +113,18 @@ struct v4l2_fwnode_endpoint {
>   * struct v4l2_fwnode_link - a link between two endpoints
>   * @local_node: pointer to device_node of this endpoint
>   * @local_port: identifier of the port this endpoint belongs to
> + * @local_id: identifier of the id this endpoint belongs to
>   * @remote_node: pointer to device_node of the remote endpoint
>   * @remote_port: identifier of the port the remote endpoint belongs to
> + * @remote_id: identifier of the id the remote endpoint belongs to
>   */
>  struct v4l2_fwnode_link {
>  	struct fwnode_handle *local_node;
>  	unsigned int local_port;
> +	unsigned int local_id;
>  	struct fwnode_handle *remote_node;
>  	unsigned int remote_port;
> +	unsigned int remote_id;
>  };
>  
>  /**

-- 
Sakari Ailus
