Return-Path: <linux-media+bounces-27256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D45EA4A6BF
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 00:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB553BBF1F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 23:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287421DF96E;
	Fri, 28 Feb 2025 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iZpP9uaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55261DED57;
	Fri, 28 Feb 2025 23:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740786963; cv=none; b=RAE9Tqe9gDSR0IjFqlvTlCfsab8x0qYAm+m37qJtEsScCg/z6kSy1gpmWVepDbyJw05umSZ2v0M+OW0/FgTpYUVl8o0o5kkWx3+SVryo3QjL5uS4QwFL0LgER07ZXL9h0lLhve6LkO5dTpKkrUM6b9E18GKMnUsyDr7p2sCsBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740786963; c=relaxed/simple;
	bh=jTCdtpRYTRHsMVAmFB/azfiEkPNOYIqmEoX6aj1pEFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Avxg7vQ5pdAv8O6SkqnEbKzq0zbY+evpvdYL8kuI92RQlzIXnB8NskHsLx7XmTqtFcEx3zBywFioaKes8GhPS8hkJ86TTIXs2fhJgq8lFd5MLhA+EL3S3b/RFodCoOPYKQAainIQWYhSAGu5TDWpkz5O3AXg1g6d2qpRuNeRCso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iZpP9uaQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5DB18BE;
	Sat,  1 Mar 2025 00:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740786870;
	bh=jTCdtpRYTRHsMVAmFB/azfiEkPNOYIqmEoX6aj1pEFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZpP9uaQpR66kiiaPF92LMEb35IpeO2GD9C2KMxOyqjXlhvDV0zzctzBqODBjYvgs
	 j0bK89QAMzr4sdPXTBsODKp1N6FM8h658nyRZ+f2f4OtK31bvcBspPHWdB3jBvIBQO
	 3Nb82ZUj91bm+/UZTXXvHX14ztrSeIZZ7w1jeDk4=
Date: Sat, 1 Mar 2025 01:55:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rkisp1: Remove unnecessary defines
Message-ID: <20250228235539.GG7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
 <20250227114558.3097101-4-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227114558.3097101-4-stefan.klug@ideasonboard.com>

Hi Stefan,

Thank you for the patch.

On Thu, Feb 27, 2025 at 12:45:01PM +0100, Stefan Klug wrote:
> The effect modes are not shifts but numbers which are already defined a
> few lines above. Remove the misleading defines.

s/misleading/misleading and unused/ (I didn't expect you to
intentionally break the build, and I'm sure it would be caught by my
build tests, but making it clear for reviewers is always nice)

> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to resubmit for this, I can update the commit message.

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index bf0260600a19..139177db9c6d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -327,13 +327,6 @@
>  #define RKISP1_CIF_IMG_EFF_CTRL_CFG_UPD			BIT(4)
>  #define RKISP1_CIF_IMG_EFF_CTRL_YCBCR_FULL		BIT(5)
>  
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE_SHIFT	0
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE_SHIFT	1
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA_SHIFT	2
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL_SHIFT	3
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS_SHIFT	4
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH_SHIFT	5
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SHARPEN_SHIFT	6
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_MASK		0xe
>  
>  /* IMG_EFF_COLOR_SEL */

-- 
Regards,

Laurent Pinchart

