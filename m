Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1157B42113A
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 16:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhJDOUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 10:20:55 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57823 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbhJDOUy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 10:20:54 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNss4-1m9HHL1aeW-00OFce for <linux-media@vger.kernel.org>; Mon, 04 Oct 2021
 16:19:03 +0200
Received: by mail-wr1-f48.google.com with SMTP id s15so2876112wrv.11
        for <linux-media@vger.kernel.org>; Mon, 04 Oct 2021 07:19:03 -0700 (PDT)
X-Gm-Message-State: AOAM5314fhP3S4L6jkmsuDmJOOnrStbNM0B1+X7xpVq8XqGCEtJRx7bi
        DczXh4/wKyWXFlw5cuCJTAavd+GTGwkb0Z+s5LI=
X-Google-Smtp-Source: ABdhPJzAQfEpo1QyVDnnohMgPqafVabxqb1y230BTyQvs0QffvVo7wXhV+66HH806BK6ArSIHmovV4iOeGGsLdEwj6c=
X-Received: by 2002:a05:6000:1561:: with SMTP id 1mr14467887wrz.369.1633357143084;
 Mon, 04 Oct 2021 07:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <a2a1d09b-8bd1-f622-3734-0d64943db6bd@xs4all.nl>
In-Reply-To: <a2a1d09b-8bd1-f622-3734-0d64943db6bd@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 4 Oct 2021 16:18:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1R4iOq+9w_bFYUXykUKN1o9hbnccPnnZDGayKFG_yg0A@mail.gmail.com>
Message-ID: <CAK8P3a1R4iOq+9w_bFYUXykUKN1o9hbnccPnnZDGayKFG_yg0A@mail.gmail.com>
Subject: Re: [PATCH] gspca/gl860-mi1320/ov9655: avoid -Wstring-concatenation warning
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tuvJO6ly+nva+pbhImPNamUJQg/ZotjKccikmwHppgZ/uAw79VH
 0lyHIyT3tV3xz/XONA+qMiNq5Q2ENeGnzliznOm498IDJNaFGJkL7oIJ2kqdNzxmZquDnP1
 r/b9+Kh51jz9Rc5mgjzqDtTziOAcITa/kKdNespYGbJzmwWHEeQO/qVM+hG7B3oxnTscLit
 EWlS+A/2QcVW7NnaCKHBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IDK5M7urdpk=:9UvAS/fHnStxuPVSMMCops
 VMvcw2Cslw3yDys73dUHcMIgqQCtDwW6CuXA9Yhh4uJ+XvsLGBZOuGCjJ0B9cCZg9AqqoHSp9
 GgVMEva7TLx43tc42nc1Iw+mQsQEYoK7YAXwOFLeWEZgsHdOGTCp1ZZ/TLB9VIAEFa4JR3AqJ
 c7D8pUYNbfsce2JMYq8jEWfmXuDamIPqnrxCvJ/W9S3KCq1XJDb3A6ueNZKzQ8UWTc5wUTRHd
 ACfYU8QGudilGDSdC/WM7MGmM96fOXPKRRZT5SValvo8QFubcLHZur8OK2IWHBK5lh6Z72/Wh
 lWwUwxNEUT2ANPLicfGKiHFsscy71A47h2u9NTLdSvpWhyA6f/URPFYJv12HK78rolqQen9An
 lzOUvzjfJzAlDEITR2DwY5pRlnPu6xpAZqLV5FSdtK62XKasRy/l2VymSCXOF00poYw5PzIDz
 HHHmYSeialop6WPfo4nNi44XtKoMMEv4+j7LJlXiB6JaRqusvVEOYZA8FTuSmZPPATEZIZS88
 m+Z6BzjEvqWHfWnCFwnmQB9WlwOL/i2MlUePDtdEsapfOItPJV31BCp8CkRrNOctHHOucSBdI
 rrIUP3KkphiHDfvVLG0SYmX+vX23qtJ2UA5yfFzA2ZTHN1bpebCMHabd6YtgArsqwDlEsB0LR
 M4QPBcRjEiQQPRfd7sbWU5DsaPd+yKHm+ZR2++KITfRPgI7fn5+/gns2OtP/CS3qnrA3A1uFl
 PtrhsXV48LiUtUQ7ytsuNCqD1V5PpNzIqSb4gQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 4, 2021 at 4:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Newer clang versions are suspicious of definitions that mix concatenated
> strings with comma-separated arrays of strings, this has found real bugs
> elsewhere, but this seems to be a false positive:
>
> drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:37: error: suspicious concatenation of string literals in an array initialization; did you
> mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
>         "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
>                                            ^
>                                           ,
> drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:2: note: place parentheses around the string literal to silence warning
>         "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
>
> Replace the string literals by compound initializers, using normal hex numbers.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me, much nicer than the original or my earlier patch.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
