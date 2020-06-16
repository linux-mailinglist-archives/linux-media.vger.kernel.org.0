Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFC11FB17A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 15:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgFPNCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 09:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgFPNCn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 09:02:43 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A1AC06174E
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 06:02:43 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n6so15864384otl.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NzTqWXpX+jIvy6nNJlsuFOKnjF4HL8dCMVxHFmjhNpc=;
        b=ZiAh19reRpuQMNnULfDrvDsIF/sHi3PNBI2av/6tLQoIpHlpsGZyVyf5/f9zfAkXsT
         RvqRMv27tjZWKFR9Snu8Rk1bKEaoZyL/3MRnmiJD2SYG7VpqMcAfTK6UqN88hIEJj+VT
         ZZoCkxccGShzokCjF5GTZ+PUN11Lr1oNW1HT862bUqaAOlMVCxgyKCPIV1P3uEkrqLi1
         kxFv1PNr65IJYwIvN8H7k/8AJzUyeVk39JEE9mCjY/8kT+oymEOkTRGIvQYJsIyQkvwl
         VTRqUzdDBZjs9D9mgj+yTLxxaJOBRalDP+g3Ki0j/9PsO5oPKeJHujNesCv6z51OEUI/
         s7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NzTqWXpX+jIvy6nNJlsuFOKnjF4HL8dCMVxHFmjhNpc=;
        b=iEggsq7BeFMogkHN5A68ioaWNcXDx0PcA6iZQ02S6LGqDWUE7rRCvF8rwW5k65PPpz
         eq8+2IMZbnOijm2KqOtfFER5OxZgfIQ+zMIXbLhZtNcOvqh6QxfZjFqyuSF36ymOAu+t
         X1FtfBx6vwt5L7cJ/IS3ZwYDYF9sel5g+Uqin4S7cfItDOa3hsutk4SHDwsL07ZDMBO/
         yR73cWBX8Neg/8fJAmKJR0CjTu0teCbMqhj3UtMQvSdKxhIvb2V8wofxfQXSdj4Xc+rB
         QLuvEpu9vbKhY/OcBzq8W2pOdeujZtxZRUx+zTG28SxsVPf/OCuhJSyY5xsMReLvJRwM
         lBUw==
X-Gm-Message-State: AOAM53231EWE30wCArDQVz0iRjz/Xx1sFpwjyim5tYt+1H4OEmmyjiSw
        /5S0sUEyKRI16a3TlipjeyQf4nznYk8tplzPu0pG/g==
X-Google-Smtp-Source: ABdhPJxsO1eVEcTPZvlTMUrXhz7ujf5MbjRiGA+lB51S5epUV5ph0XXmivVwvq7RJRM5fxua8F5YwdkG3RxhSDPGT/s=
X-Received: by 2002:a05:6830:242e:: with SMTP id k14mr2249753ots.36.1592312562394;
 Tue, 16 Jun 2020 06:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200611114418.19852-1-sumit.semwal@linaro.org>
 <CAO_48GFVYOv8Km7fEh8iBPp7d5ziySBV0vB9nu_+oset6hBO8w@mail.gmail.com> <159231181752.18853.1290700688849491922@build.alporthouse.com>
In-Reply-To: <159231181752.18853.1290700688849491922@build.alporthouse.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 16 Jun 2020 18:32:31 +0530
Message-ID: <CAO_48GE8K_nDXs_LDU9caRdP-aK9DWV3vXcD4EuVCxyShCBbmg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move dma_buf_release() from fops to dentry_ops
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chenbo Feng <fengc@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Charan Teja Reddy <charante@codeaurora.org>,
        syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com,
        "# 3.4.x" <stable@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chris,

On Tue, 16 Jun 2020 at 18:20, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Sumit Semwal (2020-06-16 13:42:13)
> > Hello,
> >
> > If there are no objections to this, I will plan to merge it soon.
>
> I was going to suggest running it against our CI, but that's unavailable
> at the moment.
>
> There's a particularly nasty BUG_ON() in dma_buf_release that we hit
> irregularly, that this might help with.
Thanks for your reply; if the CI is going to be available in a couple
of days, we could wait - it'd be definitely good to see a bug being
splattered out!

> -Chris

Best,
Sumit.
