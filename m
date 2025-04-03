Return-Path: <linux-media+bounces-29353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF7A7AFE0
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 23:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10DEE1881FB7
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 20:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406A2267B90;
	Thu,  3 Apr 2025 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MUnYnC4/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A025290E;
	Thu,  3 Apr 2025 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710002; cv=none; b=TX3gGEemgpssAfLzo2xbc7vVJUkekilbxD5jLkos9d4dO+SYD1pFziXQ/l/cMaoVK5GbloP0uTOUYeLirTQra9Im6Umn1atppiOulz03DCFXETTIiXcc24x8wobmovDcRNGKrIux/3KLNjS8Qi2IRfoLm6vZhu3MB4vtTjQnj40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710002; c=relaxed/simple;
	bh=SUI00eySafeyd6YAdaNfDWXQziyjQoigDH+2+g1acA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVAoipemilos2N52gIhnyUav0VdugyU9l15Zs2RciNGxicJeAv1kRfUCvim/yrQMvK2+KPDHlGxS69XJ6ga4ixRO+epgVVkisB34H+h43l6gN9NkQxsLGVR5ytBdZgOvvkQSBQHHUMPgG5QvGQjHvPruzVApFfVNMmPyU2cOv5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MUnYnC4/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCC9A6D5;
	Thu,  3 Apr 2025 21:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743709879;
	bh=SUI00eySafeyd6YAdaNfDWXQziyjQoigDH+2+g1acA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUnYnC4/T7y59yd7JqupnWgY/lfEQmBWcuoJjXqyH85TohAEaGA0FFOCxpzLCFQpk
	 SUOFxXNM2imOOXTaKxEH9wLHmZJdm2wrMN2qnQvFEd1ns/MILZNCF+73MOD57uF4Y8
	 dQD16bRmfllhOplVvgbCcI+wmXdpO4acq/abUVpE=
Date: Thu, 3 Apr 2025 22:52:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "bo.kong" <bo.kong@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, zhaoyuan.chen@mediatek.com,
	Teddy.Chen@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 0/4] Add AIE driver support for mt8188
Message-ID: <20250403195247.GA12280@pendragon.ideasonboard.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>

Hi Bo,

Thank you for the patches.

On Thu, Apr 03, 2025 at 03:38:32PM +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> AIE(AI Engine) is one of the units in mt8188 ISP which provides hardware accelerated face detection function, it can detect different sizes of faces in a raw image.

This series is missing:

- The v4l2-compliance report
- Documentation of the UAPI
- A pointer to an open-source userspace implementation using the device,
  in a project relevant to the field of use

> Bo Kong (4):
>   media: dt-bindings: add MT8188 AIE
>   arm64: dts: mt8188: add aie node
>   uapi: linux: add MT8188 AIE
>   media: mediatek: add MT8188 AIE driver
> 
>  .../bindings/media/mediatek,mt8188-aie.yaml   |   78 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/aie/Kconfig   |   12 +
>  drivers/media/platform/mediatek/aie/Makefile  |    5 +
>  drivers/media/platform/mediatek/aie/mtk_aie.h |  870 ++++++
>  .../media/platform/mediatek/aie/mtk_aie_drv.c | 2398 +++++++++++++++++
>  .../platform/mediatek/aie/mtk_aie_v4l2.c      | 1295 +++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    3 +
>  include/uapi/linux/mtk_aie_v4l2_controls.h    |  308 +++
>  include/uapi/linux/videodev2.h                |    6 +
>  12 files changed, 5010 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
>  create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
>  create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
Regards,

Laurent Pinchart

