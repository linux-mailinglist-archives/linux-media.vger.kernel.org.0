Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD63D69D24C
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 18:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbjBTRqb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 12:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbjBTRq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 12:46:27 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFEC1F5D1
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 09:46:19 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id 6so1656667vsv.7
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2zBjaSJ62m4cqSV9WzEoy9gWty17MJq7HdF/x/Z0Pk=;
        b=Di1O/BFvyXDfltQgQBocl2jHcfGl8wATiMjc2nmp5R7njcqMSOggRX8l1SQ/8go5V2
         P6SefLOFxgkrHkKWCHPT7QmwPcb0ec6ma5ERSNxV2oxGvDa/jsXJ85k5i1nbpKCIjCzT
         qITzzIcgm+lxEvtps8DYJuQDJBhEbga6wabtm6YK3xDtnXzu+XtDVpiIPZe9QhaopjTN
         A6nEZOBzL6jJWW7pXP21YReVvzNGh1HWZU7esrHx8b60j3Sj37chr++Cmv/rFJGVnSUg
         aGtHIhSDrL0mRUARHDuR6rjEX0Ta9br3UOMa5Gav3RvseeRbP++PPW2cGVi3EZWMfB4f
         EUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2zBjaSJ62m4cqSV9WzEoy9gWty17MJq7HdF/x/Z0Pk=;
        b=p3nLrkZDrN8prjfGWlKZzwRXKyAzoVUVeQ+GqUieBdi7uW2aGA8T3S2z7D2hEqmjI9
         zoQyipy34knHqVqLjnu2H6FY1J+WIBpU4bOV02DuCHOz8CDU2tWrrPeJDCRBmLReMWX7
         D1yH8JEj2Y282qA6yO2hNvBhzjvacIW6Sb+gDE1wVOyxPxxIAhqAEsmI7HyS6WCK857D
         vqkHWuYWU6YVFir2KqGbxn8mR21XoNMaMwh6b+msq+zJnf2gF3Ir+qFuhAbeecZFjEHs
         bXWLPijF+/3r1thX/1EEP3Ilt54RUKtvSOgQgcvh1WKepJt0Xodt0gl/9ae47rIv+epo
         8dKA==
X-Gm-Message-State: AO0yUKVwYQbSVCSev77K7OnqOYfZhe7w33j/zukO3WGnHYlrOKI5MG3f
        j7Qwg0Vhn4SWV6yBsp8ldJJ9EtO6VXVtAub7xUqN4w==
X-Google-Smtp-Source: AK7set/S3rYNW4t/VnSvb5GkcPEGrnvaI09GzzlAuhXPmWRJSvckjzpZBDEtXI1lr9iK6TZeMVAhiP6+MG6ssD+QssQ=
X-Received: by 2002:a05:6102:5088:b0:412:6281:6a38 with SMTP id
 bl8-20020a056102508800b0041262816a38mr334392vsb.48.1676915178211; Mon, 20 Feb
 2023 09:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com> <20230220124101.1010317-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230220124101.1010317-1-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 20 Feb 2023 17:46:02 +0000
Message-ID: <CAPY8ntD2c0X=vyYTYRy6Lkq5xfiJX7Nk+0re5iS87n5jUnN50Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov5647: Use bus-locked i2c_transfer()
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Mon, 20 Feb 2023 at 12:41, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> The ov5647_read() functions calls i2c_master_send() and
> i2c_master_read() in sequence. However this leaves space for other
> clients to contend the bus and insert a unrelated transaction in between
> the two calls.
>
> Replace the two calls with a single i2c_transfer() one, that locks the
> bus in between the transactions.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 0b88ac6dee41..a423ee8fe20c 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -631,23 +631,29 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
>
>  static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
>  {
> -       unsigned char data_w[2] = { reg >> 8, reg & 0xff };
>         struct i2c_client *client = v4l2_get_subdevdata(sd);
> +       u8 buf[2] = { reg >> 8, reg & 0xff };
> +       struct i2c_msg msg[2];
>         int ret;
>
> -       ret = i2c_master_send(client, data_w, 2);
> +       msg[0].addr = client->addr;
> +       msg[0].flags = client->flags;
> +       msg[0].buf = buf;
> +       msg[0].len = sizeof(buf);
> +
> +       msg[1].addr = client->addr;
> +       msg[1].flags = client->flags | I2C_M_RD;
> +       msg[1].buf = buf;
> +       msg[1].len = 1;
> +
> +       ret = i2c_transfer(client->adapter, msg, 2);
>         if (ret < 0) {

i2c_transfer
* Returns negative errno, else the number of messages executed.

Is there a valid failure case where it returns 1 having done the write
but failed the read? It's deferred to the individual I2C driver, so
could quite easily be iffy.
Personally I'd be tempted to check if (ret != 2), and remap any other
positive value to -EINVAL.

Otherwise:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> -               dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> +               dev_err(&client->dev, "%s: i2c read error, reg: %x\n",
>                         __func__, reg);
>                 return ret;
>         }
>
> -       ret = i2c_master_recv(client, val, 1);
> -       if (ret < 0) {
> -               dev_dbg(&client->dev, "%s: i2c read error, reg: %x\n",
> -                               __func__, reg);
> -               return ret;
> -       }
> +       *val = buf[0];
>
>         return 0;
>  }
> --
> 2.39.0
>
