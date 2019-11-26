Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7383A109CCE
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 12:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfKZLNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 06:13:51 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:34367 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfKZLNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 06:13:50 -0500
Received: from mail-qv1-f47.google.com ([209.85.219.47]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MLz3X-1iHkvE0Ze5-00HxRC; Tue, 26 Nov 2019 12:13:49 +0100
Received: by mail-qv1-f47.google.com with SMTP id cg2so7064136qvb.10;
        Tue, 26 Nov 2019 03:13:48 -0800 (PST)
X-Gm-Message-State: APjAAAX1zwdr5fx+EPZeDhzhhTrwEvKdjlRYIgeAnGY9lFGY5GuinElU
        SlnwboGpPm82Ujked0J2Zet0eLFQ9QA5TuY/2/s=
X-Google-Smtp-Source: APXvYqzSNPxcxO0jBS79Xqk2KpfHdI67st7CvuP9yaR6xOmSOSYpOarFGsOMp9CiPgvqGaJe8AVuhx5CYY2uulcMVKY=
X-Received: by 2002:a0c:a9cc:: with SMTP id c12mr26017158qvb.222.1574766827929;
 Tue, 26 Nov 2019 03:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20191111203835.2260382-1-arnd@arndb.de> <5c7bed6e-12d9-15e0-236e-d4f99710fbbd@xs4all.nl>
In-Reply-To: <5c7bed6e-12d9-15e0-236e-d4f99710fbbd@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 26 Nov 2019 12:13:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2EgRZ=Gv8hhZNy+NYRLH0D3-+Vfqk+KUTBEcCxVb+egw@mail.gmail.com>
Message-ID: <CAK8P3a2EgRZ=Gv8hhZNy+NYRLH0D3-+Vfqk+KUTBEcCxVb+egw@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] y2038 safety in v4l2
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9u3y69ouloFLHn+SGNgv/gvCAfhM0r8xhCwznRX+/bol8QcN/Hu
 0g3U/qUdRyv5znctqYCPlEa5s76BWFdLqbXYbmWC+CIBxrncRzNN1McY19tk362mp7/qMls
 JnCeIiK7tyVy89NZcL0I422iwO+X5pO3PVleCkDb4jVuMYJL1zExLz9mvXdimGSq4Wh1XEz
 0Xw+J7fwhYyA75ejQjbWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+6q1Wr9D9bc=:KMMGy42v4nnyaNN6gTmusN
 RshdGesygz7cGjBtpkTvcJ8wKZgqyBoqg1Z/otH5cSBerJqUgL+kL+aPGhDf16LXz9IC28ND8
 oCz3p3BwX84N80Yt8AvVkSCK5bVqJoDo1Ov3lxYD1iQnZ7mHpqqtGEQHiZBHE1CCZxx95BPJO
 xg+Jpsf+R8fPaLeqmtKRxzzhkG3/eogu9+Cs9DuWGDLSPn8rE7umjDiJqcVZfUnjAgcHi/ECR
 xIUZWLfndurPCOj0Ku5t2XpNu1iDj7V2cV2WZh+v//2T5EHkn0/fhcQWI+FPI71s7VLbr6utC
 /rtEvo7AH1ZELgxbJf5ajTz4NHV6SWbGgEZjS75cyv0tVJHgCd9ZDQbw2L99qIDT9gc3h4o47
 7ll7AOEkKdF9v61SP+9sEBMD48sYxeyVKDHcoZHzZf4Na069TZpjb8BDJ+Ol7XspX9L4azVlW
 Slx/WrWL0QqMnb1/T3qGWA1ViVBO0sD0eUSfq1JYjlCoLSknFJmJ6R6prUrNRi7z5lm0wgxpp
 SEDHNtK4lVtmJirvF1MebS9+W44bWc/DAwM4Di7MMKn0Un0Pk7xZqyu3jFi5mQf+JhOy3f26g
 Ydxi6iHR3f0ucqMO3XUyYaA06GwmoNfBm6dF4vGN0IOYQNEcOzq5HewUB8Sd3ZJWGyTnzrJie
 H1QbMUtOloYP4nGzg/hIGdZ0nsYmAHOUdmbJuB8SpPUUwVvVNiVFH4WdqAmIy+JrEI9NGKqI1
 O74MSre+wdQlf81qGaVRvfqjsvEK4UYY2J5vWw5nyvMrDlo2RTsnCR9FYFCtYCRAXH21nfNx5
 6jt5W40hGylNSwvsZ5QdIWOMf0REdlCkbCwdjsuv3Tkxb5ivzyqO5q0OI+4YUN6EYlmXsP2Kr
 Vq5Hiyb9So6O9EaZR/Eg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 25, 2019 at 5:02 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Arnd,
>
> On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> > I'm in the process of finishing up the last bits on y2038-unsafe
> > code in the kernel, this series is for v4l2, which has no problem
> > with overflow, but has multiple ioctls that break with user space
> > built against a new 32-bit libc.
>
> Thank you for working on this. Much appreciated!
>
> I've reviewed this v4 series and found a few issues (mostly things
> that ended up in videodev2.h that shouldn't be there).
>
> Once a v5 is posted I'll try to test this more.

Ok, great!

>
> Is there an easy(-ish) way to test this with a time64 ABI? Do you
> have such an environment set up for testing?

If you can build your user space with musl, you can test using
a recent snapshot from http://git.musl-libc.org/cgit/musl/.

> > I'm not entirely happy with the compat-ioctl implementation that
> > adds quite a bit of code duplication, but I hope this is
> > acceptable anyway, as a better implementation would likely
> > require a larger refactoring of the compat-ioctl file, while
> > my approach simply adds support for the additional data structure
> > variants.
>
> A cleanup is indeed much more work. This y2038 code is awful, but that's
> really because the original structs are aligned in the worst possible
> way.

Ok.

         Arnd
