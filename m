Return-Path: <linux-media+bounces-12193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3F8D3E4B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 20:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6621F2393E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 18:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315BC15D5AA;
	Wed, 29 May 2024 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pgc5oBJZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88BDDA1;
	Wed, 29 May 2024 18:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007152; cv=none; b=ti+l6zVsBNPBzE75oriZGdoVqtwtITki0+7SEzK/dWr2wt3Qd6l5IIfWZy6nmElJKRrbOcJl3YYA4l4PNWhbtXLUET8biJFrZwPFHIThBbDCXJrrx1pRq6SD/Wa4XEWFYvo3fD7299yHfiIwVcNDk7YJKBzN0ycv7fMuX3j2nBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007152; c=relaxed/simple;
	bh=LZ22GfuS5OvLGKHXwZDbPmbJTcQl9vccap9m2MEXiGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdswM97m2PjQOvbKmWxfEhP+FuVMN+7e1A7P3eHqeN1RAtkSgG1oz0liCU7C+FtA2m7EnC4BRahFy6xHlGv0h8K+vXufu+oh/K5qQ0q75uPE/thyzSCZl3HZ5hNcQvS+J9iOKwLHGk3ueGMLt2E2o/98ldq61QBVQvcXGEsoLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pgc5oBJZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6847B53;
	Wed, 29 May 2024 20:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717007145;
	bh=LZ22GfuS5OvLGKHXwZDbPmbJTcQl9vccap9m2MEXiGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgc5oBJZYk5Ejx8bVpARc7OeCIz0/91t20rvwC+Xz7Bf8xFZW2xx9okWOef/KpzDI
	 KF0iOVPS1tTEAY8ri0XdKU5wy4hDG2Z04jBzEZjxcSYd20bt3590OzcJgcDSvMB86q
	 djoZcD+ovKmpgEWHgP/RdBQltJj2cUP+3YERJCxQ=
Date: Wed, 29 May 2024 21:25:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 07/16] MAINTAINERS: Add entry for mali-c55 driver
Message-ID: <20240529182537.GE10586@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-8-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-8-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, May 29, 2024 at 04:28:49PM +0100, Daniel Scally wrote:
> Add a MAINTAINERS entry for the mali-c55 driver and its associated
> documentation.
> 
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
> 
> 	- None
> 
> Changes in v4:
> 	- None
> 
> Changes in v3:
> 
> 	- none
> 
> Changes in v2:
> 
> 	- none
> 
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef6be9d95143..c2883b30e0ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1688,6 +1688,16 @@ F:	Documentation/gpu/panfrost.rst
>  F:	drivers/gpu/drm/panfrost/
>  F:	include/uapi/drm/panfrost_drm.h
>  
> +ARM MALI-C55 ISP DRIVER
> +M:	Daniel Scally <dan.scally@ideasonboard.com>
> +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/admin-guide/media/mali-c55.rst

You're missing mali-c55-graph.dot.

> +F:	Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +F:	drivers/media/platform/arm/mali-c55/

I'm recording it here to avoid forgetting later, you will need to update
MAINTAINERS in subsequent patches to add

Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
include/uapi/linux/media/arm/mali-c55-config.h

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  ARM MALI-DP DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported

-- 
Regards,

Laurent Pinchart

