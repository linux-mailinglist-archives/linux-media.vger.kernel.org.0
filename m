Return-Path: <linux-media+bounces-7922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8A88DAC6
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 10:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469F51F2A290
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9414F1F2;
	Wed, 27 Mar 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI5W1MOu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3423EA86;
	Wed, 27 Mar 2024 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711533482; cv=none; b=YtQYQSspbqtGzyJTr5dqnq+Uez9sU39duX94HxYBzzmoMTvu0Lq+3gAnsg7qF8/OlNWvHNrwhxxNIqvRJlB5OsEWP7hdlBsGZUyIMYVMBckRWRebHjzND/3ZDwpZn3RiGL4bzZL7E1kEBDAj6hRHFhWnTBylqAGoeEVJK9URblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711533482; c=relaxed/simple;
	bh=OSqeEcWXI4ifW8M/UsrT7IcLYQ0kffRravFT8KdiKDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmM5jbf+JTqXp9XcrxII40jIbp/DmvSSLlR+YmqfZBY36K/UUDkjK8HExW9pG1RYj4VayZbKoDCcEtjnShBNCPA4uGXjEvwcOcypk+x5l0xOzhwP42IE/JobpKXqeySQ0l04i+xb+gg0jKFy1uCk0wnb66gvltDekPaPKKdVPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI5W1MOu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711533480; x=1743069480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OSqeEcWXI4ifW8M/UsrT7IcLYQ0kffRravFT8KdiKDg=;
  b=LI5W1MOuI5z/lOj51bICDTyYeqVaAEtdPq8E+0p+fGtNvTJKwXONW187
   iRxalz6eRISiEpFFI7kgpMlxejFqljk0xQ/DWkmy6beshpzlwta7GE9e5
   jRoAN/dX6AK7hSzfTxyZgWgwItwffvM6mSiGILxnJPeBQLuNLMkHQknGE
   8Xq9M2rhGM1wcVCejVTsmCT6RuESIjxZ/DjGLzxvr8SMNRSpQpEG4uyKA
   gqM2IORDaEjEDA5P2ZAMbIQrrpyZrpzbBwJuctme41py1j+CcFMSvn12r
   VYYCowoHA4sTYphxGeyUZalPjq/xaOTB8h2An/5yhFqLscdpZJ628paOr
   A==;
X-CSE-ConnectionGUID: 9J5WMrKbQlKXvZYhzSJURQ==
X-CSE-MsgGUID: vQEIH5PeQBW7ckbWJ3QuMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6810317"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6810317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 02:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="20717466"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 02:57:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D975111FB81;
	Wed, 27 Mar 2024 11:57:54 +0200 (EET)
Date: Wed, 27 Mar 2024 09:57:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document
 clock/data-lanes
Message-ID: <ZgPtolH796HER4cP@kekkonen.localdomain>
References: <20240326231033.2048193-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326231033.2048193-1-festevam@gmail.com>

Hi Fabio,

On Tue, Mar 26, 2024 at 08:10:33PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> OV2680 has a single data lane MIPI interface.
> 
> Document the clock-lanes and data-lanes properties to avoid
> the following dt-schema warning:
> 
> imx7s-warp.dtb: camera@36: port:endpoint: Unevaluated properties are not allowed ('clock-lanes', 'data-lanes' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml#
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../bindings/media/i2c/ovti,ov2680.yaml       | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index cf456f8d9ddc..ae104da067e9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -50,9 +50,22 @@ properties:
>        Definition of the regulator used as digital power supply.
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
>      description:
>        A node containing an output port node.
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            const: 1

If there's a single possible configuration only, is this needed? There's no
information here which the driver would need.

>  
>  required:
>    - compatible
> @@ -65,7 +78,7 @@ required:
>    - reset-gpios
>    - port
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -89,6 +102,8 @@ examples:
>                  port {
>                          ov2680_to_mipi: endpoint {
>                                  remote-endpoint = <&mipi_from_sensor>;
> +                                clock-lanes = <0>;
> +                                data-lanes = <1>;
>                          };
>                  };
>          };

-- 
Regards,

Sakari Ailus

