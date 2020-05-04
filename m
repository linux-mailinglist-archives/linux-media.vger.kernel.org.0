Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDFF1C3426
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 10:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgEDIQd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 04:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727878AbgEDIQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 04:16:33 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B672C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 01:16:33 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id v8so14940180wma.0
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S96L5sgkcY9t+MobNfmZ4UffGI1jHtyh8IAYblf7C1Q=;
        b=iXlQp11NFh6d5KGWMQAEBl9zr6eHXGo2o5z1wT7+z/2twpH+jcHvi5QogSLSYUvZhy
         nyiqmZtY+rYqcIZaCpJU5RlC84anRP1IcgWdiMBX/T0JmHPcCprvGTYJiTHbmcUzbMDc
         J4+HMtkMXm289wS4TeNwH6UBR654zCDHQZ4yPWpf4BUx6S16tqeEhGNrOi6K8GlbboVg
         5v3ur6ARdtYhr1X8iPK4hx+yobf3GkMYUiTM1QflTL8smfBgutFHIAAsRV4NKB59A+A4
         M2qdNTX6JOLMFXF8vT7wYicwjEawnPgrU7Hb0oMluilb5KbVwKI2Wr5L+vX+z5x7lJ34
         x2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S96L5sgkcY9t+MobNfmZ4UffGI1jHtyh8IAYblf7C1Q=;
        b=KK9m3bGy4LbLaG3I3hsjOPjGDw6JT+1nCD8kw2rZ3k09ci+X0nTw7QALKq49isqyvN
         Ilb1YDIgQmw8dNKrxsvU7JvYrPg8GtumevWy4azh+MIjbiNLUa6JJO9biSJO3wb/lv20
         MJJsoAAr9mZyGIPf9OZB9HGQp1QAndhpDPaqzXIGJFx6qRdu1KR7hSJi1Wpkh81GVvAb
         XKCSnVebeavuLjYzOsqSrKgqH+1MsiFjJABZKPOAXs0ujwV8avP/mHAkHGd1fCLh8++V
         4mUUSqlek7h10UTKXa2pcFDcK6rXwwXK9OhDEgxMVpQn3uruASCzQAkv+uGCueUWGStu
         e0hw==
X-Gm-Message-State: AGi0PuZYJMJp39iOT90fL/8hJNgLw3Ec29virzUq8n4By/jWuv1YJMXK
        lGB/Ft1aqh5H9dKrK1r4ptk=
X-Google-Smtp-Source: APiQypIlzRPo40EKsc7eIVx8GucOt4txcScIHqeqK8fl36CtO+a0rWexvm2eeB4PFcntDnutlQJj3Q==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr14108841wml.133.1588580191484;
        Mon, 04 May 2020 01:16:31 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id t16sm17768640wrm.26.2020.05.04.01.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:16:31 -0700 (PDT)
Date:   Mon, 4 May 2020 10:16:28 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200504101628.0f632bf2@ASUS>
In-Reply-To: <20200503180751.0b1e29c4@ASUS>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 3 May 2020 18:07:51 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> wrote:

> On Sun, 3 May 2020 18:03:54 +0200
> Francescodario Cuzzocrea <francescodario.cuzzocrea@mail.polimi.it> wrote:
>=20
> > Il giorno dom 3 mag 2020 alle ore 17:32 Mauro Carvalho Chehab <   =20
>  [...] =20
> >=20
> > Thanks a lot !!
> >  =20
>  [...] =20
> > According to my understarding mine which is baytrail should be  ISP2400=
 =20
>=20
> I have ISP2401 (rev B) ... I'll give it a try :-) - thanks Mauro!

I was not able yet to compile the kernel 4.4 successfully yet. I get quite
some warnings that are treated as errors. I assume that I can "resolve"
this by removing the respective compiler flag (-Werror).

drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_cm=
d.c:36:10: fatal error: linux/kct.h: No such file or directory
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:61: error: "IS_CHT" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:63: error: "IS_MOFD" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:65: error: "IS_BYT" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:61: error: "IS_CHT" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:63: error: "IS_MOFD" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:65: error: "IS_BYT" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_co=
mpat_ioctl32.c:86:5: error: this =E2=80=98if=E2=80=99 clause does not guard=
... [-Werror=3Dmisleading-indentation]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:590:5: error: this =E2=80=98else=E2=80=99 clause does not guard... [-=
Werror=3Dmisleading-indentation]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:604:9: error: =E2=80=98struct v4l2_dbg_chip_ident=E2=80=99 declared i=
nside parameter list will not be visible outside of this definition or decl=
aration [-Werror]
include/media/v4l2-subdev.h:821:51: error: =E2=80=98const struct v4l2_subde=
v_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
include/media/v4l2-subdev.h:822:15: error: =E2=80=98const struct v4l2_subde=
v_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:61: error: "IS_CHT" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:63: error: "IS_MOFD" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_in=
ternal.h:65: error: "IS_BYT" redefined [-Werror]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:1916:3: error: implicit declaration of function =E2=80=98pci_write_co=
nfig_word=E2=80=99; did you mean =E2=80=98gmin_get_config_var=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:1942:3: error: implicit declaration of function =E2=80=98INIT_COMPLET=
ION=E2=80=99; did you mean =E2=80=98CONFIG_COMPACTION=E2=80=99? [-Werror=3D=
implicit-function-declaration]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:2182:3: error: implicit declaration of function =E2=80=98pci_write_co=
nfig_dword=E2=80=99; did you mean =E2=80=98gmin_get_config_var=E2=80=99? [-=
Werror=3Dimplicit-function-declaration]
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:3063:3: error: =E2=80=98const struct v4l2_ioctl_ops=E2=80=99 has no m=
ember named =E2=80=98vidioc_g_chip_ident=E2=80=99; did you mean =E2=80=98vi=
dioc_g_enc_index=E2=80=99?
drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_io=
ctl.c:3063:25: error: initialization of =E2=80=98int (*)(struct file *, voi=
d *, struct v4l2_fmtdesc *)=E2=80=99 from incompatible pointer type =E2=80=
=98int (*)(struct file *, void *, struct v4l2_dbg_chip_ident *)=E2=80=99 [-=
Werror=3Dincompatible-pointer-types]
cc1: all warnings being treated as errors

But there are a few things that will take more time for me to investigate:

drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomisp_cm=
d.c:36:10: fatal error: linux/kct.h: No such file or directory
include/media/v4l2-subdev.h:821:51: error: =E2=80=98const struct v4l2_subde=
v_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
include/media/v4l2-subdev.h:822:15: error: =E2=80=98const struct v4l2_subde=
v_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99

I'll keep you updated.

>=20
> >=20
> > https://github.com/intel-aero/meta-intel-aero/blob/4ebb7cc829f57306b989=
5f20af8fd17987089392/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin =
=20
>  [...] =20
> >=20
> > Dario =20
>=20

with kind regards,
Patrik

