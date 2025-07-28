Return-Path: <linux-media+bounces-38576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35718B13D0A
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5963A2B12
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F201326E6EB;
	Mon, 28 Jul 2025 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KQ2tgB92"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7C262FC1
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712618; cv=none; b=j2zjb8sOMFsZ1HNOcgEbnlpqH25Js+g09wDubBczDXKFw+FVu/o01LOepXJTY4/c9G2SbDaKg2f59LqUciD1EAt/jHhrC3vSbFR2W9+FNfV3jxQoa4EgIBaixJjnB7MounD1XqU2Vxy7ut2UmX3zIltZvEqQA0enr/lpbVNK3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712618; c=relaxed/simple;
	bh=rFp8oa9Ob5g0v/+OfvXGOCtTlSZUW99iq8sUu541Jqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXXr1lbqVT/4O+nYo00GgbI+Pe7aSKIVj40wjj1x2+3nk1mIx+RiUp6SFB65dJJ8eXKkbUbYuqt2Kh75bZxfNM0Lseo2f0lKi4PKy8xnwXNCUcr4uLhkV9gOnD6HpKl1XbodClemBu96Hl26u+XLJJA8ePeH8ZqztHHErrSwSkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KQ2tgB92; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B051446;
	Mon, 28 Jul 2025 16:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753712571;
	bh=rFp8oa9Ob5g0v/+OfvXGOCtTlSZUW99iq8sUu541Jqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQ2tgB92/B7vZmAz3JWCALESjNk76M1FX4fKIKXOOPk4lM6B0Hx54WLyMxfX12z3n
	 NM83z0xfDHph5i0qaD4vtegmynDyVhAQhHEOxf9Zvaj+pj2p/5KxNhZKPuqFiWNFDF
	 V7ir7r3Ueg2cZnHPX7AlHKjfn48K416PGyfQhbvA=
Date: Mon, 28 Jul 2025 16:23:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 37/64] media: uapi: Documentation: Improve column
 width hints for examples
Message-ID: <wnfszqq6vwgzvcr3e6pfm3ffov27anewy4crug56in3nt6mg56@7vhi3e3zkvqy>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-38-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-38-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:58:09PM +0300, Sakari Ailus wrote:
> Use less arbitrary widths for the columns in metadata layout examples.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Sorry, missed this one in previous review cycle

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/v4l/metafmt-generic.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> index 90a1bc2ea15e..e8824b5a65d6 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> @@ -76,7 +76,7 @@ This format is little endian.
>  **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_10.**
>  Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>
> -.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
>
>  .. flat-table:: Sample 4x2 Metadata Frame
>      :header-rows:  0
> @@ -120,7 +120,7 @@ This format is little endian.
>  **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_12.**
>  Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>
> -.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
>
>  .. flat-table:: Sample 4x2 Metadata Frame
>      :header-rows:  0
> @@ -161,7 +161,7 @@ This format is little endian.
>  **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_14.**
>  Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>
> -.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{.8cm}|
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.8cm}|p{1.8cm}|
>
>  .. flat-table:: Sample 4x2 Metadata Frame
>      :header-rows:  0
> @@ -257,7 +257,7 @@ This format is little endian.
>  **Byte Order Of V4L2_META_FMT_GENERIC_CSI2_20.**
>  Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>
> -.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}
>
>  .. flat-table:: Sample 4x2 Metadata Frame
>      :header-rows:  0
> --
> 2.39.5
>
>

