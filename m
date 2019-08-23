Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA119AF62
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391905AbfHWM1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:27:02 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44727 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfHWM1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:27:02 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 28DBE1BF20E;
        Fri, 23 Aug 2019 12:27:00 +0000 (UTC)
Date:   Fri, 23 Aug 2019 14:26:59 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [GIT PULL for 5.4] A10 CSI driver and atmel-isi fix
Message-ID: <20190823122659.4d7ppyua7lmavxne@flea>
References: <20190823073109.GR3504@valkosipuli.retiisi.org.uk>
 <f930291a-8d00-28a4-57e0-f5cfc2d40322@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtl36qphur3okuty"
Content-Disposition: inline
In-Reply-To: <f930291a-8d00-28a4-57e0-f5cfc2d40322@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--vtl36qphur3okuty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

On Fri, Aug 23, 2019 at 01:55:07PM +0200, Hans Verkuil wrote:
> Hi Maxime,
>
> On 8/23/19 9:31 AM, Sakari Ailus wrote:
> > Hi Mauro,
> >
> > Here's a driver for A10 CSI parallel receiver and a fix for atmel-isi.
> >
> > There are three checkpatch.pl warnings; two on Makefile / Kconfig on
> > MAINTAINERS (i.e. not worth mentioning in MAINTAINERS) while the third is
> > on a spinlock missing a comment. If you'd like the last one to be
> > addressed, I'm proposing doing that in a separate patch.
>
> When running sparse I get this warning:
>
> drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c:21:31:  warning: symbol 'sun4i_csi_formats' was not declared. Should it be static?
>
> Can you post a follow-up patch for this?

Sorry for that, I just sent a patch fixing it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vtl36qphur3okuty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV/bkwAKCRDj7w1vZxhR
xayfAQD//8fv4j8tieTfhPmrSSsokulwdZ24Kzo5hgL4vgI7YwEAnr6yKKgk8gRk
WLwHB15LdSW2Z9ZJf3wlOFmKa5/btgM=
=tlGh
-----END PGP SIGNATURE-----

--vtl36qphur3okuty--
