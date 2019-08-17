Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F5A90BE0
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 03:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfHQBP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 21:15:28 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46104 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfHQBP2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 21:15:28 -0400
Received: by mail-qt1-f195.google.com with SMTP id j15so8018139qtl.13;
        Fri, 16 Aug 2019 18:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P7AqQZeADBtiPH+C4tzBJMUOLLardiNcvH5dbcyA0r4=;
        b=XUZj/TuAV5C/7e8mIoGRGN0shm4UM0kqukS7KvHmxP3AGksuHfMIkfDqPLuIPKqq+y
         NFcrAs1t7+jd97EtL0NNGHqGx8c8+HijysZKrdbgn/0eKjz/MvKUlU20vwcv46ZPzzBR
         Gqs0NYwyLaoWpZTfYNItiEQ9QriYpx5QjjuSbZKC0O1OiCHdm4UB4IR0Cob2aAq2Swf+
         rYKZdtRqggBNRFkVde4q2ygF+pFCc0Kj4rky56D5SnJuUKu/OtTr2GXeAaVjFy6OJIWl
         k0AvuYSy1uMO4soHT7R6hrbXvDnwscUMb0z6u5yqL8/u9glSL0DRIk32GiHbb/Sw7WKZ
         PvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7AqQZeADBtiPH+C4tzBJMUOLLardiNcvH5dbcyA0r4=;
        b=pWSLq073GF6KiC7zBNinDOhwRt2Hc7uFjNxLGE16L1NiGzZu2cYD7swmVN6oMpt96W
         cp0KLLPWwIGmEwO45NggEMil3gWoVNwRv5PU/k0iJuw0AP/tUzHOb1tu6UPAZhMybmkK
         j8kLmlV5zSikY4l74+HRzinXqkuO8PJl54vb12I1AF7U/HaJ+0LOuxuee/1sBYfVj2f5
         XC3YOZ7e8sAvx/iNZQMrptKnXBfiVlpHnN/iqmgnFZpMbUZs4My4i+FbjIIpu5FV6Ovx
         37Cr8kGQGNPvfJVixVwOoargl5oMpt9KFNd0kdSiHq8mNwU5rIb3sZCHeX7R12QFHGjg
         +a9Q==
X-Gm-Message-State: APjAAAVtI6Sc+S+a/XQZQZMZgRMqY8yeYCXLWNx28bCZH6nZkFr9iKfu
        8rTgOjUUHUALgrCM9+w3jIYm/wp8fupgPLEmFbRmjx6lOgM=
X-Google-Smtp-Source: APXvYqzVMLZLV0NflpxBmoMdVTTrqmTz44DZn3IMyYT66E2M2UOLSzK1J+wQhLC9pjtjIHPk5f9dfiv0let0w1CMVvM=
X-Received: by 2002:ac8:2b47:: with SMTP id 7mr11489623qtv.116.1566004527315;
 Fri, 16 Aug 2019 18:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
 <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc>
In-Reply-To: <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc>
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Fri, 16 Aug 2019 20:15:17 -0500
Message-ID: <CALaQ_hqEZ-kco1esyB4mk0z9Q9Xt1XZsgYKR7gSdF7COERKoOA@mail.gmail.com>
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     Brad Love <brad@nextdimension.cc>
Cc:     sean@mess.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 16, 2019 at 1:42 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> If you revert that one commit, does things start working again?
>
> thanks,
>
> greg k-h
Hey Greg, I just got finished building it after running "$ git revert
812658d88d26" and verifying it reverted by comparing one of the files
from git log -p, but alas, no joy.

On Fri, Aug 16, 2019 at 5:41 PM Brad Love <brad@nextdimension.cc> wrote:
>
> Hi Nathan,
>
> I don't have a "woodbury", but I have a Hauppauge 950Q sitting around
> and tested it on latest mainline kernel. w_scan is ok and streaming is
> fine. There's no unexpected errors. The 950Q uses the same au0828 bridge
> and au8522 demod as woodbury, but a different tuner. Your problem
> wouldn't appear to be a general au0828 issue.
>
> You might have to check out git bisect. That will be the quickest way to
> get to the bottom, if you've got points A and B, and are
> building/running your own kernel.
>
> Cheers,
>
> Brad
Thanks Brad, I'll explore bisecting and hopefully will be able to
narrow down the cause.
I wasn't running my own kernel, but rather using the Arch Linux kernel
and modding the one module and putting it in "extramodules".
