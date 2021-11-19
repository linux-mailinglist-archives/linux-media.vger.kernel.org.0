Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA034572EA
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 17:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236487AbhKSQbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 11:31:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:39494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233602AbhKSQbi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 11:31:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2C9C61B27;
        Fri, 19 Nov 2021 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637339316;
        bh=rg5Cdyon4OiHTuDium1Gcftq78YNbwzhGBqRz8KAg8g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JVyDYotAJKpcMHtfT8S0pjpO0poEdeQSmnzNNvlXOTcXg4N6YkDAs38+iVkl1x4QI
         FF1J1iZlrjTzeY0zmTrwF/CFh5XDmaUpH+LyhJYSIRIXR+dLDe3CZLvIW9yYAQ2/nE
         nY02YwKobj24Eisk8KteRO5HmMv7vKghqPZInXCQH9bq6l6rIw+fOKqKzyYNOspjfv
         BNwwpFnl4F1sWsdcT2gW3Kv5xefbyn4jtW8gzMpSebI5sHW+haoSkoSJXw8HL3C0qw
         lvapedB8JoQ3CHi7ksdOYcR3I4f2vxaJuJ+X7y2aLtV4OIfSE5yNRE43CMskVxRXw4
         2r4H0+QQdddDA==
Date:   Fri, 19 Nov 2021 16:28:31 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tuo Li <islituo@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        baijiaju1990@gmail.com, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: Re: [PATCH] media: isl6421: fix possible uninitialized-variable
 access in isl6421_set_voltage()
Message-ID: <20211119162831.7f3b39a0@sal.lan>
In-Reply-To: <20210731073806.60142-1-islituo@gmail.com>
References: <20210731073806.60142-1-islituo@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 31 Jul 2021 00:38:06 -0700
Tuo Li <islituo@gmail.com> escreveu:

> A memory block is allocated through kmalloc(), and its return value is
> assigned to the pointer isl6421. Then isl6421 is assigned to the
> varialbe fe->sec_priv. The function isl6421_set_voltage() is called with
> the argument fe. In this function, fe->sec_priv is assigned to isl6421.
> Thus the pointer isl6421 in the function isl6421_attach() and the function
> isl6421_set_voltage() point to the same memory. However, isl6421->is_off
> is not initialized but it is accessed at line 75:
>   if (isl6421->is_off && !is_off)
> 
> To fix this possible uninitialized-variable access, isl6421->is_off is
> initialized to false in the function isl6421_attach().
> 
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>  drivers/media/dvb-frontends/isl6421.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/dvb-frontends/isl6421.c b/drivers/media/dvb-frontends/isl6421.c
> index 43b0dfc6f453..ea101f66ea88 100644
> --- a/drivers/media/dvb-frontends/isl6421.c
> +++ b/drivers/media/dvb-frontends/isl6421.c
> @@ -185,6 +185,7 @@ struct dvb_frontend *isl6421_attach(struct dvb_frontend *fe, struct i2c_adapter
>  	isl6421->config = ISL6421_ISEL1;
>  	isl6421->i2c = i2c;
>  	isl6421->i2c_addr = i2c_addr;
> +	isl6421->is_off = false;
>  	fe->sec_priv = isl6421;

No need. The driver always initialize it:

        /* default configuration */
        isl6421->config = ISL6421_ISEL1;
        isl6421->i2c = i2c;
        isl6421->i2c_addr = i2c_addr;
        fe->sec_priv = isl6421;
 
        /* bits which should be forced to '1' */
        isl6421->override_or = override_set;
 
        /* bits which should be forced to '0' */
        isl6421->override_and = ~override_clear;
 
        /* detect if it is present or not */
        if (isl6421_set_voltage(fe, SEC_VOLTAGE_OFF)) {
                kfree(isl6421);
                fe->sec_priv = NULL;
                return NULL;
        }
 
        isl6421->is_off = true;
	^^^^^^^^^^^^^^^^^^^^^^^

(except if errors, in which case the struct is freed)

It sounds that your bot is misleading you to write an useless patch

;-)

Regards,
Mauro
