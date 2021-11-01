Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAC044196C
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhKAKIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbhKAKIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:08:49 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96659C077698;
        Mon,  1 Nov 2021 02:42:20 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z20so62692773edc.13;
        Mon, 01 Nov 2021 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f3t0TlrQDCpZfptGEZRMYdxGyvWKJa8EGbsy+RdhIYc=;
        b=GfKGZ1MHhtjj2y2Ib3IrCCrwC41xomeuTw9Ac+h/5LjZ56/LLFPPA9ZHkf72Sl35Lg
         T/upzNdUGv6dFWLOwawoV2Kl2NQLYtrnOqLSQsj6Th5ARd2Ttgl72uoOSCIp5lCmdWv6
         adTGH72SSunhu934OmSZMKAHBi5ZMmd1y/pxYeiMf9mhMqXvvgQLWDqrdY7p4m27CeBE
         T7R/W6LND8GH7fKDbK9te6i3d8VPr+Q4IjaSWo9/hmQdxOp19JffEIdhTPWlNuhYwfym
         wz8uoduBcHttBBcwO6HQgyuhQYyTS+eJvN9Xnf8xwUtrZgtYvBRs41z/3XZc23bQrh38
         tIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f3t0TlrQDCpZfptGEZRMYdxGyvWKJa8EGbsy+RdhIYc=;
        b=roCwCRtFgFWPUPA9bMkB/T+fTCH1DyU7vwU8vDv1ASg+b2y7N4ggkOl6cusePByfl/
         WVHmn5IuzL5qibpBs6PpW8iMqDFdRbg5UhFCsQoxXz8AR3VywUryQP2VKaDLRcim6iSN
         e/0EeDFjRul+s0oZFgrS63ENulQ5MdsUi49VQ0HaRPMgGVVn045hRGGmzdS7LdxD0Ii5
         GKsCuSr6G2okmuW1KaMan8RpPKSSdbV5gQSbCJyaAyi5ALlCqCQgfIpcdUGn6ZSk3uNr
         sOF6cuCqGRZUKfZIHut0By9HmNjd44cXN0Hbicl/xOwtKUcP5wVUV46WUM3NhcwVkmNd
         kq7A==
X-Gm-Message-State: AOAM532VKUP4RmCL/LaNa6Hjmibm5ikZOcBAo7ObXZk0GqruJLl18pef
        hOt3FYyiPO6OI3ayUXnxc3Fxc4D27qx+ls/rmSw=
X-Google-Smtp-Source: ABdhPJyDetWIXilkAgcd/NOkjtOViczsoxP2zNssSjIIU5p/xOY8Z5JBEulxnvhHEU+IiG/vX2282nSfpF2kqlY6P3g=
X-Received: by 2002:a05:6402:b0f:: with SMTP id bm15mr25758086edb.302.1635759739178;
 Mon, 01 Nov 2021 02:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com> <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
In-Reply-To: <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 1 Nov 2021 17:41:53 +0800
Message-ID: <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 1, 2021 at 5:19 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/1/21 11:55, Dongliang Mu wrote:
>
> >>
> >>
> >> Looks like missing clean up on error handling path.
> >>
> >> ->probe()
> >>      em28xx_init_dev()
> >>        em28xx_media_device_init() <- dev->media_dev allocated
> >>        *error somewhere in em28xx_init_dev()*
> >>
> >
> > Hi Pavel,
> >
> > you're right. In some error handling code (em28xx_audio_setup fails),
> > em28xx_init_dev fails to deallocated the media_dev field.
> >
>
> Hi, Dongliang,
>
> Did patch attached to my previous email pass syzbot's reproducer test?
> Unfortunately, I am not able to test rn :(

Yes, it works. The memory leak does not occur anymore.

But I am crafting another patch based on yours as there is a small
issue in the retval and I would like to make the error handling code
uniform.

>
>
>
>
> With regards,
> Pavel Skripkin
