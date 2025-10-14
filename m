Return-Path: <linux-media+bounces-44344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 460A7BD7CD3
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 419964F755C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCFC3043C0;
	Tue, 14 Oct 2025 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbbr7azH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EC16DC28;
	Tue, 14 Oct 2025 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760425524; cv=none; b=Jcxn+ldC2N7QWebS+CdMkwpnU3Qx1ekaq0xIpvKKJtjg0JwX/8svx+nmSsupNh5OB2KXLAjThJfB6ZKPmhy4bOPPeuuGi445LGG9D1POp72gC4RHiFxleREGw82VVO9UFNEZA1T9jUvnZ+QKlTtDEKEEgKrl1neRik6mq/1NfZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760425524; c=relaxed/simple;
	bh=jmNYVYVmbqAvjpNOVm8qG23vIn+BKX3VYzDscLcHBdw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u40VRAXdpYFlNoabldHrr2aCJmnVer+cVL9rQXotqjGYtPZlMbEtZklFXXsVGbJZbRzNaQQHW+uNaxliUftQ5cih+VfNC+OMIX3LUrNdUgizEsDoU0h+Ijf7R9Sva+hpcEqF+Vq2ZMhnhXAxqUuf+Q4BDnQXMZ/vcaWfbTnodt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbbr7azH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AAEC4CEE7;
	Tue, 14 Oct 2025 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760425524;
	bh=jmNYVYVmbqAvjpNOVm8qG23vIn+BKX3VYzDscLcHBdw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=qbbr7azH0sXjxxiOaqIfASh67I5jmxfVCE0NjElmdi5DohLKT5JO7F3zkb4eCCxNP
	 8lc7v8SSWmknN0CI+oO7Bk1cOFNpq0FOPUu7xi2RzNIKrT4gBMpmx0GyBWaam/WESM
	 4SAn8xo2qObtDCWe1tZXBM63lDxoXCghYNw/oImqW/0GVOIXuKiylnI72vgk8EbA0S
	 6pjXRSBb10A2xiPHMoZslBBF+hk5x1iFN+pan47rEsGmsE5Ackzdtx1AStsBDiHIff
	 ex33nOvlSLHuVlvENJp8FkE0AvG6LQsY9s9j8vdN9FF6RZ0I4Tj2efztc3Hb7W0IeJ
	 Cwhh5F9p8GVCg==
Message-ID: <0627cfba-798a-482b-b335-cc78a609c150@kernel.org>
Date: Tue, 14 Oct 2025 09:05:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 0/2] media: pci: Fix invalid access to file *
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

On 19/08/2025 09:07, Jacopo Mondi wrote:
> Since commits
> 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
> 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
> 
> All the ioctl handlers access their private data structures
> from file *
> 
> The ivtv and cx18 drivers call the ioctl handlers from their
> DVB layer without a valid file *, causing invalid memory access.
> 
> The issue has been reported by smatch in
> "[bug report] media: cx18: Access v4l2_fh from file"
> 
> Fix this by providing wrappers for the ioctl handlers to be
> used by the DVB layer that do not require a valid file *.

This series should go to the fixes branch for v6.18, right?
This looks like a pure regression, so I think that makes sense.

BTW, why is there a Link: tag in the cx18 patch? It just links to
the v1 of the patch and that doesn't add meaningful information.
Linus likes Link:, but only if it really adds useful information.

Regards,

	Hans

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes in v4:
> - Slightly adjust commit messages
> - Link to v3: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com
> 
> Changes in v3:
> - Change helpers to accept the type they're going to operate on instead
>   of using the open_id wrapper type as suggested by Laurent
> - Link to v2: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com
> 
> Changes in v2:
> - Add Cc: stable@vger.kernel.org per-patch
> 
> ---
> Jacopo Mondi (2):
>       media: cx18: Fix invalid access to file *
>       media: ivtv: Fix invalid access to file *
> 
>  drivers/media/pci/cx18/cx18-driver.c |  9 +++------
>  drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
>  drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
>  drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
>  drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
>  drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
>  6 files changed, 52 insertions(+), 34 deletions(-)
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde
> 
> Best regards,


