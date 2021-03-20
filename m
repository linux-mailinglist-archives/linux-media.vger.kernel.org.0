Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5825E342FC4
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 23:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhCTV7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 17:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhCTV7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 17:59:30 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAA7C061574
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 14:59:30 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id u10so11343279ilb.0
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V4TwIpBwHR/NYJF5AMSuLdn7rbp3Nmi6FMl5tCrTSVo=;
        b=CY+WA7DZrOKn6iY0naa4Sfp/BMD5pC4s2vUN0qFdw+DdIu6ddGE5YooECxdsFu6fJI
         XksriOT2f2mpHzl27tDau0yQBOF5YK9aHneQjexeBc5V7G2xfR29R3qt+98E1UOXwsTH
         N4rGzWgfnKpMv7QeVVpzvJz7zZ0Na3ToT2/3mJCYaNHqsmVzkyuRs9aTT7oIfe8xoJO6
         4CkgX8CuOvjfZ3f1Ee3JeYFS9MVn/y2YUwXo0GnYj9kjmnXF8YbwXXJ387QVdmXu7n52
         MVpxAa7qCVnpRaHYTPxnvy0vXsmMBoktJrvAC+n6tjaCDaHL+cF3FiYv+G3Kv+3VlWSY
         BXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4TwIpBwHR/NYJF5AMSuLdn7rbp3Nmi6FMl5tCrTSVo=;
        b=iLxS/zQa4bFR4HXPNSrDEBB4krvEj4roKY2XX/EC8E0LbUoWPV/sT6oM+DcdJGjSpT
         F8/WKzZEcCXdqKqYM1egVfq+5FGqi/DnAvj9d15/rFqGcWWrGHJLQCbV1Oz5Gm3W+IuO
         71Bzb6XJtRCOIKsLHwapcM3ZgK8hJS6tSfCNNpcKyDlpwFveihemkli9stJurkibmdrY
         akS4g4EINGb8ZU6jIDviI5TT5tzZgUAQCRqlF+W/Zsrx+6r/5DJoVWVYx1BejLIrApe0
         NUrIZ+j/l8KSzArztkyCOvtViQ0wwW+ZHXYYvH8CMHyXRj+f0tiKBSrZIpkygR6oMlJl
         Ga7w==
X-Gm-Message-State: AOAM531ZL52iJ8AE9m6gjuj1UnL/06Phosh1KZby7/ZWuIuHvcjPTmHG
        SL/8VBUaoeLXvxMUN50EWxHgMq0vZAYfuL5Bfl2TGpnW6bI=
X-Google-Smtp-Source: ABdhPJyg+FuUJVcGX2vHst7jgSP6wZylQeO+bAKPTyY2/hJxoQqhNaHRGIJIy46U5Orl+uKV2COW1U9A66XQZ3YYymk=
X-Received: by 2002:a05:6e02:1e03:: with SMTP id g3mr1685017ila.249.1616277570082;
 Sat, 20 Mar 2021 14:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMbLOeCCwrfoGvaV4vWPfF7tHnE-b4sFUNmK8v=ekRZAtjA-4w@mail.gmail.com>
 <20210318094836.GA31678@gofer.mess.org> <CAMbLOeAP0CDezNkgSo0afiDU9iSrtEMhi+eq9cthamOa4NXpKw@mail.gmail.com>
 <CAHp75VdQw=2J090w77bJVAY0UOyj1UcerZNDqyz_9dawVmK=-A@mail.gmail.com>
In-Reply-To: <CAHp75VdQw=2J090w77bJVAY0UOyj1UcerZNDqyz_9dawVmK=-A@mail.gmail.com>
From:   Nikolaos Beredimas <beredim@gmail.com>
Date:   Sat, 20 Mar 2021 23:58:50 +0200
Message-ID: <CAMbLOeBjhSX1-VZ0QkVG3qWcAman3fmu-erX3ugU620Wp+qajw@mail.gmail.com>
Subject: Re: Revisiting ITE8708 on ASUS PN50 uses a 16 byte io region
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy.

On Sat, Mar 20, 2021 at 11:51 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
>
> Congrats for your first submission! My comments below, starting from important one here: next time (v2 of the patch, you may use -v<N> parameter to `git format-patch ...`) send it with `git send-email ...`.
>
>
> This section basically can be transformed to two tags (should be below near to you SoB tag):
>
> BugLink: https://...
> Reported-by: Michael...

I appreciate your input. I'll start working on a v2 as per your suggestions.
I do have a quick question though. The email address of the original
bug reporter (Michael Zimmermann) is hidden from the list archives.
Can someone provide it, or is it ok for the attribution to contain
only the reporter's name?

NB
