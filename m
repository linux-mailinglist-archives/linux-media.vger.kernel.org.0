Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B93756C83E
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 11:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiGIJPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 05:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiGIJPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 05:15:23 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189AB5E31F
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 02:15:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 239E010029D; Sat,  9 Jul 2022 10:15:21 +0100 (BST)
Date:   Sat, 9 Jul 2022 10:15:21 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: lirc: ensure lirc device receives repeats
Message-ID: <YslHKajdVcsUT5W2@gofer.mess.org>
References: <Ysff5PEy580LIg8w@gofer.mess.org>
 <20220708084459.7472-1-marko.makela@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708084459.7472-1-marko.makela@iki.fi>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 08, 2022 at 11:44:59AM +0300, Marko Mäkelä wrote:
> Pressing a button on a remote control unit will typically lead to
> messages being sent several times per second until the button is released.
> 
> Some remote control units indicate long key presses by sending
> special "repeat" messages, for which the protocol driver calls
> rc_repeat(). Other units repeat the same message over and over,
> which will be handled by calling rc_keydown().
> 
> The function rc_keydown() never set the LIRC "repeat" flag to distinguish
> repeated messages that were sent due to a long keypress, and messages
> sent due to repeated short keypresses. While a user-space program may
> implement special logic to distinguish long keypresses, it is much simpler
> to be able to rely on the flag.
> 
> Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
> reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag.
> Commit b66218fddfd29f315a103db811152ab0c95fb054
> ("media: lirc: ensure lirc device receives nec repeats") fixed it up for
> rc_repeat() but not rc_keydown().

Perfect, thanks.

Sean

> 
> Signed-off-by: Marko Mäkelä <marko.makela@iki.fi>
> Co-developed-by: Sean Young <sean@mess.org>
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
