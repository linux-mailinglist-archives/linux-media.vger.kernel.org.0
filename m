Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED362BC70B
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgKVQck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:32:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:52826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgKVQcj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:32:39 -0500
Received: from coco.lan (ip5f5ad5ca.dynamic.kabel-deutschland.de [95.90.213.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A91F20781;
        Sun, 22 Nov 2020 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606062759;
        bh=9BYVHmABgAUPEldpzXEWMpomdXZlnlcEYuPXYUPt16c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PSGNcIB9sw/yE4EXemRg9rRrflc/XYl/YKzD+lHPi2mNAqaXXKbKaYdGSO99fygeV
         Z6I46pHhp7Ogc+9AcEuFseAkHPp6rmbPX2TgMNPx19SsThYt9GGuqMwS1oirB4yKom
         LMiRKGUl0nYi7GC8GHi31Komd3BVMksp8fRoQP6s=
Date:   Sun, 22 Nov 2020 17:32:35 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 095/141] media: dvb_frontend: Fix fall-through warnings
 for Clang
Message-ID: <20201122173235.363b4547@coco.lan>
In-Reply-To: <2023134a1e897bddf48e2851bdcc53706e892e6d.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
        <2023134a1e897bddf48e2851bdcc53706e892e6d.1605896060.git.gustavoars@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 20 Nov 2020 12:36:57 -0600
"Gustavo A. R. Silva" <gustavoars@kernel.org> escreveu:

> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  drivers/media/dvb-core/dvb_frontend.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index 06ea30a689d7..fb35697dd93c 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -984,6 +984,7 @@ static int dvb_frontend_check_parameters(struct dvb_frontend *fe)
>  				 fe->ops.info.symbol_rate_max);
>  			return -EINVAL;
>  		}
> +		break;
>  	default:
>  		break;
>  	}



Thanks,
Mauro
