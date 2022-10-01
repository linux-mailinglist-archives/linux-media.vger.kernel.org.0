Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A545F1BB8
	for <lists+linux-media@lfdr.de>; Sat,  1 Oct 2022 12:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiJAKHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Oct 2022 06:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiJAKHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Oct 2022 06:07:53 -0400
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9A11116EF
        for <linux-media@vger.kernel.org>; Sat,  1 Oct 2022 03:07:50 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 98CE62B06686;
        Sat,  1 Oct 2022 06:07:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 01 Oct 2022 06:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1664618865; x=
        1664626065; bh=zIXcwmCmoLYgTDh4FHgjaJy+RlGzEyM3sUNFZ+n3zH0=; b=l
        NTkmlKWYyZn2wwduSSJC/lXk6rIdzHpjrSti+chvHgMRapU9n2I3y6D6UMUFFEBO
        1aKJTDCxivsyeLgf9nzypiMmJzA4BUyjYW48ggbuZLvXgh/oszF3nFHbqxZ2ZxcC
        ZuX+oCP/EgUlitSp8CMIDDm9bv43UizPPhuw4RRQQDHzIJVEUyNirxLVMlQMo0vi
        TiFj1cWuFFq/JLOHWP5ghLSZmbtBYBqx2wu6IZ8ppOGmVxhYyisHpTGk2CiQngVx
        KMV0+QXn9qFGZYEgW7dBXeNSPv/ZPFf4EEX45wqQgOsDN7H2tu8mjgRLesm1RFtO
        bO5fDyWzafb9s2UFzzmDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664618865; x=
        1664626065; bh=zIXcwmCmoLYgTDh4FHgjaJy+RlGzEyM3sUNFZ+n3zH0=; b=Y
        em3QRV0C1MBW6rb59zWiBPGHVHbDN+KWmlUKe/mlJXrECah9D4pwOe4DRp4TOzCM
        +Bnf0JUplnxTp1Ex+eGpRtEjSsIj2qH5wvDqDJB5G6QIUlQmR6gebkksLnJny8n6
        KtbSa6eRPl+3MjwEBbwUrC0U1N39dp4bR93N7Rhjd5M2vBbs6CIzAs7IOBn2qizt
        /x5lRqb1GtLSFVCcBkWciBv4zG5O1oSnpfxLyKM+CvJ8fv6Iv6+SMSw9fuw6wltF
        5J9p+pRKP/ItcIkQ4cmtE+U6movrHPxyv14eKabNfYNDFj4mHX4ZOW7PisKSYQMy
        Fc593kRJvNY4dX9rLSLMw==
X-ME-Sender: <xms:cBE4Y132j4B4Ft7AzdMDntpY9QHdYJtJKKMooaUW_JoIvP1GJg0Q1A>
    <xme:cBE4Y8GPVSBo4WyAVH6vRj6RRT67efFGyPw6A_3uk45s97qBYxg2HbeXdXupfVGKx
    88WqG-ZJyr9j6cwAKk>
X-ME-Received: <xmr:cBE4Y17z4X4-ajgtTI9mkUWvwZOIf9jXoD3uYzUPtw700m6KAdzcj2o5QAT2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehgedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeukeefhffhvefgvdffleevhffghfejjedvhedvvdekueehgefhgedt
    hfdvfeejnecuffhomhgrihhnpehophgvnhhpghhprdhorhhgpdhusghunhhtuhdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgig
    ihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cBE4Yy1_ZipqH1b0XxG1aHgqK616gSXiF5M4-ac1OlLb8w_m6wQHaQ>
    <xmx:cBE4Y4FYpqOlJdCDoym4VUzB4XbnVGL-yghGMYRzRMdEkO-DztL8dQ>
    <xmx:cBE4Yz8xKheWEZzaR7Lx2sVB2p1tEqqKObhUoGqZcobnalnHfaemmg>
    <xmx:cRE4YwQtrtJUkkqBT1j0_GN3tIuoOthyOB37uZEN-EWhyhf2BqwbG7UDs40>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Oct 2022 06:07:43 -0400 (EDT)
Date:   Sat, 1 Oct 2022 12:07:41 +0200
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
Message-ID: <20221001100741.4iivrmhn7ph2nhs2@houat>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <20220907115351.d774wruu22fdohwl@houat>
 <20220930204642.o6l7qtgg4mhvlthe@houat>
 <YzdXDuh9Wgm6o3OP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YzdXDuh9Wgm6o3OP@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 30, 2022 at 11:52:30PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> On Fri, Sep 30, 2022 at 10:46:42PM +0200, Maxime Ripard wrote:
> > On Wed, Sep 07, 2022 at 01:53:51PM +0200, Maxime Ripard wrote:
> > > On Mon, Sep 05, 2022 at 05:44:26PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > > > > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > > > > 16:45-18:00 Anything else?
> > > > >=20
> > > > > I think it'd be great to have a GPG key signing party at the end =
of the
> > > > > meeting.
> > > >=20
> > > > It's a good idea. Could everybody please send their GPG key fingerp=
rint
> > > > in an e-mail reply to prepare for that ? It can easily be retrieved=
 with
> > > > 'gpg -K' (make sure to pick the right key if you have multiple of t=
hem).
> > > > I'll start:
> > > >=20
> > > > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> > > >       94231B980100EC619AC10E10F045C2B96991256E
> > > > uid                   [ultimate] Laurent Pinchart <laurent.pinchart=
@ideasonboard.com>
> > > >=20
> > > > If you're generating a key for the occasion, create a primary key w=
ith
> > > > the Certify (C) capability only, and create separate sub-keys for
> > > > Signature (S) and Encryption (E). There's little reason these days =
to
> > > > use less than 4096 bits for the primary key if you opt for RSA. The
> > > > subkeys should have an expiration date.
> > > >=20
> > > > The primary key can then be moved to safe storage, you will only ne=
ed
> > > > the subkeys for daily usage.  The primary key will be used only to
> > > > create new subkeys and to sign other people's keys.
> > >=20
> > > sec#  ed25519 2018-09-15 [C] [expires: 2023-03-17]
> > >       BE5675C37E818C8B5764241C254BCFC56BF6CE8D
> > > uid           [ultimate] Maxime Ripard <maxime.ripard@anandra.org>
> > > uid           [ultimate] Maxime Ripard <mripard@kernel.org>
> > > uid           [ultimate] Maxime Ripard (Work Address) <maxime@cerno.t=
ech>
> >=20
> > I'm not entirely sure what happened, but it looks like all the
> > signatures I received so far (Laurent, Jernej, Ricardo, Kieran, Jacopo
> > and Chen-Yu) have been missing that UID
> >=20
> > Could you make sure that it's signed?
>=20
> The key I have here doesn't have that UID. To what key server have you
> pushed it ?

It is published on keys.openpgp.org and I sent it yesterday to
keyserver.ubuntu.com.

Maxime
