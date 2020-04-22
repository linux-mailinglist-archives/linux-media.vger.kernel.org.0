Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4461B4D21
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 21:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgDVTNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 15:13:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgDVTNs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 15:13:48 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF12F20644;
        Wed, 22 Apr 2020 19:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587582827;
        bh=Ppb5VAGWPsKs03siTrUBh7E/XIkbufaSy5xkZBJcuqU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eT7lnn03I2BV80AieR++HwqCcegQG1YZrkxww7lQxWh4HZUTLGlIaYwMt9e8a6rRS
         gdAv7Wbsl8zp+aThDjSNi2OKn3FPu9dNdDLEJAEgOF2/AyhWU5JhFoQAcCZPhWpiWZ
         g5l3N3z+Z8tmPB8M88SHIeu9XuyaYNS8473lB+U4=
Date:   Wed, 22 Apr 2020 21:13:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200422211344.2ec3d93e@coco.lan>
In-Reply-To: <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200418172549.7cca07a7@coco.lan>
        <20200418172654.74a1eeea@coco.lan>
        <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
        <20200420013109.65babb54@coco.lan>
        <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
        <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
        <20200420224750.28c0181d@coco.lan>
        <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 22 Apr 2020 19:56:56 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 20.04.20 22:47, Mauro Carvalho Chehab wrote:
> > Em Mon, 20 Apr 2020 20:27:25 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > =20
> >> Me again ... sorry to ask such a basic question, but I can't get your
> >> modified source code. I get the following error:
> >> =20
> >>   > git clone https://git.linuxtv.org/mchehab/experimental.git/ =20
> >> Cloning into 'experimental'...
> >> warning: adding alternate object store:
> >> https://git.linuxtv.org/git/linux.git/
> >> warning: adding alternate object store:
> >> https://git.linuxtv.org/git/media_tree.git/
> >> warning: adding alternate object store:
> >> https://git.linuxtv.org/git/linux.git/
> >> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f under
> >> https://git.linuxtv.org/mchehab/experimental.git
> >> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
> >> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
> >> error: fetch failed.
> >>
> >> Do I use the wrong command? =20
> > Better to use git:// url:
> >
> > 	git clone git://git.linuxtv.org/mchehab/experimental.git/ =20
>=20
> I was able to download and compile the code. I installed the kernel and=20
> tried to boot; unfortunately it hangs with the message "Loading initial=20
> ramdisk ..." - after I start the old kernel I check kern.log and syslog=20
> - but I do not see entries from the failed boot attempt. I'll read into=20
> the topic and try around. This will take some time ... so there will be=20
> a dealy, but it's not that I do not care or lacking=C2=A0 interest, I jus=
t=20
> first have to sort this out.

Well, try to build it first without the atomisp driver. This would allow
you to see what's going on.=20

Thanks,
Mauro
