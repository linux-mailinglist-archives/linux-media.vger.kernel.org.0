Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0E3140F46
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 17:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgAQQr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 11:47:56 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42396 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAQQr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 11:47:56 -0500
Received: by mail-pg1-f194.google.com with SMTP id s64so11927116pgb.9
        for <linux-media@vger.kernel.org>; Fri, 17 Jan 2020 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a0X6p9xbHrIlzrHh63asXC+Mr9ezNFig8K8mnlw/VU0=;
        b=CMYDVK3o15a/HLUEwZvdlzwRDAHR11DvP7YGjjZFLjxpRPH9kwENk08LX0uEzCGkOD
         lTru8dUdToIiA4eSbzG50gCCsQKvKxHA6VlmgjLs2ZsdmaKvY1i9BdjF4aKeZIxXBpF9
         NQl7L5svUZaNyz/v96UNHPclw2e8ji1Pu/Xmnvo6ncClATMcQ2pSYyN+1m8dcQq5Yl75
         qpst28HMwgbX1e8UyK2ZDQzRKxQjPU/bF8pGmpA3zKdiShJ1ksvshyVc7a5I06celg8N
         zPI+BQBRbox2vCUX84yW0VxyPzVm6ZWOCDe7OT43LvdcVJqZiH71MJ8hA+vfA+Xt2A7W
         wFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0X6p9xbHrIlzrHh63asXC+Mr9ezNFig8K8mnlw/VU0=;
        b=Y2Hf9C+wO/gwzTDaatcuBsYldbm/fiCZ0ixbgPUBA5+JI2WWcJ1cFUfz+x7Uiyp8Xi
         GJO8IZoURyNQnp90b6psmuLSU+hu//WOflKwtSrbKZ9zJp/P7euFcd15yFhmTvjLXVJv
         fMlXEQuK6TJq9GHwjHc/KlIVUqmrw57WzkIZftPo0RB3tnAgs943Rwth/Bt0uM8fWvg1
         U4akvK3gqms8KsW6qtQCIJdTaK9Y8Dw/gNgV9ipOyLft6zRTAv1+04DDi9JAcHpGSkAy
         0SC80bI1zuWTg0uh5FMXoacUSEz7NmgOdC/0mF5RDazHjVjDO1kKUwws5gn1VgTNTttd
         AQYw==
X-Gm-Message-State: APjAAAVrj2VXhjQ42FSGy5yxzB5V6ytqGZkW+nuzI/eHC5TTBnTSN1t7
        Pf9Hf2cQdA30xvElal+Jkdgg2Qp6j6noDYtsrPNvMw==
X-Google-Smtp-Source: APXvYqzf1H4OJi9a5ulljQv3WaQlU3fRZ0ZEAcTUWyDTmvAqhBxj9PMrU7ySmf6NRhw9tQh/UG1oa39cDJV/rCiAQIM=
X-Received: by 2002:a63:f24b:: with SMTP id d11mr45395104pgk.381.1579279675422;
 Fri, 17 Jan 2020 08:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20191022132522.GA12072@embeddedor> <20200113231413.GA23583@ubuntu-x2-xlarge-x86>
 <a729415d-1304-9722-2433-129bd2255188@xs4all.nl>
In-Reply-To: <a729415d-1304-9722-2433-129bd2255188@xs4all.nl>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 17 Jan 2020 08:47:43 -0800
Message-ID: <CAKwvOdne74KKV4s+voH1_+4iL_2T2efJTSiw5b6MW2=egiMN1Q@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: adv748x: Fix unsafe macros
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 16, 2020 at 11:25 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 1/14/20 12:14 AM, Nathan Chancellor wrote:
> > On Tue, Oct 22, 2019 at 08:25:22AM -0500, Gustavo A. R. Silva wrote:
> >> Enclose multiple macro parameters in parentheses in order to
> >> make such macros safer and fix the Clang warning below:
> >>
> >> drivers/media/i2c/adv748x/adv748x-afe.c:452:12: warning: operator '?:'
> >> has lower precedence than '|'; '|' will be evaluated first
> >> [-Wbitwise-conditional-parentheses]
> >>
> >> ret = sdp_clrset(state, ADV748X_SDP_FRP, ADV748X_SDP_FRP_MASK, enable
> >> ? ctrl->val - 1 : 0);
> >>
> >> Fixes: 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
> >> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> >> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com
> >
> > It doesn't look like this was picked up? I still see this warning on
> > 5.5-rc6 and next-20200113.
>
> It's been picked up some time ago and will appear in 5.6.

https://git.linuxtv.org/media_tree.git/commit/?id=0d962e061abcf1b9105f88fb850158b5887fbca3

-- 
Thanks,
~Nick Desaulniers
