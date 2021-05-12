Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EDC37CFF2
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 19:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhELRXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 13:23:11 -0400
Received: from gofer.mess.org ([88.97.38.141]:38857 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237228AbhELQiC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 12:38:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 695A3C6387; Wed, 12 May 2021 17:36:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620837411; bh=zc9wSP/5PcWYTdlf6TKylEppKxg8dlAf3sV4hJ2wvG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X36RAd/uNzLbxW7hP2mmhN6Z+JtKLXOu9Q5uoJyKBRRsLPO3oYIXb5hIK6IpAWleJ
         7z21F7uio3/LgI73Fns+nydzX285A/DmSDwjV4yVQ5HE+Sf54wOskamBNcumZ9CLWC
         9u1Yy5+uYFtMhf5Dzy4Mu9iQZ/Yn6BRtWF2uSBLDjBlBzTM8rPCRqCMUa3eThLXah3
         +HXQ01IysGuE0Wlxb0r7SWuKrxfea4NxbuknOSEkZHGE+12Qf8p3SquiUozL4yNYVu
         jJcR2SD+qp0s5nc8/Y6smZPEh+DdhawUaJNMnHx8XMC4W+TNS0/GMzoP4UVUCSz7Vr
         XaEj7YucoHuLg==
Date:   Wed, 12 May 2021 17:36:51 +0100
From:   Sean Young <sean@mess.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rc: i2c: Fix an error message
Message-ID: <20210512163651.GA5987@gofer.mess.org>
References: <179fb4cda2b79904fc9cf1d7d8e61153e30fae6b.1620279452.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179fb4cda2b79904fc9cf1d7d8e61153e30fae6b.1620279452.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 07:38:56AM +0200, Christophe JAILLET wrote:
> 'ret' is known to be 1 here. In fact 'i' is expected instead.
> Store the return value of 'i2c_master_recv()' in 'ret' so that the error
> message print the correct error code.

Nice catch, applied!

Thanks
Sean

> 
> Fixes: acaa34bf06e9 ('media: rc: implement zilog transmitter")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/i2c/ir-kbd-i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
> index e8119ad0bc71..92376592455e 100644
> --- a/drivers/media/i2c/ir-kbd-i2c.c
> +++ b/drivers/media/i2c/ir-kbd-i2c.c
> @@ -678,8 +678,8 @@ static int zilog_tx(struct rc_dev *rcdev, unsigned int *txbuf,
>  		goto out_unlock;
>  	}
>  
> -	i = i2c_master_recv(ir->tx_c, buf, 1);
> -	if (i != 1) {
> +	ret = i2c_master_recv(ir->tx_c, buf, 1);
> +	if (ret != 1) {
>  		dev_err(&ir->rc->dev, "i2c_master_recv failed with %d\n", ret);
>  		ret = -EIO;
>  		goto out_unlock;
> -- 
> 2.30.2
