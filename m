Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6368AC0CB0
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfI0UgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:36:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33944 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0UgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:36:18 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so3417695otp.1;
        Fri, 27 Sep 2019 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xPwfmJP0RHwPS/Q5mW1AWaMTmkYfq9HponGBK/XGjg=;
        b=lPKC7Kwz+Fd7kiPmkVGht46oEWF23eIHKnXheSxin84SUFUk5/dlmn+GcGam6QBrvu
         k5yjdAN4l1Dyu9WhlNwonl8dRIFODWTTQUDzx6yYnqKgZdjQQIHGyoxML+oe8/VNbipQ
         td6G5HfbLzZg1Cz9yG+Ynab6uNLZB8la3p0YKO2N2PQO/tvRp7oyFWSHe8GAiM0P+k61
         w7xr3s0oNI+2zOPuHiLqyCWuXk+VO+jilAugWag/8QTGZvnumu5BiQA9xA5vwiz1pKWq
         JIFIT12dfJv1/1fHnFQiskTqjbmqR8cAZ4o4QvAApIrvX0BLTTUwbkNAOGwsu9ZtKEUk
         d8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xPwfmJP0RHwPS/Q5mW1AWaMTmkYfq9HponGBK/XGjg=;
        b=GAXT1s6IukexXNifjdZuBs1MQgbfzaT7tYBKXxSmFGAWr0mG6ByfPGTBsJLm6dd7Cz
         A3FnQkT7rn503XhysbVaGw5epnO7wVIwS/nV7mrGYKanaMiaOfljy54iyLayLRq690rA
         6XuE+JUmGWc6oH6kw3l23cV00m7i+H3hTeBsd+yTL0fwYjipKvmcVISaq4mbMld2vXXZ
         zpJDGbMNza+H3sSBhH8uxypVN36wkqK5vywc4djiLBx+OPryn4o306wQwCRNYpLgGqEi
         aGadcIy2os1qSDoTcciy+r5U/49o9JfvrE06ZqKPjOLHUgT7VfbxaEswHXNt+6ZK9vys
         kXug==
X-Gm-Message-State: APjAAAWbuD4HPg44vyjoFb7prxmINCS1H8ms2SsfweUGSKsEK0l4C8k2
        K8SH44x5/t6Y1F89t2BrGep8X0OjqrsXH9AJlv8JnPGQ/Vk=
X-Google-Smtp-Source: APXvYqx5WpbPvvkLRbb3w9N73YGeANP/8uEydwUPkM0M1z2nvDer7u8U1ZtVTab+k/5z4YJ13WkjV3EoCiFMr19ukVY=
X-Received: by 2002:a9d:721e:: with SMTP id u30mr4998992otj.44.1569616577333;
 Fri, 27 Sep 2019 13:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-4-bparrot@ti.com>
In-Reply-To: <20190927184722.31989-4-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Sep 2019 21:35:51 +0100
Message-ID: <CA+V-a8tYwWfgngkTKnpA85byqMkxERFrG7_w+pbzTDvKVpPf-g@mail.gmail.com>
Subject: Re: [Patch v4 3/8] media: i2c: ov2659: Cleanup include file list
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Several of include files listed are not explicitly needed.
> If they are need then they are implicitly included.
>
> Reduce the list of includes to an easier to manage list.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index efbe6dc720e2..f77320e8a60d 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -22,29 +22,15 @@
>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/init.h>
> -#include <linux/interrupt.h>
> -#include <linux/io.h>
>  #include <linux/i2c.h>
> -#include <linux/kernel.h>
> -#include <linux/media.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/of_graph.h>
> -#include <linux/slab.h>
> -#include <linux/uaccess.h>
> -#include <linux/videodev2.h>
>
> -#include <media/media-entity.h>
>  #include <media/i2c/ov2659.h>
> -#include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
> -#include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-image-sizes.h>
> -#include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>
>  #define DRIVER_NAME "ov2659"
> --
> 2.17.1
>
