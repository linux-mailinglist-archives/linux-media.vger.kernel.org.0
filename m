Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE458311063
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 19:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbhBERJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 12:09:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:42858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233647AbhBEQ3d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 11:29:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37B8F64E4D;
        Fri,  5 Feb 2021 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612548671;
        bh=yWZtZPAP4nZYW79cu5NgAC9QYiraIlmFa0/bPP0ERuM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Gx6KEjej7Pl/icLyoEZGR+dQjVlGiKf7JZNFZauDKp8ynRzweCkcBblzalY0GSpXx
         Lfw3l/GV8q6UIjEhf7qzSMBoAHbmZ2zZa5QH9JsFpXxb5uIMm2hr8312YSHpLXd0+M
         YPoUrBP7lWrWVDY8RbFM+l+RZPzBWZ39rValnx2AWeWHVkVLdc1ZVBDM02ZRlKqYKU
         8AGlTbusZuArYYAjxLECwgckTwpxMlbxUKy65KuqJgvkagM4UHBSb8VFODeDoijCcn
         lphoRe4qxbkSsX5uydsNKmsd5vJl0xsbYRFUb8Z6l0kgpZ4S2voxvSUBhSRU1a75W7
         hTrTwXqhDLspA==
Date:   Fri, 5 Feb 2021 19:11:05 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Tony Battersby <tonyb@cybernetics.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Jari Ruusu <jariruusu@protonmail.com>,
        David Laight <David.Laight@ACULAB.COM>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-media@vger.kernel.org
Subject: Re: Kernel version numbers after 4.9.255 and 4.4.255
Message-ID: <20210205191105.128c6e48@coco.lan>
In-Reply-To: <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
References: <a85b7749-38b2-8ce9-c15a-8acb9a54c5b5@kernel.org>
        <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 5 Feb 2021 12:31:05 -0500
Tony Battersby <tonyb@cybernetics.com> escreveu:

> On 2/4/21 6:00 AM, Jiri Slaby wrote:
> > Agreed. But currently, sublevel won't "wrap", it will "overflow" to=20
> > patchlevel. And that might be a problem. So we might need to update the=
=20
> > header generation using e.g. "sublevel & 0xff" (wrap around) or=20
> > "sublevel > 255 : 255 : sublevel" (be monotonic and get stuck at 255).
> >
> > In both LINUX_VERSION_CODE generation and KERNEL_VERSION proper. =20
>=20
> My preference would be to be monotonic and get stuck at 255 to avoid
> breaking out-of-tree modules.=C2=A0 If needed, add another macro that
> increases the number of bits that can be used to check for sublevels >
> 255, while keeping the old macros for compatibility reasons.=C2=A0 Since
> sublevels > 255 have never existed before, any such checks must be
> newly-added, so they can be required to use the new macros.
>=20
> I do not run the 4.4/4.9 kernels usually, but I do sometimes test a wide
> range of kernels from 3.18 (gasp!) up to the latest when bisecting,
> benchmarking, or debugging problems.=C2=A0 And I use a number of out-of-t=
ree
> modules that rely on the KERNEL_VERSION to make everything work.=C2=A0 So=
me
> out-of-tree modules like an updated igb network driver might be needed
> to make it possible to test the old kernel on particular hardware.
>=20
> In the worst case, I can patch LINUX_VERSION_CODE and KERNEL_VERSION
> locally to make out-of-tree modules work.=C2=A0 Or else just not test ker=
nels
> with sublevel > 255.

Overflowing LINUX_VERSION_CODE breaks media applications. Several media
APIs have an ioctl that returns the Kernel version:

	drivers/media/cec/core/cec-api.c:       caps.version =3D LINUX_VERSION_COD=
E;
	drivers/media/mc/mc-device.c:   info->media_version =3D LINUX_VERSION_CODE;
	drivers/media/v4l2-core/v4l2-ioctl.c:   cap->version =3D LINUX_VERSION_COD=
E;
	drivers/media/v4l2-core/v4l2-subdev.c:          cap->version =3D LINUX_VER=
SION_CODE;

Those can be used by applications in order to enable some features that
are available only after certain Kernel versions.

This is somewhat deprecated, in favor of the usage of some other
capability fields, but for instance, the v4l2-compliance userspace tool
have two such checks:

	utils/v4l2-compliance/v4l2-compliance.cpp
	640:	fail_on_test((vcap.version >> 16) < 3);
	641:	if (vcap.version >=3D 0x050900)  // Present from 5.9.0 onwards

As far as I remember, all such checks are against major.minor. So,
something like:

	sublevel =3D (sublevel > 0xff) ? 0xff : sublevel;

inside KERNEL_VERSION macro should fix such regression at -stable.

Thanks,
Mauro
