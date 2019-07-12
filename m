Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D216748D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 19:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfGLRpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 13:45:50 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42924 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfGLRpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 13:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NxeFOSM4MwQ991fBRbEDEiqzzEYscNx/lH42noQqaEA=; b=iiOsW3Vw8rpy77HSY+BGojEg3
        r1DgZZuXVeaAX4pU32jCzEMbZcE4HtuLLezPLqvzJT0Tbt0N3T085kmHs53uch75CG27pJliMnDq/
        /Yb90FjffjE6mabThCuHYTbXItDblO8gBVgcMq2JAjeN8yK56sjN172naX00teqIbfYq4mtWssMYz
        o/V/KPzcVb8qs/8iJTx+iqmSqmkgOPprMGp/YeoYVJtCZXDI9OLxcZOMroQluNZzk055ejii7IN7e
        Xat7kvGXGALkxQXnexd0HUOmM9Ad936A2+82kIK9u/NqCMC1G1c3qBhSX08mgsBqND4u1Ih6t370d
        bXzgvZE3A==;
Received: from [186.213.242.57] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hlzc6-0006HD-MB; Fri, 12 Jul 2019 17:45:42 +0000
Date:   Fri, 12 Jul 2019 14:45:37 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Brad Love <brad@nextdimension.cc>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Antti Palosaari <crope@iki.fi>,
        Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
Message-ID: <20190712144537.2bad2482@coco.lan>
In-Reply-To: <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
        <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 12 Jul 2019 10:47:17 -0500
Brad Love <brad@nextdimension.cc> escreveu:

> Hi Marc,
>=20
> Replying inline.
>=20
>=20
> On 04/07/2019 05.33, Marc Gonzalez wrote:
> > Refactor the command setup code, and let the compiler determine
> > the size of each command.
> >
> > Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > ---
> > Changes from v1:
> > - Use a real function to populate struct si2168_cmd *cmd, and a trivial
> > macro wrapping it (macro because sizeof).
> > Changes from v2:
> > - Fix header mess
> > - Add Jonathan's tag
> > ---
> >  drivers/media/dvb-frontends/si2168.c | 146 +++++++++------------------
> >  1 file changed, 45 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-f=
rontends/si2168.c
> > index c64b360ce6b5..5e81e076369c 100644
> > --- a/drivers/media/dvb-frontends/si2168.c
> > +++ b/drivers/media/dvb-frontends/si2168.c
> > @@ -12,6 +12,16 @@
> > =20
> >  static const struct dvb_frontend_ops si2168_ops;
> > =20
> > +static void cmd_setup(struct si2168_cmd *cmd, char *args, int wlen, in=
t rlen)
> > +{
> > +	memcpy(cmd->args, args, wlen);
> > +	cmd->wlen =3D wlen;
> > +	cmd->rlen =3D rlen;
> > +}
> > + =20
>=20
>=20
> struct si2168_cmd.args is u8, not char. I also think const should apply
> to the pointer.
>=20
>=20
> > +#define CMD_SETUP(cmd, args, rlen) \
> > +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
> > + =20
>=20
>=20
> This is only a valid helper if args is a null terminated string. It just
> so happens that every instance in this driver is, but that could be a
> silent pitfall if someone used a u8 array with this macro.

Actually, it is uglier than that. Of one writes something like:

	char buf[20];

	buf[0] =3D 0x20;
	buf[1] =3D 0x03;

	CMD_SETUP(cmd, buf, 0);

	// some other init, up to 5 values, then another CMD_SETUP()


sizeof() will evaluate to 20, and not to 2, with would be the
expected buffer size, and it will pass 18 random values.

IMHO, using sizeof() here is a very bad idea.

Regards,
Mauro
