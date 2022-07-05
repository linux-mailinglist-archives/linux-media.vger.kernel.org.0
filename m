Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B168D5675F1
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 19:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiGERn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 13:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiGERn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 13:43:58 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2681C92A
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 10:43:57 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0012310007B; Tue,  5 Jul 2022 18:43:55 +0100 (BST)
Date:   Tue, 5 Jul 2022 18:43:55 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: Always report LIRC repeat flag
Message-ID: <YsR4W3B6JErTCDrS@gofer.mess.org>
References: <20220705085358.44418-1-marko.makela@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220705085358.44418-1-marko.makela@iki.fi>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Tue, Jul 05, 2022 at 11:53:58AM +0300, Marko Mäkelä wrote:
> The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
> Previously it was only set by rc_repeat(), but not all protocol
> decoders invoke that function.

This should say _why_ you are making this change, not _what_ the change
is. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

This also applies the first line of the commit.

Thanks
Sean

> 
> Signed-off-by: Marko Mäkelä <marko.makela@iki.fi>
> ---
>  drivers/media/rc/rc-main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index b90438a71c80..d914197245eb 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -786,7 +786,8 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
>  			  dev->last_toggle   != toggle);
>  	struct lirc_scancode sc = {
>  		.scancode = scancode, .rc_proto = protocol,
> -		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
> +		.flags = (toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
> +		(!new_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),
>  		.keycode = keycode
>  	};
>  
> -- 
> 2.36.1
