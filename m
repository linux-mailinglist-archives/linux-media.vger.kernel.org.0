Return-Path: <linux-media+bounces-40221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE0B2B8FA
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A1C5816A9
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 05:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE25C257832;
	Tue, 19 Aug 2025 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AHpiOaPo"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702B1FECD4;
	Tue, 19 Aug 2025 05:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582874; cv=none; b=TU76UQJ+ffpV75bJVPjyE3d2P96tPEHe0VubomAhTnM7Q0Dg3f2gXrMSR2K4QCcawFzx5dhciA/Lt2id1hxVmTvbuqgeyS8w+x//FDrvVtBYNG0Gtw0bWL1lKyq8+RU8TtsGzsrDga+ZlsL/A3djkx6GZ8a4F9+Sl9feypSGb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582874; c=relaxed/simple;
	bh=3P8uD5CNg/kUDpT4YXMlVJMBIcVMKgQRMzpleXZ0cks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uvkO0VvgsF2h6SdfBYAg8y4gaiyh+HXFI7+6oc4bBTUCReTxFQsYVk1nrsROM/ePBE3X+6C1J7aI5wVu++I/S6aSVwj6alA7Kd1hZhJzalk6DX38t0bqKQl53CpL8lfUkoqSqOEJvyKFWEhuDYzVF7FLxd+T65B4C6GoLOmfNXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AHpiOaPo; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J5rK8s2883382;
	Tue, 19 Aug 2025 00:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755582800;
	bh=sTeiwFyBkdK6n6VB0SEmiukgw5hVXV2XEVJwlEkyGz0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AHpiOaPosSSV1LgvmY6r4AIuPoFppFdVEmb3eQ5q6xG+lojpRdrpdAVtov9ZWbw+T
	 ZIqdYKYHksH8+GbHXerzPAeT/198tdUd3YCHqcttZ/GTvJKsbPxvY1I/nlD7M6t1c7
	 SeDJxrGg99TofV1/zCNcia0xXHVUzzN/9mrDR4I4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J5rKHd824561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 00:53:20 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 00:53:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 00:53:19 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J5rFav2511790;
	Tue, 19 Aug 2025 00:53:16 -0500
Message-ID: <9f700025-8a73-4e9f-acf5-6b5edf56d06d@ti.com>
Date: Tue, 19 Aug 2025 11:23:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: ti, cdns: Multiple pixel support and misc
 fixes
To: Jai Luthra <jai.luthra@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: Devarsh Thakkar <devarsht@ti.com>,
        Yemike Abhilash Chandra
	<y-abhilashchandra@ti.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>
References: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 11/08/25 13:50, Jai Luthra wrote:
> Hi,


Hi Jai,
Thank you for the patches !


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


Test Logs (SK-AM62A + IMX219) :

https://gist.github.com/Rishikesh-D/cb1d06cf341c2327da0d38a6b21688d6


Regards,

Rishikesh

> ---
> Changes in v4:
> - Rebase on top of v6.17-rc1
> - Add missing include for linux/export.h in cdns-csi2rx.c
> - Link to v3: https://lore.kernel.org/r/20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com
>
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
>   drivers/media/platform/cadence/cdns-csi2rx.c       | 75 ++++++++++++++++------
>   drivers/media/platform/ti/Kconfig                  |  3 +-
>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 65 ++++++++++++++-----
>   include/media/cadence/cdns-csi2rx.h                | 19 ++++++
>   5 files changed, 128 insertions(+), 35 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250314-probe_fixes-7e0ec33c7fee
>
> Best regards,

