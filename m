Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C49230A84
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 14:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbgG1MoL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 08:44:11 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53679 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729379AbgG1MoK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 08:44:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1EF895802D6;
        Tue, 28 Jul 2020 08:44:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 28 Jul 2020 08:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=3
        zW4tWcFHAaD/UFG0J62346g4/8MQMozUhPE9nWQcAQ=; b=PDGYSP0OsFCNrzpHC
        yOtNOXSD+UMusIIf928WPNocPn1Gf1aQKpxo833s+0wj59VasKVroUq8ZNDI+d3F
        PeSLvqXlDOTjoHukGJHGZ2W71fl5QoMAy0DsdzC8Na3JqOo06NYPnqzURw4ERhXA
        kmoDudUs9NSKOTuqvVnwdyzL+SuEbUb4HNgS05110bN3jWema8H5dVw9LB+6mNFI
        t3eb8oQlT/GiOmgtE1ArIWUSVizIn1BzOi3DAh64h1x5Dd661D5bZKpWCepbAATE
        18avLINXhcBuf7necpwJlRyrUgTRMn2dIYjyHvIF7liXgCtEmL7uXhwdwndKcPqo
        58mng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=3zW4tWcFHAaD/UFG0J62346g4/8MQMozUhPE9nWQc
        AQ=; b=fTAbfbFuCXisbkE4lvc9HyOH0IbYLfPbkYxKpMXgj3AN7VFiXABj5+4UU
        /t3v6ivneh/t0Lp8wZiYpJ8HGlGBKdX9RgFTJxdYyxgJYhHwFWvtKITHxzCzwTQ7
        z8GKERkJAz2/EaClpCjKzDKvpurfzu1ciWdiH04ZlU6Bhfk26hE7fzLbpeUuCmGo
        qI72xbQbUEcTKW63j5H/GqW5pJ//mpMhosBL8nma+fTG3FpgJVhVf17MW9fgW/dd
        yhQLh5fhHO0MN1LhsXb7PaPgQN2M6ORUZRU3pyykxB1orp6zT/uPYG1Az+8bpqlq
        xhuFLN3aHcORn6h/vJDrQ/KPmg9Sw==
X-ME-Sender: <xms:mB0gXzBTU3jEYnxQoy13xi3LBgvf4zF50ZL08EEj1HlrgkO_jLmDAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedvgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mB0gX5inbbCQ8UBq3vsYo32_ONz_dqoMqRhoH8KluLzUfVVGl-qclA>
    <xmx:mB0gX-lDw-pCTGkuBDz20_uyA5Is-WaSIRsfXwanNh1pqtm94NPOFg>
    <xmx:mB0gX1ys1lEXKEe06CZVO0-i5ZAZrqgufUgOIblaP8cx7N4TLblJgQ>
    <xmx:mR0gX7H4Xn8jelQjfYxg84ioU_mybIBccgE9y8IuP8xcUALEduurrg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B531D328005D;
        Tue, 28 Jul 2020 08:44:07 -0400 (EDT)
Date:   Tue, 28 Jul 2020 14:44:05 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax
 elements
Message-ID: <20200728124405.ziuwaabp4fnv7lw2@gilmour.lan>
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-9-ezequiel@collabora.com>
 <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
 <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Jul 27, 2020 at 11:39:12AM -0300, Ezequiel Garcia wrote:
> On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com=
> wrote:
> > > The H.264 specification requires in its "Slice header semantics"
> > > section that the following values shall be the same in all slice head=
ers:
> > >=20
> > >   pic_parameter_set_id
> > >   frame_num
> > >   field_pic_flag
> > >   bottom_field_flag
> > >   idr_pic_id
> > >   pic_order_cnt_lsb
> > >   delta_pic_order_cnt_bottom
> > >   delta_pic_order_cnt[ 0 ]
> > >   delta_pic_order_cnt[ 1 ]
> > >   sp_for_switch_flag
> > >   slice_group_change_cycle
> > >=20
> > > and can therefore be moved to the per-frame decode parameters control.
> >=20
> > I am really not a H.264 expert, so this question may not be relevant,
>=20
> All questions are welcome. I'm more than happy to discuss this patchset.
>=20
> > but are these values specified for every slice header in the
> > bitstream, or are they specified only once per frame?
> >=20
> > I am asking this because it would certainly make user-space code
> > simpler if we could remain as close to the bitstream as possible. If
> > these values are specified once per slice, then factorizing them would
> > leave user-space with the burden of deciding what to do if they change
> > across slices.
> >=20
> > Note that this is a double-edged sword, because it is not necessarily
> > better to leave the firmware in charge of deciding what to do in such
> > a case. :) So hopefully these are only specified once per frame in the
> > bitstream, in which case your proposal makes complete sense.
>=20
> Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> are doing the slice header parsing themselves. Therefore, the
> driver is not really parsing these fields on each slice header.
>=20
> Currently, we are already using only the first slice in a frame,
> as you can see from:
>=20
>         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
>                 reg |=3D G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
>=20
> Even if these fields are transported in the slice header,
> I think it makes sense for us to split them into the decode params
> (per-frame) control.

I don't really get it though. The initial plan that was asked was to
mimic as much as possible the bitstream and that's what we did.

But that requirement seems to have changed now?

Even if it did change though, if this is defined as a slice parameter in
the spec, why would we want to move it to some other control entirely if
we are to keep the slice parameters control?

Especially if the reason is to make the life easier on a couple of
drivers, that's really not the point of a userspace API, and we can
always add an helper if it really shows up as a pattern.

> They are really specified to be the same across all slices,
> so even I'd say if a bitstream violates this, it's likely
> either a corrupted bitstream or an encoder bug.

That doesn't look like something we should worry about though. Or at
least, this is true for pretty much any other field in the bitstream and
we won't change those.

Maxime
