Return-Path: <linux-media+bounces-45576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7BC0B096
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 19:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92545344825
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 18:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35A82FD1D4;
	Sun, 26 Oct 2025 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KAEKu/pz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39F3248F69;
	Sun, 26 Oct 2025 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761504593; cv=none; b=hYT5YRWOBqONQunFd0TNh+Ag+BOwQJ3uMgvEd0yqc3QdJJiRgUAs1UMcXQT2wWwNsPzXPLOBmoLPL8KZV6LWXvWU7Ebytr52lnyhOfWZsZjLAqm1z6pFPAsuTmGjJQM2KHxFgYYvde0RcLHih+sfPGOw5hf7Ak8RjBmSm4dNZls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761504593; c=relaxed/simple;
	bh=SBAlHQr01XhpEUC4KPUxRR+yFK/fqz9GLMF8BAiidW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix7WyKRr1hEWtIbdEGO7pMhBMfHYbhEsg8O0W7lczPjlTt0qv06vzeibqRaFrMsim3O/v+7/bP22tY5eFI2LD54ThaZNHYI1qOgyP1YT4paHGZ/OD8QGZuHGALUzgdVwgXVNVt+FpDjjRm+7m7hTLM4j+jPq6xekrFCelE7Xtl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KAEKu/pz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F9C51BA0;
	Sun, 26 Oct 2025 19:48:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761504480;
	bh=SBAlHQr01XhpEUC4KPUxRR+yFK/fqz9GLMF8BAiidW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAEKu/pzrR2WdA3jwWhEjVL5n1ck+bdI13daW2T+hf2IXSz4lp7mK6bjk87D95lTY
	 ojJ51hPyK2y5agMIOYGPVh3hZZYDdsKJZXbwSbvFUSECqEWIJpbHKYKhM8SQHlzmEP
	 mTa3Ie507Yen15YtA1S2ELcEXk7ASSQn0EhXFrZM=
Date: Sun, 26 Oct 2025 20:49:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] media: dt-bindings: video-interfaces: add
 video-interfaces.h information
Message-ID: <20251026184933.GB1025@pendragon.ideasonboard.com>
References: <20251021154922.2874390-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021154922.2874390-1-Frank.Li@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Oct 21, 2025 at 11:49:22AM -0400, Frank Li wrote:
> Mention include/dt-bindings/media/video-interfaces.h in descriptions to
> help avoid use hardcode in dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - update commit message "mention ..."
> - use full path include/dt-bindings/media/video-interfaces.h
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 038e85b45befa..6ed4695cacf7e 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -95,7 +95,7 @@ properties:
>        - 6 # BT.656
>        - 7 # DPI

I wondered if we should reference the macros here as well:

    enum:
      - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
      - 2 # MEDIA_BUS_TYPE_CSI1
      - 3 # MEDIA_BUS_TYPE_CCP2
      - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
      - 5 # MEDIA_BUS_TYPE_PARALLEL
      - 6 # MEDIA_BUS_TYPE_BT656
      - 7 # DPI

(Annoyingly we don't have a macro for DPI.)

This can be done separately if desired, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>      description:
> -      Data bus type.
> +      Data bus type. See include/dt-bindings/media/video-interfaces.h.
>  
>    bus-width:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -229,7 +229,7 @@ properties:
>        Imaging. The length of the array must be the same length as the
>        data-lanes property. If the line-orders property is omitted, the value
>        shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
> -      busses only.
> +      busses only. See include/dt-bindings/media/video-interfaces.h.
>  
>    strobe:
>      $ref: /schemas/types.yaml#/definitions/uint32

-- 
Regards,

Laurent Pinchart

