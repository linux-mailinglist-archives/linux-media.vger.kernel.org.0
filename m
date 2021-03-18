Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58C334024A
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 10:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhCRJoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 05:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhCRJng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 05:43:36 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5683C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 02:43:35 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ACF4DC637B; Thu, 18 Mar 2021 09:43:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1616060611; bh=efRirhTVUVgQFLUpntmZzzDeTbIsB48CD9Z4UsoOfh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ChU5GYo7nkWo/5zZOLaEU2otzE5sA8rZzlU/Kbv1zPBEFmz/SzvaumzEwCYRwEl5h
         RSzryl61Wc6ljzduJdTHKbbkqoSyI5t8IP2n4j++I9pXJNaKCujVaAps6X7yWKGWEK
         V0jDmumKRPRr0N2DQKWD2YjBeJq/VEiQ2jaSb0IgBI4MA0L+kychVFFiC2XDTdvKAq
         aNDT3GQ7LM3buYukEzIQX98c221AOweNntet4w/WKIKRVAh2HRiRlm/os6Qk1jAx1z
         BUsDsoXja8rL2efFrHoyMOHoNlsyf7pWsJPUccP+I+AQQ2Ff9Eymi8M9CM12saX731
         J45r2y7fsKeLg==
Date:   Thu, 18 Mar 2021 09:43:31 +0000
From:   Sean Young <sean@mess.org>
To:     Leonardo Brondani Schenkel <leonardo@schenkel.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] Add extra keys for rc6-mce
Message-ID: <20210318094331.GA31494@gofer.mess.org>
References: <288ddcee-15d1-90b7-8d52-4519faa56ea4@schenkel.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288ddcee-15d1-90b7-8d52-4519faa56ea4@schenkel.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Leonardo,

On Wed, Mar 17, 2021 at 10:59:56PM +0100, Leonardo Brondani Schenkel wrote:
> (This is my first time sending a patch to this project. I hope I'm doing it
> right. This is not necessarily meant to be merged as-is.)
> 
> Over the years I have compiled a list of known MCE remote keys from multiple
> sources. Unfortunately I have not written down those sources, but I remember
> that among them there were IR databases such as the one from Logitech
> Harmony, and also some web pages.
> 
> I noticed that the RC6-MCE keymap is missing a few of them, so I am
> submitting a patch to include them.
> 
> I have a Harmony remote and also a JP1 programmable remote and I personally
> tested all those keys.
> 
> I added comments in the diff after the fact to communicate to this list what
> the buttons are on the remote, so you can know why the specific key was
> chosen.

I can't see those comments.

> ---
>  utils/keytable/rc_keymaps/rc6_mce.toml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/utils/keytable/rc_keymaps/rc6_mce.toml
> b/utils/keytable/rc_keymaps/rc6_mce.toml
> index 1ee9c722..672fa763 100644
> --- a/utils/keytable/rc_keymaps/rc6_mce.toml
> +++ b/utils/keytable/rc_keymaps/rc6_mce.toml
> @@ -44,24 +44,32 @@ variant = "rc6_mce"
>  0x800f0425 = "KEY_TUNER"
>  0x800f0426 = "KEY_EPG"
>  0x800f0427 = "KEY_ZOOM"
> +0x800f0428 = "KEY_OPEN" # Open/Close
> +0x800f0429 = "KEY_WAKEUP" # Power on (discrete)
> +0x800f042a = "KEY_SLEEP" # Power off (discrete)

Thank you for your patch. These files are generated from the linux kernel
tree. Your patch should modifiy drivers/media/rc/keymaps/rc-rc6-mce.c,
and then utils/keytable/rc_keymaps/rc6_mce.toml will be regenerated from
it.

Your patch also requires a Signed-off-by line.

Have a look through:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Many thanks

Sean

>  0x800f0432 = "KEY_MODE"
>  0x800f0433 = "KEY_PRESENTATION"
>  0x800f0434 = "KEY_EJECTCD"
>  0x800f043a = "KEY_BRIGHTNESSUP"
> +0x800f043b = "KEY_EXIT" # Exit/Close (Alt+F4 in Windows)
>  0x800f0446 = "KEY_TV"
>  0x800f0447 = "KEY_AUDIO"
>  0x800f0448 = "KEY_PVR"
>  0x800f0449 = "KEY_CAMERA"
>  0x800f044a = "KEY_VIDEO"
> +0x800f044b = "KEY_ANGLE" # DVD angle
>  0x800f044c = "KEY_LANGUAGE"
>  0x800f044d = "KEY_TITLE"
>  0x800f044e = "KEY_PRINT"
> +0x800f044f = "KEY_DISPLAYTOGGLE" # Display
>  0x800f0450 = "KEY_RADIO"
> +0x800f0451 = "KEY_TITLE" # Title
>  0x800f045a = "KEY_SUBTITLE"
>  0x800f045b = "KEY_RED"
>  0x800f045c = "KEY_GREEN"
>  0x800f045d = "KEY_YELLOW"
>  0x800f045e = "KEY_BLUE"
> +0x800f0464 = "KEY_GAMES" # Xbox
>  0x800f0465 = "KEY_POWER2"
>  0x800f0469 = "KEY_MESSENGER"
>  0x800f046e = "KEY_PLAYPAUSE"
> -- 
> 2.31.0
> 


