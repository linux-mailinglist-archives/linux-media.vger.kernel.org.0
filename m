Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B007318DE5E
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2020 08:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgCUHCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Mar 2020 03:02:12 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46422 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbgCUHCM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Mar 2020 03:02:12 -0400
Received: by mail-io1-f65.google.com with SMTP id a20so1373182ioo.13
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2020 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SXnfnJdxwyP4iXFKwBQ2Uuna7kuUgG8tOJJOGAbD0FA=;
        b=ay1CXFxFI2kqh1GC/SM7jIVOfPTUieW0GKf6rU36wlUW9H+EFkPbv4WFL6rXrnC6+m
         pxAGtKx/myQRAMfSfo8qH1L72jii+b4kDuYiEsnlIbT0ymKDTP+gPYxFY769W8HgOXWD
         +3YYcVOkYwlaPjrEZxo6h7yjLoq5o2jnK4uEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXnfnJdxwyP4iXFKwBQ2Uuna7kuUgG8tOJJOGAbD0FA=;
        b=p9FikUglsQOnPdXF9loq/UpfNiC5Q4OyYipEuyHJcVdiBI3rXGiBhg/TCk8VfXBbs3
         eUh0BLrHXiT9dYVQy+/nM+DpadyVkhGWvc1HvywIRBoH1cO7XdnFZlkwql7w6oXppZbg
         Yh4NxYzCeM4O3szkNRNoarFafyTgEiiruxB1w3PRtVX7H08Q0lzCvJ+r8GL4AqrHAbI2
         vi58AgHyOMtRHR9rsInnS/msjO2Q4g5maQvhKly8fZNC0vnvloPX5ncjb/o3k63b+1Hf
         o9VRWxvJEoVr+7eYNlCVFwYRK5t3nBjT6X6ReBQ2oyVd3Q9nUItXMRElIKTJNdm/44US
         sfWA==
X-Gm-Message-State: ANhLgQ3EWE+YWgkXjRL9cC5SDX8xyO6kIR3p5jGaoBA21gZ9izZ74biy
        jiDx4DBryzdqcYiCD786lxmp7TDQMRHNZjZDErk75C4lilNEhXnk
X-Google-Smtp-Source: ADFU+vs+FKm069H/iVNq87gZm09sSiRcson512o9Fb2ivFkX/UaD9JOQI0sPTk8hsofSeCEP18qA6mjwclmsC/f6KY0=
X-Received: by 2002:a05:6638:319:: with SMTP id w25mr660446jap.26.1584774131021;
 Sat, 21 Mar 2020 00:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200320201539.3a3a8640@canb.auug.org.au> <ada1cf22-b135-d84c-b75b-62ff2b4f1945@infradead.org>
In-Reply-To: <ada1cf22-b135-d84c-b75b-62ff2b4f1945@infradead.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sat, 21 Mar 2020 00:02:00 -0700
Message-ID: <CAJCx=gkbP9=G_kvO954=psTwfqCG8ws0DT47mKJ0D0VfPR832w@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 20 (drivers/media/i2c/video-i2c.o)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 20, 2020 at 9:11 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/20/20 2:15 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200319:
> >
>
> on i386 or x86_64:
>
> ld: drivers/media/i2c/video-i2c.o: in function `amg88xx_hwmon_init':
> video-i2c.c:(.text+0x2e1): undefined reference to `devm_hwmon_device_register_with_info'
>
>
> Full randconfig file is attached.

Odd since there is a "imply HWMON" for the driver.

- Matt

>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
