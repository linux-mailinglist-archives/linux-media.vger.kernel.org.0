Return-Path: <linux-media+bounces-34702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49088AD82E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7A81670E2
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 06:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6577F256C81;
	Fri, 13 Jun 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KQ6FULog"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E61183CA6;
	Fri, 13 Jun 2025 06:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794561; cv=none; b=Zd574o0WENhJK1WnCoZgAVKoJ/Xs9SSClYjyATgQ9Q7BI7qx0UYZd30TPGgfTA1IOIqNNbmUN+GvbRm44RZSclb4AYLEis6896yQ/Y96iKwmZs7qDuM0GixchD2nwKISsZmn/ZMrdd5Ot53vmySYkbGIZS2LLLZnwL7A6jMjqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794561; c=relaxed/simple;
	bh=wSh2OKSV2CA+7iXWOs9/JXA+nC2k2MOKfyH6PG71jwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=owYHSDpEKPjmhVmSKSxlYwY1PV+3YDBaP98UbQV7Xa76/EymYQBA/+q2EP5qBMoNZITTDEx4HGh3hOltGzcGXvGzL/rCQcedqoAt9V+g2KZQZiN6bfX8YZ6Cjydm7FKdRhvw9WWUHWrJRZQgo5SQ492zZzwpmyiYzigwQnjmk6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KQ6FULog; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55D62I613055176;
	Fri, 13 Jun 2025 01:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749794538;
	bh=6+5lF4XbIHB36glldEYa0buQM6Y0o3f7nE1tTSBNNYY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KQ6FULogi98z1wXgXQbwsrOSMtLDlQ86S0j8xLpLy+y4N7zvfgekwVxOdsK2KM3XB
	 EUxznGb65wm8ObGF94TBzgZ+vi+9qFF0QZ809ILCrrMzQwsaUSx5bRVf3guAR+e1dq
	 meyRRYPD4kZpC0NIuwDXFx/3GV8DCKo3xssyKv7c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55D62HJW011196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 01:02:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 01:02:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 01:02:17 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55D62DBB3120662;
	Fri, 13 Jun 2025 01:02:13 -0500
Message-ID: <6dafe9e8-7c94-4b53-80fb-c6807c6cefd2@ti.com>
Date: Fri, 13 Jun 2025 11:32:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: ti, cdns: Multiple pixel support and misc
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
CC: Devarsh Thakkar <devarsht@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,
Thanks for the patch series.

On 10/04/25 12:18, Jai Luthra wrote:
> Hi,
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
> ---

For the entire series,

Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> [on AM68SK]

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
>   drivers/media/platform/cadence/cdns-csi2rx.c       | 76 +++++++++++++++++-----
>   drivers/media/platform/cadence/cdns-csi2rx.h       | 19 ++++++
>   drivers/media/platform/ti/Kconfig                  |  3 +-
>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 66 ++++++++++++++-----
>   4 files changed, 129 insertions(+), 35 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250314-probe_fixes-7e0ec33c7fee
> 
> Best regards,

