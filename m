Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BE4230E47
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731063AbgG1Pok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 11:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730775AbgG1Poi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 11:44:38 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4504C061794;
        Tue, 28 Jul 2020 08:44:37 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t7so1398475otp.0;
        Tue, 28 Jul 2020 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X8oqyy89D3G/SsEykgSGLbJc6vMNxyoDi/zTaYVXNlM=;
        b=MEFDd8Joi2gcNe+Oo274jwfc0jNOGgVZ20XATCHQjHC7h+kZTzaoff5isq0tOFNp/C
         kFfmxHAbLphiwW45ogcaUqVJ9TNqwTyA0yixFhGmI876F7vL9vmZ/8dJXSqcrSM+fFce
         abUl80wnq2/leB/gMmD23tokb9EXQPTGOouc1WWQIR+pYmwadZQV9NTdvrtG9Y2y5bPS
         jQ2TqnJO1hC7J9aU3IXyIxwCx3/AmaRnW8NATXhi2A7fpEw227v7IlsTlbctd1siRolM
         psEIq2LL+neEmq29/4O1LpNREUcwwjXZFv/J1mLvJIinZEoHkifHvl1knjNruvbI1cUb
         olhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X8oqyy89D3G/SsEykgSGLbJc6vMNxyoDi/zTaYVXNlM=;
        b=A77d2LD802wvr6Mq4ChOrkVbPqNShe8+B8hDHCR75envT9SMjdVbFvEOYTOSCX6iqE
         G1nML925oB/hZDeYNl5xZX5p9V5EjmhfxSiEGTLVJ2QDbDbonsCc8ow4L3ZbY3wtr6ae
         GWmEE8fhfmdDeIlb6l+9X415kRfOlQjO1G+XOsmjCivfxyuP2q9248ZgaMieLY+1I9op
         Dh/4402n3mJkP3l/vPHBX31ttvSt7SlT81x452+DfRvs8QngBblNSIH9vGCeNxQAyjAm
         Z6sIE0tn55/U9XKIgxeP3EgunG1li0gsqqD9d/jhFvRG697G/PjgNsfwLbWBuThSsY0N
         2Fyg==
X-Gm-Message-State: AOAM531dSYKlxnCOTbodmfXfLFYY92djBW+wfQWlyCGAupwW0f0ZYCpk
        qeo4ZI+rVuS3+X2XfX4vTT0OkLZ8fb01xFCwFOzmIokuQDlzGA==
X-Google-Smtp-Source: ABdhPJywjajz/CBt08LbXIzjYxAfcjOxLdzB1Yi2RSu+QgW6DiQ4dYj/VqieKN+dCykMiGBkOp7Ox75v1v0NTh+ReTQ=
X-Received: by 2002:a05:6830:18ed:: with SMTP id d13mr25841749otf.196.1595951077208;
 Tue, 28 Jul 2020 08:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200728143004.3228-1-dhiraj.sharma0024@gmail.com> <20200728145419.GA3537020@kroah.com>
In-Reply-To: <20200728145419.GA3537020@kroah.com>
From:   Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Date:   Tue, 28 Jul 2020 21:14:24 +0530
Message-ID: <CAPRy4h1Xs1JpQinnWm04dOi07Ch0RLL0U4Z5DDCKHmombXE0sA@mail.gmail.com>
Subject: Re: [PATCH] media: usbvision: fixed coding style
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, stern@rowland.harvard.edu,
        arnd@arndb.de, jrdr.linux@gmail.com, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry, I didn't realize that I committed a mistake by not replying to
all. It was an accidental mistake which will not be committed in
future now.

>
> That is not needed in a changelog text.
>

Alright Sir.

> Neither is this, please be specific about what you have fixed.  My bot
> should kick in soon with more specifics...

Sir there were checkpatch.pl styling issues and I fixed them all
together, so should I write a proper changelog as what all I fixed i.e
errors and warnings thrown by checkpatch.pl

On Tue, Jul 28, 2020 at 8:24 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 28, 2020 at 08:00:04PM +0530, Dhiraj Sharma wrote:
> > As per eudyptula challenge task 10 I had to fix coding styles.
>
> That is not needed in a changelog text.
>
> > Thus I
> > used checkpatch.pl script and fixed a chunk of warnings and few errors.
>
> Neither is this, please be specific about what you have fixed.  My bot
> should kick in soon with more specifics...
>
> thanks,
>
> greg k-h
