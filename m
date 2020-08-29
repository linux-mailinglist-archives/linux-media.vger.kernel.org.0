Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BD8256525
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 08:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgH2GoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 02:44:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:38340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgH2GoX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 02:44:23 -0400
Received: from coco.lan (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2985F207BB;
        Sat, 29 Aug 2020 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598683463;
        bh=Fa3ytPwbtjOSb9eP8IVzHuFxn+Gz74zrip68UY+4Fxg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=es0I5+/9eLX8edVzmtQgOmM0PI59vy+RLhrSDZRaqoB7vIvcsKNdoUgZ6ZyKYRJmE
         AbZ3mqNDwHYSrC7goKrjZ1ZRxGv3IUxMPYPfq/mIKvBfbQ8xgcEfLjAI1LNrk8raRH
         pFnOOnpklrCy/AvJ/0exohxFuwdjfI0b3c90gmL0=
Date:   Sat, 29 Aug 2020 08:44:14 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/20] media: pci: saa7164.c: Replace if(cond) BUG with
 BUG_ON
Message-ID: <20200829084414.701a02b8@coco.lan>
In-Reply-To: <20200807083548.204360-8-dwlsalmeida@gmail.com>
References: <20200807083548.204360-8-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Em Fri,  7 Aug 2020 05:35:35 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Fix the following coccinelle reports:
> 
> drivers/media/pci/saa7164/saa7164-buffer.c:254:3-6: WARNING: Use BUG_ON
> instead of if condition followed by BUG.
> 
> drivers/media/pci/saa7164/saa7164-buffer.c:261:3-6: WARNING: Use BUG_ON
> instead of if condition followed by BUG.
> 
> Found using - Coccinelle (http://coccinelle.lip6.fr)

I ended accepting those patches, but IMO, this doesn't make
the code any better.

The thing is that very few parts of the Kernel should panic if
things go sideways. I don't think that any media driver would
apply on such cases.

As pointed at:

	https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

The real fix is to use WARN_ON(), probably with something like:

	if (WARN_ON(something))
		return;

as probably the code after BUG() would be assuming that the
condition was asserted.

Regards,
Mauro

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/pci/saa7164/saa7164-buffer.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7164/saa7164-buffer.c b/drivers/media/pci/saa7164/saa7164-buffer.c
> index 289cb901985b..245d9db280aa 100644
> --- a/drivers/media/pci/saa7164/saa7164-buffer.c
> +++ b/drivers/media/pci/saa7164/saa7164-buffer.c
> @@ -250,15 +250,14 @@ int saa7164_buffer_cfg_port(struct saa7164_port *port)
>  	list_for_each_safe(c, n, &port->dmaqueue.list) {
>  		buf = list_entry(c, struct saa7164_buffer, list);
>  
> -		if (buf->flags != SAA7164_BUFFER_FREE)
> -			BUG();
> +		BUG_ON(buf->flags != SAA7164_BUFFER_FREE);
>  
>  		/* Place the buffer in the h/w queue */
>  		saa7164_buffer_activate(buf, i);
>  
>  		/* Don't exceed the device maximum # bufs */
> -		if (i++ > port->hwcfg.buffercount)
> -			BUG();
> +		BUG_ON(i > port->hwcfg.buffercount);
> +		i++;
>  
>  	}
>  	mutex_unlock(&port->dmaqueue_lock);
> @@ -302,4 +301,3 @@ void saa7164_buffer_dealloc_user(struct saa7164_user_buffer *buf)
>  
>  	kfree(buf);
>  }
> -



Thanks,
Mauro
