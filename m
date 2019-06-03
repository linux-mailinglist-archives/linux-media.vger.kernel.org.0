Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6645132EEC
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfFCLqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:46:30 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35157 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfFCLqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:46:30 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6EDBB1BF216;
        Mon,  3 Jun 2019 11:46:21 +0000 (UTC)
Date:   Mon, 3 Jun 2019 13:46:20 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
        boris.brezillon@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH 2/7] media: cedrus: Fix H264 default reference index count
Message-ID: <20190603114620.vsvbxz6gyhg3tn7b@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fsayms5djr42vwm2"
Content-Disposition: inline
In-Reply-To: <20190530211516.1891-3-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fsayms5djr42vwm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2019 at 11:15:11PM +0200, Jernej Skrabec wrote:
> Reference index count in VE_H264_PPS reg should come from PPS control.
> However, this is not really important because reference index count is
> in our case always overridden by that from slice header.
>
> Cc: nicolas@ndufresne.ca
> Cc: boris.brezillon@collabora.com
> Cc: jonas@kwiboo.se
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

> ---
> We have to decide if we drop pps->num_ref_idx_l0_default_active_minus1
> and pps->num_ref_idx_l1_default_active_minus1 fields or add
> num_ref_idx_l0_active_override_flag and num_ref_idx_l0_active_override_flag
> to slice control.
>
> Current control doesn't have those two flags, so in Cedrus override flag is
> always set and we rely on userspace to set slice->num_ref_idx_l0_active_minus1
> and slice->num_ref_idx_l1_active_minus1 to correct values. This means that
> values stored in PPS are not needed and always ignored by VPU.
>
> If I understand correctly, algorithm is very simple:
>
> ref_count = PPS->ref_count
> if (override_flag)
> 	ref_count = slice->ref_count
>
> It seems that VAAPI provides only final value. In my opinion we should do the
> same - get rid of PPS default ref index count fields.

The rationale was to be as conservative as possible and just expose
everything that is in the bitstream in those controls to accomodate
for as many weird hardware as possible.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--fsayms5djr42vwm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPUIjAAKCRDj7w1vZxhR
xdm0AP46c7mpa3rFUC3RjFMniXaoNTXWcQ8pPICsPfw3vjCa9gD+KujizJ6uc9di
+fd1bkaTJJCq8ZbqR+3HqBMJe9acIgE=
=wE3x
-----END PGP SIGNATURE-----

--fsayms5djr42vwm2--
