Return-Path: <linux-media+bounces-32171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A341AB1C9A
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46CE4B250A3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CBA23CEF8;
	Fri,  9 May 2025 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GEeuyY3F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7161223C4FD
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816441; cv=none; b=GepwPwiEdDMsqKLgUgFWJoKu8cxvdTZOQittpWXVUxXW3lvl+ki18sfuJfUXU1C2pv1UgZhwBQoK+MngpBwYxoCuqtdMz8PvJ+FCKfeMV5h6AOHYshhhV0n3boWFt0hxRZ9E558JcZMzMLnXS3Z3P1odV4X3Ym1LMrrsQYD4KW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816441; c=relaxed/simple;
	bh=wy5gqsqf+PoBI3utc7s4D6elm1vRfarYU5VG9T5mSLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmCLWx/4yKCdQjcRl+v+yNeXSF1H+rTlWtviYDPvE89/wRe1zuzUxP6E04UJDpB8EZY/0i5AFA5tZ05V4Zy8qmTJJu5tSHkdK+Kwc5Vxn1BV7Tu5y90qKC4RmBlSHDw2R62wDlZiPZD2PgxBO0LaT7s3bNxKoVJm9gxEpH9ZTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GEeuyY3F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01518F89;
	Fri,  9 May 2025 20:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746816423;
	bh=wy5gqsqf+PoBI3utc7s4D6elm1vRfarYU5VG9T5mSLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEeuyY3F3ZBRC4kPFgVzCDPv45IXugodV82sd6IITTkKfEI4Okn+Si15FDX2xNk5E
	 soiDzrNqmaP2lb/P7aunpZhrArrdhv9K4ew580hJ0ir4ZoNkmqVjml2p4/FJsFyBuT
	 SsBYvM0bzMpqtNrRYGYMjG+e8yorDxXvigUbpOhc=
Date: Fri, 9 May 2025 20:47:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/13] media: aptina-pll: Debug log p1 min and max values
Message-ID: <20250509184706.GA19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-2-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:22PM +0200, Hans de Goede wrote:
> Make aptina_pll_calculate() debug log the calculated p1 min and max values,
> this makes it easier to see how the m, n and p1 values were chosen.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/aptina-pll.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
> index b1f89bbf9d47..cd2ed4583c97 100644
> --- a/drivers/media/i2c/aptina-pll.c
> +++ b/drivers/media/i2c/aptina-pll.c
> @@ -129,6 +129,8 @@ int aptina_pll_calculate(struct device *dev,
>  	p1_max = min(limits->p1_max, limits->out_clock_max * div /
>  		     (pll->ext_clock * pll->m));
>  
> +	dev_dbg(dev, "pll: p1 min %u max %u\n", p1_min, p1_max);
> +
>  	for (p1 = p1_max & ~1; p1 >= p1_min; p1 -= 2) {
>  		unsigned int mf_inc = p1 / gcd(div, p1);
>  		unsigned int mf_high;

-- 
Regards,

Laurent Pinchart

