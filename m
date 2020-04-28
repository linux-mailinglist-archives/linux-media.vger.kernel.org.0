Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C671A1BC0CA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgD1OLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727934AbgD1OLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:11:30 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Apr 2020 07:11:30 PDT
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA98C03C1A9
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 07:11:30 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:d03f:8af3:4e83:6587])
        by albert.telenet-ops.be with bizsmtp
        id YE6S2200U27aUyk06E6S0e; Tue, 28 Apr 2020 16:06:26 +0200
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jTQsU-0003Ly-B4; Tue, 28 Apr 2020 16:06:26 +0200
Date:   Tue, 28 Apr 2020 16:06:26 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: place CEC menu before MEDIA_SUPPORT
In-Reply-To: <32565659d6778e92bd9ac7d17622149bd95973c5.1586944045.git.mchehab+huawei@kernel.org>
Message-ID: <alpine.DEB.2.21.2004281600310.12370@ramsan.of.borg>
References: <cover.1586944045.git.mchehab+huawei@kernel.org> <32565659d6778e92bd9ac7d17622149bd95973c5.1586944045.git.mchehab+huawei@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 	Hi Mauro,

On Wed, 15 Apr 2020, Mauro Carvalho Chehab wrote:
> The only item that opens at the CEC Kconfig menu is related
> to Remote Controller. Also, its support should not depend on
> media support, so it makes sense to keep both RC and CEC together.
>
> After this change, the main media menus that are visible
> under "Device Drivers" menu are:
>
> 	<*> Remote Controller support  --->
> 	[ ] HDMI CEC RC integration (NEW)
> 	< > HDMI CEC drivers
> 	<M> Multimedia support  --->
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for your patch, which is now commit 46d2a3b964ddbe63 ("media:
place CEC menu before MEDIA_SUPPORT") in media/master.

> --- a/drivers/media/cec/Kconfig
> +++ b/drivers/media/cec/Kconfig
> @@ -11,3 +20,14 @@ config CEC_PIN_ERROR_INJ
> 	depends on CEC_PIN && DEBUG_FS
> 	help
> 	  This option enables CEC error injection using debugfs.
> +
> +config MEDIA_CEC_SUPPORT
> +	bool
> +	prompt "HDMI CEC drivers"

This is now visible in a media-less and head-less kernel...

> +	default y if !MEDIA_SUPPORT_FILTER

... and in that case even defaults to y:

     $ grep MEDIA .config
     CONFIG_MEDIA_CEC_SUPPORT=y
     # CONFIG_MEDIA_SUPPORT is not set

Is that intentional?

> +	help
> +	  Enable support for HDMI CEC (Consumer Electronics Control),
> +	  which is an optional HDMI feature.
> +
> +	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
> +	  adapter that supports HDMI CEC.
> --

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
