Return-Path: <linux-media+bounces-39508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94337B21E29
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBADB4282F3
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770902D640A;
	Tue, 12 Aug 2025 06:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K/Tx0bDf"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EED20C004;
	Tue, 12 Aug 2025 06:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754979582; cv=none; b=I6L5Arw2d8+mJNcbfMIX6c1JDGo83JgonD5nbNH2tL6Or8diQ3l3+D1FAWph+Eylw2oWpFdSGuMYICM2oRbYeD/73v+jpaHyry2+bD+TW2AnpHJORJYxk3FL1FOga7qDGc1JcyhqWHpSB6nZORNxNsWItqcsaEqAnHfncU8o1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754979582; c=relaxed/simple;
	bh=1y6AIQivrcS3lNqgKQD1Jz1j8SsCB0Y9EKiOlf2YRUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Oebb7m3tqkEY8JGmQwsr0w1QnvM9Nz7P4kvpqE5slZ5Um+qYyodbGwclfSTTHSrMOnw4JCT1JLuUERXjl3Bk6xKud8kggtfaYQvVSRoRR8V6h2F+M98UPluTfWOMPyKpezcnrJNp2fXpVK4dhdkwe8S0LovhTVnHyGZxO8NCKtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K/Tx0bDf; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57C6JSAF1748235;
	Tue, 12 Aug 2025 01:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754979568;
	bh=7Up/GO1ex2gLdQgvAYE87VGy19CzR8Yleera9Scsf3k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=K/Tx0bDfctQ8WbJs88ob/ZNBUro+ip9hsAfBxqPS1EnagRo5nJfaziENK5RJ6jkam
	 xTm3koH66a+/CYtab7kiF8R7G53LADgNkgTBXweLkijHOXaPjspCeX2kPQh0asclwt
	 9FicgceKYGnU9OOwAwhcWX1HwXuPdyhFjSG4Gm44=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57C6JSjm094265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 12 Aug 2025 01:19:28 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 12
 Aug 2025 01:19:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 12 Aug 2025 01:19:27 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57C6JNkP4090592;
	Tue, 12 Aug 2025 01:19:24 -0500
Message-ID: <903bbeac-2717-44b0-888b-5a63937fb97c@ti.com>
Date: Tue, 12 Aug 2025 11:49:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: ti, cdns: Multiple pixel support and misc
 fixes
To: Jai Luthra <jai.luthra@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
CC: Devarsh Thakkar <devarsht@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
References: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 27/06/25 06:36, Jai Luthra wrote:
> Hi,

Hi Jai,

Thank you for the patches


>
> The first four patches in this series are miscellaneous fixes and
> improvements in the Cadence and TI CSI-RX drivers around probing, fwnode
> and link creation.
>
> The last two patches add support for transmitting multiple pixels per
> clock on the internal bus between Cadence CSI-RX bridge and TI CSI-RX
> wrapper. As this internal bus is 32-bit wide, the maximum number of
> pixels that can be transmitted per cycle depend upon the format's bit
> width. Secondly, the downstream element must support unpacking of
> multiple pixels.
>
> Thus we export a module function that can be used by the downstream
> driver to negotiate the pixels per cycle on the output pixel stream of
> the Cadence bridge.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>


For the entire series,

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>

Test Logs (AM62A + imx219): 
https://gist.github.com/Rishikesh-D/63f9b203a84087d1207ae7c98fa1fb40

> ---
> Changes in v3:
> - Move cdns-csi2rx header to include/media
> - Export symbol from cdns-csi2rx.c to be used only through
>    the j721e-csi2rx.c module namespace
> - Other minor fixes suggested by Sakari
> - Add Abhilash's T-by tags
> - Link to v2: https://lore.kernel.org/r/20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com
>
> Changes in v2:
> - Rebase on v6.15-rc1
> - Fix lkp warnings in PATCH 5/6 missing header for FIELD_PREP
> - Add R-By tags from Devarsh and Changhuang
> - Link to v1: https://lore.kernel.org/r/20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com
>
> ---
> Jai Luthra (6):
>        media: ti: j721e-csi2rx: Use devm_of_platform_populate
>        media: ti: j721e-csi2rx: Use fwnode_get_named_child_node
>        media: ti: j721e-csi2rx: Fix source subdev link creation
>        media: cadence: csi2rx: Implement get_fwnode_pad op
>        media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
>        media: ti: j721e-csi2rx: Support multiple pixels per clock
>
>   MAINTAINERS                                        |  1 +
>   drivers/media/platform/cadence/cdns-csi2rx.c       | 74 ++++++++++++++++------
>   drivers/media/platform/ti/Kconfig                  |  3 +-
>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 65 ++++++++++++++-----
>   include/media/cadence/cdns-csi2rx.h                | 19 ++++++
>   5 files changed, 127 insertions(+), 35 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250314-probe_fixes-7e0ec33c7fee
>
> Best regards,

