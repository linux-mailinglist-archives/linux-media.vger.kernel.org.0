Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81604293D5A
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 15:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407465AbgJTNbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 09:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407459AbgJTNby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 09:31:54 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239E1C0613CE;
        Tue, 20 Oct 2020 06:31:53 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1734E634C87;
        Tue, 20 Oct 2020 16:31:47 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kUrjw-0000Eg-6T; Tue, 20 Oct 2020 16:31:48 +0300
Date:   Tue, 20 Oct 2020 16:31:48 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount
 in software_node_get_next_child
Message-ID: <20201020133148.GB843@valkosipuli.retiisi.org.uk>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-4-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Oct 19, 2020 at 11:58:57PM +0100, Daniel Scally wrote:
> The software_node_get_next_child() function currently does not hold a kref
> to the child software_node; fix that.
> 
> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- split out from the full software_node_graph*() patch
> 
>  drivers/base/swnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index f01b1cc61..741149b90 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -450,7 +450,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>  		c = list_next_entry(c, entry);
>  	else
>  		c = list_first_entry(&p->children, struct swnode, entry);
> -	return &c->fwnode;
> +	return software_node_get(&c->fwnode);

I believe similarly, the function should drop the reference to the previous
node, and not expect the caller to do this. The OF equivalent does the
same.

>  }
>  
>  static struct fwnode_handle *

-- 
Kind regards,

Sakari Ailus
