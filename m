Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3CF3F06A0
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238531AbhHRO0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:26:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51626 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbhHRO0c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:26:32 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17IEPm8b040529;
        Wed, 18 Aug 2021 09:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1629296748;
        bh=8N1EpZZqBz/COqdF/VtwF0s5dhZjZS1YH9WJZTrwiys=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=J0IjhelrNAFLlWEErMS54G4vyyBY5qy0qKWcQgIsQRCrdIlB/8kZfpE9WUD+AOuMA
         O8oahCUVdty8BD3+SqkadOO9flHW5Cu0SLWTz+zbSZ8RMusvS4gv+qDfJbd1i3+OtI
         s92ueX3t45C9GTZE7rdbMbbvwN3dH9TYEaON9XoU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17IEPmWs015964
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Aug 2021 09:25:48 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 18
 Aug 2021 09:25:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 18 Aug 2021 09:25:48 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17IEPmHB029124;
        Wed, 18 Aug 2021 09:25:48 -0500
Subject: Re: [PATCH 30/30] ARM64: ti_sdk_arm64_release_defconfig: Enable d5520
 video decoder driver
To:     <sidraya.bj@pathpartnertech.com>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC:     <prashanth.ka@pathpartnertech.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <praveen.ap@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-31-sidraya.bj@pathpartnertech.com>
From:   "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <064e296f-878a-c16f-3734-c124db392886@ti.com>
Date:   Wed, 18 Aug 2021 09:25:48 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818141037.19990-31-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/18/2021 9:10 AM, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya<sidraya.bj@pathpartnertech.com>
> 
> This patch enables d5520 video decoder driver as module
> on J721e board.

Nack

> 
> Signed-off-by: Sidraya<sidraya.bj@pathpartnertech.com>
> ---
>   MAINTAINERS                                   |    1 +
>   .../configs/ti_sdk_arm64_release_defconfig    | 7407 +++++++++++++++++

This defconfig doesnt belong in mainline.

>   2 files changed, 7408 insertions(+)
>   create mode 100644 arch/arm64/configs/ti_sdk_arm64_release_defconfig
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c7b4c860f8a7..db47fcafbcfc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19537,6 +19537,7 @@ M:	Sidraya Jayagond<sidraya.bj@pathpartnertech.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
> +F:	arch/arm64/configs/tisdk_j7-evm_defconfig

This is wrong.

>   F:	drivers/staging/media/vxd/common/addr_alloc.c
>   F:	drivers/staging/media/vxd/common/addr_alloc.h
>   F:	drivers/staging/media/vxd/common/dq.c
> diff --git a/arch/arm64/configs/ti_sdk_arm64_release_defconfig b/arch/arm64/configs/ti_sdk_arm64_release_defconfig
> new file mode 100644
