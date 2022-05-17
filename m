Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C4352A329
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347527AbiEQNVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347695AbiEQNV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:21:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2263616C
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:21:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 80C19B818A0
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 13:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379D0C34113;
        Tue, 17 May 2022 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652793685;
        bh=ThJeWeK1MzFBhEfG0Wvan0Rdvgr0oLyF1ni85f4GH3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lFAl69HBon2hAfoLESArEbwKMp6fsvZezlJhjmTpbBvyETmM9A+3PH7eqpwZUpu6e
         j9vxPryLsdWZOQb21pQef7JQwSOmtDZh9NxwVAE07rio80rIr2lX/M2dHNmzLlQdNK
         PaqiuLHWE+bJ+m8fzXA3YaCRbugATxSwXPtHkUhiUlrx5gDrLEkrn8mkK5sY7lhwAS
         A8oCS4XchLaqUaGjoF5bNM1iomaogYJnsriVZg1e06zz1cQH6lMY4TpvJ1if5P1Pp0
         hP5UOXgPF1zwTr4/KLbUsQSvXwzfjuW6VSdbXJWEU9S0Z7qBu8ID/nonHuzmB8ub8Y
         QDgM+zPLGpt/g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nqx8f-0000KN-04; Tue, 17 May 2022 15:21:25 +0200
Date:   Tue, 17 May 2022 15:21:24 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, gushengxian@yulong.com,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Subject: Re: [PATCH 1/2] flexcop: unneeded ATOMIC
Message-ID: <YoOhVGXU/pbt2KjV@hovoldconsulting.com>
References: <20220517131109.28371-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517131109.28371-1-oneukum@suse.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 17, 2022 at 03:11:08PM +0200, Oliver Neukum wrote:
> No need for GFP_ATOMIC during probe()

Please add a "media: " prefix and use a verb (e.g. "replace") in
Subject.

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/usb/b2c2/flexcop-usb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
> index 7835bb0f32fc..98d9912a4efb 100644
> --- a/drivers/media/usb/b2c2/flexcop-usb.c
> +++ b/drivers/media/usb/b2c2/flexcop-usb.c
> @@ -446,7 +446,7 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
>  	/* creating iso urbs */
>  	for (i = 0; i < B2C2_USB_NUM_ISO_URB; i++) {
>  		fc_usb->iso_urb[i] = usb_alloc_urb(B2C2_USB_FRAMES_PER_ISO,
> -			GFP_ATOMIC);
> +			GFP_KERNEL);
>  		if (fc_usb->iso_urb[i] == NULL) {
>  			ret = -ENOMEM;
>  			goto urb_error;
> @@ -479,7 +479,7 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
>  			frame_offset += frame_size;
>  		}
>  
> -		if ((ret = usb_submit_urb(fc_usb->iso_urb[i],GFP_ATOMIC))) {
> +		if ((ret = usb_submit_urb(fc_usb->iso_urb[i],GFP_KERNEL))) {

And add the missing space after the comma here.

>  			err("submitting urb %d failed with %d.", i, ret);
>  			goto urb_error;
>  		}

Change itself looks good otherwise.

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
