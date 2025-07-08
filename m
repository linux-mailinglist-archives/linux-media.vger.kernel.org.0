Return-Path: <linux-media+bounces-37165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6DCAFD9A7
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 23:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E10EF3AE6B3
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 21:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAD72459DA;
	Tue,  8 Jul 2025 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceLa8LDc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078391A841A;
	Tue,  8 Jul 2025 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752009691; cv=none; b=Ex+kieGflsXWYxCN/rEsypyq0P1ug4aoNvPWLuSDHvg+IQFJJoBOiJJA+jd1BLouwibFGizisUNDpPRBwy4vBC23IwYx2RpuyDqMNVEISYgJoSXnbq84GkLr6BcYsXnqqv+ESLgVc92Dg4qeHlOgrDs2osbCJJIAQr1UauXbDGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752009691; c=relaxed/simple;
	bh=BD45fOSIJuFMBAgIlSkATWlSQYal73zlmew1ys0nEOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihLa4EW+dXhlVfbSz+9jCVLaiXorZQxOx3KKSIsdgjpZ6Mf7Ub7gGhkMANoGsBOSBPe18yZXaSFycVx8q67/ceYo6TPI1yhv3pqOlTPT9VF2mdxNiqbQwJAxRUE1Jd75ehvSFm6sj+4Iyg5lONBUiEtMKpnX57U8CA08OWgLdz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceLa8LDc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42891C4CEED;
	Tue,  8 Jul 2025 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752009690;
	bh=BD45fOSIJuFMBAgIlSkATWlSQYal73zlmew1ys0nEOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceLa8LDcpUhuLf+TCrHxLAH1fLRwQgCP7HUiw3erLFEnnmi5ucOx8mzDUfhGxVCxJ
	 1SiJuTWo577zuuNDx+YuZ2wjDzayqvIAU1OEz3u3h7CFn4KAID2ef9Teg0cMY1C+WA
	 /5+YE0PrrhWE/6nIhAK12bMt+2PHz/FBue60O38wno5DNf3RxcwdhFvRcG3ldfr7ax
	 lg9PXvX40G3mpjacx7sycLPDYHelmuurrhjuTgoqjPkUvDdAa0zu9FOxJPX0rtW5cY
	 yoBtswoYsblAYTRoMoZtOXD382/XQhcGAl+kMLZo1D2SlSoa7ku7aC1P5mhpZUEkmI
	 o54yV+XskZadA==
Date: Tue, 8 Jul 2025 16:21:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
Message-ID: <175200964552.1075683.215921884605311329.robh@kernel.org>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
 <20250708-drm-v1-3-45055fdadc8a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-drm-v1-3-45055fdadc8a@gmail.com>


On Tue, 08 Jul 2025 18:06:46 +0800, LiangCheng Wang wrote:
> The binding is for the Mayqueen Pixpaper e-ink display panel,
> controlled via an SPI interface.
> 
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
>  .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

This should be patch 2. Bindings come before users of them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


