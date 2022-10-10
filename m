Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F64C5F9AEC
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 10:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiJJI0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 04:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiJJI03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 04:26:29 -0400
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33292DF0D
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 01:26:25 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 85E042B0673B;
        Mon, 10 Oct 2022 04:26:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 10 Oct 2022 04:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665390380; x=1665397580; bh=+HNL0KL8wS
        ey7vxThpAtrbkojWq3FLbzmJvRRF4D2Mo=; b=vxqkmG7xhW7/j0fdk1M9H5hCQf
        36xONFVNkxTIwV/VvBElxv07tw1f9D2vpgpCMwDvyyEksgdTXz0bKt06s1TlM3Fo
        6fdhgD9Qnvu/gx9A99OhBeQAXzVuzlR1JkAduwo6x2gWeXb7EyXhjbOdHdDNqfvi
        /3P4EIhO+RTkkiIkVoPUZdmcYXQzERAU2CkeSRp6pG8Y6fJ5HJmdFFjhI7S7LU+d
        g5MsFeLPLZjDhQ35coCZEzKo2epRCwDzeJ1DwPtcs7O/1KUCqSgLIr/qiHwYtVpm
        05XG6x6KGIW0DUSJlxOIKJSdkAGvy+hnw8gEovSnc2aYdbBNHkRV3VeqE8Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665390380; x=1665397580; bh=+HNL0KL8wSey7vxThpAtrbkojWq3
        FLbzmJvRRF4D2Mo=; b=BP6X/lBWjhcIHEA2V8WwrDEgQQYWPa3U5mVVEe2ufc9Z
        Fo+fTCAICab5yJHqGfomCXbOfn9DX0L46yU8wR95U2YGFdRHlwCY3D/KKYDDg+u6
        dFaW9eG/7HY2BnIJMjbr0uKkNRbz8BX4uLi6dvnJTPHmW8zna5MBJEpSOuVFm27k
        aRUc2w1SNYb7Mw5dqpwS8Myh6BhWENhypaGhRUUdn+QBQtSwQ1UN/HgwSgLU4rpF
        Bc7zt9y/j1T+hmVnyVuYpTpcr3wM9BGjVebhWWkHBZTq4vHmewFBfVBSZN6ltW04
        2zMN3mircLw4M8YiaATrtvOxJZd3jhQp9CHDwp+wUQ==
X-ME-Sender: <xms:K9dDY84ymzTPa_ilhkK5Nq7CUhbTxJZrPVAPJCpmYr6isch5u7TXAQ>
    <xme:K9dDY97Rl5eDAnBykGXsSgVwyAlxbd3UkDvAY7S6zybR-plTGBPpke_60mJ-ncoz5
    j3uMWIBeBSXMp9ECTo>
X-ME-Received: <xmr:K9dDY7cnOuZaAGsW192m-MujnZe9Z2P4jg8-NRvm-aCU6atuKxxK2tdl7GWL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejfedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeefgfelteehheejfeetkeeujeevtdektdefgeegleejgfdttdeltdeivddv
    leffveenucffohhmrghinhepohhpvghnphhgphdrohhrghdpuhgsuhhnthhurdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
    mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:K9dDYxK_CNoHVwWrpgb-rIUqaNfk4SdWxlvllYGfvNNzJxv62ol-rA>
    <xmx:K9dDYwJLP65U8lNdjBUT4RvlMMXGqut5WwzE77vZCxASsRrffXX8fQ>
    <xmx:K9dDYyxYFXEV671sPziGFOv19siMlZCo931ccSOBxQoE8mLwbd-RzA>
    <xmx:LNdDY21WSt-Ac6k4FumxprdIU9OCSakiseCQOrjGBAEb93wZj-Wujc6qi3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 04:26:19 -0400 (EDT)
Date:   Mon, 10 Oct 2022 10:26:18 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Message-ID: <20221010082618.cu7mhdx266rdubwq@houat>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <20220907115351.d774wruu22fdohwl@houat>
 <20220930204642.o6l7qtgg4mhvlthe@houat>
 <YzdXDuh9Wgm6o3OP@pendragon.ideasonboard.com>
 <20221001100741.4iivrmhn7ph2nhs2@houat>
 <Yzoq1w4GZvhjvTYZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2tkwlht6rfw4gbdu"
Content-Disposition: inline
In-Reply-To: <Yzoq1w4GZvhjvTYZ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2tkwlht6rfw4gbdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2022 at 03:20:39AM +0300, Laurent Pinchart wrote:
> On Sat, Oct 01, 2022 at 12:07:41PM +0200, Maxime Ripard wrote:
> > On Fri, Sep 30, 2022 at 11:52:30PM +0300, Laurent Pinchart wrote:
> > > On Fri, Sep 30, 2022 at 10:46:42PM +0200, Maxime Ripard wrote:
> > > > On Wed, Sep 07, 2022 at 01:53:51PM +0200, Maxime Ripard wrote:
> > > > > On Mon, Sep 05, 2022 at 05:44:26PM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > > > > > > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > > > > > > 16:45-18:00 Anything else?
> > > > > > >=20
> > > > > > > I think it'd be great to have a GPG key signing party at the =
end of the
> > > > > > > meeting.
> > > > > >=20
> > > > > > It's a good idea. Could everybody please send their GPG key fin=
gerprint
> > > > > > in an e-mail reply to prepare for that ? It can easily be retri=
eved with
> > > > > > 'gpg -K' (make sure to pick the right key if you have multiple =
of them).
> > > > > > I'll start:
> > > > > >=20
> > > > > > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> > > > > >       94231B980100EC619AC10E10F045C2B96991256E
> > > > > > uid                   [ultimate] Laurent Pinchart <laurent.pinc=
hart@ideasonboard.com>
> > > > > >=20
> > > > > > If you're generating a key for the occasion, create a primary k=
ey with
> > > > > > the Certify (C) capability only, and create separate sub-keys f=
or
> > > > > > Signature (S) and Encryption (E). There's little reason these d=
ays to
> > > > > > use less than 4096 bits for the primary key if you opt for RSA.=
 The
> > > > > > subkeys should have an expiration date.
> > > > > >=20
> > > > > > The primary key can then be moved to safe storage, you will onl=
y need
> > > > > > the subkeys for daily usage.  The primary key will be used only=
 to
> > > > > > create new subkeys and to sign other people's keys.
> > > > >=20
> > > > > sec#  ed25519 2018-09-15 [C] [expires: 2023-03-17]
> > > > >       BE5675C37E818C8B5764241C254BCFC56BF6CE8D
> > > > > uid           [ultimate] Maxime Ripard <maxime.ripard@anandra.org>
> > > > > uid           [ultimate] Maxime Ripard <mripard@kernel.org>
> > > > > uid           [ultimate] Maxime Ripard (Work Address) <maxime@cer=
no.tech>
> > > >=20
> > > > I'm not entirely sure what happened, but it looks like all the
> > > > signatures I received so far (Laurent, Jernej, Ricardo, Kieran, Jac=
opo
> > > > and Chen-Yu) have been missing that UID
> > > >=20
> > > > Could you make sure that it's signed?
> > >=20
> > > The key I have here doesn't have that UID. To what key server have you
> > > pushed it ?
> >=20
> > It is published on keys.openpgp.org and I sent it yesterday to
> > keyserver.ubuntu.com.
>=20
> The latter gave me your third UID, the former didn't.

It looks like you can only push new signatures through --send-keys, but
not new UID. It should work now

Maxime

--2tkwlht6rfw4gbdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0PXKgAKCRDj7w1vZxhR
xcpxAPoD1Jx/kCzJeQOj7D0AZlr5H9ixXztdZ4bpsEQx8VEwXwEA+CteMcm5LX3G
GEBAPBvmy0VE3NKsB0S8CXCXpuGaLQI=
=bptG
-----END PGP SIGNATURE-----

--2tkwlht6rfw4gbdu--
