Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9F9130F70
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 10:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgAFJ3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 04:29:13 -0500
Received: from mout.gmx.net ([212.227.17.21]:33015 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgAFJ3N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 04:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1578302952;
        bh=sTraTDSyNOGS6DOIfFUkjlgKsk4JoprUqjPKZ24do+s=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=XGj3my5GA9SoxzepMUuOjI2RJJGYG02/SfnYEzBix2qOwBRprTCkpS/u0TGut3+Sh
         jQBsvmGimJkG/XZ6T/4nL5+LpeGgAz9xczulAl1ixnpVBuLWry/Hz0IpGtKUWTL70e
         T7+xZsp+ngTRyrgKlK5WtfaH5Aix9XNuHmmJezp4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.53]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs4f-1jS4xi3QDx-00mqld; Mon, 06
 Jan 2020 10:29:11 +0100
Date:   Mon, 6 Jan 2020 10:29:10 +0100
From:   Peter Seiderer <ps.report@gmx.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] keymap.h needs sys/types.h and argp.h
Message-ID: <20200106102910.0172ef45@gmx.net>
In-Reply-To: <20191231090848.GB24469@gofer.mess.org>
References: <20191218211016.18796-1-ps.report@gmx.net>
        <20191231090848.GB24469@gofer.mess.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aX5Q9XB9e50tgxBRfYQG9f4/93qgTcvYiAvKkMO1EG2yNCtqHP4
 umPZ+QKtTyRrGrNfCer97bzmclpms70n0/njn1o0EFQKqD/cmsDwlR0sc4de8t0EZJ8PxD1
 gpAAqSR5AWJKYu1ZhzSoepTAEnfPRDSK0g1BSKpPJXoqeaTYkETR41aGGA/mzKoVUOB7Q2J
 sGZTm7AA9sXYhhEHPsTMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xoCoF1F34HY=:F4ied6DFffUbxeoJxmFavF
 kZmvTInEPs4og+c7zEGUYiVkfjFHPw8AJnjBzSOB1hE43XNIh6z+2H4gkzHqUuMjWCSyvuei0
 fUEJnRDg31OZSkDW9FzMnKdo9AVxceU1T+LxGJAlk/Sbr/y6jRtosCmD0qpWafrr6ICdRmzds
 lVeM2uAz5fZtzUNUYIVZoNg7o3i+TSNo8PoZIhM8lMLKNsYcohHK5pECob7Bs8uFs4aLOG3Y3
 eqTsj7PLyDrsnCvj5YaBTTZx2jh6iAz1qtn+aIZ9nwoJYb0ReeJDwfDq4CpiOKkkj6VcQOrjY
 W4PRRwPTaFtOID1KFnU4iUwtv09sGcI6PeCNIOwXxyPZ+9gjHF04/wf2eCNWnpXS4fEkg6x0q
 rRS26WcUAR4FqOa18Cc9V5RT+kJa+THIk4knp7Wd1eUHcQtDc8JvVR/7Qrl4Mm/ynDiXBswzO
 vFaIPq6uFSQDio1IG3cQXrP7o22vkwy5WqVDBTiWO+9F53gLoEcZEOKay8Xgb5g1Y2+dD1H7i
 mFVrksKjDIq6iQkP1GJGzsOXxtgWivHYDsJ7CCWmD3Z0y1dzRfxLvZR7yaJTFYLMdelAcrZoJ
 TICWz9AsdgyWKhAsxRXEBTlGV4uUt1EF40stGX8wqQmwFbJCCqnrNUynI3QHmxKevxJPM0NA8
 1JyjGYjn+6Bp7rj6mK0wrpdVBud+bsZKFL9KSjhTrZo/UGi5V5N9/NvxACqMS/9vRsOtMcKHR
 96tnc7ukiM2C6b1SnRiSXCJMcHIr+ApQrsQnx0+/8bQ8JWag6BquZtM4dszHTR3q763nrOxQ5
 wIbQJ0z+64g2VUTxU4XnUermoCpGIuf0xNTGHJnoC7TF3vIuxAIO1vVNRvjNCo9M0RlRpkJb2
 FF9V/6VZJOaFrxmZms32gftRthiXHstuYWno6pwxp57Ja9spRe5QDbUMCO6+OUlYUwW3IuFaz
 Ua5XDCCh8JwV5BKJgg3Uvk6k7ShvHJDxx+1/vK2cBzTRSAxvA3ua8UOupWBc89wZxQ9BF7yXM
 kHzKqvOyuYJRvEeNAiF8NzMOcGWTpd9K1EaUKbZX3BwI4IeHlpO9BKlHW4irRnc74m9W7thcS
 A3beCVnhjfXuVPZa0lArZ7m9XbZ6/JtuBsBLwWxQUmjkK4dyItXZzjmAwF+mZ3b1cKk8xBtwf
 NtOAsKS/DJAj/K21R6cHLjHITYh7JtNmRbcvrF+IX0wOEyzXJU6qaa6GY4Q1ldF2eCeCBvgWa
 S3AuPtrC9RPg2xwv4vKt+2SZxkffMR0RRgSi8Z3QjNOLQ98hGnkzvaSeuLhU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Sean,

On Tue, 31 Dec 2019 09:08:48 +0000, Sean Young <sean@mess.org> wrote:

> Hi Peter,
>=20
> On Wed, Dec 18, 2019 at 10:10:16PM +0100, Peter Seiderer wrote:
> > Fixes:
> >=20
> >   keymap.h:23:2: error: unknown type name =E2=80=98u_int32_t=E2=80=99
> >   keymap.h:36:1: error: unknown type name =E2=80=98error_t=E2=80=99 =20
>=20
> It would be nice to know where/how you are encountering these errors. ir-=
ctl
> with these changes are building fine on Fedora and Debian (unstable).

Sorry for the (very) brief commit log, the problem occurs with buildroot/mu=
sl-toolchain
e.g. from the buildroot autobuild system [1], [2]...

Regards,
Peter

[1] http://autobuild.buildroot.net/results/f6d14fa0827d5eba9e020f238399396a=
121a45d6
[2] http://autobuild.buildroot.net/results/f6d14fa0827d5eba9e020f238399396a=
121a45d6/build-end.log

>=20
> Thanks,
> Sean
>=20
> >=20
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  utils/common/keymap.c      | 2 ++
> >  utils/ir-ctl/bpf_encoder.c | 1 +
> >  2 files changed, 3 insertions(+)
> >=20
> > diff --git a/utils/common/keymap.c b/utils/common/keymap.c
> > index f574f24f..d06deb59 100644
> > --- a/utils/common/keymap.c
> > +++ b/utils/common/keymap.c
> > @@ -9,6 +9,8 @@
> >  #include <string.h>
> >  #include <limits.h>
> >  #include <stdbool.h>
> > +#include <sys/types.h>
> > +#include <argp.h>
> > =20
> >  #include "keymap.h"
> >  #include "toml.h"
> > diff --git a/utils/ir-ctl/bpf_encoder.c b/utils/ir-ctl/bpf_encoder.c
> > index 82d12cc0..e3e705e7 100644
> > --- a/utils/ir-ctl/bpf_encoder.c
> > +++ b/utils/ir-ctl/bpf_encoder.c
> > @@ -5,6 +5,7 @@
> >  #include <errno.h>
> >  #include <string.h>
> >  #include <sys/types.h>
> > +#include <argp.h>
> > =20
> >  #include "keymap.h"
> > =20
> > --=20
> > 2.24.0
> >  =20

