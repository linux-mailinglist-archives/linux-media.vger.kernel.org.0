Return-Path: <linux-media+bounces-45591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D304C0B6E3
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 00:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EB5F18A05BB
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6E83009DE;
	Sun, 26 Oct 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lIxPZ7G/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76614D29B;
	Sun, 26 Oct 2025 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520572; cv=none; b=ETqgEKLrGiekF42X3FWo7iqlrpOv8vfKsFQE4YHeTusHflNRrCFZPAHLmy6+OjxMf+iv86mRh1+UyRAqgIuxxzfx+nGC+okKDEFTY/BiGfM3/Xm/hwb3cl9m7v2mxMUz3Ee90AycXHMOOtwcN0q15O2f8I4ZRs4I+N1LicHF2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520572; c=relaxed/simple;
	bh=zAGDpX+nRvTui2WZwKFAtkpnv0XUp3D8BQ9rL9Gzr5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+7nXbSU2/9ewYfX69qO0jZROYRaC3Ckp0bcN5/CA83B6kKEcpZCAVC+826hA2MZ7CZ527YOJiwCT2HFD813E+usEw1V0JLrurxTjf+xwzCp7aXax4i2hgNOmi1CC8zxuZiJrkrf4lHDqegXD3KxOVkORAIwHWhecbl8M9hbffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lIxPZ7G/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D29157E0;
	Mon, 27 Oct 2025 00:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761520460;
	bh=zAGDpX+nRvTui2WZwKFAtkpnv0XUp3D8BQ9rL9Gzr5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIxPZ7G/LKyiehOTfKC1HcdMk2FxdRfs692pmUyrcxBNaGQfJOz2uyvlq+5UsYU+G
	 ctbkspWJuSKRtp7PxkTyZOBGbhjLSXKBx/D6Xzxrtn6S+cTEPltywoQiaD+n6wBINO
	 SPigzZf4xJUsQXeLye+WswnSKOoih7k8hGvFViGY=
Date: Mon, 27 Oct 2025 01:15:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mats Randgaard <matrandg@cisco.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Message-ID: <20251026231553.GB9719@pendragon.ideasonboard.com>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
 <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>

On Mon, Oct 13, 2025 at 01:01:34PM +0200, Maxime Ripard wrote:
> MIPI-CSI2 sends its RGB format on the wire with the blue component
> first, then green, then red. MIPI calls that format "RGB", but by v4l2
> conventions it would be BGR.
> 
> MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.
> 
> We already have BGR666 and BGR888 media bus formats, we don't have any
> CSI transceivers using the 444 and 555 variants, but some transceivers
> use the CSI RGB565 format, while using the RGB565 media bus code.
> 
> That's a mistake, but since we don't have a BGR565 media bus code we
> need to introduce one before fixing it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
>  include/uapi/linux/media-bus-format.h              |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef6cdb1a2ec9395af1468f56adf31a8de 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -625,10 +625,47 @@ The following tables list existing packed RGB formats.
>        - b\ :sub:`4`
>        - b\ :sub:`3`
>        - b\ :sub:`2`
>        - b\ :sub:`1`
>        - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-BGR565-1X16:
> +
> +      - MEDIA_BUS_FMT_BGR565_1X16
> +      - 0x1028
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`

We're definitely in convention territory, because this is not how 16-bit
RGB data is transmitted over CSI-2. CSI-2 transmits blue first, but
starts with bit 0, not bit 4.

Have you explored the alternative of picking the parallel bus code that
matches the serial order when transmitted with the least significant bit
first ? That would be MEDIA_BUS_FMT_RGB565_1X16 here, and
MEDIA_BUS_FMT_RGB888_1X24 for 24-bit RGB.

>      * .. _MEDIA-BUS-FMT-BGR565-2X8-BE:
>  
>        - MEDIA_BUS_FMT_BGR565_2X8_BE
>        - 0x1005
>        -
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index ff62056feed5b6588bfcfdff178f5b68eecd3a26..a73d91876d31844bf8c2da91ddea541181840bd2 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -32,17 +32,18 @@
>   * new pixel codes.
>   */
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x1028 */
> +/* RGB - next is	0x1029 */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
>  #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
>  #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
>  #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
> +#define MEDIA_BUS_FMT_BGR565_1X16		0x1028
>  #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
>  #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
>  #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
>  #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
>  #define MEDIA_BUS_FMT_RGB666_1X18		0x1009

-- 
Regards,

Laurent Pinchart

