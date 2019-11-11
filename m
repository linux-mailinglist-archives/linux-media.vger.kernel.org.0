Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAE1F7FA2
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 20:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfKKTPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 14:15:42 -0500
Received: from sauhun.de ([88.99.104.3]:48750 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726994AbfKKTPm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 14:15:42 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id 0876D2C0428;
        Mon, 11 Nov 2019 20:15:39 +0100 (CET)
Date:   Mon, 11 Nov 2019 20:15:39 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Michael Krufky <mkrufky@linuxtv.org>,
        Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>
Subject: Re: Seeking help for getting rid of i2c_clients_command()
Message-ID: <20191111191539.GA1608@kunai>
References: <20191110150553.GA8040@kunai>
 <5209c59d-f0f6-c2c3-5f5a-eedef500eb39@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <5209c59d-f0f6-c2c3-5f5a-eedef500eb39@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans!

> TUNER_SET_CONFIG is called whenever the TV or radio frequency is
> changed, and when that happens the demod needs to update its configuration
> as well. So the tuner_i2c_xfer_send(&priv->i2c_props, buffer, 4); is for the
> tuner itself (whose i2c address is known), but i2c_clients_command is
> basically broadcasting to anyone on the bus, and only the tda9987 will
> actually act on the TUNER_SET_CONFIG command.

I see. Thanks for the heads up.

> This should make it possible for tuner-simple.c to actually lookup the
> i2c address of the demod from that global list and use a direct call.

Sounds awesome!

> I've CC-ed a bunch of people who know more about DVB than I do, so
> I hope they can double-check that I am on the right track.

Their help would be much appreciated.

> Wolfram, do you just want to get rid of i2c_clients_command or the i2c
> command() callback as well?

I'd like to get rid of the callback as well. tuner is again the only
in-tree user. And this whole mechanism looks so 2.4ish... I think it can
go now.

Thanks for your help,

   Wolfram


--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Js1cACgkQFA3kzBSg
Kbb+uw//ZbgCBXLgL990IM8kvt/st3xYHp3CK4kcC2jha7cU1BZjiUKPMeZ/qAww
UPvhiD0rubPy8R1bVaQSovegDHwG9Zb6D5kWaLqE3m8ycjLPBvxAacwZfy0Omyn7
5qaeUIZ7b1ITl/XTjYdGld0Ww/dxqDkHXvaPl74S1FqwBy49///m6hYwirJqVmSa
Vex4izPkYAofNLMo40fK4QndSTeGNCnvNpwJ+n9X5BTjpHYFUeGvrisQYA9wb3MA
RtUagCyuDYGQhP53OUHzG5f5QOBO4Z0/RjTRrPlEQEQMDM21lFwn5McxaTGmqlLo
dE8h4pDLfmFqb/tEMz9OxgwmsItra875UM0yJfUQwblfOwOVTqV/DGUWCVkBzTcH
Y+9Robo0iZRwNjiuDm/edL9bMtIbnRjOxfMNsHtxEUpg+u/JAbLJ0HfqMR17YHCU
FtyEEQkXDQ4B9P2qwYTCvlT2rxcz6Rfswfw8Q+dss+uppDe1qJipaYFgQL6hpIQx
8W6s6uS66p6Tj451jRni1vZq4jvoCoHNuZXhVOw3LCQuWXJiCCQL93mKEP8yQK6H
bEPgx0viOuxekcOXDC17Pk3Q5UEtN+E45aRPDXlwNWLWPGxv5//eo5glgPkS/Qtn
WoDrtO9DS+WP0LMfztY4G0D/CMMRey/GD9jYxD23ZEDYX/ZVEWk=
=AUzu
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
