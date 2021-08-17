Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0193EEB56
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbhHQLFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 07:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235827AbhHQLFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 07:05:36 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA19C061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 04:05:03 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 98A08C6459; Tue, 17 Aug 2021 12:05:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1629198300; bh=dQ41X2lNfY1nk1cv5DgLcCLl9xarFoBcFvy3s90yyew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UzLWXmfB8txnzmyuqgIoyX/BloP/F0Wrfa/Bi7+HTk9ZmRX+wL0FEZZXlybUpz9pB
         PKMm/zgqN3A/K4a3P2YhlO2XK6MS/StCJFAtdLeGTruM+Rg8kJsgZVoCRqrgI0Ffsu
         M8JWMYIoFEumq6wDDn3zqw4OduPWFEqEcaU1oYDOV/pFjjCqohBVsYUW/umEYJkHuy
         tMHx84uqnLKqSdvbFYqaZqWGbGbOkc8TPgmVqfc04jarfQ0Oal//LUU68MdgBPN6ih
         ZwtTEaCpk5zOXORiEgGWQlxzi0ykwJYlfvyYuscSH3EYLYVC+7Jilx+HWKSt8ehoUK
         PvI8D+P48Bu7Q==
Date:   Tue, 17 Aug 2021 12:05:00 +0100
From:   Sean Young <sean@mess.org>
To:     Nil Yi <teroincn@163.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: usb: tm6000:clear the freed pointer
Message-ID: <20210817110500.GB18933@gofer.mess.org>
References: <20210814105822.GA67154@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210814105822.GA67154@nilus-desk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Aug 14, 2021 at 06:58:22PM +0800, Nil Yi wrote:
> After free the ir->int_urb, the pointer need to
> be set to NULL.

Again, in the commit message please explain what code path will lead to 😱.

Thanks,

Sean

> 
> Signed-off-by: Nil Yi <teroincn@163.com>
> ---
>  drivers/media/usb/tm6000/tm6000-input.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/tm6000/tm6000-input.c b/drivers/media/usb/tm6000/tm6000-input.c
> index 84602edf3..49acb97ca 100644
> --- a/drivers/media/usb/tm6000/tm6000-input.c
> +++ b/drivers/media/usb/tm6000/tm6000-input.c
> @@ -346,6 +346,7 @@ static int __tm6000_ir_int_start(struct rc_dev *rc)
>  	ir->int_urb->transfer_buffer = kzalloc(size, GFP_ATOMIC);
>  	if (!ir->int_urb->transfer_buffer) {
>  		usb_free_urb(ir->int_urb);
> +		ir->int_urb = NULL;
>  		return err;
>  	}
>  	dprintk(1, "int interval: %d\n", dev->int_in.endp->desc.bInterval);
> -- 
> 2.17.1
> 
