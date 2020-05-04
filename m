Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F56E1C3722
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 12:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728125AbgEDKpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 06:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726445AbgEDKpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 06:45:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028C1C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 03:45:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g13so20298470wrb.8
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 03:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CX/5Gfk06qaXTDfegOCHduy5CUjTjXi2kCJhlNaOOQg=;
        b=bqGOMNY+r3L+ybu4Pj334dWOIXU4FTU9BLiu7Pyw6oSh3tSVCeMKJ+5+3H4C7+KKCY
         WOcRHxWCPkZnpmYQ4lxQy4cKPqJUk2VneI8NkdILRl5OnKPGvDtAMXZ0WeNmIVwAHLOC
         YiDkvti+GR5T2MXojP5MMQQIfdSCRPp+bJKfX6I6tSvxj+G7Z3WJ5xqL3cucmaK/bDQc
         9VWr5M6rU94xDgbvQdLMWWQNEP56+tooAeiDkMz+ErLJIl5VyN+HfZ1Qu/UkWYe/FO5q
         01gNo3lKHEPvFsMwoVOS8UZZVAF2JyOQhFowO8AV8ne7/4vgQRyg+s/T6UV8lfRpzkzf
         nqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CX/5Gfk06qaXTDfegOCHduy5CUjTjXi2kCJhlNaOOQg=;
        b=ga1oGItDAeMWgslpDV+YjWwHa7fiQtoumAq/oJr95E3Tm7i54VxTqHuSlvOSHH5728
         2l0wyEZ3FXfSy6EoZxQAq0iFlTGHkYc4GpttjU16xQqc3AHdb6BHoGkwp03ljzV65GMn
         tw5MuFmpPpBTz9dTfxNncnv4iLK9x10sx3ctv6v3mWFcXz4M5hgl2Ke3hWj2fercKADb
         ku29XoxZIjL0aDQ60X8arK5SQqCQdyRPWMvz+VuRcG55zNOfbp1G5/GQVM1sYYPyZddk
         546ayMklQy+e5uW/qWMB5hCZTwIg5JZmY7S+2NgOIWWgemnUtlavGPCohTegN5MGkP9f
         5Lpw==
X-Gm-Message-State: AGi0Pubosh5Agx8sHxDYa4vqijqLsnWJDlga4IVf5Gl9+dzRfWQPECIV
        wEpFxC8lMTfo1KYJCEco0vc=
X-Google-Smtp-Source: APiQypJZH9kdJwk12qkqVewABu6d3b21Tge/MFgThngL2ehWEMXM9uGvA3BOxL+d+FOjfMCfFjHdEQ==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr19817507wrw.207.1588589143600;
        Mon, 04 May 2020 03:45:43 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id k14sm18033386wrp.53.2020.05.04.03.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 03:45:43 -0700 (PDT)
Date:   Mon, 4 May 2020 12:45:39 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200504124539.77eac397@ASUS>
In-Reply-To: <20200504104934.7873cee3@coco.lan>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 4 May 2020 10:49:34 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> Em Mon, 4 May 2020 10:16:28 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>=20
> > On Sun, 3 May 2020 18:07:51 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> wrote:
> >   =20
>  [...] =20
> >=20
> > I was not able yet to compile the kernel 4.4 successfully yet.  =20
>=20
> Yesterday, I imported only a subset of the yocto patches. I imported today
> all 24 patches from it, as some patches depend on hacks on other upstream
> stuff. You'll need to do a:
>=20
> 	$ git remote update && git reset --hard origin/yocto_intel_atom
>=20
> To update your local branch.
>=20
> > I get quite
> > some warnings that are treated as errors. I assume that I can "resolve"
> > this by removing the respective compiler flag (-Werror). =20
>=20
> Yeah, you may need to to that. There's a Kernel option with disables
> -Werror. You may also change the Makefile to add things like:
>=20
> 	# HACK! While this driver is in bad shape, don't enable several warnings
> 	#       that would be otherwise enabled with W=3D1
> 	ccflags-y +=3D $(call cc-disable-warning, implicit-fallthrough)
> 	ccflags-y +=3D $(call cc-disable-warning, missing-prototypes)
> 	ccflags-y +=3D $(call cc-disable-warning, missing-declarations)
> 	ccflags-y +=3D $(call cc-disable-warning, suggest-attribute=3Dformat)
> 	ccflags-y +=3D $(call cc-disable-warning, unused-const-variable)
> 	ccflags-y +=3D $(call cc-disable-warning, unused-but-set-variable)
>=20
> (this is what we do with the upstream version, as this driver is on
> bad shape)
>=20
> > But there are a few things that will take more time for me to investiga=
te:
> >=20
> > drivers/media/pci/atomisp//css2401a0_v21_build/../atomisp_driver/atomis=
p_cmd.c:36:10: fatal error: linux/kct.h: No such file or directory
> > include/media/v4l2-subdev.h:821:51: error: =E2=80=98const struct v4l2_s=
ubdev_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99
> > include/media/v4l2-subdev.h:822:15: error: =E2=80=98const struct v4l2_s=
ubdev_core_ops=E2=80=99 has no member named =E2=80=98g_chip_ident=E2=80=99

There are still errors when I try to build. I've found code like the
one below:

const struct v4l2_ioctl_ops atomisp_ioctl_ops =3D {
	.vidioc_querycap =3D atomisp_querycap,
#ifndef CONFIG_INTEL_MID_ISP
	.vidioc_g_chip_ident =3D atomisp_g_chip_ident,
#endif
	.vidioc_enum_input =3D atomisp_enum_input,

Therefore I've tried with "CONFIG_INTEL_MID_ISP=3Dy". Not sure if this is
a good idea function wise - but it compiles. But the last step of the
module build produces some scary warnings:

WARNING: "cpu_tss" [drivers/media/pci/atomisp//css2401a0_v21_build/atomisp-=
css2401a0_v21.ko] undefined!
WARNING: "pv_lock_ops" [drivers/media/pci/atomisp//css2401a0_v21_build/atom=
isp-css2401a0_v21.ko] undefined!
WARNING: "__alloc_workqueue_key" [drivers/media/pci/atomisp//css2401a0_v21_=
build/atomisp-css2401a0_v21.ko] undefined!
WARNING: "v4l2_subdev_querymenu" [drivers/media/pci/atomisp//css2401a0_v21_=
build/atomisp-css2401a0_v21.ko] undefined!
WARNING: "intel_mid_msgbus_write32" [drivers/media/pci/atomisp//css2401a0_v=
21_build/atomisp-css2401a0_v21.ko] undefined!
...

Maybe this is related to my partial build (only the module to test if
it builds). I'll now do a full build of the kernel.

> >=20
> > I'll keep you updated. =20
>=20
> Maybe now with the other patches applied, this could have been solved.
>=20
> Thanks,
> Mauro

with kind regards,
Patrik

