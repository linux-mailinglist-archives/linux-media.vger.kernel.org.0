Return-Path: <linux-media+bounces-46271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8084C30630
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D1314F6168
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF93314A90;
	Tue,  4 Nov 2025 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxvUEd0/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1528BAAC;
	Tue,  4 Nov 2025 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762250251; cv=none; b=YeoYtq+PRn5cPFtYbjMDgiu3S96xa8P+nBMvjBDElTC1iq6r0KBu1SDCoER6/73MqOae66qA3bJnJY4Rfd0a2IzqiUHBYDwTACulbxv4znn6FTxTD3gcuPxtRkAaeG+b/N0KFTU5Xgg5n8SZG0PnuV4tJaXkTWGDDFoeh8xpt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762250251; c=relaxed/simple;
	bh=7En2OG3X7ZP2LUb4t379Rh8l5nm4w5x2WVKDBZXU++c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7NxijKRQhSR5KtBRWemzFWxeUXzb5BWhgGZoRfv3AJL7vhKv4PDZENZZdTC2lZw5xFv3tk7wvAxrXJL/qEWQle5CeDIB7GPuV2ygwD/7P5G+fZbcXbQDRUDLfFVUXF/SbLt1kZrKW1OmhUxPDwiC9X9lQjfHKf4+Fqh5ZOpUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxvUEd0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B08C4CEF7;
	Tue,  4 Nov 2025 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762250250;
	bh=7En2OG3X7ZP2LUb4t379Rh8l5nm4w5x2WVKDBZXU++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxvUEd0/+QrkhLPYuBnQ/9h1tHeLa30JGm9ZsH19YCY3j/D5/jn/L7l/XEY3JVvtF
	 Z+DgQdggz5BBwcqp740WVIHMei09l8oiE1p2QhTiYydS2lQZRT3FsE2X9BqBn94k+H
	 HqaEZD9WbXUKCbpAhnFbe5HtIBPdmja9P9bg/znjqY3OzlVkKIWFi1ki6yLj6VnOe7
	 NwO+6fJYCl/wfdzvsp3Q06QtAOArsSNjyqP9s/WLt30+gFrqgPzJwj57suwQgvFfgq
	 elpcMz/GB9twDSJfYfhzAfdI2s0iXiNO7+xbjIFE+vsJnhVE/9DBs8SAsy1L+w+FE2
	 kmGj+fxz5zC9g==
Date: Tue, 4 Nov 2025 10:57:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <20251104-tricky-stallion-of-tenacity-a8e81b@kuoka>
References: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
 <20251104-isi_imx95-v2-1-c05b7cb104cd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-isi_imx95-v2-1-c05b7cb104cd@nxp.com>

On Tue, Nov 04, 2025 at 11:21:05AM +0800, Guoniu Zhou wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-isi
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 8
> +        ports:
> +          properties:
> +            port@0:
> +              description: Pixel Link Slave 0
> +            port@1:
> +              description: Pixel Link Slave 1
> +            port@2:
> +              description: MIPI CSI-2 RX 0
> +            port@3:
> +              description: MIPI CSI-2 RX 1
> +          required:
> +            - port@2
> +            - port@3
> +    else:

Drop the else and instead add if:then: blocks per each variant where you
correctly constrain the interrupts.

Best regards,
Krzysztof


