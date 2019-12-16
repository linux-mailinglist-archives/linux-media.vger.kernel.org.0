Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE561120295
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLPKaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:30:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:48892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbfLPKaO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:30:14 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CAF8206CB;
        Mon, 16 Dec 2019 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576492212;
        bh=TP9DzZcKSVrQpP32FqzNgOZaTZ4ylpfJByIaBDD/rtI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cbW7rAD98yBt5ylWkUjbozPxRKW1HZE5UawycIiZRFQ7gvrOSblVeXGoelAraXm6z
         BkbndCnYJ4/iiZpb3JLUY79l3nikIgQSfsGIToNvNie7cu1JTu1PeaXTB4430bcJ5J
         E2BhjDjV/XFCPZXxpWRtwB/0M1JZKrVzw/bN05+8=
Date:   Mon, 16 Dec 2019 11:30:09 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 02/14] dt-bindings: media: sun4i-csi: Add compatible for
 CSI0 on R40
Message-ID: <20191216103009.knlby7rxf5pghf5q@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j4c5uoispaqa4lve"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-3-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--j4c5uoispaqa4lve
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:12AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The CSI0 block in the Allwinner R40 SoC looks to be the same as the one
> in the A20. The register maps line up, and they support the same
> features. The R40 appears to support BT.1120 based on the feature
> overview, but it is not mentioned anywhere else. Also like the A20, the
> ISP is not mentioned, but the CSI special clock needs to be enabled for
> the hardware to function. The manual does state that the CSI special
> clock is the TOP clock for all CSI hardware, but currently no hardware
> exists for us to test if CSI1 also depends on it or not.
>
> Add a compatible string for the CSI0 block in the R40, with the A20
> compatible string as a fallback.
>
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--j4c5uoispaqa4lve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdcsQAKCRDj7w1vZxhR
xdV4AP43TuArwkolNnd0v+MEWhLJJWbvcpaXKB28P0p/Or8XqAEAtdXmz4ciBhek
kycHLr2wxDL17v6dVj+QU3bE3MLLvws=
=nnf8
-----END PGP SIGNATURE-----

--j4c5uoispaqa4lve--
