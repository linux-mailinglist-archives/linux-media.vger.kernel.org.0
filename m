Return-Path: <linux-media+bounces-45029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1EBF0C6E
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 13:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F11D84F20AB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 11:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A855246783;
	Mon, 20 Oct 2025 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlwDYxDL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A681F5825;
	Mon, 20 Oct 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958968; cv=none; b=RdiOjGynddaAaB8Mf5PSl1pKTWVz82FkQ4lXgJn6+Li7+p/BNOb66dBowbImXwThNVUO7NMLtId0mt8TzpmTT3TSzlOGUJv+68Bq7NEQZhnaU+9/Pgf43dQcxPIOqPIHxVBv/nodRF1z2QKu9ybpuurLq4TlIs5VqxtVnNc12VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958968; c=relaxed/simple;
	bh=X0eKZdFlSWj/hHX4OYGh6yBB3JhcwwktgIYdMBCdF7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCWPb18Vq5DUq7C5+Zzy9K7yeCEUObSZKz/p7nC92UPBxpmanrPo5pX7878JTluOxOmPL88w+O4g3UiHihuGMrE42kMvFsdCiYRiiLQYa0qBOrR2lLQQyC86swdVUOTDi00LsxwWevB+CDWFtgcZetee7Qaezp7WU7ALF84lvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlwDYxDL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDDEC4CEF9;
	Mon, 20 Oct 2025 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760958967;
	bh=X0eKZdFlSWj/hHX4OYGh6yBB3JhcwwktgIYdMBCdF7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlwDYxDLexHxuJDjsT8XRWxCtS0pSUGKNFz94TlQjAMaDGnqwlhisoJn3hON91lQO
	 A1Vli/NxJi66rFDpFrj38VobB1qI8W6KaEJAFuh8Mxg7Sif4UqfIPGvbh4Stb3viEA
	 gYVQr5zvgexIP0l9QqyInkJDC1sU3V8OHDwZhD6y5a2cpX59zJCi10pby8bJK5W5Zq
	 lvAdkiE83Ajrg/CgkpS5X6M0aIqJ/Rsegbz1rBnev/nJXTbPU1gfsfISaJhY4a1a1o
	 6PJO39w3sVjgOdqXMh+BDq2Z5jLgr47YchSGybYwQbk7HV7s0KH/gaKauob9fxJtRB
	 q3EL/1llhA2MQ==
Date: Mon, 20 Oct 2025 13:16:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] media: dt-bindings: video-interfaces: add
 video-interfaces.h information
Message-ID: <20251020-majestic-warm-barracuda-06acb3@kuoka>
References: <20251014170043.2341146-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251014170043.2341146-1-Frank.Li@nxp.com>

On Tue, Oct 14, 2025 at 01:00:43PM -0400, Frank Li wrote:
> Add dt-bindings/media/video-interfaces.h informations to help avoid use

"Mention dt-bindings/media/video-interfaces.h in descriptions to help..."

> hardcode in dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 038e85b45befa..f96cc0e403ddd 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -95,7 +95,7 @@ properties:
>        - 6 # BT.656
>        - 7 # DPI
>      description:
> -      Data bus type.
> +      Data bus type. See dt-bindings/media/video-interfaces.h.

Please use full path, so it can be validated by tools.

Best regards,
Krzysztof


