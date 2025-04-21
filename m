Return-Path: <linux-media+bounces-30645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1408A956F4
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E951894BEB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 19:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3AA1EFF8E;
	Mon, 21 Apr 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dfuVmKhk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA701E8356
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265363; cv=none; b=P7NVFo7A2ekGhoWIMBJcf+baV7D34Rk+u7RmizeG8RhbED7m45X7uj3hhrLgko2PWudi5SZxOWtWk5hM2Zaq+4PE30qSvsO3WgU86UrgnUFp9Brii+ki063/quAn1bdLc/uhi02XRoJV+J2pAaAa+ghyzpGuC71tpej2zC0laaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265363; c=relaxed/simple;
	bh=b7iTotJekDnqTLA7gIKOcaDIP3WN6S6y5yR5QSUVNr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLIG7KAC3VPm0zvcea2heaaSpvilqqCJl1zrRi7lahUFg2Wh3klDs2ZCxKv56GX7i0yN0QETMhW2yp8LXURihn5LiLS9utBPk9S4rhPgLR3dwOy+pzIhcbVPlWmjo2vZPyloK6M7wRf+SC4NJTptQHGKf9YcPUb4+XPdzZAsll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dfuVmKhk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40AE96D5;
	Mon, 21 Apr 2025 21:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745265233;
	bh=b7iTotJekDnqTLA7gIKOcaDIP3WN6S6y5yR5QSUVNr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfuVmKhk2r9uBfJ6O+80b0EE9jehdmPzWTniSWMpWd9qpbL/Fswf2iRP2dQ2j+5g8
	 aXc4ZVz+AEAmyntDY7vh4bMW9HKdnqLe33lRBZ8oopqH0J2YtF+N5RiZ1lNJXuT/8l
	 0l3xUtTjul8LyhWUcE+4VwT4RHUY0Tp7d88TEluw=
Date: Mon, 21 Apr 2025 22:55:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linuxtv-commits@linuxtv.org
Subject: Re: [GIT,PULL,FOR,v6.16] Improvements and fixes to Renesas media
 drivers
Message-ID: <20250421195558.GC17813@pendragon.ideasonboard.com>
References: <20250421183002.GA6463@pendragon.ideasonboard.com>
 <68069ea5.050a0220.396ced.2058@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68069ea5.050a0220.396ced.2058@mx.google.com>

On Mon, Apr 21, 2025 at 12:38:13PM -0700, Patchwork Integration wrote:
> Dear Laurent Pinchart:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0014-media-rzg2l-cru-Add-register-mapping-support.patch checkpatch
> 
> #58: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:335:
> +[AMnMB5ADDRH] = 0x124,
> 
> CHECK: Avoid CamelCase: <AMnMB6ADDRL>
> #59: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:336:
> +[AMnMB6ADDRL] = 0x128,
> 
> CHECK: Avoid CamelCase: <AMnMB6ADDRH>
> #60: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:337:
> +[AMnMB6ADDRH] = 0x12c,
> 
> CHECK: Avoid CamelCase: <AMnMB7ADDRL>
> #61: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:338:
> +[AMnMB7ADDRL] = 0x130,
> 
> CHECK: Avoid CamelCase: <AMnMB7ADDRH>
> #62: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:339:
> +[AMnMB7ADDRH] = 0x134,
> 
> CHECK: Avoid CamelCase: <AMnMB8ADDRL>
> #63: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:340:
> +[AMnMB8ADDRL] = 0x138,
> 
> CHECK: Avoid CamelCase: <AMnMB8ADDRH>
> #64: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:341:
> +[AMnMB8ADDRH] = 0x13c,
> 
> CHECK: Avoid CamelCase: <AMnMBVALID>
> #65: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:342:
> +[AMnMBVALID] = 0x148,
> 
> CHECK: Avoid CamelCase: <AMnMBS>
> #66: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:343:
> +[AMnMBS] = 0x14c,
> 
> CHECK: Avoid CamelCase: <AMnAXIATTR>
> #67: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:344:
> +[AMnAXIATTR] = 0x158,
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR>
> #68: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:345:
> +[AMnFIFOPNTR] = 0x168,
> 
> CHECK: Avoid CamelCase: <AMnAXISTP>
> #69: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:346:
> +[AMnAXISTP] = 0x174,
> 
> CHECK: Avoid CamelCase: <AMnAXISTPACK>
> #70: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:347:
> +[AMnAXISTPACK] = 0x178,
> 
> CHECK: Avoid CamelCase: <ICnEN>
> #71: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:348:
> +[ICnEN] = 0x200,
> 
> CHECK: Avoid CamelCase: <ICnMC>
> #72: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:349:
> +[ICnMC] = 0x208,
> 
> CHECK: Avoid CamelCase: <ICnMS>
> #73: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:350:
> +[ICnMS] = 0x254,
> 
> CHECK: Avoid CamelCase: <ICnDMR>
> #74: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:351:
> +[ICnDMR] = 0x26c,
> 
> CHECK: Avoid CamelCase: <AMnMBxADDRL>
> #116: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:22:
> +#define AMnMBxADDRL(x)(AMnMB1ADDRL + (x) * 2)
> 
> CHECK: Avoid CamelCase: <AMnMBxADDRH>
> #120: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:25:
> +#define AMnMBxADDRH(x)(AMnMB1ADDRH + (x) * 2)
> 
> CHECK: Macro argument reuse 'cru' - possible side-effects?
> #279: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:95:
> +#define rzg2l_cru_write(cru, offset, value) \
> +(__builtin_constant_p(offset) ? \
> + __rzg2l_cru_write_constant(cru, offset, value) : \
> + __rzg2l_cru_write(cru, offset, value))
> 
> CHECK: Macro argument reuse 'offset' - possible side-effects?
> #279: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:95:
> +#define rzg2l_cru_write(cru, offset, value) \
> +(__builtin_constant_p(offset) ? \
> + __rzg2l_cru_write_constant(cru, offset, value) : \
> + __rzg2l_cru_write(cru, offset, value))
> 
> CHECK: Macro argument reuse 'value' - possible side-effects?
> #279: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:95:
> +#define rzg2l_cru_write(cru, offset, value) \
> +(__builtin_constant_p(offset) ? \
> + __rzg2l_cru_write_constant(cru, offset, value) : \
> + __rzg2l_cru_write(cru, offset, value))
> 
> CHECK: Macro argument reuse 'cru' - possible side-effects?
> #284: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:100:
> +#define rzg2l_cru_read(cru, offset) \
> +(__builtin_constant_p(offset) ? \
> + __rzg2l_cru_read_constant(cru, offset) : \
> + __rzg2l_cru_read(cru, offset))
> 
> CHECK: Macro argument reuse 'offset' - possible side-effects?
> #284: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:100:
> +#define rzg2l_cru_read(cru, offset) \
> +(__builtin_constant_p(offset) ? \
> + __rzg2l_cru_read_constant(cru, offset) : \
> + __rzg2l_cru_read(cru, offset))
> 
> total: 0 errors, 0 warnings, 37 checks, 243 lines checked
> 
> # Test checkpatch:./0016-media-rzg2l-cru-Add-image_conv-offset-to-OF-data.patch checkpatch
> CHECK: Avoid CamelCase: <ICnMC>
> #33: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:357:
> +.image_conv = ICnMC,
> 
> CHECK: Avoid CamelCase: <ICnMC_INF_MASK>
> #61: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:252:
> +icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
> 
> CHECK: Avoid CamelCase: <ICnMC_CSCTHR>
> #85: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:282:
> +rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
> 
> total: 0 errors, 0 warnings, 3 checks, 53 lines checked
> 
> # Test checkpatch:./0017-media-rzg2l-cru-Add-IRQ-handler-to-OF-data.patch checkpatch
> CHECK: Avoid CamelCase: <CRUnIE>
> #105: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:397:
> +rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> 
> CHECK: Avoid CamelCase: <CRUnIE_EFE>
> #105: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:397:
> +rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> 
> CHECK: Avoid CamelCase: <CRUnINTS>
> #111: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:403:
> +rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
> 
> total: 0 errors, 0 warnings, 3 checks, 84 lines checked
> 
> # Test checkpatch:./0018-media-rzg2l-cru-Add-function-pointer-to-check-if-FIF.patch checkpatch
> CHECK: Avoid CamelCase: <AMnFIFOPNTR>
> #69: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:297:
> +amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFOWPNTR>
> #71: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:299:
> +amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFORPNTR_Y>
> #73: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:301:
> +(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> 
> total: 0 errors, 0 warnings, 3 checks, 57 lines checked
> 
> # Test checkpatch:./0020-media-rzg2l-cru-Add-support-for-RZ-G3E-SoC.patch checkpatch
> 
> #75: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:349:
> +[AMnAXISTP] = 0x110,
> 
> CHECK: Avoid CamelCase: <AMnAXISTPACK>
> #76: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:350:
> +[AMnAXISTPACK] = 0x114,
> 
> CHECK: Avoid CamelCase: <AMnIS>
> #77: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:351:
> +[AMnIS] = 0x128,
> 
> CHECK: Avoid CamelCase: <ICnEN>
> #78: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:352:
> +[ICnEN] = 0x1f0,
> 
> CHECK: Avoid CamelCase: <ICnSVCNUM>
> #79: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:353:
> +[ICnSVCNUM] = 0x1f8,
> 
> CHECK: Avoid CamelCase: <ICnSVC>
> #80: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:354:
> +[ICnSVC] = 0x1fc,
> 
> CHECK: Avoid CamelCase: <ICnIPMC_C0>
> #81: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:355:
> +[ICnIPMC_C0] = 0x200,
> 
> CHECK: Avoid CamelCase: <ICnMS>
> #82: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:356:
> +[ICnMS] = 0x2d8,
> 
> CHECK: Avoid CamelCase: <ICnDMR>
> #83: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c:357:
> +[ICnDMR] = 0x304,
> 
> CHECK: Avoid CamelCase: <CRUnIE2_FSxE>
> #121: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:17:
> +#define CRUnIE2_FSxE(x)BIT(((x) * 3))
> 
> CHECK: Avoid CamelCase: <CRUnIE2_FExE>
> #122: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:18:
> +#define CRUnIE2_FExE(x)BIT(((x) * 3) + 1)
> 
> CHECK: Avoid CamelCase: <CRUnINTS2_FSxS>
> #126: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:22:
> +#define CRUnINTS2_FSxS(x)BIT(((x) * 3))
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFOWPNTR_B0>
> #135: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:40:
> +#define AMnFIFOPNTR_FIFOWPNTR_B0AMnFIFOPNTR_FIFOWPNTR
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFOWPNTR>
> #135: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:40:
> +#define AMnFIFOPNTR_FIFOWPNTR_B0AMnFIFOPNTR_FIFOWPNTR
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFOWPNTR_B1>
> #136: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:41:
> +#define AMnFIFOPNTR_FIFOWPNTR_B1GENMASK(15, 8)
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFORPNTR_B0>
> #138: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:43:
> +#define AMnFIFOPNTR_FIFORPNTR_B0AMnFIFOPNTR_FIFORPNTR_Y
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFORPNTR_Y>
> #138: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:43:
> +#define AMnFIFOPNTR_FIFORPNTR_B0AMnFIFOPNTR_FIFORPNTR_Y
> 
> CHECK: Avoid CamelCase: <AMnFIFOPNTR_FIFORPNTR_B1>
> #139: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:44:
> +#define AMnFIFOPNTR_FIFORPNTR_B1GENMASK(31, 24)
> 
> CHECK: Avoid CamelCase: <AMnIS_IS_MASK>
> #141: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:46:
> +#define AMnIS_IS_MASKGENMASK(14, 7)
> 
> CHECK: Avoid CamelCase: <AMnIS_IS>
> #142: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:47:
> +#define AMnIS_IS(x)((x) << 7)
> 
> CHECK: Avoid CamelCase: <ICnSVC_SVC0>
> #150: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:55:
> +#define ICnSVC_SVC0(x)(x)
> 
> CHECK: Avoid CamelCase: <ICnSVC_SVC1>
> #151: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:56:
> +#define ICnSVC_SVC1(x)((x) << 4)
> 
> CHECK: Avoid CamelCase: <ICnSVC_SVC2>
> #152: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:57:
> +#define ICnSVC_SVC2(x)((x) << 8)
> 
> CHECK: Avoid CamelCase: <ICnSVC_SVC3>
> #153: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h:58:
> +#define ICnSVC_SVC3(x)((x) << 12)
> 
> CHECK: Avoid CamelCase: <ICnMC_INF>
> #298: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:265:
> +u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> 
> CHECK: Avoid CamelCase: <ICnMC_INF_MASK>
> #300: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:267:
> +icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
> 
> CHECK: Avoid CamelCase: <ICnMC_VCSEL>
> #303: FILE: drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:270:
> +icnmc |= ICnMC_VCSEL(csi_vc);
> 
> total: 0 errors, 0 warnings, 54 checks, 408 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.

Can we fix this automated e-mail to indicate that only errors and
warnigns need to be fixed ? I've ignored all the above checks for a
reason.

> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/75048292/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

-- 
Regards,

Laurent Pinchart

