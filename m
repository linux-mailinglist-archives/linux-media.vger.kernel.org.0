Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F185266EA
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 18:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382365AbiEMQUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 12:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382362AbiEMQUp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 12:20:45 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549A5E0F6
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 09:20:43 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AB88C101BDF; Fri, 13 May 2022 17:20:41 +0100 (BST)
Date:   Fri, 13 May 2022 17:20:41 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH] iguanair: no superfluous usb_unlink_urb()
Message-ID: <Yn6FWePGyTw+QwRH@gofer.mess.org>
References: <20220512125000.8340-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512125000.8340-1-oneukum@suse.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 12, 2022 at 02:50:00PM +0200, Oliver Neukum wrote:
> Unlinking yourself while the completion handler
> is running is a NOP. Drop it.

Applied, thanks!

Sean

> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/rc/iguanair.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
> index c9cb8277723f..276bf3c8a8cb 100644
> --- a/drivers/media/rc/iguanair.c
> +++ b/drivers/media/rc/iguanair.c
> @@ -149,10 +149,8 @@ static void iguanair_rx(struct urb *urb)
>  		return;
>  
>  	ir = urb->context;
> -	if (!ir) {
> -		usb_unlink_urb(urb);
> +	if (!ir)
>  		return;
> -	}
>  
>  	switch (urb->status) {
>  	case 0:
> @@ -161,7 +159,6 @@ static void iguanair_rx(struct urb *urb)
>  	case -ECONNRESET:
>  	case -ENOENT:
>  	case -ESHUTDOWN:
> -		usb_unlink_urb(urb);
>  		return;
>  	case -EPIPE:
>  	default:
> -- 
> 2.35.3
