Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22313F0936
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 18:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhHRQft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 12:35:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51624 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbhHRQfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 12:35:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17IGZ7Ts091851;
        Wed, 18 Aug 2021 11:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1629304507;
        bh=/jm50KId1immFSMoeS4vydlo9Xu7gBnpdDVtC4QxEek=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=bhgw1DzgvJ3XY6Lk8ry1FP2wjv5TGD2ActOp/rLKzP7VY00Qu0EnAEAh2pnTKrXLd
         c3n3Ezl4qQ0CZ/4SK2fvx8AEE7cUI+GSQfBvr+sPG3jRmqivGNB3aSHwXedLhduvMz
         HUs7sJtEIvfalYJ4T/3vosByUT2P6M6W65kgxFlY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17IGZ7Gm065220
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Aug 2021 11:35:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 18
 Aug 2021 11:35:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 18 Aug 2021 11:35:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17IGZ7YY128276;
        Wed, 18 Aug 2021 11:35:07 -0500
Date:   Wed, 18 Aug 2021 11:35:07 -0500
From:   Nishanth Menon <nm@ti.com>
To:     <sidraya.bj@pathpartnertech.com>
CC:     <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <prashanth.ka@pathpartnertech.com>,
        <praneeth@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <praveen.ap@pathpartnertech.com>
Subject: Re: [PATCH 30/30] ARM64: ti_sdk_arm64_release_defconfig: Enable
 d5520 video decoder driver
Message-ID: <20210818163507.trdnzmq22ubutgvh@calibrate>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-31-sidraya.bj@pathpartnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-31-sidraya.bj@pathpartnertech.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19:40-20210818, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> This patch enables d5520 video decoder driver as module
> on J721e board.
> 
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>  MAINTAINERS                                   |    1 +
>  .../configs/ti_sdk_arm64_release_defconfig    | 7407 +++++++++++++++++
>  2 files changed, 7408 insertions(+)
>  create mode 100644 arch/arm64/configs/ti_sdk_arm64_release_defconfig
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c7b4c860f8a7..db47fcafbcfc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19537,6 +19537,7 @@ M:	Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
> +F:	arch/arm64/configs/tisdk_j7-evm_defconfig


Sigh.. no.

>  F:	drivers/staging/media/vxd/common/addr_alloc.c
>  F:	drivers/staging/media/vxd/common/addr_alloc.h
>  F:	drivers/staging/media/vxd/common/dq.c
> diff --git a/arch/arm64/configs/ti_sdk_arm64_release_defconfig b/arch/arm64/configs/ti_sdk_arm64_release_defconfig
> new file mode 100644
> index 000000000000..a424c76d29da
> --- /dev/null
> +++ b/arch/arm64/configs/ti_sdk_arm64_release_defconfig
> @@ -0,0 +1,7407 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Linux/arm64 5.10.41 Kernel Configuration
> +#

^^ NAK. we DONOT want to see additional configs in arm64 and definitely
not one based on 5.10

> 
> This
> message contains confidential information and is intended only 
> for the
> individual(s) named. If you are not the intended

If you are sending confidential information to a public mailing list,
you might want to start talking to legal folks in your company.

> recipient, you are 
> notified that disclosing, copying, distributing or taking any
> action in 
> reliance on the contents of this mail and attached file/s is strictly
> prohibited. Please notify the
> sender immediately and delete this e-mail 
> from your system. E-mail transmission
> cannot be guaranteed to be secured or 
> error-free as information could be
> intercepted, corrupted, lost, destroyed, 
> arrive late or incomplete, or contain
> viruses. The sender therefore does 
> not accept liability for any errors or
> omissions in the contents of this 
> message, which arise as a result of e-mail
> transmission.

^^ please use a different mail provider.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
