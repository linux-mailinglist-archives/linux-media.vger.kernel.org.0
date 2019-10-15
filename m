Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373D4D7FAC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 21:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbfJOTMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 15:12:02 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46483 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728832AbfJOTMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 15:12:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id d1so21364156ljl.13
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 12:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kczTeQUMovnAwIbIyAAWu4y3vqob8h/6PTvuFRVH9s=;
        b=QcMgEU+ypuVKV0dMUBmzODs3XIMf6HMjun7cShannT9r93CtychsivP5Co2/LE7Sg0
         mI6czF1MYDrKRWM/wXdGX0IRt3X/7uHTdj+UZpBhxiXyqN9e9HyPkwUneyBDH5rTv5oJ
         3EoWD6E7sJuo0PSNoe+wDGoIX8u1Ny6O8zZivdrmRFN3dHNdtPSMxRdzXWhwhIbSRUY0
         VTgQX+Q9AHOtiRWEholnbpmpyD0/aW1qJ4DzaGn+0zu0Fe9Bn/cLySLZtZmK9SpfsEde
         zEriLVgkZkvZZ/QeQm4n47+XdOekrNcwlssjOotLX4xoB/TlXrlWKCwKZl0RdCpzbULK
         QKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kczTeQUMovnAwIbIyAAWu4y3vqob8h/6PTvuFRVH9s=;
        b=Q61p1JlZP1+FUuc0tHA88/fVnTg59XsYmvDHSjBqmycLrLRhQ5Og5XrLTMRA9chLVT
         C94ZzqzYgZMH/oBR8ISW/Z49+It5szgf1G9iuNegfz1UTMn4+0tI2pT97DlKJ4AhuQBn
         BYtlQ+9mKj//A7H2kzFPbqhJ6VC0gWqiQqCUhWo4o2lx8mcrIkMjyDZaePaWu05Irih8
         BU2YvcggjOwO44id6t0NcGgJro/aBLXms7B56BW5ITrhn6U9LJPn50TA4DlCvHlSlpM8
         wCuJOzledIMhCOCLUrUlRy1XSuexEtg1qaJlXVdaNreHGmiq2lhd1x9qfCuasp9B1364
         +85A==
X-Gm-Message-State: APjAAAXCebBSIoXTP0pOc/zWukCB/uxLliWm7oirA9NlPhXYCyjFXAyq
        3OhYe8Fc40upkW3Xf90s7/jLCHf6s/SzZUyTqIQ=
X-Google-Smtp-Source: APXvYqwXIWTOXOGNFtKH6kW7vFm3gXrI2lXjpB09gZoDcodQc9yYgwXNTibOkZidWmewcXVoW4Rl2bw+DHijMJZibfg=
X-Received: by 2002:a2e:42d6:: with SMTP id h83mr22735998ljf.21.1571166720194;
 Tue, 15 Oct 2019 12:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
 <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
 <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com> <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com>
In-Reply-To: <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 16:11:55 -0300
Message-ID: <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Tue, Oct 15, 2019 at 3:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> I submitted the ICAP driver patch quite a while ago, it was ~2 yrs ago I
> think. Can't seem to find the link unfortunately.
>
> I'll work on updating the driver and retesting, and try resubmitting again.
>
> Most of the hooks are present in imx-media-fim.c to use the hardware
> input capture to measure frame intervals. The only missing piece is the
> ICAP driver itself.
>
> The FIM is explained in the imx.rst doc. It is configured and enabled
> via v4l2 controls. It will report a v4l2_event to userspace during

Thanks for the explanation.

I read through imx.rst, but it was not clear for me how to actually
configure/enable it via v4l2 controls.

Could you please provide an example on how I can configure/enable FIM?

Also, would you have an example on how to achieve the following
behavior explained at imx.rst?

"If the FIM detects a bad frame interval, the ipuX_csiY subdev will
send the event
V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR. Userland can register with
the FIM event notification on the ipuX_csiY subdev device node.
Userland can issue a streaming restart when this event is received
to correct the rolling/split image."

Thanks
