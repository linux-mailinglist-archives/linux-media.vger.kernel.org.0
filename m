Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655CD43ABE6
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 07:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbhJZF5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 01:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbhJZF5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 01:57:00 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF91C061767
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 22:54:36 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u5so16598916ljo.8
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 22:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PE12sBEfW/xDgLi19sIkoWTI0DJx+IMAfXlVsyqwOfw=;
        b=i2FrzE734FAkfYlSLmHM7oRIxndkuIkUapaY7hkkBx7UXDOI5mlLRxAkMK/qWOKbcl
         x+vK9LzlDnty+S/HVs6IR6jVX1WjgOWANx9AOifF3Hy6lx58R/vuCuE+qGUnOTlmEDQy
         /BBoVFiosaVw8G9ep0qfp6bHtSrcUN0zKo//FxliB03/his+QwnssIwkGqXrXrr9qzjX
         o60aXOYVmDgIWyLlZjfNxWi/hTq12EK0KUxsE4zA4XBDpSPQpeYa4ZKgeYAL8fLBWcb8
         aRxn7v73xsjW8ny+k9hUCF7Y6BdiYFrmv+n8jbazKY/Y6McIDCt9DYhqZygRWGhQ6Cek
         WXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PE12sBEfW/xDgLi19sIkoWTI0DJx+IMAfXlVsyqwOfw=;
        b=RFl+0IwJZnX28Vin+1FunFhaF46a72AZWidnkF8Uewm2G7w4bcdwZdEzfAB3iS99gg
         2maaIlBkt0oYW07fc9rH6YbJ7zB2ZuhBOpcK0xYEB4oaXE2HPhuRu19gjpYRw2tpGeVY
         fmVDu0iRtE9QHtG2Auh3lHpmphmjoLHyPd8IBBgBUpl4qNuJz+WfJF5Y7mmTzFqnOgTd
         MfKqkYPyVzr7hsKJKQ75KV6LBav+VQXQ7qL0XvKLTXQg9SOtRpjBl2tCaOQiaWe+mjFR
         jU4jY/OguQ7Er8Twdo3M7HNHBA5NmKkKTNuLM/IswQCf3M9BZgmghxzbS4LAndhGlPYa
         BRQg==
X-Gm-Message-State: AOAM533/lj53BaNMW1Guo1cjzu7P2stj98ZEm1T1kVLzt/zluR8hcOk5
        Wqd5wUGu6zXhd8AA48npryIda6d+jn6XfO/Ey4a6DA==
X-Google-Smtp-Source: ABdhPJw6ePvloiWcZWCXpt2q5JBIZkZxUbaHiQVzjp3ZdS+f7lZZ26jasAGHUTQ+79p3jby+F1TA/ZihF56Rpo0Ub4I=
X-Received: by 2002:a2e:9003:: with SMTP id h3mr13200966ljg.427.1635227675238;
 Mon, 25 Oct 2021 22:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211026055010.1569728-1-arnd@kernel.org>
In-Reply-To: <20211026055010.1569728-1-arnd@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 25 Oct 2021 22:54:23 -0700
Message-ID: <CALAqxLUG-Fy5B28K43SRV+kui8a9jnEb+WsCW7DTSsOZaE-tEQ@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-core: fix VIDIOC_DQEVENT handling on non-x86
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 25, 2021 at 10:50 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> My previous bugfix addressed an API inconsistency found by syzbot,
> and it correctly fixed the issue on x86-64 machines, which now behave
> correctly for both native and compat tasks.
>
> Unfortunately, John found that the patch broke compat mode on all other
> architectures, as they can no longer rely on the VIDIOC_DQEVENT_TIME32
> code from the native handler as a fallback in the compat code.
>
> The best way I can see for addressing this is to generalize the
> VIDIOC_DQEVENT32_TIME32 code from x86 and use that for all architectures,
> leaving only the VIDIOC_DQEVENT32 variant as x86 specific. The original
> code was trying to be clever and use the same conversion helper for native
> 32-bit code and compat mode, but that turned out to be too obscure so
> even I missed that bit I had introduced myself when I made the fix.
>
> Fixes: c344f07aa1b4 ("media: v4l2-core: ignore native time32 ioctls on 64-bit")
> Reported-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much again Arnd!
-john
