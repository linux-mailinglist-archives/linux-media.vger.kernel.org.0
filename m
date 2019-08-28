Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB2C9FCB3
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 10:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfH1IRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 04:17:31 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46781 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfH1IRb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 04:17:31 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2C6211C0016;
        Wed, 28 Aug 2019 08:17:29 +0000 (UTC)
Date:   Wed, 28 Aug 2019 10:17:28 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/3] drm/sun4i/sun4i_hdmi_enc: call cec_s_conn_info()
Message-ID: <20190828081728.3prhkjq3o2ndadvx@flea>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
 <20190823112427.42394-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elwmax327enzry3p"
Content-Disposition: inline
In-Reply-To: <20190823112427.42394-3-hverkuil-cisco@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--elwmax327enzry3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2019 at 01:24:26PM +0200, Hans Verkuil wrote:
> Set the connector info for the CEC adapter. This helps
> userspace to associate the CEC device with the HDMI connector.
>
> Tested on a Cubieboard.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--elwmax327enzry3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWY4mAAKCRDj7w1vZxhR
xZLrAP9X6mugRqxtiUk6Exhdt6v1sAs1+cgS4zHZThS+W8UaxwEA/0A1c3ljf4xL
7feT4RNrgewx61O4vRAJKmE2D9qtPAE=
=7Ikl
-----END PGP SIGNATURE-----

--elwmax327enzry3p--
