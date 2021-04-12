Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548A735C26E
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238974AbhDLJn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:43:56 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43025 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242209AbhDLJk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:40:29 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8F3C740007;
        Mon, 12 Apr 2021 09:40:09 +0000 (UTC)
Date:   Mon, 12 Apr 2021 11:40:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Martiros Shakhzadyan <vrzh@vrzh.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Minor code style changes
Message-ID: <20210412094048.gxnndzkbqv7tvykc@uno.localdomain>
References: <20210412023558.360103-1-vrzh@vrzh.net>
 <20210412023558.360103-4-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412023558.360103-4-vrzh@vrzh.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martiros,

On Sun, Apr 11, 2021 at 10:35:58PM -0400, Martiros Shakhzadyan wrote:
> Fixed line continuation and parenthesis alignment issues.
>
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
>
> squashme

This line should probably be dropped :)

> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 912eadaffc44..90a985ee25fa 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -49,8 +49,8 @@ static int ov2722_read_reg(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>
> -	if (data_length != OV2722_8BIT && data_length != OV2722_16BIT
> -	    && data_length != OV2722_32BIT) {
> +	if (data_length != OV2722_8BIT && data_length != OV2722_16BIT &&
> +	    data_length != OV2722_32BIT) {

Does checkpatch report this one ?

>  		dev_err(&client->dev, "%s error, invalid data length\n",
>  			__func__);
>  		return -EINVAL;
> @@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
>  }
>
>  static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
> -	struct ov2722_write_ctrl *ctrl,
> -	const struct ov2722_reg *next)
> +					     struct ov2722_write_ctrl *ctrl,
> +					     const struct ov2722_reg *next)

These are probably 2 separate changes, but give this is just a style
fix I think it's ok...

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>



>  {
>  	if (ctrl->index == 0)
>  		return 1;
> --
> 2.31.1
>
