Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06766322C5D
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 15:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhBWOcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 09:32:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:50008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232608AbhBWOcE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 09:32:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 582B064EC1;
        Tue, 23 Feb 2021 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614090682;
        bh=oqCJx8NHXStuqlV1NrC2dd7e7CMVlgeyC8oEC7KrlG0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p2B2lsUBRUHMQNFYCxErtzkEFiHGphDbdtN+G9Z1KL0Od+TLCb52iwYAJdqum+PgU
         Zf4xyqNbXwUKLnalc8pRRulVdsFBxpodn2mvpbb2CKBk01obkYCvpQvlTEhEO95Dtt
         Gcq260nyEdsVrjBu3ExkixiFX7+XScq57aodHBD434enlAPaW5G8VmCQfKHIvzkX3E
         EOomp0dz6XDte7O9k6vTuDRMPN5Us238cTFK3ZZ9uKy//EvDHmTI7/ioM/a9Q8LBQ4
         L0I0MPFKXyqOmSLvFU+Y4Jb4so2rUjJuujJjPmXTty2oLK0kKdjEg0upNwPwPpKOeM
         9jsuIFnV6R8Cg==
Received: by mail-ed1-f49.google.com with SMTP id c6so26205528ede.0;
        Tue, 23 Feb 2021 06:31:22 -0800 (PST)
X-Gm-Message-State: AOAM530I1f1sOWCFVHy3p0KOPFqkxBSoKuWQSNVFVj7spywVZEkyyyo4
        eC6JVKbngd7sHFrXzRNIRQkSgGF5QA1cvxpmGQ==
X-Google-Smtp-Source: ABdhPJyYhIvQsC2FuZjzr5FowQAASKFykbjYyZN9ovf0Da99A769RxD3C30Z3RZmtSjSV1KoZikYqHKwpHOh5s+qPbE=
X-Received: by 2002:a05:6402:164e:: with SMTP id s14mr15513878edx.62.1614090680626;
 Tue, 23 Feb 2021 06:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
 <20210222122406.41782-9-benjamin.gaignard@collabora.com> <20210223003442.GA2516123@robh.at.kernel.org>
 <25f30110-d655-2d77-d3b7-30c1c61f6965@collabora.com>
In-Reply-To: <25f30110-d655-2d77-d3b7-30c1c61f6965@collabora.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Feb 2021 08:31:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGZK2C8mcDiYa4yfKxf4sKykxSQ-Nfr4bi_u_OcAxW_Q@mail.gmail.com>
Message-ID: <CAL_JsqJGZK2C8mcDiYa4yfKxf4sKykxSQ-Nfr4bi_u_OcAxW_Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] dt-bindings: media: nxp,imx8mq-vpu: Update bindings
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Peng Fan <peng.fan@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 23, 2021 at 2:04 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 23/02/2021 =C3=A0 01:34, Rob Herring a =C3=A9crit :
> > On Mon, Feb 22, 2021 at 01:24:05PM +0100, Benjamin Gaignard wrote:
> >> The current bindings seem to make the assumption that the
> >> two VPUs hardware blocks (G1 and G2) are only one set of
> >> registers.
> >> After implementing the VPU reset driver and G2 decoder driver
> >> it shows that all the VPUs are independent and don't need to
> >> know about the registers of the other blocks.
> >> Remove from the bindings the need to set all blocks register
> >> but keep reg-names property because removing it from the driver
> >> may affect other variants.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >> version 2:
> >> - be more verbose about why I change the bindings
> >> Keep in mind that series comes after: https://www.spinics.net/lists/ar=
m-kernel/msg875766.html
> >> without that review and ack it won't work
> > Better, but you've still mentioned nothing about breaking compatibility=
.
> > Why is that okay?
>
> Because this reg-names wasn't used before for this variant so remove it w=
on't change anything.

It is the reset changes in the driver that break. The driver
previously got the 'ctrl' registers whether it went by name or index,
right? With an old DTB and a kernel with the changes (and vice-versa),
you'll have nothing to handle the VPU resets because the VPU reset
node doesn't exist. It could work if the default state is not held in
reset.

At least the removal of 'ctrl' registers belongs in the reset changes serie=
s.

Rob
