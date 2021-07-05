Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303F63BB962
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 10:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhGEIfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 04:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhGEIfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 04:35:46 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D9C061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 01:33:09 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6B484C63BB; Mon,  5 Jul 2021 09:33:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625473987; bh=GwwPS+w83nwueiZIUfJcVD0k0hneMjQ+PvRuZaLuzlo=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=gHG6cK2t14WMQh+cD2yu3xrEDp/Xfw/2d+HyQjBrmOwKBlhxymZtS//cuh/apmfcm
         RylwRA3T6ssn9oVuSS3Wg0W0CMBCg+pxPWNo28jQMZu9+ik2z53J6yhZCNlKsLgr0V
         lWvtKndtCeRxspM0MoBtH0Y2SV/K8RlDD48l7BJPIs46x8Gav3Rfhn4xhcJ5C+eCCw
         IgPTZ1QUc79cejQwrbSZZXxCgSGUKkJePcFeQf1Hz45u463dQcyz8Ynwq78eLHYXUO
         HCtqmFNibZ45pQvW24p2zQijLmJwhGvOM/HXihpUODQ+DGE3q84evfjrk+ibZjJVNa
         +rNEbpF6JTfbw==
Date:   Mon, 5 Jul 2021 09:33:07 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] ir-ctl: print correct transmitter count
Message-ID: <20210705083307.GA5225@gofer.mess.org>
References: <20210703150049.11917-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210703150049.11917-1-sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 03, 2021 at 04:00:49PM +0100, Sean Young wrote:
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  utils/ir-ctl/ir-ctl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
> index 3c3bcca1..66a257a7 100644
> --- a/utils/ir-ctl/ir-ctl.c
> +++ b/utils/ir-ctl/ir-ctl.c
> @@ -933,7 +933,7 @@ static int lirc_options(struct arguments *args, int fd, unsigned features)
>  		if (features & LIRC_CAN_SET_TRANSMITTER_MASK) {
>  			rc = ioctl(fd, LIRC_SET_TRANSMITTER_MASK, &args->emitters);
>  			if (rc > 0)
> -				fprintf(stderr, _("warning: %s: failed to set send transmitters: only %d available\n"), dev, rc);
> +				fprintf(stderr, _("warning: %s: failed to set send transmitters: only %d available\n"), dev, ffs(~rc) - 1);

I was mistaken; the ioctl does return the tx emitter count, not the valid
mask. 

All the existing drivers except rc-loopback return the count, not the mask.
The documentation also says so. 

I'll have to revert.

Sean

>  			else if (rc < 0)
>  				fprintf(stderr, _("warning: %s: failed to set send transmitters: %m\n"), dev);
>  		} else
> @@ -1026,8 +1026,11 @@ static void lirc_features(struct arguments *args, int fd, unsigned features)
>  				fprintf(stderr, _("warning: %s: device supports setting transmitter mask but returns 0 as number of transmitters\n"), dev);
>  			else if (rc < 0)
>  				fprintf(stderr, _("warning: %s: device supports setting transmitter mask but returns: %m\n"), dev);
> -			else
> -				printf(_(" - Set transmitter (%d available)\n"), rc);
> +			else {
> +				unsigned count = ffs(~rc) - 1;
> +
> +				printf(_(" - Set transmitter (%d available)\n"), count);
> +			}
>  		}
>  	} else if (features & LIRC_CAN_SEND_LIRCCODE) {
>  		printf(_(" - Device can send using device dependent LIRCCODE mode (not supported)\n"));
> -- 
> 2.31.1
