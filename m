Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8C41A2959
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 21:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgDHTdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 15:33:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43761 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgDHTdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 15:33:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id g27so8898400ljn.10
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSgVlvLEI2qFKoDpx8jSrrYwlmA51yhu2uxsG/VXUMY=;
        b=RxniSdd1eO3vSBn/B+GjtE80ARR7ILdZ0JHvNUMTXb1APYr3p4e0hVQdD64Qargghs
         c66ndoAdx8Ib0d10+6NU69rh/nvlmY+BxklVDfMI4WnPSrV+uJdkVu5gJeLBA3ugHPr6
         q9+wxqUz2t3gDNunKlz44YTYkxKKllUBJrnTjPLaHKhjFKGozwf90tYN1Pb/jrGU4fD3
         SyUqPnM/TNe98BsEfm8MurfgXep7RPxKCjIyd3sx+DZOYFsOKnrJKoReejlqobsWez3/
         egIJkXcMoXc7kmNanhT/YEmsDx0wQBacYdegYgh0RbIZeyAFVgDRy4dXMPMaq/7FGBt1
         9wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSgVlvLEI2qFKoDpx8jSrrYwlmA51yhu2uxsG/VXUMY=;
        b=BT74aTBRIgf146ptRasixFrnBn475fPN4ar7wcf8DHUBMzeO9xSWwcyE/MkVGit7cF
         NVJSZL6+SYYQ7kWqWGNwfbsCz/Y7jRwmAn6QIl00GizO3gA/p8dZxPNyZUIXR+Ov2sOO
         A3hRAAr33rU6x0BdTJANwWHJjEm06IfVECdzedCn3oSBh3bTvevCls95G/KPgF4hZmU/
         zi6Pr8ZUH0EQuGq822GW9dlqLw0mO3W1T3hrvJzqDOzpfmdSd28tNuaV1Kq6io/UNLFn
         hl+cJ0caA0CSbYey5VAPl25PZPbd0/AuNz3nEGS+Y1ctxQbTcVtZtFxmWAY50XpK+tFR
         9/bg==
X-Gm-Message-State: AGi0PuZ7oqEiLegYNEglF5EwsfZeSG52gAA//LQXOseVhypYymXHpu8q
        rJaTi/bJ90U0rXXBHR1h92iN1Bd5+nDMKCYmAx4i746jDjc=
X-Google-Smtp-Source: APiQypJFoI2hVqvnIn2CFgUPMlJslFf4g3e4dGbBW+NQsCtPR7wOWJMhaqCTegiBy7qLnbJtDo9lJhL6PnNoA64dSLI=
X-Received: by 2002:a2e:6c0a:: with SMTP id h10mr5716003ljc.195.1586374391414;
 Wed, 08 Apr 2020 12:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200408123215.2531-1-festevam@gmail.com> <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
 <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com>
 <a23d2559-5498-75bb-0bce-3bc11bb6b5ae@gmail.com> <CAOMZO5BoD4K9Z7GCZHtrWDkYre3aFNd6YdDkUfKB1xVwdjaNzg@mail.gmail.com>
In-Reply-To: <CAOMZO5BoD4K9Z7GCZHtrWDkYre3aFNd6YdDkUfKB1xVwdjaNzg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 8 Apr 2020 16:33:36 -0300
Message-ID: <CAOMZO5AQKQhE4THON2LGtN-Btmz=E_AbYpFxi6KV3TpTdBWOzA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 8, 2020 at 4:28 PM Fabio Estevam <festevam@gmail.com> wrote:

> Should I change the Gstreamer pipeline?

It works if I use the v4l2convert element:

gst-launch-1.0 -v v4l2src device=/dev/video1 ! v4l2convert ! kmssink

I will send it in the next patch series.

Thanks

>
> Thanks
