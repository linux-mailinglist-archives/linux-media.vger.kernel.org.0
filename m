Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC61182DEA
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgCLKhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:37:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:29068 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbgCLKhL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:37:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:37:10 -0700
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; 
   d="scan'208";a="232008288"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:37:08 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7A1CB208BB; Thu, 12 Mar 2020 12:37:06 +0200 (EET)
Date:   Thu, 12 Mar 2020 12:37:06 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v13 04/21] media: v4l2-fwnode: fix v4l2_fwnode_parse_link
 handling
Message-ID: <20200312103706.GM5379@paasikivi.fi.intel.com>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
 <20200312103156.3178-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312103156.3178-5-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Thu, Mar 12, 2020 at 11:31:39AM +0100, Marco Felsch wrote:
> Currently the driver differentiate the port number property handling for
> ACPI and DT. This is wrong as because ACPI should use the "reg" val too
> [1].
> 
> [1] https://patchwork.kernel.org/patch/11421985/
> 
> Fixes: ca50c197bd96 ("[media] v4l: fwnode: Support generic fwnode for parsing standardised properties")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 6ece4320e1d2..d56eee9c09b8 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -560,7 +560,7 @@ EXPORT_SYMBOL_GPL(v4l2_fwnode_endpoint_alloc_parse);
>  int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
>  			   struct v4l2_fwnode_link *link)
>  {
> -	const char *port_prop = is_of_node(__fwnode) ? "reg" : "port";
> +	const char *port_prop = "reg";
>  	struct fwnode_handle *fwnode;
>  
>  	memset(link, 0, sizeof(*link));

I'd omit this patch. With this change, the parsing is no longer compatible
with previous definition (now deprecated) that use the "port" property.

We don't really need to address this for v4l2_fwnode_parse_link(), but
rather should change the users to use other APIs. No driver supporting ACPI
uses this anyway so it's not really an issue right now.

-- 
Regards,

Sakari Ailus
