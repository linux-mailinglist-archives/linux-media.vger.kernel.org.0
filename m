Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888CA3753E3
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhEFMdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhEFMdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 08:33:09 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7FFC061574;
        Thu,  6 May 2021 05:32:11 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id s131so1166664vka.11;
        Thu, 06 May 2021 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9TWHmwsdK1dTcbAv8pBSTziUy5ZrYIjx0ljVbLmuWY=;
        b=r34+qEJJIN1KBbooFY18JIM+bUhGQAPzvx+asQRAeJokx4to4DWOEbDTiloyh0kMRn
         v5bFp7hHB2OMKCWsyGMPBTlJW42QcR0W4/pmYTzkzPbS6vhNihDuKyWMTtvSjm4l8nu/
         f16zpAgAMcuYkegwt3XPqzDelIGWMbOoog1sJdyLQhjJyRO3A3bSoy8FWBax0Y5eJZf0
         3bI6uNEMw8rv33AZq4JFejeY5XC1j+7EkpvTRJPA0mUQPSvbYKEuRlKeL1KCDVl5nmRG
         +EnDLJrHqg1V+REGkhgnIqECV6oEXQGvjX8+OKRRM456VRHJ0J1OFHTNjRXQ6y+pHL2j
         CvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9TWHmwsdK1dTcbAv8pBSTziUy5ZrYIjx0ljVbLmuWY=;
        b=R+KSevwZdDzbpJ5/tkRuw9Bc4Z4ll5IfVcCMta9GyuPET95fVhEtaLAh+aXY9y2gY+
         kszPcdv3bA+tJVrOhXGG7/yP1B5GL1rcyfXaf6RMk9nGaL5XmHS5plRIfgB7+WmeTIbh
         j3674d62zteUsioaSZ7t7jI+Xg7SP5Q4VGO3Ph8cPk3x+CDQzsl4DqCXGh23yd3Dv2qB
         GHK3B37LmKmgquNrfhauZSkMTlDVcP+Qgi9H/c99ripWlucpuDuyV8W/go1eZvz5Ajfr
         ltscQasTLrEtOEIiNk3E+7WvXbZLBaRD/c09LBQP2Sa76ThDDUQ89lpd0Q0zM4dBhGYZ
         M5xw==
X-Gm-Message-State: AOAM532uYRvfbz8grbe8SbWWKxea078fkt1/ZWsqOkG25FFd6pLeboNR
        kOAXF1D7d9Hs47/uewZkF0zJCpBRSYdT9yKukZQ=
X-Google-Smtp-Source: ABdhPJwiwHBkyzi5cwGSnzZQ0ZNAudi35hC4dNj4uWMTJhdZ04jb/LYlsElFp6RjuFqjXz0Ts/Ms/DA1mCwn1jQGHZ4=
X-Received: by 2002:a1f:978e:: with SMTP id z136mr2438936vkd.17.1620304330868;
 Thu, 06 May 2021 05:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
 <20210401144336.2495479-10-emil.l.velikov@gmail.com> <a9829af1-f4e9-5835-9a74-15a0fce6b1eb@xs4all.nl>
In-Reply-To: <a9829af1-f4e9-5835-9a74-15a0fce6b1eb@xs4all.nl>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 6 May 2021 13:31:59 +0100
Message-ID: <CACvgo53L-3kN6WGn6VqkpZTRcVnrnLeCxRPxcGks0TR+VQuXbQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] ARM: dts: sama5d4: enable Hantro G1 VDEC
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, 5 May 2021 at 15:31, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 01/04/2021 16:43, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > Add the SAMA5D4 VDEC module which comprises Hantro G1 video decoder
> > core.
>
> I've accepted parts 1-8 of this series for 5.14, so this remaining patch
> can be merged by whoever handles such dts patches.
>
Can you please include this patch as well. As you can see it has been
Acked by Nicolas, one of the AT91 maintainers so it can go with the
media tree.

> Regards,
>
>         Hans
>
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Thanks
Emil
