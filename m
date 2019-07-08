Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 648E061C9D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 11:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbfGHJ5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 05:57:14 -0400
Received: from gofer.mess.org ([88.97.38.141]:34409 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729185AbfGHJ5O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jul 2019 05:57:14 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D794C60991; Mon,  8 Jul 2019 10:57:12 +0100 (BST)
Date:   Mon, 8 Jul 2019 10:57:12 +0100
From:   Sean Young <sean@mess.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cxd2880: Add missing newline at end of file
Message-ID: <20190708095712.d7tcnsdxzk6xc5nq@gofer.mess.org>
References: <20190617143801.5077-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617143801.5077-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 17, 2019 at 04:38:01PM +0200, Geert Uytterhoeven wrote:
> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the file.

git diff says this because after patching using the diff output, files
should be byte-for-byte identifical. It does not mean there necessarily
is a problem. 

I'm not sure this worth fixing or whether it solves an actual problem;
the Kconfig is parsed correctly.

Sean

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/dvb-frontends/cxd2880/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/cxd2880/Kconfig b/drivers/media/dvb-frontends/cxd2880/Kconfig
> index 9d989676e8007264..94a8e0b936b951dd 100644
> --- a/drivers/media/dvb-frontends/cxd2880/Kconfig
> +++ b/drivers/media/dvb-frontends/cxd2880/Kconfig
> @@ -5,4 +5,4 @@ config DVB_CXD2880
>  	depends on DVB_CORE && SPI
>  	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
> -	  Say Y when you want to support this frontend.
> \ No newline at end of file
> +	  Say Y when you want to support this frontend.
> -- 
> 2.17.1
