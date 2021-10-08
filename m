Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BDD426E0F
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 17:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243083AbhJHPug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 11:50:36 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:53441 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhJHPue (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 11:50:34 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B1D75100008;
        Fri,  8 Oct 2021 15:48:37 +0000 (UTC)
Date:   Fri, 8 Oct 2021 17:49:24 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] media: i2c: Copy mt9t112 soc_camera sensor driver
Message-ID: <20211008154924.nwxf5t2qikcj7ecc@uno.localdomain>
References: <20211005092521.GA19607@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005092521.GA19607@kili>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Tue, Oct 05, 2021 at 12:25:21PM +0300, Dan Carpenter wrote:
> Hello Media devs,
>
> The patch 7641b0442195: "media: i2c: Copy mt9t112 soc_camera sensor
> driver" from Mar 12, 2018, leads to the following Smatch static
> checker warning:

That commit is from me, but I just copied the code as (ugly) as it
was I didn't even have the hw to test it so I preferred not to touch
it

>
> 	drivers/media/i2c/mt9t112.c:176 __mt9t112_reg_read()
> 	warn: not copying enough bytes for '&ret' (4 vs 2 bytes)
>
> drivers/media/i2c/mt9t112.c
>     150 static int __mt9t112_reg_read(const struct i2c_client *client, u16 command)
>     151 {
>     152         struct i2c_msg msg[2];
>     153         u8 buf[2];
>     154         int ret;
>     155
>     156         command = swab16(command);
>                           ^^^^^^^^^^^^^^^
> This driver won't work on big endian systems
>
>     157
>     158         msg[0].addr  = client->addr;
>     159         msg[0].flags = 0;
>     160         msg[0].len   = 2;
>     161         msg[0].buf   = (u8 *)&command;
>     162
>     163         msg[1].addr  = client->addr;
>     164         msg[1].flags = I2C_M_RD;
>     165         msg[1].len   = 2;
>     166         msg[1].buf   = buf;
>     167
>     168         /*
>     169          * If return value of this function is < 0, it means error, else,
>     170          * below 16bit is valid data.
>     171          */
>     172         ret = i2c_transfer(client->adapter, msg, 2);
>     173         if (ret < 0)
>     174                 return ret;
>     175
> --> 176         memcpy(&ret, buf, 2);
>                        ^^^^
> And this is ugly as all heck.  I would have fixed it but there were
> so many other endian bugs and I can't test it.

Is this an endianess issue or just a complaint about the difference in
size between the number of copied bytes and the destination ?

Thanks
   j

>
>     177
>     178         return swab16(ret);
>     179 }
>
> regards,
> dan carpenter
