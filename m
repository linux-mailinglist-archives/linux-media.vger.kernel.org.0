Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D061B0F29
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 17:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgDTPCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 11:02:55 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:40825 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726615AbgDTPCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 11:02:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id DEA10638;
        Mon, 20 Apr 2020 11:02:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 20 Apr 2020 11:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=L27MuuYz1SixnmfaHirukiQJrxC
        Tv8fLDqVFJXmGlc0=; b=XLnEVb1swtAk8zZ4/ZrbJwk5Zszm9kxeZodYA8FcZ/c
        ziI0Co7Zf6z9PuFfj+8vwErIVzcsdG+nhI3S6Uz3Ju758ug/XlAWFhNhNcPP1sCB
        bUxHz1/6DqU0Cp6fhlBBh1xjQWcpU8bUdnCcWzIBFooa6xYYZtOYYRz0FanoXs+d
        jXLKI1csogzJYT0VyfAqw0nXSLtwb7MH9z644G4tyn+69K5Of0tyvR9Q/e/iIqwf
        rDoPsBrf9B+2de0tQ6PuDOFCrgcF+2CCtfZ7qYfG25DcCzOaxDThGs/UFcOOiY0M
        Dr55kkJNX5zCuwCed8lrf14Tp8/IFKzRKdGqF6LkrsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=L27Muu
        Yz1SixnmfaHirukiQJrxCTv8fLDqVFJXmGlc0=; b=JWHhtcUxZK8up4VTR7dxtb
        nWq61WKCtiBxnDvUHML3ErQCOBVwaflUDfO5VPn7RSrJUDhjjZ/1ZSYOMWQw6Tfv
        ORB4LDzilF1z7Ed5UHu3AHriiK55GO5YPF5LvuQkj+aZEC/tFdhqf1bIyLsYQktx
        SD77eTCUfL+FRPfueRKkZB/ZNm3vGOhdW8M07p99qmxQ+gVcSuU8kMVGKwkkA65q
        rqOy4H52KfgsD+vvg23lTkRhTx3cRaRKyUb/zllXxqfqzVYwpTLGrqge7jjRNoRz
        8/LWZT3lztUFH8jJsrHqe4CkjLSKfjyWiZ3qV7fH9YUnyC9+/4WN7zl1jkUvbSNw
        ==
X-ME-Sender: <xms:mrmdXpW0a6b7oEDyfoMqd29TrNQhYzqlGCs_kwWuVm0UHqg9hrre0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
    hordhtvggthh
X-ME-Proxy: <xmx:m7mdXuu11GnamYeDFtYtOHIR89FZXPkjxvEMzq77_RnQJKgusIGyIg>
    <xmx:m7mdXoVueCausVfPcqaubNEo1d3D0A5_HwjEyh3Exbq9FXD9MydQLA>
    <xmx:m7mdXiXVegDsXmhTrxlc0iuHdh4vgXc8q7pxdNOP7qyPvQih1kC2tQ>
    <xmx:nLmdXrGlRTtnVvm8gflpw646ZArS7sCb-znIOBFrD4mFqBlT-BYDgYc5E-g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A483C328006F;
        Mon, 20 Apr 2020 11:02:50 -0400 (EDT)
Date:   Mon, 20 Apr 2020 17:02:48 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200420150248.mqqcxgsaxj5oxfgk@gilmour.lan>
References: <20200407163916.GL6127@valkosipuli.retiisi.org.uk>
 <CAAFQd5BGFB5znb9QyyPVL47kc809Ktu33bssvqg5eA-WwvMgOw@mail.gmail.com>
 <20200407172035.GM6127@valkosipuli.retiisi.org.uk>
 <20200408122127.i27hrmjh3pbjeulk@gilmour.lan>
 <CAAFQd5DNyQra-XksVaSfT_FCkOHTzm9mbn+tMd1vACV=pb9_8g@mail.gmail.com>
 <20200408134315.a7cemmto6bi26arg@gilmour.lan>
 <20200408152857.GO6127@valkosipuli.retiisi.org.uk>
 <20200408153051.GP6127@valkosipuli.retiisi.org.uk>
 <20200415101827.owf5babnigev2vit@gilmour.lan>
 <20200415161616.GA934@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z2dri642qwse5u2s"
Content-Disposition: inline
In-Reply-To: <20200415161616.GA934@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--z2dri642qwse5u2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 07:16:16PM +0300, Sakari Ailus wrote:
> On Wed, Apr 15, 2020 at 12:18:27PM +0200, Maxime Ripard wrote:
> > On Wed, Apr 08, 2020 at 06:30:51PM +0300, Sakari Ailus wrote:
> > > Cc'ing Laurent as well.
> > >
> > > On Wed, Apr 08, 2020 at 06:28:57PM +0300, Sakari Ailus wrote:
> > > > Hi Maxime,
> > > >
> > > > On Wed, Apr 08, 2020 at 03:43:15PM +0200, Maxime Ripard wrote:
> > > > > On Wed, Apr 08, 2020 at 02:35:28PM +0200, Tomasz Figa wrote:
> > > > > > On Wed, Apr 8, 2020 at 2:21 PM Maxime Ripard <maxime@cerno.tech=
> wrote:
> > > > > > > On Tue, Apr 07, 2020 at 08:20:35PM +0300, Sakari Ailus wrote:
> > > > > > > > On Tue, Apr 07, 2020 at 06:46:06PM +0200, Tomasz Figa wrote:
> > > > > > > > > On Tue, Apr 7, 2020 at 6:40 PM Sakari Ailus <sakari.ailus=
@iki.fi> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Apr 07, 2020 at 05:47:41PM +0200, Robert Foss w=
rote:
> > > > > > > > > > > On Tue, 7 Apr 2020 at 14:32, Maxime Ripard <maxime@ce=
rno.tech> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Robert,
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Fo=
ss wrote:
> > > > > > > > > > > > > On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxim=
e@cerno.tech> wrote:
> > > > > > > > > > > > > > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakar=
i Ailus wrote:
> > > > > > > > > > > > > > > > But that 19.2MHz is not a limitation of the=
 device itself, it's a
> > > > > > > > > > > > > > > > limitation of our implementation, so we can=
 instead implement
> > > > > > > > > > > > > > > > something equivalent in Linux using a clk_s=
et_rate to 19.2MHz (to make
> > > > > > > > > > > > > > > > sure that our parent clock is configured at=
 the right rate) and the
> > > > > > > > > > > > > > > > clk_get_rate and compare that to 19.2MHz (t=
o make sure that it's not
> > > > > > > > > > > > > > > > been rounded too far apart from the frequen=
cy we expect).
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This is doing exactly the same thing, excep=
t that we don't encode our
> > > > > > > > > > > > > > > > implementation limitations in the DT, but i=
n the driver instead.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > What I really wanted to say that a driver tha=
t doesn't get the clock
> > > > > > > > > > > > > > > frequency from DT but still sets that frequen=
cy is broken.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > This frequency is highly system specific, and=
 in many cases only a certain
> > > > > > > > > > > > > > > frequency is usable, for a few reasons: On ma=
ny SoCs, not all common
> > > > > > > > > > > > > > > frequencies can be used (e.g. 9,6 MHz, 19,2 M=
Hz and 24 MHz; while others
> > > > > > > > > > > > > > > are being used as well), and then that freque=
ncy affects the usable CSI-2
> > > > > > > > > > > > > > > bus frequencies directly --- and of those, on=
ly safe, known-good ones
> > > > > > > > > > > > > > > should be used. IOW, getting the external clo=
ck frequency wrong typically
> > > > > > > > > > > > > > > has an effect that that none of the known-goo=
d CSI-2 bus clock frequencies
> > > > > > > > > > > > > > > are available.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So clock-frequency is not about the "Frequency =
of the xvclk clock in
> > > > > > > > > > > > > > Hertz", but the frequency at which that clock m=
ust run on this
> > > > > > > > > > > > > > particular SoC / board to be functional?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > If so, then yeah, we should definitely keep it,=
 but the documentation
> > > > > > > > > > > > > > of the binding should be made clearer as well.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Alright so, let me summarise the desired approach=
 then.
> > > > > > > > > > > >
> > > > > > > > > > > > There's a separate discussion on the same topic her=
e:
> > > > > > > > > > > > https://lore.kernel.org/linux-media/20200407122106.=
GD4751@pendragon.ideasonboard.com/
> > > > > > > > > > >
> > > > > > > > > > > Thanks for the link.
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > ACPI:
> > > > > > > > > > > > >   - Fetch the "clock-frequency" property
> > > > > > > > > > > > >   - Verify it to be 19.2Mhz
> > > > > > > > > > > > >
> > > > > > > > > > > > > DT:
> > > > > > > > > > > > >   - Fetch the "clock-frequency" property
> > > > > > > > > > > > >   - Verify it to be 19.2Mhz
> > > > > > > > > > > > >   - Get xvclk clock
> > > > > > > > > > > > >   - Get xvclk clock rate
> > > > > > > > > > > > >   - Verify xvclk clock rate to be 19.2Mhz
> > > > > > > > > > > >
> > > > > > > > > > > > The current status is that you should
> > > > > > > > > > > > 's/clock-frequency/link-frequencies/', and in order=
 to replace
> > > > > > > > > > > > assigned-clock-rates, you'll want to have a clk_set=
_rate to 19.2MHz
> > > > > > > > > > > > between steps 3 and 4
> > > > > > > > > > >
> > > > > > > > > > > Would we want to 's/clock-frequency/link-frequencies/=
' for ACPI too?
> > > > > > > > > > > I imagine that would cause some breakage.
> > > > > > > > > >
> > > > > > > > > > It would, yes, and it would be no more correct on DT ei=
ther.
> > > > > > > > > >
> > > > > > > > > > There are basically two possibilities here; either use =
the clock-frequency
> > > > > > > > > > property and set the frequency, or rely on assigned-clo=
ck-rates, and get
> > > > > > > > > > the frequency instead.
> > > > > > > > > >
> > > > > > > > > > The latter, while I understand it is generally preferre=
d, comes with having
> > > > > > > > > > to figure out the register list set that closest matche=
s the frequency
> > > > > > > > > > obtained. The former generally gets around this silentl=
y by the clock
> > > > > > > > > > driver setting the closest frequency it can support.
> > > > > > > > >
> > > > > > > > > Wouldn't the former actually cause problems, because the =
closest
> > > > > > > > > frequency the clock driver can support could be pretty fa=
r from the
> > > > > > > > > one requested? (E.g. 19.2 MHz vs 24 MHz) The driver needs=
 to check the
> > > > > > > > > resulting frequency anyway.
> > > > > > > >
> > > > > > > > That's possible, yes; in this case there wouldn't be a guar=
antee the
> > > > > > > > frequency wouldn't be far off.
> > > > > > >
> > > > > > > assigned-clock-rates is really fragile... There's zero guaran=
tee on
> > > > > > > how far the actual rate is going to be from the asked one, bu=
t more
> > > > > > > importantly you have zero guarantee on the time frame that ra=
te is
> > > > > > > going to be enforced for.
> > > > > >
> > > > > > Is there such a guarantee if clk_set_rate() is called?
> > > > >
> > > > > with clk_set_rate itself, no, but...
> > > > >
> > > > > > > It's simply going to change the rate as a one-off thing, and =
if
> > > > > > > there's the next millisecond someone else is going to change =
its rate
> > > > > > > one way or another, it's going to do so and you won't have any
> > > > > > > notification.
> > > > >
> > > > > You can get notified, and you can use clk_set_rate_exclusive if y=
ou
> > > > > *really* want to enforce it.
> > > >
> > > > Is the conclusion then we should go back to relying on the clock-fr=
equency
> > > > property?
> >=20
> > clock-frequency or link-frequencies. link-frequencies seems to be a
> > better fit here, but we don't really have the choice for older
> > bindings.
>=20
> You can't replace one with the other as the two are different things. The
> clock-frequency refers to the external clock frequency whereas the
> link-frequencies refers to the frequencies allowed on the CSI-2 bus.

Ack.

> > > > This has been discussed multiple times over the years, and I don't =
really
> > > > disagree with the above. The frequency is typically indeed hand-pic=
ked for
> > > > the hardware, and no other frequency should be used in any circumst=
ances.
> > > >
> > > > No sensor driver I've seen has used clk_set_rate_exclusive() but I =
guess
> > > > they should. The absence of practical problems has been probably be=
cause of
> > > > two factors; firstly, these are typically clocks dedicated to the s=
ensors
> > > > and secondly, good luck.
> >=20
> > My point was that at least with handling the clock rate within the
> > driver (as opposed to assigned-clock-rates) you have multiple options
> > in dealing with changing colck rates / parents (Modelling the sensor
> > clock as a clock itself, using clk_set_rate_exclusive, using a
> > notifier, etc).. Some are more intrusive to the rest of the system
> > than others (especially clk_set_rate_exclusive), so I'm not really
> > advocating for any here, but we should make sure we have them in the
> > first place.
>=20
> Using a different frequency really should not be allowed. It may be
> possible on a development system, hobbyist platform, but never in
> production. Therefore the exclusive variant sounds like the right one to
> me.

In all of those cases you would not allow a different frequency. The only
difference is whether you react to a rate change in your parent clock, or
prevent it from happening in the first place.

The latter is easier to do, but has a wider impact on the rest of the system
than the former.

Maxime

--z2dri642qwse5u2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp25mAAKCRDj7w1vZxhR
xdLFAQDgS/6l5DqkSNLXkzh07fGnuajNVakM1El0NxhwAQ+8IwD9Hcj0jWFI9Qpx
MPtiduaoOqotTnb0HwYz4QmM+teMNw0=
=jp6m
-----END PGP SIGNATURE-----

--z2dri642qwse5u2s--
