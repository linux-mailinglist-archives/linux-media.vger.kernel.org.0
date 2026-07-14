Return-Path: <linux-media+bounces-67530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRJYD0N/VWrlpAAAu9opvQ
	(envelope-from <linux-media+bounces-67530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 02:13:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423074FD42
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 02:13:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Anx6hkBP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67530-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67530-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE4E304DEA2
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 00:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288881DFFB;
	Tue, 14 Jul 2026 00:13:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2DE79CD
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 00:13:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783988028; cv=none; b=p2Dwjzi28+zBXj4Cm/T3KZ80aBngzPgHUztxG30xJA5o4Rl4rRfVhLtZdZ/4L1Is5emsqSE0QGR4fuyPFBOiIuC8M86rKVl9hAGD0K66BiZoHNkRb9qSXRMoHxVlKgzg6AjHD1GCXwi/XvRHr1snY6VmePt1ueN2YBPn9GqTatA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783988028; c=relaxed/simple;
	bh=+GhOfx/YSoDvZeHGmvEqCoLH41UL5X1KDSWW7CveRh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEipQ1B0rlSDgQOnhAT+nDc7y0pt8SQuTAnG8GrdhhNPsR0gHa4JTV5sAN007qS69z+ZpQrZD7pJl2Md82sIxC6Ce721zHFBSaJKrOKuJ8i4mYu6F8mLApJYT4jchqC1C1qWSUKETL1zWiKH2oBSi9891va3F8+mRwoPHFTkAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Anx6hkBP; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92A171049;
	Tue, 14 Jul 2026 02:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783987967;
	bh=+GhOfx/YSoDvZeHGmvEqCoLH41UL5X1KDSWW7CveRh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Anx6hkBPt22ZVxYkpHrUG1YokGulSUfS5yH8vgVO8xa3rJvx118AqEIgzWKjOx9sz
	 MJPiWv9CXxN6YGcXD+pMhW8vjf2zaGHGIkYKsavtHqQq4WiMs9NQndEIqGaK2I9KCb
	 OSkpZTb2TYR/GsMUSSjUf3MhYmqocqAHoJJOjdj8=
Date: Tue, 14 Jul 2026 03:13:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/8] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
Message-ID: <20260714001340.GK1127719@killaraus.ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
 <20260210-b4-vchiq-isp-v2-1-4403944152fe@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210-b4-vchiq-isp-v2-1-4403944152fe@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67530-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[broadcom.com,chromium.org,samsung.com,kernel.org,raspberrypi.com,ideasonboard.com,gmx.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:florian.fainelli@broadcom.com,m:tfiga@chromium.org,m:m.szyprowski@samsung.com,m:mchehab@kernel.org,m:kernel-list@raspberrypi.com,m:kieran.bingham@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:naush@raspberrypi.com,m:wahrenst@gmx.net,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7423074FD42

On Tue, Feb 10, 2026 at 01:51:18PM +0530, Jai Luthra wrote:
> Now that VCHIQ interface is destaged, different drivers (like ISP or
> codec) no longer live under the same tree as VCHIQ MMAL, but in their
> relevant trees like media or audio.
> 
> Enable access to VCHIQ headers for such drivers by moving these headers
> under include/linux/raspberrypi with other VCHIQ related headers.

s/VCHIQ/VCHIQ MMAL/ twice in this paragraph.

> While at it, add the missing videobuf2-v4l2.h include to mmal-common.h
> as it references struct vb2_v4l2_buffer.

mmal-common.h should also include list.h and types.h. I'd move all that
to a separate patch.

> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Explain the addition of videobuf2-v4l2.h in the commit message
> - Add Kieran's R-by
> - No code change
> ---
>  MAINTAINERS                                                      | 1 +
>  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 ++++-----
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-common.h       | 2 ++
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-encodings.h    | 0
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-common.h   | 0
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-format.h   | 0
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-port.h     | 0
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg.h          | 0
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-parameters.h   | 0
>  .../vchiq-mmal => include/linux/raspberrypi}/mmal-vchiq.h        | 0
>  10 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bb9943fe3deba7fd27f745b6fb2e0b10daf34cb..34f779679f1d0eff4cfbdc2533db153fb5f8fe2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4931,6 +4931,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>  F:	drivers/pci/controller/pcie-brcmstb.c
>  F:	drivers/platform/raspberrypi/vchiq-*
>  F:	drivers/staging/vc04_services
> +F:	include/linux/raspberrypi/mmal*
>  F:	include/linux/raspberrypi/vchiq*
>  N:	bcm2711
>  N:	bcm2712
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd87256c38d6ba0dbcd0e 100644
> --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> @@ -22,17 +22,16 @@
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/completion.h>
> +#include <linux/raspberrypi/mmal-common.h>
> +#include <linux/raspberrypi/mmal-parameters.h>
> +#include <linux/raspberrypi/mmal-vchiq.h>
> +#include <linux/raspberrypi/mmal-msg.h>
>  #include <linux/raspberrypi/vchiq.h>
>  #include <linux/raspberrypi/vchiq_arm.h>
>  #include <linux/raspberrypi/vc_sm_knl.h>
>  #include <linux/vmalloc.h>
>  #include <media/videobuf2-vmalloc.h>
>  
> -#include "mmal-common.h"
> -#include "mmal-parameters.h"
> -#include "mmal-vchiq.h"
> -#include "mmal-msg.h"
> -
>  /*
>   * maximum number of components supported.
>   * This matches the maximum permitted by default on the VPU
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/include/linux/raspberrypi/mmal-common.h
> similarity index 97%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> rename to include/linux/raspberrypi/mmal-common.h
> index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8dc2000d2a1e4cec7883c 100644
> --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> +++ b/include/linux/raspberrypi/mmal-common.h
> @@ -16,6 +16,8 @@
>  #ifndef MMAL_COMMON_H
>  #define MMAL_COMMON_H
>  
> +#include <media/videobuf2-v4l2.h>
> +
>  #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
>  #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
>  
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
> rename to include/linux/raspberrypi/mmal-encodings.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h b/include/linux/raspberrypi/mmal-msg-common.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
> rename to include/linux/raspberrypi/mmal-msg-common.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/include/linux/raspberrypi/mmal-msg-format.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
> rename to include/linux/raspberrypi/mmal-msg-format.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h b/include/linux/raspberrypi/mmal-msg-port.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
> rename to include/linux/raspberrypi/mmal-msg-port.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/include/linux/raspberrypi/mmal-msg.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
> rename to include/linux/raspberrypi/mmal-msg.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
> rename to include/linux/raspberrypi/mmal-parameters.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/include/linux/raspberrypi/mmal-vchiq.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
> rename to include/linux/raspberrypi/mmal-vchiq.h

-- 
Regards,

Laurent Pinchart

