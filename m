Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B678ED604
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 23:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbfKCWCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 17:02:02 -0500
Received: from gofer.mess.org ([88.97.38.141]:40763 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728117AbfKCWCC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 17:02:02 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BFA75C6402; Sun,  3 Nov 2019 22:02:00 +0000 (GMT)
Date:   Sun, 3 Nov 2019 22:02:00 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 4/8] rc/ite-cir: fix smatch warning
Message-ID: <20191103220200.GA20609@gofer.mess.org>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
 <20191103112338.22569-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103112338.22569-5-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 03, 2019 at 12:23:34PM +0100, Hans Verkuil wrote:
> Use sizeof instead of ARRAY_SIZE to fix this smatch warning:
> 
> drivers/media/rc/ite-cir.c:385 ite_tx_ir() warn: calling memset(x, y, ARRAY_SIZE());
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sean Young <sean@mess.org>

Acked-by: Sean Young <sean@mess.org>

Thanks,
Sean

> ---
>  drivers/media/rc/ite-cir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
> index 3ab6cec0dc3b..07667c04c1d2 100644
> --- a/drivers/media/rc/ite-cir.c
> +++ b/drivers/media/rc/ite-cir.c
> @@ -382,7 +382,7 @@ static int ite_tx_ir(struct rc_dev *rcdev, unsigned *txbuf, unsigned n)
>  	ite_dbg("%s called", __func__);
>  
>  	/* clear the array just in case */
> -	memset(last_sent, 0, ARRAY_SIZE(last_sent));
> +	memset(last_sent, 0, sizeof(last_sent));
>  
>  	spin_lock_irqsave(&dev->lock, flags);
>  
> -- 
> 2.23.0
