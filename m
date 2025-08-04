Return-Path: <linux-media+bounces-38818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07EB19CB7
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 09:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C78E3B5F0C
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 07:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF17239570;
	Mon,  4 Aug 2025 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HSs84rR8"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1DA238C1A;
	Mon,  4 Aug 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754292761; cv=none; b=bkB9bSOKyXOiXdZ58C9LDveZ3dAUq9VOaZ3vWEJYKrZgpRXGcftv2LSEzf+oOUhjlsURitynE9d4yUucAoDqiXANnD7PgtVj4ty8BtATXN4su1XSHLMTHBjlT/nSHkgs6WZvZadvaLpaL9sgbNM58s4uNiPOQ+9KTPnM6egW0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754292761; c=relaxed/simple;
	bh=Z48qhYx1E9RAm9q3E9ne3Bu8aaMskBPR/XAvIv6fw1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WKf0PgBUxD6QYHddbIBqL4Neb1nkrx4ZVVesiMFKM41X/Dpl20m2FkUboZCEtJnNCSZCRertpSImnpgNdyH4u6fWHzxZzVZSBO97AwsOi0xa/KVlrgF3sQZn5W9RbBAy4kDgMd5Xvkh/Uq2Xvelcxeq9XUL1y7RFD75rO66XtD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HSs84rR8; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5747WBJk050606;
	Mon, 4 Aug 2025 02:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754292731;
	bh=Y/qJDDVSKCntMIE0tAsUW/rOZmoJEuEjnBLZPhU4DHo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HSs84rR8Dg6kkk8MeBR3BGEw2ctVJSXgmci4YvE4WaYwpyduSc0m+zLemImpcmx/5
	 OviowGt6IEi8+zDDUjBhEGTZlBrw5Vt09iQIhd8fG+/P86vllkgVTrTCOcCxFSzSQr
	 spErzBMZLhSKTcWPsemA4RRRIrZsN4l6Jbt4Mdm4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5747WA9u1327133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 4 Aug 2025 02:32:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 02:32:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 02:32:10 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5747W6MG030973;
	Mon, 4 Aug 2025 02:32:07 -0500
Message-ID: <ff1db3ac-4511-4346-b9e6-bd98ad811c0f@ti.com>
Date: Mon, 4 Aug 2025 13:02:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: Support runtime PM and system sleep for
 TI-CSI2RX
To: Jai Luthra <jai.luthra@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 24/02/25 19:05, Jai Luthra wrote:
> This series adds support for runtime power management and system sleep
> for the TI (J721E) CSI2RX pipeline.
>
> Some basic testing with suspend-to-idle mode has been performed to
> ensure that any ongoing stream resumes smoothly after wakeup. More
> testing with suspend-to-memory mode will be done later, as I need to
> update the device management boot firmware, which supports newer APIs
> used by the mainline kernel.
>
> I have picked PATCH 1/3 from Changhuang's earlier series [1] with minor
> modifications.
>
> Link: https://lore.kernel.org/linux-media/20240718032834.53876-1-changhuang.liang@starfivetech.com/ [1]
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>


Hi Jai,

Thank you for the patches. For the entire series,

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>


Test Logs (AM62A): 
https://gist.github.com/Rishikesh-D/303218d56f51c8acdc02282fef40da36


> ---
> Changhuang Liang (1):
>        media: cadence: csi2rx: Support runtime PM
>
> Jai Luthra (2):
>        media: ti: j721e-csi2rx: Support runtime suspend
>        media: ti: j721e-csi2rx: Support system suspend using pm_notifier
>
>   drivers/media/platform/cadence/Kconfig             |   1 +
>   drivers/media/platform/cadence/cdns-csi2rx.c       | 121 +++++++++-----
>   drivers/media/platform/ti/Kconfig                  |   1 +
>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 180 +++++++++++++++++++--
>   4 files changed, 252 insertions(+), 51 deletions(-)
> ---
> base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
> change-id: 20250224-ti_csi_pm-24808b2b445c
>
> Best regards,

