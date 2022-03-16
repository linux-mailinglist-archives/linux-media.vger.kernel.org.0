Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7214DB4C0
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 16:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243514AbiCPPVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 11:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351322AbiCPPVv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 11:21:51 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A6B6C914;
        Wed, 16 Mar 2022 08:20:32 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22GEWVr4001902;
        Wed, 16 Mar 2022 16:15:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/A6EE8PbW2E0bKbBdQxnm2bQUqo4dYjEYeCBuPrqADk=;
 b=uyZ3bgifCSRqfFXoF+ynZHxjeqv9yP5gcVojMM3fN4fSMGuwltl1+/b6sBZ6iRXpg07C
 fmls2x0nRa6EAaHUMwRq6t1FbaP4eNiIAnqywBVpy+qHKiwew9WPQOxGbFnU9ugc91qs
 pMu9KXg+Y3A82vWcF2L9oqyyRDKFnFcGzIydEkLJlrYAWpFMjSawtOybd5e/zyZK90Jl
 STOAQIfTFytFqpZjp0bztMsfHIRWFq3ZW8FOMK4YVyOz5IQVvFkuMtXt8O5fcGgULdDq
 4bSpuFIER1ppZaKcTg/5BejdpYyXx1JxLbAKP8zfacFfhNVryF4io7hxCYwYsk+PDNlO +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ethxu3cay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Mar 2022 16:15:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F40C10002A;
        Wed, 16 Mar 2022 16:15:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43C2222F7CB;
        Wed, 16 Mar 2022 16:15:00 +0100 (CET)
Received: from [10.211.6.204] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 16 Mar
 2022 16:14:59 +0100
Subject: Re: media: platform/Kconfig: some adjustments at ST and Allwinner
 drivers
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        <linux-media@vger.kernel.org>, <inux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220316154322.031fedf9@coco.lan>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <9d85a818-e3dc-ea14-758c-13069026bf7b@foss.st.com>
Date:   Wed, 16 Mar 2022 16:14:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220316154322.031fedf9@coco.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_06,2022-03-15_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Mauro,

For ST part:
Acked-by: Hugues Fruchet <hugues.fruchet@st.com>

BR,
Hugues.

On 3/16/22 3:43 PM, Mauro Carvalho Chehab wrote:
> Align with the the latest discussions with ST and Sunxi community,
> moving:
> 
> 	stm32/ and sti/ to drivers/media/platform/st/
> 
> and not renaming the sunxi/ directory.
> 
> Also adjust the per-vendor accordingly and make the comments clearer
> for someone reading them at the generated .config file.
> 
> PS.: I opted to place such changes on a single patch for upstream
> review, in order to avoid another 60+ mailbomb of patches, but I'm
> actually folding the changes directly at media_stage tree.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 152fef3163e5..49d1e43f4a9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -750,7 +750,7 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> -F:	drivers/media/platform/allwinner/sun4i-csi/
> +F:	drivers/media/platform/sunxi/sun4i-csi/
>   
>   ALLWINNER CPUFREQ DRIVER
>   M:	Yangtao Li <tiny.windzz@gmail.com>
> @@ -2710,7 +2710,7 @@ F:	drivers/clocksource/clksrc_st_lpc.c
>   F:	drivers/cpufreq/sti-cpufreq.c
>   F:	drivers/dma/st_fdma*
>   F:	drivers/i2c/busses/i2c-st.c
> -F:	drivers/media/platform/stm/sti/c8sectpfe/
> +F:	drivers/media/platform/st/sti/c8sectpfe/
>   F:	drivers/media/rc/st_rc.c
>   F:	drivers/mmc/host/sdhci-st.c
>   F:	drivers/phy/st/phy-miphy28lp.c
> @@ -3383,7 +3383,7 @@ L:	linux-media@vger.kernel.org
>   S:	Supported
>   W:	https://linuxtv.org
>   T:	git git://linuxtv.org/media_tree.git
> -F:	drivers/media/platform/stm/sti/bdisp
> +F:	drivers/media/platform/st/sti/bdisp
>   
>   BECKHOFF CX5020 ETHERCAT MASTER DRIVER
>   M:	Dariusz Marcinkiewicz <reksio@newterm.pl>
> @@ -5114,7 +5114,7 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> -F:	drivers/media/platform/allwinner/sun6i-csi/
> +F:	drivers/media/platform/sunxi/sun6i-csi/
>   
>   CW1200 WLAN driver
>   M:	Solomon Peachy <pizza@shaftnet.org>
> @@ -5391,7 +5391,7 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
> -F:	drivers/media/platform/allwinner/sun8i-di/
> +F:	drivers/media/platform/sunxi/sun8i-di/
>   
>   DELL LAPTOP DRIVER
>   M:	Matthew Garrett <mjg59@srcf.ucam.org>
> @@ -5482,7 +5482,7 @@ L:	linux-media@vger.kernel.org
>   S:	Supported
>   W:	https://linuxtv.org
>   T:	git git://linuxtv.org/media_tree.git
> -F:	drivers/media/platform/stm/sti/delta
> +F:	drivers/media/platform/st/sti/delta
>   
>   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>   M:	Zev Weiss <zev@bewilderbeest.net>
> @@ -8870,7 +8870,7 @@ L:	linux-media@vger.kernel.org
>   S:	Supported
>   W:	https://linuxtv.org
>   T:	git git://linuxtv.org/media_tree.git
> -F:	drivers/media/platform/stm/sti/hva
> +F:	drivers/media/platform/st/sti/hva
>   
>   HWPOISON MEMORY FAILURE HANDLING
>   M:	Naoya Horiguchi <naoya.horiguchi@nec.com>
> @@ -12046,7 +12046,7 @@ L:	linux-media@vger.kernel.org
>   S:	Supported
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> -F:	drivers/media/platform/stm/stm32/stm32-dcmi.c
> +F:	drivers/media/platform/st/stm32/stm32-dcmi.c
>   
>   MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>   M:	Mauro Carvalho Chehab <mchehab@kernel.org>
> @@ -16746,7 +16746,7 @@ L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
>   F:	Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml
> -F:	drivers/media/platform/allwinner/sun8i-rotate/
> +F:	drivers/media/platform/sunxi/sun8i-rotate/
>   
>   RPMSG TTY DRIVER
>   M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index def0749a07ba..f1056ceaf5a8 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -63,7 +63,6 @@ config VIDEO_MUX
>   
>   # Platform drivers - Please keep it alphabetically sorted
>   source "drivers/media/platform/allegro-dvt/Kconfig"
> -source "drivers/media/platform/allwinner/Kconfig"
>   source "drivers/media/platform/amlogic/Kconfig"
>   source "drivers/media/platform/amphion/Kconfig"
>   source "drivers/media/platform/aspeed/Kconfig"
> @@ -79,7 +78,8 @@ source "drivers/media/platform/qcom/Kconfig"
>   source "drivers/media/platform/renesas/Kconfig"
>   source "drivers/media/platform/rockchip/Kconfig"
>   source "drivers/media/platform/samsung/Kconfig"
> -source "drivers/media/platform/stm/Kconfig"
> +source "drivers/media/platform/st/Kconfig"
> +source "drivers/media/platform/sunxi/Kconfig"
>   source "drivers/media/platform/ti/Kconfig"
>   source "drivers/media/platform/via/Kconfig"
>   source "drivers/media/platform/xilinx/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index e5060cb891de..ae87e34db3c1 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -6,7 +6,6 @@
>   # Place here, alphabetically sorted by directory
>   # (e. g. LC_ALL=C sort Makefile)
>   obj-y += allegro-dvt/
> -obj-y += allwinner/
>   obj-y += amlogic/
>   obj-y += amphion/
>   obj-y += aspeed/
> @@ -20,9 +19,10 @@ obj-y += nvidia/
>   obj-y += nxp/
>   obj-y += qcom/
>   obj-y += renesas/
> +obj-y += sunxi/
>   obj-y += rockchip/
>   obj-y += samsung/
> -obj-y += stm/
> +obj-y += st/
>   obj-y += ti/
>   obj-y += via/
>   obj-y += xilinx/
> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
> index 735440369c5c..2182e1277568 100644
> --- a/drivers/media/platform/allegro-dvt/Kconfig
> +++ b/drivers/media/platform/allegro-dvt/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Allegro DVT drivers"
> +comment "Allegro DVT media platform drivers"
>   
>   config VIDEO_ALLEGRO_DVT
>   	tristate "Allegro DVT Video IP Core"
> diff --git a/drivers/media/platform/allwinner/Kconfig b/drivers/media/platform/allwinner/Kconfig
> deleted file mode 100644
> index 95a671d87e85..000000000000
> --- a/drivers/media/platform/allwinner/Kconfig
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -
> -source "drivers/media/platform/allwinner/sun4i-csi/Kconfig"
> -source "drivers/media/platform/allwinner/sun6i-csi/Kconfig"
> -source "drivers/media/platform/allwinner/sun8i-di/Kconfig"
> -source "drivers/media/platform/allwinner/sun8i-rotate/Kconfig"
> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
> index c1376ec1fe23..5014957404e9 100644
> --- a/drivers/media/platform/amlogic/Kconfig
> +++ b/drivers/media/platform/amlogic/Kconfig
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Amlogic drivers"
> +comment "Amlogic media platform drivers"
>   
>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
> diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
> index af95b08adf46..c871eda33570 100644
> --- a/drivers/media/platform/aspeed/Kconfig
> +++ b/drivers/media/platform/aspeed/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Aspeed drivers"
> +comment "Aspeed media platform drivers"
>   
>   config VIDEO_ASPEED
>   	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
> diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
> index ae0fa7f96f66..83aebee0c8eb 100644
> --- a/drivers/media/platform/atmel/Kconfig
> +++ b/drivers/media/platform/atmel/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Atmel drivers"
> +comment "Atmel media platform drivers"
>   
>   config VIDEO_ATMEL_ISC
>   	tristate "ATMEL Image Sensor Controller (ISC) support"
> diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
> index 1a0f2d9a6a28..480325d053de 100644
> --- a/drivers/media/platform/cadence/Kconfig
> +++ b/drivers/media/platform/cadence/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Cadence drivers"
> +comment "Cadence media platform drivers"
>   
>   config VIDEO_CADENCE_CSI2RX
>   	tristate "Cadence MIPI-CSI2 RX Controller"
> diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
> index ea49b3563320..57f8f8a22df8 100644
> --- a/drivers/media/platform/chips-media/Kconfig
> +++ b/drivers/media/platform/chips-media/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Chips&Media drivers"
> +comment "Chips&Media media platform drivers"
>   
>   config VIDEO_CODA
>   	tristate "Chips&Media Coda multi-standard codec IP"
> diff --git a/drivers/media/platform/intel/Kconfig b/drivers/media/platform/intel/Kconfig
> index 091e15f00ef5..724e80a9086d 100644
> --- a/drivers/media/platform/intel/Kconfig
> +++ b/drivers/media/platform/intel/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Intel drivers"
> +comment "Intel media platform drivers"
>   
>   config VIDEO_PXA27x
>   	tristate "PXA27x Quick Capture Interface driver"
> diff --git a/drivers/media/platform/marvell/Kconfig b/drivers/media/platform/marvell/Kconfig
> index d7275322fd92..ec1a16734a28 100644
> --- a/drivers/media/platform/marvell/Kconfig
> +++ b/drivers/media/platform/marvell/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Marvell drivers"
> +comment "Marvell media platform drivers"
>   
>   config VIDEO_CAFE_CCIC
>   	tristate "Marvell 88ALP01 (Cafe) CMOS Camera Controller support"
> diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
> index 122eb94ed430..af47d9888552 100644
> --- a/drivers/media/platform/mediatek/Kconfig
> +++ b/drivers/media/platform/mediatek/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Mediatek drivers"
> +comment "Mediatek media platform drivers"
>   
>   source "drivers/media/platform/mediatek/jpeg/Kconfig"
>   source "drivers/media/platform/mediatek/mdp/Kconfig"
> diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
> index 597402090680..b211b46877f6 100644
> --- a/drivers/media/platform/nvidia/Kconfig
> +++ b/drivers/media/platform/nvidia/Kconfig
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "NVidia drivers"
> +comment "NVidia media platform drivers"
>   
>   source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 838abc9766b4..7473096f5885 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -2,7 +2,7 @@
>   
>   # V4L drivers
>   
> -comment "NXP drivers"
> +comment "NXP media platform drivers"
>   
>   config VIDEO_IMX_MIPI_CSIS
>   	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index 4a89587e932d..cc5799b9ea00 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Qualcomm drivers"
> +comment "Qualcomm media platform drivers"
>   
>   source "drivers/media/platform/qcom/camss/Kconfig"
>   source "drivers/media/platform/qcom/venus/Kconfig"
> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
> index 8451ef37e9fb..9fd90672ea2d 100644
> --- a/drivers/media/platform/renesas/Kconfig
> +++ b/drivers/media/platform/renesas/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Renesas drivers"
> +comment "Renesas media platform drivers"
>   
>   # V4L drivers
>   
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index 4351e3258d14..b41d3960c1b4 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Rockchip drivers"
> +comment "Rockchip media platform drivers"
>   
>   source "drivers/media/platform/rockchip/rga/Kconfig"
>   source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
> index c187cefbec5a..0e34c5fc1dfc 100644
> --- a/drivers/media/platform/samsung/Kconfig
> +++ b/drivers/media/platform/samsung/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "Samsung drivers"
> +comment "Samsung media platform drivers"
>   
>   source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
>   source "drivers/media/platform/samsung/exynos4-is/Kconfig"
> diff --git a/drivers/media/platform/st/Kconfig b/drivers/media/platform/st/Kconfig
> new file mode 100644
> index 000000000000..b29c258ea5fc
> --- /dev/null
> +++ b/drivers/media/platform/st/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +comment "STMicroelectronics media platform drivers"
> +
> +source "drivers/media/platform/st/sti/Kconfig"
> +source "drivers/media/platform/st/stm32/Kconfig"
> diff --git a/drivers/media/platform/stm/Makefile b/drivers/media/platform/st/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/Makefile
> rename to drivers/media/platform/st/Makefile
> diff --git a/drivers/media/platform/st/sti/Kconfig b/drivers/media/platform/st/sti/Kconfig
> new file mode 100644
> index 000000000000..60068e8b47b8
> --- /dev/null
> +++ b/drivers/media/platform/st/sti/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +source "drivers/media/platform/st/sti/bdisp/Kconfig"
> +source "drivers/media/platform/st/sti/c8sectpfe/Kconfig"
> +source "drivers/media/platform/st/sti/delta/Kconfig"
> +source "drivers/media/platform/st/sti/hva/Kconfig"
> diff --git a/drivers/media/platform/stm/sti/Makefile b/drivers/media/platform/st/sti/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/sti/Makefile
> rename to drivers/media/platform/st/sti/Makefile
> diff --git a/drivers/media/platform/stm/sti/bdisp/Kconfig b/drivers/media/platform/st/sti/bdisp/Kconfig
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/Kconfig
> rename to drivers/media/platform/st/sti/bdisp/Kconfig
> diff --git a/drivers/media/platform/stm/sti/bdisp/Makefile b/drivers/media/platform/st/sti/bdisp/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/Makefile
> rename to drivers/media/platform/st/sti/bdisp/Makefile
> diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp-debug.c b/drivers/media/platform/st/sti/bdisp/bdisp-debug.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/bdisp-debug.c
> rename to drivers/media/platform/st/sti/bdisp/bdisp-debug.c
> diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp-filter.h b/drivers/media/platform/st/sti/bdisp/bdisp-filter.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/bdisp-filter.h
> rename to drivers/media/platform/st/sti/bdisp/bdisp-filter.h
> diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp-hw.c b/drivers/media/platform/st/sti/bdisp/bdisp-hw.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/bdisp-hw.c
> rename to drivers/media/platform/st/sti/bdisp/bdisp-hw.c
> diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp-reg.h b/drivers/media/platform/st/sti/bdisp/bdisp-reg.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/bdisp-reg.h
> rename to drivers/media/platform/st/sti/bdisp/bdisp-reg.h
> diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/bdisp-v4l2.c
> rename to drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
> diff --git a/drivers/media/platform/stm/sti/bdisp/bdisp.h b/drivers/media/platform/st/sti/bdisp/bdisp.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/bdisp/bdisp.h
> rename to drivers/media/platform/st/sti/bdisp/bdisp.h
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/Kconfig b/drivers/media/platform/st/sti/c8sectpfe/Kconfig
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/Kconfig
> rename to drivers/media/platform/st/sti/c8sectpfe/Kconfig
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/Makefile b/drivers/media/platform/st/sti/c8sectpfe/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/Makefile
> rename to drivers/media/platform/st/sti/c8sectpfe/Makefile
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.c
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-common.h
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.h
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-core.c
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-core.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-core.h
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-debugfs.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-debugfs.c
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-debugfs.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-debugfs.h
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-dvb.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-dvb.c
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.c
> diff --git a/drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-dvb.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/c8sectpfe/c8sectpfe-dvb.h
> rename to drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.h
> diff --git a/drivers/media/platform/stm/sti/delta/Kconfig b/drivers/media/platform/st/sti/delta/Kconfig
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/Kconfig
> rename to drivers/media/platform/st/sti/delta/Kconfig
> diff --git a/drivers/media/platform/stm/sti/delta/Makefile b/drivers/media/platform/st/sti/delta/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/Makefile
> rename to drivers/media/platform/st/sti/delta/Makefile
> diff --git a/drivers/media/platform/stm/sti/delta/delta-cfg.h b/drivers/media/platform/st/sti/delta/delta-cfg.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-cfg.h
> rename to drivers/media/platform/st/sti/delta/delta-cfg.h
> diff --git a/drivers/media/platform/stm/sti/delta/delta-debug.c b/drivers/media/platform/st/sti/delta/delta-debug.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-debug.c
> rename to drivers/media/platform/st/sti/delta/delta-debug.c
> diff --git a/drivers/media/platform/stm/sti/delta/delta-debug.h b/drivers/media/platform/st/sti/delta/delta-debug.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-debug.h
> rename to drivers/media/platform/st/sti/delta/delta-debug.h
> diff --git a/drivers/media/platform/stm/sti/delta/delta-ipc.c b/drivers/media/platform/st/sti/delta/delta-ipc.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-ipc.c
> rename to drivers/media/platform/st/sti/delta/delta-ipc.c
> diff --git a/drivers/media/platform/stm/sti/delta/delta-ipc.h b/drivers/media/platform/st/sti/delta/delta-ipc.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-ipc.h
> rename to drivers/media/platform/st/sti/delta/delta-ipc.h
> diff --git a/drivers/media/platform/stm/sti/delta/delta-mem.c b/drivers/media/platform/st/sti/delta/delta-mem.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-mem.c
> rename to drivers/media/platform/st/sti/delta/delta-mem.c
> diff --git a/drivers/media/platform/stm/sti/delta/delta-mem.h b/drivers/media/platform/st/sti/delta/delta-mem.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-mem.h
> rename to drivers/media/platform/st/sti/delta/delta-mem.h
> diff --git a/drivers/media/platform/stm/sti/delta/delta-mjpeg-dec.c b/drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-mjpeg-dec.c
> rename to drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c
> diff --git a/drivers/media/platform/stm/sti/delta/delta-mjpeg-fw.h b/drivers/media/platform/st/sti/delta/delta-mjpeg-fw.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-mjpeg-fw.h
> rename to drivers/media/platform/st/sti/delta/delta-mjpeg-fw.h
> diff --git a/drivers/media/platform/stm/sti/delta/delta-mjpeg-hdr.c b/drivers/media/platform/st/sti/delta/delta-mjpeg-hdr.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-mjpeg-hdr.c
> rename to drivers/media/platform/st/sti/delta/delta-mjpeg-hdr.c
> diff --git a/drivers/media/platform/stm/sti/delta/delta-mjpeg.h b/drivers/media/platform/st/sti/delta/delta-mjpeg.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-mjpeg.h
> rename to drivers/media/platform/st/sti/delta/delta-mjpeg.h
> diff --git a/drivers/media/platform/stm/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta-v4l2.c
> rename to drivers/media/platform/st/sti/delta/delta-v4l2.c
> diff --git a/drivers/media/platform/stm/sti/delta/delta.h b/drivers/media/platform/st/sti/delta/delta.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/delta/delta.h
> rename to drivers/media/platform/st/sti/delta/delta.h
> diff --git a/drivers/media/platform/stm/sti/hva/Kconfig b/drivers/media/platform/st/sti/hva/Kconfig
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/Kconfig
> rename to drivers/media/platform/st/sti/hva/Kconfig
> diff --git a/drivers/media/platform/stm/sti/hva/Makefile b/drivers/media/platform/st/sti/hva/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/Makefile
> rename to drivers/media/platform/st/sti/hva/Makefile
> diff --git a/drivers/media/platform/stm/sti/hva/hva-debugfs.c b/drivers/media/platform/st/sti/hva/hva-debugfs.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-debugfs.c
> rename to drivers/media/platform/st/sti/hva/hva-debugfs.c
> diff --git a/drivers/media/platform/stm/sti/hva/hva-h264.c b/drivers/media/platform/st/sti/hva/hva-h264.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-h264.c
> rename to drivers/media/platform/st/sti/hva/hva-h264.c
> diff --git a/drivers/media/platform/stm/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-hw.c
> rename to drivers/media/platform/st/sti/hva/hva-hw.c
> diff --git a/drivers/media/platform/stm/sti/hva/hva-hw.h b/drivers/media/platform/st/sti/hva/hva-hw.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-hw.h
> rename to drivers/media/platform/st/sti/hva/hva-hw.h
> diff --git a/drivers/media/platform/stm/sti/hva/hva-mem.c b/drivers/media/platform/st/sti/hva/hva-mem.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-mem.c
> rename to drivers/media/platform/st/sti/hva/hva-mem.c
> diff --git a/drivers/media/platform/stm/sti/hva/hva-mem.h b/drivers/media/platform/st/sti/hva/hva-mem.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-mem.h
> rename to drivers/media/platform/st/sti/hva/hva-mem.h
> diff --git a/drivers/media/platform/stm/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva-v4l2.c
> rename to drivers/media/platform/st/sti/hva/hva-v4l2.c
> diff --git a/drivers/media/platform/stm/sti/hva/hva.h b/drivers/media/platform/st/sti/hva/hva.h
> similarity index 100%
> rename from drivers/media/platform/stm/sti/hva/hva.h
> rename to drivers/media/platform/st/sti/hva/hva.h
> diff --git a/drivers/media/platform/stm/stm32/Kconfig b/drivers/media/platform/st/stm32/Kconfig
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/Kconfig
> rename to drivers/media/platform/st/stm32/Kconfig
> diff --git a/drivers/media/platform/stm/stm32/Makefile b/drivers/media/platform/st/stm32/Makefile
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/Makefile
> rename to drivers/media/platform/st/stm32/Makefile
> diff --git a/drivers/media/platform/stm/stm32/dma2d/dma2d-hw.c b/drivers/media/platform/st/stm32/dma2d/dma2d-hw.c
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/dma2d/dma2d-hw.c
> rename to drivers/media/platform/st/stm32/dma2d/dma2d-hw.c
> diff --git a/drivers/media/platform/stm/stm32/dma2d/dma2d-regs.h b/drivers/media/platform/st/stm32/dma2d/dma2d-regs.h
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/dma2d/dma2d-regs.h
> rename to drivers/media/platform/st/stm32/dma2d/dma2d-regs.h
> diff --git a/drivers/media/platform/stm/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/dma2d/dma2d.c
> rename to drivers/media/platform/st/stm32/dma2d/dma2d.c
> diff --git a/drivers/media/platform/stm/stm32/dma2d/dma2d.h b/drivers/media/platform/st/stm32/dma2d/dma2d.h
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/dma2d/dma2d.h
> rename to drivers/media/platform/st/stm32/dma2d/dma2d.h
> diff --git a/drivers/media/platform/stm/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> similarity index 100%
> rename from drivers/media/platform/stm/stm32/stm32-dcmi.c
> rename to drivers/media/platform/st/stm32/stm32-dcmi.c
> diff --git a/drivers/media/platform/stm/Kconfig b/drivers/media/platform/stm/Kconfig
> deleted file mode 100644
> index 58cbb6b888bf..000000000000
> --- a/drivers/media/platform/stm/Kconfig
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -
> -comment "STMicroelectronics drivers"
> -
> -source "drivers/media/platform/stm/sti/Kconfig"
> -source "drivers/media/platform/stm/stm32/Kconfig"
> diff --git a/drivers/media/platform/stm/sti/Kconfig b/drivers/media/platform/stm/sti/Kconfig
> deleted file mode 100644
> index 311930644281..000000000000
> --- a/drivers/media/platform/stm/sti/Kconfig
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -source "drivers/media/platform/stm/sti/bdisp/Kconfig"
> -source "drivers/media/platform/stm/sti/c8sectpfe/Kconfig"
> -source "drivers/media/platform/stm/sti/delta/Kconfig"
> -source "drivers/media/platform/stm/sti/hva/Kconfig"
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
> new file mode 100644
> index 000000000000..46b7b9bf989c
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +comment "Sunxi media platform drivers"
> +
> +source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
> diff --git a/drivers/media/platform/allwinner/Makefile b/drivers/media/platform/sunxi/Makefile
> similarity index 100%
> rename from drivers/media/platform/allwinner/Makefile
> rename to drivers/media/platform/sunxi/Makefile
> diff --git a/drivers/media/platform/allwinner/sun4i-csi/Kconfig b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun4i-csi/Kconfig
> rename to drivers/media/platform/sunxi/sun4i-csi/Kconfig
> diff --git a/drivers/media/platform/allwinner/sun4i-csi/Makefile b/drivers/media/platform/sunxi/sun4i-csi/Makefile
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun4i-csi/Makefile
> rename to drivers/media/platform/sunxi/sun4i-csi/Makefile
> diff --git a/drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.c
> rename to drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> diff --git a/drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun4i-csi/sun4i_csi.h
> rename to drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
> diff --git a/drivers/media/platform/allwinner/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun4i-csi/sun4i_dma.c
> rename to drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
> diff --git a/drivers/media/platform/allwinner/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun4i-csi/sun4i_v4l2.c
> rename to drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/Kconfig
> rename to drivers/media/platform/sunxi/sun6i-csi/Kconfig
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/Makefile b/drivers/media/platform/sunxi/sun6i-csi/Makefile
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/Makefile
> rename to drivers/media/platform/sunxi/sun6i-csi/Makefile
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.c
> rename to drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/sun6i_csi.h
> rename to drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/sun6i_csi_reg.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/sun6i_csi_reg.h
> rename to drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/sun6i_video.c
> rename to drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> diff --git a/drivers/media/platform/allwinner/sun6i-csi/sun6i_video.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun6i-csi/sun6i_video.h
> rename to drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
> diff --git a/drivers/media/platform/allwinner/sun8i-di/Kconfig b/drivers/media/platform/sunxi/sun8i-di/Kconfig
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-di/Kconfig
> rename to drivers/media/platform/sunxi/sun8i-di/Kconfig
> diff --git a/drivers/media/platform/allwinner/sun8i-di/Makefile b/drivers/media/platform/sunxi/sun8i-di/Makefile
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-di/Makefile
> rename to drivers/media/platform/sunxi/sun8i-di/Makefile
> diff --git a/drivers/media/platform/allwinner/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-di/sun8i-di.c
> rename to drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> diff --git a/drivers/media/platform/allwinner/sun8i-di/sun8i-di.h b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-di/sun8i-di.h
> rename to drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
> diff --git a/drivers/media/platform/allwinner/sun8i-rotate/Kconfig b/drivers/media/platform/sunxi/sun8i-rotate/Kconfig
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-rotate/Kconfig
> rename to drivers/media/platform/sunxi/sun8i-rotate/Kconfig
> diff --git a/drivers/media/platform/allwinner/sun8i-rotate/Makefile b/drivers/media/platform/sunxi/sun8i-rotate/Makefile
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-rotate/Makefile
> rename to drivers/media/platform/sunxi/sun8i-rotate/Makefile
> diff --git a/drivers/media/platform/allwinner/sun8i-rotate/sun8i-formats.h b/drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-rotate/sun8i-formats.h
> rename to drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h
> diff --git a/drivers/media/platform/allwinner/sun8i-rotate/sun8i-rotate.h b/drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-rotate/sun8i-rotate.h
> rename to drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
> diff --git a/drivers/media/platform/allwinner/sun8i-rotate/sun8i_formats.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-rotate/sun8i_formats.c
> rename to drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.c
> diff --git a/drivers/media/platform/allwinner/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> similarity index 100%
> rename from drivers/media/platform/allwinner/sun8i-rotate/sun8i_rotate.c
> rename to drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> diff --git a/drivers/media/platform/via/Kconfig b/drivers/media/platform/via/Kconfig
> index 6077222eb274..8926eb0803b2 100644
> --- a/drivers/media/platform/via/Kconfig
> +++ b/drivers/media/platform/via/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -comment "VIA drivers"
> +comment "VIA media platform drivers"
>   
>   config VIDEO_VIA_CAMERA
>   	tristate "VIAFB camera controller support"
> diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
> index 0c772d070eb6..93ef78bf62e6 100644
> --- a/drivers/media/platform/xilinx/Kconfig
> +++ b/drivers/media/platform/xilinx/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> -comment "Xilinx drivers"
> +comment "Xilinx media platform drivers"
>   
>   config VIDEO_XILINX
>   	tristate "Xilinx Video IP (EXPERIMENTAL)"
> 
> 
> Thanks,
> Mauro
> 
