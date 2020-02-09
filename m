Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57038156BAF
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 18:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgBIRJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 12:09:32 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37643 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgBIRJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 12:09:31 -0500
Received: by mail-vk1-f196.google.com with SMTP id b2so592084vkk.4
        for <linux-media@vger.kernel.org>; Sun, 09 Feb 2020 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cTVo2U9KTioTCLP3XSeVoyKOkuiWdF4fuEhq6a/+zbQ=;
        b=X+AKAv0ks82oqD2t43ZyCyFh4luZOixMPsW/OkM+5LgO6hPsyHglS+wnA0F57EvaUD
         9VwI9lpadXXTYOX6asNXnGu443eMa4uJ8yx8yy60PKBgXVuaV4tDXQwgaZgrUbVEFl7f
         pU0rwxwpz5hM132RK81iOb55ipALo18tXAwL1fFKcuoc5uG8jBudWt/8LH3l/K7oOG+V
         GXXoWiJ0wkluun8HzmK1nvtbGGF4U9slgifNe6d4G05iM+axcRRbv1IXe1RAl8zQyh8D
         otSdVWdFNz4HZmgzlDKGqYtWBgnNWN9Q7/DuSYtxuPp98xFgs1HaUScivcwc3EmNog+W
         CInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cTVo2U9KTioTCLP3XSeVoyKOkuiWdF4fuEhq6a/+zbQ=;
        b=XHzFaSrzEmBTn2sqFl/ae6+lQToA7HLIr2lnxstjM0WJBzrMvPgNJuH8ibzJL300H7
         KJYOm3ksa1t2ESnabz7i6FQNjT+Si2UPRc9UPyn7vpo0FpMTeFJJrhpi+DpQyLnh9Buq
         yuiVcNTKSyMSr5Z1Ym54zB4P+pAAZlastO9ErtGtZrkqB0UTncGCMESpXEqJQ6TqLLtW
         zrTh5iuUCab4oPigoqzjgnmS0how9H+1B0e4STveCv1Jdgl/2iJn53veuFJjl4S1PBiy
         8GLBvml0zjo9n3R9P1xewwHKcmjvjLU7v1jIlBqP7ZB3kP1UhrakBRuwgqeLRAOIhnYc
         saIg==
X-Gm-Message-State: APjAAAVvdG/RWVDklI9C+jK6T1yFbL5+Q+QVMWOd1CaRWUBMyLZbmUti
        jTwHG6GWzTVn+3NZn+rtSe7USfuAlwUBIFSpkoQe6g==
X-Google-Smtp-Source: APXvYqwC5E1vHaoVe5TD+NTJeDM1TW1xkDse7uMbo4tmjWmqlr3IF/TBaj3K9VzqmEoolu6n+MFERw4KggOFhiWhAQM=
X-Received: by 2002:a1f:9684:: with SMTP id y126mr4247264vkd.84.1581268169240;
 Sun, 09 Feb 2020 09:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
In-Reply-To: <20200202155019.1029993-1-nfraprado@protonmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 9 Feb 2020 14:09:17 -0300
Message-ID: <CAAEAJfDGicyS9RGkLfPEBP9FCVHiu4tYsnq+BKPsez7pWSxXXQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: vimc: Add support for GBR and BGR formats on
 source pad of debayer
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2 Feb 2020 at 12:50, N=C3=ADcolas F. R. A. Prado
<nfraprado@protonmail.com> wrote:
>
> The objective of this series is to add support for GBR and BGR media bus =
formats
> for the source pad of debayer subdevices of the vimc driver.
>

Can you elaborate why is this needed, e.g. what use-case is this enabling,
or what is this fixing?

Thanks,
Ezequiel

> Since the GBR media bus code doesn't have a corresponding pixelformat, it=
 needed
> to use the pixelformat of another bus code.
>
> The first patch makes it possible to have multiple media bus codes mappin=
g to
> the same pixelformat.
>
> The second patch adds the GBR media bus code, using the RGB pixelformat.
>
> The third patch adds support for GBR and BGR media bus formats on the sou=
rce
> pad of the debayer subdevice.
>
> This patch series passed all tests of v4l2-compliance:
> $ compliance_git -m /dev/media0
> v4l2-compliance SHA: c4a62f26c5c3ecd856ca10cf2f0d35d100283d7f, 64 bits, 6=
4-bit time_t
>
> Grand Total for vimc device /dev/media0: 461, Succeeded: 461, Failed: 0, =
Warnings: 0
>
> N=C3=ADcolas F. R. A. Prado (3):
>   media: vimc: Support multiple buscodes for each pixelformat
>   media: vimc: Add GBR media bus code
>   media: vimc: deb: Add support for GBR and BGR bus formats on source
>     pad
>
>  drivers/media/platform/vimc/vimc-common.c  | 68 +++++++++++++---------
>  drivers/media/platform/vimc/vimc-common.h  |  9 ++-
>  drivers/media/platform/vimc/vimc-debayer.c | 53 +++++++++++++----
>  drivers/media/platform/vimc/vimc-scaler.c  | 10 +++-
>  drivers/media/platform/vimc/vimc-sensor.c  |  6 +-
>  5 files changed, 102 insertions(+), 44 deletions(-)
>
> --
> 2.25.0
>
>
