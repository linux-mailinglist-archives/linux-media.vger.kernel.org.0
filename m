Return-Path: <linux-media+bounces-23679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6FE9F5CBF
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 03:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E31137A17BC
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 02:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCFA3597A;
	Wed, 18 Dec 2024 02:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f0fxWUYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38EA2AF1B
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 02:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734488336; cv=none; b=SKOYs4quLw5tHUyDS4mS6ZITZPi2yqUUxGdw6lZSoB44Obo7zLQdOJwHl/rh1NXUHLAinX2cdZAQbP9/ixh9qJD3M07M45tY2mrR1MCN/uyu+Uj9XUHH1QcLaVwbEYMswlKSzwlOSSMhSVWQPgeXhzW/bnGNIK64Meh+ziooj4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734488336; c=relaxed/simple;
	bh=QhVxv4u+D/kq46atIFWOvm/48UdyCHPwF4laDWPT/ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTR3C9xaWK1Q2L23P3O1dTuxPV2DqpqDdHjlPEng62Iffo6O+x0r0+a9XKpn0j07vvijCC1LyHyy4IPd9X8Ju23+9Xw2caoLk09iZDexPzSt9LjyivVdhQP+eQsAjy6eO3rb8uabEFGFiJxVbXQEyNEbjztj+oYQERxAoSaBJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f0fxWUYQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D76F670;
	Wed, 18 Dec 2024 03:18:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734488292;
	bh=QhVxv4u+D/kq46atIFWOvm/48UdyCHPwF4laDWPT/ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0fxWUYQYWJs2qOnfZ9ahEfKOAdE9NDp7CdHQ9GaeNPBHpfDHsknys1nbBAQhKTtZ
	 g5Vtcxvwsl+y8MzgUG0ZrL5zUfWomUg9G38NE7wamiiM60pxKMfgy71Lzp2XCAAsiP
	 sDrDbAgsidYLg7wn5owVTIv7lfNeYvKNbrRC7jHM=
Date: Wed, 18 Dec 2024 04:18:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linuxtv-commits@linuxtv.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [GIT,PULL,FOR,v6.14] imx8-isi fixes and improvements
Message-ID: <20241218021847.GA1844@pendragon.ideasonboard.com>
References: <20241218004058.GA24802@pendragon.ideasonboard.com>
 <67622b40.050a0220.3a9c93.6e95@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67622b40.050a0220.3a9c93.6e95@mx.google.com>

On Tue, Dec 17, 2024 at 05:54:08PM -0800, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches! Unfortunately media-ci detected some issues:
> 
> # Test media-patchstyle:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch media style
> WARNING: Commit cf21f328fcafacf4f96e7a30ef9dceede1076378 found in the stable tree, but stable@vger.kernel.org not in Cc:
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> #16: 
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")

I don't think Cc: stable makes sense for this particular commit.

> total: 0 errors, 1 warnings, 15 lines checked
> WARNING: ./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch: Fails some mandatory checkpatch tests
> 
> # Test checkpatch:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch checkpatch
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> #16: 
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> 
> total: 0 errors, 1 warnings, 0 checks, 15 lines checked

This I can fix. I'll wait for replies to the above though.

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68354451/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

-- 
Regards,

Laurent Pinchart

