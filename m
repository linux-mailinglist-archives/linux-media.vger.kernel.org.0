Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093F124D7B
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 13:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfEULCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 07:02:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45836 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbfEULCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 07:02:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id r76so15393351lja.12
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JiOuebsbWgjEjp0a4XhtJdVmmGWnCnRTxg69qCcOtsY=;
        b=ZvRBIPtfv2tQxLEbXHDCKUrcnh/NVGQfK3ADpUqQQBHq1gYARpxa+eRJtDdzIgJu00
         kldlfPB4RQNBEqY7t9xCcYTx60nZQBUNINx3FuZLkV4uQquWRRo0ZPQVLb4Gmk2L8dfh
         USl8OwxlE0Lwfu33/W2BA31HSvaLTnOEeLrf1CWKLuutF2ytufBEwqs16ms8qN0neyLc
         +KOZj1m8EZx3foz/XKFg3yT3ele5AQZCLu7ZTBo9lCedes1ZgP7k8FK8ofFAumM/oNfz
         MuSoRVwe5VBd9AnIjHJGGJFnPOxeYVrX8VYOq1+YDhFfQguqeHkycLU5DZGaPjTGM2s/
         c3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JiOuebsbWgjEjp0a4XhtJdVmmGWnCnRTxg69qCcOtsY=;
        b=eo9gtGwEE/T8pjw/oX8Ak5WHkdoJ9PconI/B+ee/cPgvCJ7kF4wLeai0zatktRM/LQ
         VdalRjxo64f6JOC3BGQXugrrBYl/RG2LhTYbBbZ5H0OEqycgmw2HC/tjtTsOxuEPOVAf
         94GeyOtu/7d2mxgNla6Hq1IrMORRebffCSZTTBtKTW+tRnPk6pn5LRg9eyOttdjgPZ8j
         ntUyB1uSE8mi6iC0Zf8KHjKSqZPsh5lOxK6jyKNGa0xY1hzV1zfzgsNyy5wHTLTUSdK3
         /fpf6wNc7sKB/YyjUqE6MjxfaSMAsFOhtMuVCn7aDwA/2ScF4yXzU049ukP6Oeylh5lA
         l0Gg==
X-Gm-Message-State: APjAAAXHsBT7aJWPT7s8wGaH8md/4RVl9KewjvFiJuMeQ3VkH9TRMRS7
        H6d47Z4S6nJC5/Isv1mj7JUxoLv10fGNcXEup1ZKNRvdfJQ=
X-Google-Smtp-Source: APXvYqwWehMJJXjGsP0Bc9f4SddpS0xg17Ozs3s2XazkB+UlZqZ2pxY6LcgfzktZnCGe51S0yfCdqoJ2EF6kI7Lo3Ns=
X-Received: by 2002:a2e:2b58:: with SMTP id q85mr41770277lje.179.1558436532542;
 Tue, 21 May 2019 04:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190517154256.255696-1-darekm@google.com> <c0007b51-5e9f-4788-b860-d0623e21013b@xs4all.nl>
In-Reply-To: <c0007b51-5e9f-4788-b860-d0623e21013b@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 21 May 2019 13:02:01 +0200
Message-ID: <CALFZZQHqg1oNXOoMJGhSxOuXc-a1AqJL23GAW2oUGk8h9X9Fbw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] media: cec: expose HDMI connector to CEC dev mapping
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 20, 2019 at 12:25 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> It's a bit unusual since it uses the Synopsys bridge, but not the Synopsys
> CEC driver (it has its own meson cec driver).
>
> The first thing I noticed is that I did not get any connector info.
> I think that the root cause of that is that you forgot that there are
> several drm drivers that call cec_notifier_get() instead of cec_notifier_get_conn().
>
> I think all those calls to cec_notifier_get() in drm drivers should be replaced
> by cec_notifier_get_conn() where the second argument is NULL, but the third argument
> should contain valid connector info.
>
> A quick grep gives me the following drivers that need work:
>
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> drivers/gpu/drm/exynos/exynos_hdmi.c
> drivers/gpu/drm/i2c/tda998x_drv.c
> drivers/gpu/drm/sti/sti_hdmi.c
> drivers/gpu/drm/tegra/output.c
>
I am afraid that just replacing cec_notifier_get with
cec_notifier_get_conn won't necessarily make this information
available, as, e.g. looking at tegra, those would also require some
reshuffling of the code so that notifier is created once connector is
initialized. Btw. I've updated dw-hdmi.c and tda998x_drv.c to use
cec_notifier_get_conn, so at least those 2 will be covered.


> The second thing I noticed is that patch 2 gave me a new kernel warning, but
> I'll do some more testing for that and reply to patch 2/3 once I know more.
>
I hope this is fixed in v7.

Thank you for your testing and best regards!
