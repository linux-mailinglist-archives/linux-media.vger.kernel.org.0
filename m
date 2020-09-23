Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24FE2754A5
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 11:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgIWJlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 05:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgIWJlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 05:41:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0318FC0613CE;
        Wed, 23 Sep 2020 02:41:09 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74940555;
        Wed, 23 Sep 2020 11:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600854066;
        bh=8WsagTADLofWy33Fh9JhoiYjR8SCGifunbn2ooUaAKk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bI5wgNnVtZH0ahTguXyqLstlG4CMcHW975yJpsecum6uAJel+5upDemaY9BZKGLPo
         jOiTmHgt7y+n0K1P1uZvho+2JI2xLWOyR88YxNikkge6nRDjUxPTEqyMRjoZasDsVU
         dTDX4OEyoi4+JtqMoKFGd6JR8pV6bvGVbrwjA3qg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/2] media: i2c: max9286: Use unsigned constants
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200922155210.242536-1-kieran.bingham+renesas@ideasonboard.com>
 <20200922155210.242536-2-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdXv1JRoBTT=XL+q=jwOPnTPYRZMp8pk+_M0WOGofFf0dg@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <89b1ae29-5422-8d40-8075-0b814afea9b1@ideasonboard.com>
Date:   Wed, 23 Sep 2020 10:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXv1JRoBTT=XL+q=jwOPnTPYRZMp8pk+_M0WOGofFf0dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 23/09/2020 08:42, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, Sep 22, 2020 at 5:52 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> Convert the bitfield definitions to use unsigned integers.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/media/i2c/max9286.c
>> +++ b/drivers/media/i2c/max9286.c
>> @@ -31,85 +31,85 @@
>>  #include <media/v4l2-subdev.h>
>>
>>  /* Register 0x00 */
>> -#define MAX9286_MSTLINKSEL_AUTO                (7 << 5)
>> +#define MAX9286_MSTLINKSEL_AUTO                (7U << 5)
> 
> While using this format for multi-bit fields makes sense...
> 
>>  #define MAX9286_MSTLINKSEL(n)          ((n) << 5)
>>  #define MAX9286_EN_VS_GEN              BIT(4)
>> -#define MAX9286_LINKEN(n)              (1 << (n))
>> +#define MAX9286_LINKEN(n)              (1U << (n))
> 
> ... I think single-bit fields (more below) make better use of the BIT() macro.

Ooops, I missed that, indeed that certainly looks like a BIT.

I was really trying to make sure all the 'bit-field enum' type values
are consistent here, i.e.:

#define MAX9286_I2CSLVSH_1046NS_469NS	(3U << 5)
#define MAX9286_I2CSLVSH_938NS_352NS	(2U << 5)
#define MAX9286_I2CSLVSH_469NS_234NS	(1U << 5)
#define MAX9286_I2CSLVSH_352NS_117NS	(0U << 5)

I'll sift out the single bit fields that are more appropriate for BIT().

There is also the FIELD_PREP, FIELD_GET macros that could be used
instead from include/linux/bitfield.h which are new to me, and seem
interesting but I haven't worked out if it's worth converting the whole
driver to use that yet or not.

--
Kieran


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

