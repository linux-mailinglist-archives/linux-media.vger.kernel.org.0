Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A03E1EDD1C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 08:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgFDGU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 02:20:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgFDGU4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 02:20:56 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 357E7206DC;
        Thu,  4 Jun 2020 06:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591251656;
        bh=+HdQImVDyrT99xu6InwjdgnGBee+vtpE89w1UlBanIE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=asoXW0pWuATP8jFKvFvNgsCVYtB54v25YROE33i5jH5P/1UetYz8OtYr0eNqaFdig
         /XwS0KlWwm1EgFLSBOb4XrFrqQC+KC3t2BDFpPC+CTKrErpagVmTeUlt8cCxagRgLC
         z+kmUC6vfolwV6zu1yPLtOC8yQG9Cq8v1qZtuWOg=
Date:   Thu, 4 Jun 2020 08:20:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL for v5.8-rc1] media updates
Message-ID: <20200604082052.298d534f@coco.lan>
In-Reply-To: <CAHk-=wg0=J7VXoEL0eCNmguyj-z7G-iByHcUV02nrmw10GCZ3A@mail.gmail.com>
References: <20200603100559.2718efba@coco.lan>
        <CAHk-=wg0=J7VXoEL0eCNmguyj-z7G-iByHcUV02nrmw10GCZ3A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 3 Jun 2020 21:21:06 -0700
Linus Torvalds <torvalds@linux-foundation.org> escreveu:

> On Wed, Jun 3, 2020 at 1:06 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> >   - The atomisp staging driver was resurrected. It is meant to work with
> >     4 generations of cameras on Atom-based laptops, tablets and cell
> >     phones. So, it seems worth investing time to cleanup this driver and
> >     making it in good shape. =20
>=20
> Hmm. It causes a warning for me:
>=20
>    drivers/staging/media/atomisp/pci/atomisp_v4l2.c:764:12: warning:
> =E2=80=98atomisp_mrfld_power=E2=80=99 defined but not used [-Wunused-func=
tion]
>=20
> which is a bit annoying.
>=20
> I can see the FIXME's there, but the warning still isn't acceptable.
>=20
> I'll add a fixup commit. I was going to do it in the merge itself, but
> decided that was a bit too subtle.

OK!

I have a patch like that already on a separate pile of patches,
which address several other things. I opted to place them in
separate, in order to give people some time to comment and review.

My plan is to keep them on linux-next and submit you next week, if
ok for you.

The new series should drop all LLVM warnings and add SPDX headers,
among other things.=20

Thanks,
Mauro
