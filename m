Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC021206EC
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfLPNSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:18:04 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43395 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbfLPNSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:18:04 -0500
Received: by mail-pl1-f193.google.com with SMTP id p27so4448054pli.10
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDTG1dtuof8oohV+ZDjnkTKA+QbTtPXocHHBYvIWtYU=;
        b=S/J/iNuzrRNSlcoVOoFAosx1pTi88JQTvUDIvkDwjAvXTjmXKPJ+OY4ApQT00OvL3T
         BihH2XEs9CCbEwTg5bdsJ5JzMng+nXSqV27hrzRCNGYnl5j/pXS3xCnHab5m3tZ6lfdS
         fVC8ESr3EjvsR8tKYP9Fiy5zwxgVnslVyb57oNetnP2OwrBlIKqff4Ebb8UZ1NwS7qHi
         4ng9ekKWSPIz15ZgFpQUXh3CSH6OW29DsvxB5Y+aywtmQtx5nvxSOWQxq3KZoQiM8hD8
         B66/8OtrhB7y+cyji/kKZQpgSpbAOU3q9F7IysssNwFVfmWs0fJ9KVJ93S050e6tMU+B
         /2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDTG1dtuof8oohV+ZDjnkTKA+QbTtPXocHHBYvIWtYU=;
        b=AjMm+COjlQ71+GTofJ2FyEo4jU2HJKzlSKlH5LgpOD01QxL8rDtla9nKoSvn9eUGiP
         0iBT0Crun4Ks03T1ckASYnrgEPqNB9h0T6OF0IPUpYaqaY9/aJkR54ZvvNd6PxZm5O92
         p8QKlzkzgcoffUSI3e4/PUa1ikL31d7cXZyJYqlPPhxKwrQeHPcpatZk06fzI/pmtMhf
         ftakBWUTOHsNO6FlmopNaz5QUylTo4Ay4nhe8qu1phRIpg7g1K4smwkbVhCJvVnUKwDv
         CkNwHihZHalyGWovPrECq0ja+N32IWTNxrL3tsQOFAXcbVU/+yd1VIUmdmHQDVofNyjT
         A0cA==
X-Gm-Message-State: APjAAAUjJR+gXyxiM+wKHsjRnbgpIUmxQv83IYBT2kKVDhN9uedLQn8c
        /XWq7sjH0FOR9zZD+P/YigrylqhlAj7pyou+snK/pg==
X-Google-Smtp-Source: APXvYqyU6prPxVR6gNSNaVAUcL5V++4eeLFe5K9rpahXPgNvA2HzUtv8aCtb6oKq0CyPcRLFn+BQdhyiEUMOptdlRdE=
X-Received: by 2002:a17:90b:150:: with SMTP id em16mr17350598pjb.123.1576502283682;
 Mon, 16 Dec 2019 05:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20191108154838.21487-1-will@kernel.org> <20191108155503.GB15731@pendragon.ideasonboard.com>
 <20191216121651.GA12947@willie-the-truck>
In-Reply-To: <20191216121651.GA12947@willie-the-truck>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 16 Dec 2019 14:17:52 +0100
Message-ID: <CAAeHK+xdVmEFtK78bWd2Odn0uBynqnt5UT9jZJFvqGL=_9NU2w@mail.gmail.com>
Subject: Re: [PATCH RESEND RESEND] media: uvc: Avoid cyclic entity chains due
 to malformed USB descriptors
To:     Will Deacon <will@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 1:16 PM Will Deacon <will@kernel.org> wrote:
>
> Hi Laurent,
>
> On Fri, Nov 08, 2019 at 05:55:03PM +0200, Laurent Pinchart wrote:
> > Thank you for the patch.
> >
> > I'm sorry for the delay, and will have to ask you to be a bit more
> > patient I'm afraid. I will leave tomorrow for a week without computer
> > access and will only be able to go through my backlog when I will be
> > back on the 17th.
>
> Gentle reminder on this, now you've been back a month ;)

Hi Will,

I think we now have a reproducer for this issue that syzbot just reported:

https://syzkaller.appspot.com/bug?extid=0a5c96772a9b26f2a876

You can try you patch on it :)

There's also another one, which looks related:

https://syzkaller.appspot.com/bug?extid=0b0095300dfeb8a83dc8

Thanks!
