Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F53080734
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2019 18:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbfHCQYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Aug 2019 12:24:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33716 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387464AbfHCQYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Aug 2019 12:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=XSLOZN3ga9Ecy3LtSrYOh8CMmhfqw1VrMAjYmlU4U6c=; b=Or8Rk8SyCEI/nTz5Q6xPORxnG
        DAUTgwelPVJzms0lF8vU3rc3rUMsYNhDMbAlc9jJ3zpcnyj31NNsy75w/YqqcC7jeihAZV8YwIhmr
        +k3TQOUr8MIp+BhnV2bbUegPOcEZNGvTvy6BPeabdGXzxk9AC+YOHsBlDJoO0O6Enqn6iCl8y4BqX
        B8mK/FhwH6EoiomyBVxJDzg6+Xb9/AjYbF/gUmGUKrfuLyRWqYcyGp6UloVY+DlBrS+Fa7R6I75c7
        W0f/UgA14KTc/jc72yEeaXqPStZXfuAOw2V/NVALlEWfkB8U3HaUCqEyQhYfwrE5IrUG7+6tp11NB
        VROCGceZw==;
Received: from [191.33.150.100] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1htwpG-0000Kj-7G; Sat, 03 Aug 2019 16:24:10 +0000
Date:   Sat, 3 Aug 2019 13:24:06 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.4] dvb/rc fixes, take #2
Message-ID: <20190803132406.7bbb139b@coco.lan>
In-Reply-To: <20190801123131.azv6kldrr7gniqih@gofer.mess.org>
References: <20190801123131.azv6kldrr7gniqih@gofer.mess.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 1 Aug 2019 13:31:31 +0100
Sean Young <sean@mess.org> escreveu:

> Hi Mauro,
>=20
> Here is another dvb/rc pull request. More to come.
>=20
> Thanks
> Sean
>=20
> The following changes since commit 4590c07462fbff4ecbfe1deec44431c16191bd=
19:
>=20
>   media: via-camera: convert to the vb2 framework (2019-07-30 12:18:34 -0=
400)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/syoung/media_tree.git tags/v5.4b
>=20
> for you to fetch changes up to 6eedaba3f5a2c733c211b4fea91a348f058bc025:
>=20
>   dt-bindings: media: sunxi-ir: Add H6 compatible (2019-08-01 21:09:15 +0=
900)
>=20
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       media: don't drop front-end reference count for ->detach
>=20
> Cl=C3=A9ment P=C3=A9ron (6):
>       dt-bindings: media: sunxi-ir: Add A31 compatible
>       media: rc: Introduce sunxi_ir_quirks
>       media: rc: sunxi: Add A31 compatible
>       media: rc: sunxi: Add RXSTA bits definition
>       dt-bindings: media: sunxi-ir: Add A64 compatible
>       dt-bindings: media: sunxi-ir: Add H6 compatible
>=20
> Oliver Neukum (1):
>       media: iguanair: add sanity checks
>=20
> Sean Young (2):
>       media: lirc: document BPF IR decoding
>       media: rc: describe rc protocols and their scancodes
>=20
> Wolfram Sang (2):
>       media: ir-kbd-i2c: convert to i2c_new_dummy_device()

I don't think this one is a good idea, as it may cause troubles
during unbind time.

>       media: ir-kbd-i2c: remove outdated comments
>=20
>  .../devicetree/bindings/media/sunxi-ir.txt         |  11 +-
>  Documentation/media/uapi/rc/lirc-dev-intro.rst     |  57 ++-
>  Documentation/media/uapi/rc/lirc-read.rst          |   3 +-
>  Documentation/media/uapi/rc/lirc-write.rst         |   3 +-
>  Documentation/media/uapi/rc/rc-protos.rst          | 456 +++++++++++++++=
++++++
>  Documentation/media/uapi/rc/remote_controllers.rst |   1 +
>  drivers/media/dvb-core/dvb_frontend.c              |   4 +-
>  drivers/media/i2c/ir-kbd-i2c.c                     |  17 +-
>  drivers/media/rc/iguanair.c                        |  15 +-
>  drivers/media/rc/sunxi-cir.c                       |  88 +++-
>  drivers/media/usb/dvb-usb/pctv452e.c               |   8 -
>  11 files changed, 597 insertions(+), 66 deletions(-)
>  create mode 100644 Documentation/media/uapi/rc/rc-protos.rst



Thanks,
Mauro
