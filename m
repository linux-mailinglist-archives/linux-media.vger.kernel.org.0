Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A152214ADB
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 15:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEFNXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 09:23:00 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:60339 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfEFNXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 09:23:00 -0400
X-Originating-IP: 90.88.149.145
Received: from localhost (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr [90.88.149.145])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1834E1BF211;
        Mon,  6 May 2019 13:22:55 +0000 (UTC)
Date:   Mon, 6 May 2019 15:22:55 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 18/20] lib: image-formats: Add v4l2 formats support
Message-ID: <20190506132255.k5d4e6wcsy5ltjjk@flea>
References: <cover.8ec406bf8f4f097e9dc909d5aac466556822f592.1555487650.git-series.maxime.ripard@bootlin.com>
 <a9af304793a38b6001c9155f36e370002926841c.1555487650.git-series.maxime.ripard@bootlin.com>
 <5c904167-14f3-8e64-42f1-650d0689f78d@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elbcsaswnwcxysle"
Content-Disposition: inline
In-Reply-To: <5c904167-14f3-8e64-42f1-650d0689f78d@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--elbcsaswnwcxysle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans

On Thu, May 02, 2019 at 10:24:00AM +0200, Hans Verkuil wrote:
> On 4/17/19 9:54 AM, Maxime Ripard wrote:
> > V4L2 uses different fourcc's than DRM, and has a different set of formats.
> > For now, let's add the v4l2 fourcc's for the already existing formats.
>
> For this lib to be more useful for V4L2, would it be a good idea to add
> Bayer formats as well? This can be done in a separate patch.
>
> Those formats are V4L specific, but are very common.

Yeah, this was mostly to support the formats that are already
supported as of today, but eventually more are going to be supported,
and the bayer formats seems like a natural choice :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--elbcsaswnwcxysle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXNA1LwAKCRDj7w1vZxhR
xQb1AP9+7X+VYpkwMiJLhzyVSkvkphWcjZ4tq9sc/yOP03E47AD/YZpmkkIpI1FW
n04Y3eAA5DKrtCudeW0FjnAIclNJogs=
=bYjp
-----END PGP SIGNATURE-----

--elbcsaswnwcxysle--
