Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444B8120296
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfLPKaY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:30:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:49140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727261AbfLPKaY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:30:24 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73AD7206CB;
        Mon, 16 Dec 2019 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576492223;
        bh=KmOjsO485jZWPyMI0JTSr6CCJZxWMYYXDKFUfapkW0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KcB9P/2h/9Ud9VmZpuZ737sZN6xDA/T/iKVKsFkI4QgKMissDmHwcz+tU8/zU0XuQ
         e+5y+DSi5/tXT/uWOXMRg8j/ooYnhFd8jg+rFGOr8hn7kjhv3h+/p8/uyQsirCdQJB
         uWqhnBl7t1rYareJCRlX0yeY6o6vVqWhtmh/+AQ0=
Date:   Mon, 16 Dec 2019 11:30:21 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 01/14] dt-bindings: media: sun4i-csi: Add compatible for
 CSI1 on A10/A20
Message-ID: <20191216103021.z4zmd5wz3fbt6p76@gilmour.lan>
References: <20191215165924.28314-1-wens@kernel.org>
 <20191215165924.28314-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c5dhr4zeahfmg3rc"
Content-Disposition: inline
In-Reply-To: <20191215165924.28314-2-wens@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--c5dhr4zeahfmg3rc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2019 at 12:59:11AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The CSI1 block has the same structure and layout as the CSI0 block.
> Differences include:
>
>   - Only one channel in BT.656 instead of four in CSI0
>   - 10-bit raw data input vs 8-bit in CSI0
>   - 24-bit RGB888/YUV444 input vs 16-bit RGB565/YUV422 in CSI0
>   - No ISP hardware
>
> The hardware found in the A20 is the same as in the A10.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--c5dhr4zeahfmg3rc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdcvQAKCRDj7w1vZxhR
xT3dAQCxY6xWEXeQcYr/d7+QSenbOtBVqgdSzjafmezoosWGJQEAzy+LF9CQBWZn
xOxhZnZen3CAWEOsFLZ6ul8WsuPC6AM=
=C0Mw
-----END PGP SIGNATURE-----

--c5dhr4zeahfmg3rc--
