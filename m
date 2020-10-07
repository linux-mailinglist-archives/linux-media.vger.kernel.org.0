Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C80286246
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 17:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgJGPhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 11:37:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:55951 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgJGPhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 11:37:54 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Md66H-1kzWSo1MsV-00aDYM; Wed, 07 Oct 2020 17:37:53 +0200
Received: by mail-qt1-f182.google.com with SMTP id 10so2208624qtx.12;
        Wed, 07 Oct 2020 08:37:52 -0700 (PDT)
X-Gm-Message-State: AOAM5329ei+keLtl2h4V4yEhmN32GdqjZ0Y3eBiFKWrv98HnNIIZoX1O
        5jFLb7d81+t464sRK3euOsQujMRUZF/v3Ugn6EE=
X-Google-Smtp-Source: ABdhPJz1UVvdnvYbeBpkWMxqxLtjj8co5Lbs7eY9E/m3oUp5zJUn8Q+Zu+P5QH4HKcr9UjsA/z0soG9AFQZi8lXMrJ8=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr2055142qtv.7.1602085072021;
 Wed, 07 Oct 2020 08:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201007141702.655724-1-arnd@arndb.de> <20201007141812.GA1578@lst.de>
In-Reply-To: <20201007141812.GA1578@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 17:37:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38xRc602Sm2mRQQ2h5qp2r8znXBjzdfV2MWK33T21fSA@mail.gmail.com>
Message-ID: <CAK8P3a38xRc602Sm2mRQQ2h5qp2r8znXBjzdfV2MWK33T21fSA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: stop compiling compat_ioctl32 code
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Rgqw1hrHw3LKh2n/Z45AFazItlGr31bW2b1C6rbEu7Ia6XO3Vmj
 JGTn5JUiV5qwVT+8Zf4PLbWzfiQmDMVbrawS8uqb3Yptu/pQs08HxRFVp6b6dqqHWqrlhL6
 e56Ka44Fr7CUcaCNG5IbE0006QYoDYQwEfCt2wx0+NAVef9I4kSjO23B7JEzL3qBu1RcAfG
 bAr3iX9wNvpGSu5jfiUXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ajare0/6oxw=:4Szm3wqIQuNyiYzFPtSlaW
 nuj+z3nYwUTGJvxLI4WyDlJSrpvLTxKwbnPbCFSxbopIphsL03GztzU3/RllLtnzIEuHfXUJU
 TMFoUtUCI23y72FMI3HgE6v+nnMNurY4Gu2jPsKb9ZaK3eQtAhPIHmmTzv5Wn6ZxobCyWW67X
 JqPiIsDKXBQsV3zO+oGlECYrQPQhUBbWBmyT7SoH3ZRVcEV13QY48/TYyt/b1ULivinj5USRv
 RBImUUS3MSRJkHhaPpQ8QlD4NJpdSSCvjEh4jWv0EMLrg0VSjWI5i316Vw6CQQI/Kqmqrduzs
 +euKK8pcCbMZbqjBnDDGfJ5m5DGhENO25qpqrO1T+shre68DxHbH2i/3YNIukVF11+o/rk7z4
 Qe1p7kPLMbBk3p7ACNmwMkRhlTpefJ5CBfkxh//JWDsfEswiDTSGdnB5ontbMCJ0HIKIyBBpF
 KweTR8gz/n04GJP1Iao+VWLO2Ch4TlJ/qrfi95Ge3Nb9V5q7lZ10RgOXC8kyMShY6/gUcPIur
 3RAgPrbELxcC/8rFJydbEGtr5ntnvOb3VtMO5AfTTsM8LD4FCaFYebfYLI901qU3J2bv35lFm
 6J1meYrTCrzZTN0L7Z/u/tfgpz9G199LYsusNuFA3iXPUsgz4UP5VbYJSz1ZgJG2z+uVb/T5R
 Rl/2urQ1fGYAsSHWbx9zOKOKdRXNOurqCMroyYY6Qveq/uQVQipFGEd+48bTaGd5r6V52a4IA
 ZrGaCFiOI5/mO8M6UKytk54ZWdA5AZC47rpygyPFj/6vAA5fzASoyyzjqG3aqQfhJW2D+Ui0V
 29ypfX0xRr3dKV9Uq5MdNWsiYZDfNboE3SRPFLyNouSgWNdPB0Fn84gf77AhoI/vNNWBnK5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 4:18 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Oct 07, 2020 at 04:16:39PM +0200, Arnd Bergmann wrote:
> > Alternatively, the entire file could just be removed, since anyone
> > willing to restore the functionality can equally well just look up
> > the contents in the git history if needed.
>
> I suspect that is the right thing.  Note that given that the driver
> is only in staging anyway, the right thing to do would be to change
> the ioctl ABI to be more compat friendly to start with.

Ok, I sent that as v2 now.

I wonder how many of those 56 ioctl commands in the driver are
actually used in practice. Is there a public repository for the
matching user space? Is it required to even use the driver
or is it otherwise compatible with normal v4l2 applications?

     Arnd
