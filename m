Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09FC34A265
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 08:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhCZHPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 03:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhCZHOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 03:14:44 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC408C0613B0
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 00:14:42 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id j7so3618787qtx.5
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yUOq+i+za9mFTcUR2ItQ5M1T1uiann3mxCOMoYcUQ5Q=;
        b=lgotakyfSrhsEC1uVtkh1GQkls20zL1aqZXfAnYHISIrU4o3OgldfmxCUGGMDTRu4U
         14+2fGXQMvlY4l8R1QpJoJvVOVVv8bvXhZ4dPaUtrU74DxB62D0t4+Q+5H2PMF5q302/
         04UdZRQVOfRSIeT/yEHM0bMiKzJeqArZtMnI3qcK49nBOw40r6XqCl2PVhzmzihwjr6D
         rL8PymTsMwQFP1s786fNcCfiBHK7nI8v94FxNhvuwWfZMX7cv6dCxxrMQ2p0C7VyhIN0
         AaA8eX4D/FSbixhfscP/QDjpQTrbyXfCWv1FQlmw4rKghhws+SSnLqD+Qu+AG5l2OKJE
         egng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yUOq+i+za9mFTcUR2ItQ5M1T1uiann3mxCOMoYcUQ5Q=;
        b=dfebKHOzsfq2uEnMkvo3ecO5JReeEx9cADQwIXvWY8RzwDkPNbmPt2jgp8R6mGY699
         nR+VRpD9cK+XGRZU+HswaUseGG9wYoymnHkvPEshcSBNbsUeYPDDzv3l5CKzQq6FfED2
         Tm16DPNMJjaT8pNshwqJc7MrG88HaqBdAs4uZOGkOxfdNIknc0RMXFyjMY/cgFedAO11
         2JGTZa+aGW6VIDsRUEAPE+L9jwEIQmL+eKmlwdQV9+tVGwdmNq73lN7G//1iVpjSuKpV
         Hg8MhAHFtxnY86DdxlZ3WJeOF1iywfnh3jZKsRk/XFXSA8CQRK0EciO8T4lJXsC19awv
         s4ZQ==
X-Gm-Message-State: AOAM531FOJQdrwv5bsxuTPQSbvWB9TBKus5cbT7VT1vL3rxNz6HPMp0q
        ZpuMI9Wzp3r88YN+URasAWnDiIuhVs52hZzO4iTB4A==
X-Google-Smtp-Source: ABdhPJwIKh5eNAF8ll48qY6zktjfiidWxE1IDLeOoczNGg4gmlVgaBtUIymLzERUTryf44FJtHdpDLtslxowH0R1GE8=
X-Received: by 2002:ac8:6696:: with SMTP id d22mr11159167qtp.67.1616742881258;
 Fri, 26 Mar 2021 00:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210325212202.142945-1-alaaemadhossney.ae@gmail.com> <YF2JF+UMdt/icEMj@kroah.com>
In-Reply-To: <YF2JF+UMdt/icEMj@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 26 Mar 2021 08:14:30 +0100
Message-ID: <CACT4Y+Y8f6-c6zYCN=d0557xEryAzBfS9n2m=vBcdjHSi5gYcw@mail.gmail.com>
Subject: Re: [PATCH] media: sq905.c: fix uninitialized variable
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alaa Emad <alaaemadhossney.ae@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 26, 2021 at 8:11 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Mar 25, 2021 at 11:22:02PM +0200, Alaa Emad wrote:
> > Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> > Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> > ---
>
> I know I do not take patches with no changelog text, but other
> maintainers might be more leniant :(

I wonder if it's the right fix or not.
Initializing variables will, of course, silence the warning, but it's
not necessarily the right fix. I suspect there is something wrong in
how ret/act_len are user/checked.
