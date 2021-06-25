Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682D23B403E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 11:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhFYJY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 05:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhFYJY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 05:24:28 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00B5C061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:22:06 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j1so9795033wrn.9
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZtBenJZiPmyi493dfRBTPI3MP3DWJjJPTKTzdT6LzVE=;
        b=SwI0/QMmDsRvDegtArYL4X0sz8x2fZt7mLCHAb8i+LlyUnjlsy4nCgJlqV25R324Ue
         TtLXlDOnulrIkC6bu6hv0LDVUBtUBRd/xyInPlv74wQ/QtAJqG+P2AdpIiO8VMzVWDwV
         sq+32oNNV1ksOCvxYboSZpMPGjl58EdlOxJW1MaPwQV5EJxB+7OWskaX7w6MKXCCjjqu
         5bg/DqfUOljlLJO5qfwsjGdXv1nyV+XaonhEGOQ1/8Yzm2lMjBjpyH6Bi0tUefDJufAp
         AGwoHQKqL+kFs6FHa069baO8SVPL5I7fTGmq7+9V9Er2AgOSmCObj/2qda0LAorB7rmP
         7cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZtBenJZiPmyi493dfRBTPI3MP3DWJjJPTKTzdT6LzVE=;
        b=DVvJudn8apqdj2UGbGC4t7+srrm1p0UT3mmbGpEXfX2/XFhNnQpZ0HJQxqwk1rjLFn
         h30AQnyZdm4GiDRB3lW+oneuWD8EFBrwq69Vr2GpPihYCam4d2XzGknNK+5ovuBbJu2P
         GIYUUjIiaaqxc6089pB0THGYtMntgVsnXVw5/uBmYIqZkuY3sJgGfLoqUQTZmegLvhjb
         bDPcixS51r7Ywj4VkIcu/n1c6+onESeodD3a96s87tCUbZyniVhPBcUlEwFj/wWWB9Hh
         SocVi4LwV9mP3jGankFC8BEfZ+4MH/LeLCW40DlhM2ZrGHlWe6djBT9Pb0RM/ewBSOyz
         PFmg==
X-Gm-Message-State: AOAM530zE3mjBEr70FJCQwgwb7ON2FMRYzBEz1anKuc5r2s10XsxZopU
        4dlkJsEJAG/ctL7tY5rwyiY=
X-Google-Smtp-Source: ABdhPJzs4iIF2wgZhzrxxY6rEtfv87AOafG9CBmIglAeSopVE6wQGn1ehmUxiKT3OOllzgKXn4tElA==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr9867962wru.225.1624612925381;
        Fri, 25 Jun 2021 02:22:05 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c07:9700:6acb:61b6:ae46:2431? ([2a00:23c4:1c07:9700:6acb:61b6:ae46:2431])
        by smtp.googlemail.com with ESMTPSA id h9sm5018662wmb.35.2021.06.25.02.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 02:22:04 -0700 (PDT)
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <CAOMZO5CxDtPa_WYEJf9dkLa8x1UthicBqB=RBJUgxKud+srsDQ@mail.gmail.com>
 <a6322fe86be905c028ede9ee2abee278266e1b35.camel@pengutronix.de>
 <fec3a57d-6b37-e5dd-4586-cdacf311159c@gmail.com>
 <CAOMZO5DFfqLnF-5rAMdWkShVipG+tpssTVxDU-SQe6FsPkZqcg@mail.gmail.com>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <2c84a673-6e5d-4940-faac-50fd972cd0fd@gmail.com>
Date:   Fri, 25 Jun 2021 10:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DFfqLnF-5rAMdWkShVipG+tpssTVxDU-SQe6FsPkZqcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 25/06/2021 02:20, Fabio Estevam wrote:
> Hi Ian,
> 
> On Wed, Jun 9, 2021 at 2:28 PM Ian Arkver <ian.arkver.dev@gmail.com> wrote:
> 
>> Page 55 of the ADV7280-M HW Ref Manual shows how the CLK and DATA lanes
>> can be (separately) forced into Ultra Low Power State. It mentions that
>> when exiting ULPS it transmits the ULPS exit sequence, though it doesn't
>> define what that sequence is. Perhaps this sequence includes
>> transitioning through LP-11 enough to keep the CSI-2 RX happy?
> 
> I measured the CLK and DATA lines and they are stuck at 0.
> 
> LP-11 means CLK and DATA at 1, right?
> 
> So this is what I tried as per your suggestion:
> 
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -505,6 +505,8 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
>          struct adv7180_state *state = to_state(sd);
>          int ret;
> 
>          ret = mutex_lock_interruptible(&state->mutex);
>          if (ret)
>                  return ret;
> @@ -512,6 +514,20 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
>          ret = adv7180_set_power(state, on);
>          if (ret == 0)
>                  state->powered = on;
> +
> +       if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
> +               pr_err("**** Put MIPI CSI in LP-11\n");
> +               adv7180_csi_write(state, 0x26, 0x00);
> +               msleep(100);
> +               adv7180_csi_write(state, 0x26, 0x80);
> +               msleep(100);
> +               adv7180_csi_write(state, 0x26, 0xc0);
> +               msleep(100);
> +               adv7180_csi_write(state, 0x26, 0xe0);
> +               msleep(100);
> +               adv7180_csi_write(state, 0x26, 0xf0);
> +               msleep(100);
> +       }

It looks like you're putting the clock and data into ULPS, but I don't 
see you clearing that mode again. It's the transition *out* of ULPS that 
I think would go through LP-11 and hopefully awaken the i.MX6 CSI.

However, I'm only guessing from the ref manual. Unfortunately I don't 
have an ADV7280-M to try it with. I've only got the BT656 versions.

Good luck!
Ian

> 
>          mutex_unlock(&state->mutex);
>          return ret;
> 
> but still see CLK and DATA at 0.
> 
> Any ideas?
> 
> Thanks,
> 
> Fabio Estevam
> 
