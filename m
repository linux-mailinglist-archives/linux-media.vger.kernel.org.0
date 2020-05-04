Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F3B1C34D4
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 10:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgEDItm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 04:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727929AbgEDItm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 04:49:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEF3C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=2q6sBYm9cSdjw70HOol2k2huqwYMXvxSxakfhIHIabo=; b=mzEezp/BESWtG3QsDkqaKUbfY8
        eke3yvI2lHdXN3HeL+EfDgj92oJEnVrYlxjwY4IJJwiWrn41B5h8t9c/82w4xw//OoPJdF3kpT0jC
        LvOGDinSoWkXGF+t946StKNWkeauYUUgev86iE1AMBJ7ailXiKr0upseY9mEOnDBGiXunxLDQcIQK
        j6e6mWH7SWWtaUgWotOsyu8sYYc/24QB5Succ5bs4UFMdt62sMSQ2FhqK74GsVvnFxioD81FcWCXp
        C9k7GKJmpm4SoJRMzN340XHxKkq4Wx4a85ubMdpNZby8n5MplrD77IPL5NonWfvshHes7rB9FYHX1
        yqXoRmfg==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVWnC-0004jQ-Ck; Mon, 04 May 2020 08:49:38 +0000
Date:   Mon, 4 May 2020 10:49:34 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200504104934.7873cee3@coco.lan>
In-Reply-To: <20200504101628.0f632bf2@ASUS>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 4 May 2020 10:16:28 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Sun, 3 May 2020 18:07:51 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> wrote:
>=20
> > On Sun, 3 May 2020 18:03:54 +0200
> > Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it> wrot=
e:
> >  =20
> > > Il giorno dom 3 mag 2020 alle ore 17:32 Mauro Carvalho Chehab <     =
=20
> >  [...]   =20
> > >=20
> > > Thanks a lot !!
> > >    =20
> >  [...]   =20
> > > According to my understarding mine which is baytrail should be  ISP24=
00   =20
> >=20
> > I have ISP2401 (rev B) ... I'll give it a try :-) - thanks Mauro! =20
>=20
> I was not able yet to compile the kernel 4.4 successfully yet.=20

Yesterday, I imported only a subset of the yocto patches. I imported today
all 24 patches from it, as some patches depend on hacks on other upstream
stuff. You'll need to do a:

	$ git remote update && git reset --hard origin/yocto_intel_atom

To update your local branch.

> I get quite
> some warnings that are treated as errors. I assume that I can "resolve"
> this by removing the respective compiler flag (-Werror).

Yeah, you may need to to that. There's a Kernel option with disables
-Werror. You may also change the Makefile to add things like:

	# HACK! While this driver is in bad shape, don't enable several warnings
	#       that would be otherwise enabled with W=3D1
	ccflags-y +=3D $(call cc-disable-warning, implicit-fallthrough)
	ccflags-y +=3D $(call cc-disable-warning, missing-prototypes)
	ccflags-y +=3D $(call cc-disable-warning, missing-declarations)
	ccflags-y +=3D $(call cc-disable-warning, suggest-attribute=3Dformat)
	ccflags-y +=3D $(call cc-disable-warning, unused-const-variable)
	ccflags-y +=3D $(call cc-disable-warning, unused-but-set-variable)

(this is what we do with the upstream version, as this driver is on
bad shape)

> But there are a few things that will take more time for me to investigate:
>=20
> drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_=
cmd.c:36:10: fatal error: linux/kct.h: No such file or directory
> include/media/v4l2-subdev.h:821:51: error: =E2=80=98const struct v4l2_sub=
dev_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
> include/media/v4l2-subdev.h:822:15: error: =E2=80=98const struct v4l2_sub=
dev_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
>=20
> I'll keep you updated.

Maybe now with the other patches applied, this could have been solved.

Thanks,
Mauro
