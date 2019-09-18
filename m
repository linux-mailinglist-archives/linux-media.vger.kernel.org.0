Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10CEFB6597
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 16:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfIROL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 10:11:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41196 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfIROL6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 10:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Yohvd0Idt9XF7Z6aLd86ae0gny3xbIPIECy+nZxQfLE=; b=S/PEL4lw1qOMpx3VheqesgCV1
        AIiEYbnI2+76xp2AdoZPxn99nn4aBnFFjMqZDtORB/z7ZMSmPUc8cQgoQ+zPzDCZMzxEwMNI2Xisv
        7Kt8c+FOSVluINCBfYJCFxm9YCOt8RvGMA+E9yntY3tGoE+taqsw2dB1Y3aeOw2GXqOH66/bK+39F
        DpBuzmAmm4vHuSOsaIPBL4rSbm/3ziVEeebXN9NwQ8syvEOt2bDqZ70gcln9F2e8GgQMQQgpmegct
        UQUPONz3+M1pb3nEeAfnBgNDdMo7gr9gQQcsO8K8cOYzdoFXSXXe3K9qefRYIbKQ6yIzlHfqXVpAc
        Kl+PGB/QQ==;
Received: from 177.96.192.152.dynamic.adsl.gvt.net.br ([177.96.192.152] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iAagX-0002oN-EH; Wed, 18 Sep 2019 14:11:57 +0000
Date:   Wed, 18 Sep 2019 11:11:53 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2] media: add a subsystem profile documentation
Message-ID: <20190918111153.6f52c651@coco.lan>
In-Reply-To: <1e479f17-dbc8-b44d-bd1e-4229a6dbf151@collabora.com>
References: <20190918123620.GA6306@pendragon.ideasonboard.com>
        <9cdbab30b9e0a435b97113b90645e647e8165225.1568815176.git.mchehab+samsung@kernel.org>
        <1e479f17-dbc8-b44d-bd1e-4229a6dbf151@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 18 Sep 2019 11:07:16 -0300
Andr=C3=A9 Almeida <andrealmeid@collabora.com> escreveu:

> Hello Mauro,
>=20
> On 9/18/19 10:59 AM, Mauro Carvalho Chehab wrote:
> > Document the basic policies of the media subsystem profile.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/media/index.rst                 |   1 +
> >  .../media/maintainer-entry-profile.rst        | 157 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  3 files changed, 159 insertions(+)
> >  create mode 100644 Documentation/media/maintainer-entry-profile.rst
> >=20
> > diff --git a/Documentation/media/index.rst b/Documentation/media/index.=
rst
> > index 0301c25ff887..ac94685b822a 100644
> > --- a/Documentation/media/index.rst
> > +++ b/Documentation/media/index.rst
> > @@ -12,6 +12,7 @@ Linux Media Subsystem Documentation
> >  .. toctree::
> >     :maxdepth: 2
> > =20
> > +   maintainer-entry-profile
> >     media_uapi
> >     media_kapi
> >     dvb-drivers/index
> > diff --git a/Documentation/media/maintainer-entry-profile.rst b/Documen=
tation/media/maintainer-entry-profile.rst
> > new file mode 100644
> > index 000000000000..68d642abe2c1
> > --- /dev/null
> > +++ b/Documentation/media/maintainer-entry-profile.rst
> > @@ -0,0 +1,157 @@
> > +Media Subsystem Profile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Overview
> > +--------
> > +
> > +The media subsystem covers support for a variety of devices: stream
> > +capture, analog and digital TV, cameras, remote controllers, HDMI CEC
> > +and media pipeline control.
> > +
> > +It covers, mainly, the contents of those directories:
> > +
> > +  - drivers/media
> > +  - drivers/staging/media
> > +  - Documentation/media
> > +  - include/media
> > +
> > +Both media userspace and Kernel APIs are documented and should be kept=
 in
> > +sync with the API changes. It means that all patches that add new
> > +features to the subsystem should also bring changes to the correspondi=
ng
> > +API files.
> > +
> > +Also, patches that changes the Open Firmware/Device Tree bindings shou=
ld
> > +also be reviewed by the Device Tree maintainers.
> > +
> > +Due to the size and wide scope of the media subsystem, media's
> > +maintainership model is to have sub-maintainers that have a broad
> > +knowledge of an specific aspect of the subsystem. It is a
> > +sub-maintainer's task to review the patches, providing feedback to use=
rs
> > +if the patches are following the subsystem rules and are properly using
> > +the media internal and external APIs.
> > +
> > +Patches for the media subsystem should be sent to the media mailing li=
st
> > +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > +HTML will be automatically rejected by the mail server. It could be wi=
se
> > +to also copy the sub-maintainer(s).
> > +
> > +Media's workflow is heavily based on Patchwork, meaning that, once a p=
atch
> > +is submitted, it should appear at:
> > +
> > +   - https://patchwork.linuxtv.org/project/linux-media/list/
> > +
> > +If it doesn't automatically appear there after a few minutes, then
> > +probably something got wrong on your submission. Please check if the
> > +email is in plain text only and if your emailer is not mangling with
> > +whitespaces before complaining or submit it again.
> > +
> > +Sub-maintainers
> > ++++++++++++++++ =20
>=20
> What is the motivation for using "+++" instead of "---"?

Just cosmetics.

This chapter doesn't exist at the original profile, as sub-maintainers,
co-maintainers, etc. are used only on a few subsystems.=20

So, I'm adding it as a sub-chapter.

Thanks,
Mauro
