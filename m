Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F55422DFE
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 18:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhJEQdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 12:33:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:36396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236222AbhJEQdU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 12:33:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A009C61373;
        Tue,  5 Oct 2021 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633451489;
        bh=kFSyn5wbdxqXQcQJgh8HYZVtXpNSbbAhdCTSYWjwKtE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XlFm1Ue0KCDpcuBpq9q14jk90Yz9iNGsozNK8kcTI91KnW55HOzAFeWV+zzCKqmrd
         SnGzA9qlJK8wDhf7v6GA+In/pNjfX8icdDWoaIm3rz+rC5VttdE9ssTZ90CGdjdJr5
         FBZyPOw0V+adnj7bSNLnzDAepJ7npezan5T9Oby548UAfYnDXAXyjjcQm4cC0gIQ9P
         JcE+fdsSFN/0YsEXRHYJn0YMMza25tE3ZnZya8cXHNSQhSRuXFuS0up97UWDtMPmre
         Q1rDC4d3KaIVJwTRhaTkyEYJ28JvZaxkrz5v5tsjc3Gsh3xuy+c2mr5oYjMx/4yKr5
         KJgJRcFctI+wQ==
Date:   Tue, 5 Oct 2021 18:31:25 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH] media: Kconfig: Make DVB_CORE=m possible when
 MEDIA_SUPPORT=y
Message-ID: <20211005183125.30f7df0a@coco.lan>
In-Reply-To: <20211005105110.14082-1-lecopzer.chen@mediatek.com>
References: <20211005105110.14082-1-lecopzer.chen@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 5 Oct 2021 18:51:10 +0800
Lecopzer Chen <lecopzer.chen@mediatek.com> escreveu:

> A case that we need VIDEO_DEV=y but DVB_CORE=m, and this doesn't
> work since DVB_CORE is default MEDIA_DIGITAL_TV_SUPPORT and then
> follows MEDIA_SUPPORT.
> 
> Change to tristate to make DVB_CORE=m possible when MEDIA_SUPPORT=y
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  drivers/media/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index b07812657cee..c3baf92b4d02 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -88,7 +88,7 @@ config MEDIA_ANALOG_TV_SUPPORT
>  		will disable support for them.
>  
>  config MEDIA_DIGITAL_TV_SUPPORT
> -	bool
> +	tristate
>  	prompt "Digital TV" if MEDIA_SUPPORT_FILTER
>  	default y if !MEDIA_SUPPORT_FILTER
>  	help

While this change looks simple enough, not sure if this would work
for all possibilities. If I'm not mistaken, someone proposed
something similar to it, but it caused troubles with different
configurations. I don't recall any patch addressing it, but I
may be wrong.

Tf I remember correctly, the problem rises when either V4L or DVB
core is compiled as module and the other one is compiled builtin.
On such scenario, all drivers that depend on both should be
compiled as a module, or the build will fail.

Thanks,
Mauro
