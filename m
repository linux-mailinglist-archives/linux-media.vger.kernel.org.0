Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C41D7C99F7
	for <lists+linux-media@lfdr.de>; Sun, 15 Oct 2023 18:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjJOQSA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Oct 2023 12:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjJOQSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Oct 2023 12:18:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20E0A3
        for <linux-media@vger.kernel.org>; Sun, 15 Oct 2023 09:17:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02604C433C8;
        Sun, 15 Oct 2023 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697386678;
        bh=JjwR3Iik7yapto6dZBJQNmf0aTKZs2ObMm2rWIEIAv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lxPPuJVssZgz9N8vnb7K0yqgihdBkeBkf1s4LgrGKPCKla3QnZaPSgydmKC0LHV4/
         24KSAA5TUc8AvM4RchPLogC02WW4bbwKc3j+P/mBJzBqsRYt0nyhbMacpFforE9pZx
         TkVMSSq61pPUbYU+zIrIFhbvp4HF+M/MHqJDox2k=
Date:   Sun, 15 Oct 2023 18:17:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2] staging: vc04_services: vchiq_bus: Do not kfree device
Message-ID: <2023101540-treason-unbounded-47b6@gregkh>
References: <20231009104714.142880-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009104714.142880-1-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 09, 2023 at 04:17:14PM +0530, Umang Jain wrote:
> As per device_register() documentation, this kfree() on error path will
> crash. The call to put_device() is all that is needed here to free the
> memory.
> 
> Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> index 4ac3491efe45..0076d091b9b2 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> @@ -73,7 +73,6 @@ vchiq_device_register(struct device *parent, const char *name)
>  	if (ret) {
>  		dev_err(parent, "Cannot register %s: %d\n", name, ret);
>  		put_device(&device->dev);
> -		kfree(device);
>  		return NULL;
>  	}
>  
> -- 
> 2.40.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
