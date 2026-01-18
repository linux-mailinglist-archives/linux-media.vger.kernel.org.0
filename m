Return-Path: <linux-media+bounces-50969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E6D3935F
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 09:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C63B3009D42
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 08:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D729284669;
	Sun, 18 Jan 2026 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QL3OethW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6C27FD75;
	Sun, 18 Jan 2026 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768724992; cv=none; b=k7+8TfA/WQVGq3S23+qkFQMCsx7h0y7LAFnTNRAjgbqhELFKS94jIsOziP6GI/RU1vhP42EZcEMqJ0MaEAPWaj7ZQKHdcRy9ya9+wc+CQTnam+oGTWXWg1EbpElq1TFwb72ZbCZ3EZA+ovB4UEIHMPT8LM9TaujaGvst3ApLv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768724992; c=relaxed/simple;
	bh=fW3uY+SpcU3DDDjX7rKHmlXchpeeczq5hy4+z/bCzmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWYX50VAylpVNFMWczzVr5Pc3zONLgrJKiAgHVBJ9MKXJJWMr1ebo+ubiLPpea9zseGS4hHgwxiEjd0LcqsMHrTKTA5afnZuZSZJ0L6GsHFxmI/R0oeXmEhuntnKlEl54Z0dQ9cxDXrcZZT4nvxi7F4j+ss4kIV6HKmQ5T1QpQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QL3OethW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7ED7546F;
	Sun, 18 Jan 2026 09:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768724958;
	bh=fW3uY+SpcU3DDDjX7rKHmlXchpeeczq5hy4+z/bCzmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL3OethWl8ed+ZqtIAOZdjlIC+Hc5kPO+jFogQvXtkjLEOM6nfZtr1slXNZ0AEu3I
	 HZjitx7BSqOhIKM3AHJhDghDac+YG8p8RTnRxXUCRE4/eJmqqgcyqLnmMAdq4wTxsN
	 gCsiI/8E7UVcl34ezH6oUmZM+Q9QoKyNBhVzQH5E=
Date: Sun, 18 Jan 2026 10:29:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/2] media: staging: Drop StarFive JH7110 Camera
 Subsystem
Message-ID: <20260118082927.GB20659@pendragon.ideasonboard.com>
References: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>

On Fri, Jan 16, 2026 at 12:36:57PM +0530, Jai Luthra wrote:
> StarFive no longer plans to maintain or develop the JH7110 camera
> subsystem for destaging, as discussed in below thread:
> 
> https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> 
> So drop the driver and bindings from staging. This came up while adding
> support for streams APIs in Cadence CSI2RX driver, which is used both by
> StarFive and TI in their capture pipelines:
> 
> https://lore.kernel.org/all/20260114130522.GE25101@pendragon.ideasonboard.com/
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Mauro, Hans, can you pick this up ? There's a comment from Krzysztof on
patch 1/2 asking for the DT bindings removal to be applied on top of the
driver removal (just swapping the order between patches 1/2 and 2/2).

> ---
> Changes in v2:
> - Add Changhuang's Ack on PATCH 1
> - Fix PATCH 2 to also drop reference to the starfive camss documentation
>   in v4l-drivers.rst
> - Link to v1: https://lore.kernel.org/r/20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com
> 
> ---
> Jai Luthra (2):
>       media: dt-bindings: Drop starfive,jh7110-camss from staging
>       media: staging: Drop starfive-camss from staging
> 
>  Documentation/admin-guide/media/starfive_camss.rst |  72 ---
>  .../admin-guide/media/starfive_camss_graph.dot     |  12 -
>  Documentation/admin-guide/media/v4l-drivers.rst    |   1 -
>  .../bindings/media/starfive,jh7110-camss.yaml      | 180 ------
>  MAINTAINERS                                        |   9 -
>  drivers/staging/media/Kconfig                      |   2 -
>  drivers/staging/media/Makefile                     |   1 -
>  drivers/staging/media/starfive/Kconfig             |   5 -
>  drivers/staging/media/starfive/Makefile            |   2 -
>  drivers/staging/media/starfive/camss/Kconfig       |  18 -
>  drivers/staging/media/starfive/camss/Makefile      |  13 -
>  drivers/staging/media/starfive/camss/TODO.txt      |   4 -
>  drivers/staging/media/starfive/camss/stf-camss.c   | 438 ---------------
>  drivers/staging/media/starfive/camss/stf-camss.h   | 134 -----
>  drivers/staging/media/starfive/camss/stf-capture.c | 605 ---------------------
>  drivers/staging/media/starfive/camss/stf-capture.h |  86 ---
>  .../staging/media/starfive/camss/stf-isp-hw-ops.c  | 445 ---------------
>  drivers/staging/media/starfive/camss/stf-isp.c     | 379 -------------
>  drivers/staging/media/starfive/camss/stf-isp.h     | 428 ---------------
>  drivers/staging/media/starfive/camss/stf-video.c   | 570 -------------------
>  drivers/staging/media/starfive/camss/stf-video.h   | 100 ----
>  21 files changed, 3504 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260115-drop-starfive-camss-2b9ff7cf3321

-- 
Regards,

Laurent Pinchart

