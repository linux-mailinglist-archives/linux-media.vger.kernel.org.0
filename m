Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496B52DE2C8
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 13:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgLRMYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 07:24:47 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41297 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725894AbgLRMYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 07:24:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id EE83D58042B;
        Fri, 18 Dec 2020 07:23:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 18 Dec 2020 07:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=HZ2lvYrWK8D7QHvnJNCIdRlHUCr
        +09IGqR+IruZm1Jc=; b=o8vQmAYgw3Z5QK9DpTYDmUe2/7lcgk8rqifz5T1YaMu
        GlP+LkEHNRvYCm8B20b/F671N+Q09HV8A8K6+vO6jwOU1o9GC77p7IWIRflZ6NB4
        7xoqtDoJa6QPU6azvtH1LbA+ulJE40jP1JEQCSJ/lXNBVUb76cd2BDYdxASX2E9k
        YVrG7OxBcFOpkZTHxAKVvASevxE4SRptwH9Lp3m2RYecHqSNF2l3k48RhqspeMLh
        qPngyAwlANijQj8L7c9UR5VY3t0go7Y60mcc4wjlD6ZnJKke5TkemkVW94pLTAig
        GB8gjQyZg6ReFz0/hUvh1jDAGL30l+YqqGDw6+FR+Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HZ2lvY
        rWK8D7QHvnJNCIdRlHUCr+09IGqR+IruZm1Jc=; b=QdFCxWH1tPU1r9zhA/CTWV
        e4N0IyNB4TeFqfCvoz6cRLy5ZAAf0naI2oj92jMRta75+UHq3MnVrH+qGcsvR2Yg
        LQ0bfbHLudlm7Bvb8NTuo3zRk/KsfBdSNo5PBVCDz42HkFOSmENYw68WjpZxqIE7
        wMtPlnfJsQwEZd1uluRtNzWXEzvdQKo0o4KIJZfGoWT+EpWzF44DT2jg6mAu6Npk
        neQpgt3CGAurDtOAgQ8kNfQTxG7iMZXCKX8s/oA+cJb6dvUEynboEhS7GokJnLku
        aKveEmXo971ZeeDt54PvQHPu3b9xaCqRmhCJuRVZ19vbOIbS2grSFsH1yUmt7EdQ
        ==
X-ME-Sender: <xms:SJ_cX2-IiTpjI8q9dI_bqTqjQy2q-_gE-P-X8inSduIkt_9ZlIdxMg>
    <xme:SJ_cX2vtbM0_Tk-zGcr4ZF3wvd4BRxD8cPdZSGAETk1SOWHqZI5TrhVZHFs9RXb9o
    2tcKS2AyMbpibQkBys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
    jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
    ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SJ_cX8CQs_SvMn-t7zGoLkPsMOgLmzxQBVDG1Nq2pf6I2GX52tXjtA>
    <xmx:SJ_cX-eNZLo2U-Mqz5OP8QcUqfGMs-VfJoo6YC44p02vNt0e-SDoTg>
    <xmx:SJ_cX7O5hRPP5pOCx2tosS0wmentpHf9o7MRmpNQV20hJ8C1tQb2Gg>
    <xmx:S5_cXylNVPANXWC0tyEVVGRpgFd8C0mJS7yagXdlK7UHAILkZHpciw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 090CA24005D;
        Fri, 18 Dec 2020 07:23:35 -0500 (EST)
Date:   Fri, 18 Dec 2020 13:23:34 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jason Cooper <jason@lakedaemon.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-rpi-kernel@lists.infradead.org,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 08/15] drm/vc4: hdmi: Introduce a CEC clock
Message-ID: <20201218122334.tvdeslyyuus4hp4y@gilmour>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-9-maxime@cerno.tech>
 <CAPY8ntA7dS1Ew+mF=xRdWFF0P071=O5X7vVKt7O_iiTdUbJM5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="daa325rvus7mm5rb"
Content-Disposition: inline
In-Reply-To: <CAPY8ntA7dS1Ew+mF=xRdWFF0P071=O5X7vVKt7O_iiTdUbJM5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--daa325rvus7mm5rb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, Dec 18, 2020 at 11:37:50AM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > While the BCM2835 had the CEC clock derived from the HSM clock, the
> > BCM2711 has a dedicated parent clock for it.
> >
> > Let's introduce a separate clock for it so that we can handle both
> > cases.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++++++++-
> >  drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index b93ee3e26e2b..0debd22bc992 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -145,7 +145,7 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_=
hdmi *vc4_hdmi)
> >          * Set the clock divider: the hsm_clock rate and this divider
> >          * setting will give a 40 kHz CEC clock.
> >          */
> > -       clk_cnt =3D clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
> > +       clk_cnt =3D clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
> >         value |=3D clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
> >         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
> >  }
> > @@ -1740,6 +1740,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdm=
i *vc4_hdmi)
> >                 return PTR_ERR(vc4_hdmi->hsm_clock);
> >         }
> >         vc4_hdmi->audio_clock =3D vc4_hdmi->hsm_clock;
> > +       vc4_hdmi->cec_clock =3D vc4_hdmi->hsm_clock;
> >
> >         return 0;
> >  }
> > @@ -1833,6 +1834,12 @@ static int vc5_hdmi_init_resources(struct vc4_hd=
mi *vc4_hdmi)
> >                 return PTR_ERR(vc4_hdmi->audio_clock);
> >         }
> >
> > +       vc4_hdmi->cec_clock =3D devm_clk_get(dev, "cec");
> > +       if (IS_ERR(vc4_hdmi->cec_clock)) {
> > +               DRM_ERROR("Failed to get CEC clock\n");
> > +               return PTR_ERR(vc4_hdmi->cec_clock);
> > +       }
>=20
> Aren't we adding to the DT binding here and breaking backwards compatibil=
ity?
> Admittedly CEC didn't work before (and was masked out) for vc5, but do
> we need to worry about those with existing DT files that currently
> work happily?

The DT compatibility is not a worry here: I made sure the CEC clock and
range were part of the binding since it's been introduced:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D2e3725b05b785e73482a194b99bff3d5a1c85140

So we were not using it so far, but it was in the DT all along

Maxime

--daa325rvus7mm5rb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9yfRgAKCRDj7w1vZxhR
xdw8AQDSePfxRuumqbi3ziN0f2aHgCzU27a3QqLpmmDtvy9yjwD8DDNWRGgWo+YB
Sm5jVlyvzrNZGCh1S4auc/kwypDjNA4=
=wsp5
-----END PGP SIGNATURE-----

--daa325rvus7mm5rb--
