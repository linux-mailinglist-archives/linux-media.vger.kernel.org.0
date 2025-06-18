Return-Path: <linux-media+bounces-35164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD24ADE830
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 12:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AA84189DD2C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 10:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC0828A1DF;
	Wed, 18 Jun 2025 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WjSTLVsS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0327F4CA;
	Wed, 18 Jun 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241421; cv=none; b=E73kngAnO9/8xsY6N+/wLPbWmDOEz9Igsyoa4zeSzjEO+x1omTHUEBgMQpfdGS5+4OFJp2mZJx8DNROYcpkjuqnH2quy+LQEuCpiqAzBeXLLjGGEq8HAjzOXXTffZP78+s8gVIyz7cM+CqSeDO2kfnQ2EEsuT2bHtk8kDF0Q6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241421; c=relaxed/simple;
	bh=aH95rNHRdwQXbxmyv1/Vp8rFQ+7zY8olDtZsi2hZDV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enXE3CQbgWHiXMb+WSSAUh98k4mukXJYIzotgK5f0QJMRUgPkNarOFvsPxd/avmv3Lz8iAPsEkmbw8GHeTBB2+6vigfUDWlL0BLrcKV3bNphJvfuEtHZfr2KuHUXq5PjrdXxmegHgLO3vLc37nY+0GgZWJEvA3FuyC3z9VQybFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WjSTLVsS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42B34593;
	Wed, 18 Jun 2025 12:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750241405;
	bh=aH95rNHRdwQXbxmyv1/Vp8rFQ+7zY8olDtZsi2hZDV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjSTLVsSwIxqr0GVr/Hm3E4L7IUfwlxGBiGHeZXk9jvblyF9L5hO2gHy8Uyq3G2TZ
	 wv1jM4zG6iisi3Rh9YwIn0p6r7g41prtB9p7RtmnhRyOme7piv6dWD9pU+KhPo8n7i
	 qbIt6FGw4mhXCxWdB1bB4lO+ycVscyCictfoAgZc=
Date: Wed, 18 Jun 2025 13:10:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] media: renesas: rzg2l-cru: Fix typo in
 rzg3e_fifo_empty name
Message-ID: <20250618101001.GB10978@pendragon.ideasonboard.com>
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Apr 29, 2025 at 10:16:09AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Correct the misnamed FIFO-empty helper for the RZ/G3E CRU. Rename
> `rz3e_fifo_empty` to `rzg3e_fifo_empty` to match the intended
> naming convention.
> 
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 2 +-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 5fa73ab2db53..db27819d8200 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -366,7 +366,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
>  	.irq_handler = rzg3e_cru_irq,
>  	.enable_interrupts = rzg3e_cru_enable_interrupts,
>  	.disable_interrupts = rzg3e_cru_disable_interrupts,
> -	.fifo_empty = rz3e_fifo_empty,
> +	.fifo_empty = rzg3e_fifo_empty,
>  	.csi_setup = rzg3e_cru_csi2_setup,
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index c30f3b281284..56feda6e6207 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -199,7 +199,7 @@ void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
>  void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> -bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
> +bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
>  			  const struct rzg2l_cru_ip_format *ip_fmt,
>  			  u8 csi_vc);
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 3d0810b3c35e..ab35caf97c51 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -323,7 +323,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	return 0;
>  }
>  
> -bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
> +bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru)
>  {
>  	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
>  

-- 
Regards,

Laurent Pinchart

