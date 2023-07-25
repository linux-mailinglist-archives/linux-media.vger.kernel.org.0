Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700CA761EEA
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 18:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjGYQnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 12:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjGYQnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 12:43:17 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3951FC9;
        Tue, 25 Jul 2023 09:43:13 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PDXDri010531;
        Tue, 25 Jul 2023 18:42:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=6QnlhmKHdbeIl7Hs8Qk0Ib7pRhywX3PL8ioGr6WJgP0=;
 b=tqATn94RAc/T938gUBGjTrCig0CvEhzQXomhmUndO9aUfJGo471b5d30oR5LPgv6qyTA
 xUC+N80/b03AzEFVyg0X4rI4JOn82CYgzuboeqdvBCuKewyo4I77RMUAGweO8g8Tgtn7
 etyQXfs5X6jtAmTA86/4yRUrDVpK4hcAZldrzOJ0ciqyOylZyPo4cTV+/paEQ6zID/8c
 kwLL/qDj0H0UUTmTwjcs+bMxWj5rlQObqOuPvX3y8+BB3ihK2ZJ30z1gyHRSxpVhXJm3
 /bqQ1TriJgNRJOPXgpwOjWYvv1bgkaxfbBY18Cx+odYBbmLp7VllCglkgArwtAWWIKVW 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2bkbjqh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jul 2023 18:42:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A23A100048;
        Tue, 25 Jul 2023 18:42:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F505257AB5;
        Tue, 25 Jul 2023 18:42:40 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 25 Jul
 2023 18:42:40 +0200
From:   Gatien Chevallier <gatien.chevallier@foss.st.com>
To:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>
CC:     <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v2 00/11] Introduce STM32 Firewall framework
Date:   Tue, 25 Jul 2023 18:40:53 +0200
Message-ID: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_08,2023-07-25_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
register to the framework to offer firewall services such as access
granting.

This series of patches is a new approach on the previous STM32 system
bus, history is available here:
https://lore.kernel.org/lkml/20230127164040.1047583/

The need for such framework arises from the fact that there are now
multiple hardware firewalls implemented across multiple products.
Drivers are shared between different products, using the same code.
When it comes to firewalls, the purpose mostly stays the same: Protect
hardware resources. But the implementation differs, and there are
multiple types of firewalls: peripheral, memory, ... 

Some hardware firewall controllers such as the RIFSC implemented on
STM32MP2x platforms may require to take ownership of a resource before
being able to use it, hence the requirement for firewall services to
take/release the ownership of such resources.

On the other hand, hardware firewall configurations are becoming
more and more complex. These mecanisms prevent platform crashes
or other firewall-related incoveniences by denying access to some
resources.

The stm32 firewall framework offers an API that is defined in
firewall controllers drivers to best fit the specificity of each
firewall.

For every peripherals protected by either the ETZPC or the RIFSC, the
firewall framework checks the firewall controlelr registers to see if
the peripheral's access is granted to the Linux kernel. If not, the
peripheral is configured as secure, the node is marked populated,
so that the driver is not probed for that device.

The firewall framework relies on the feature-domain-controller device
tree bindings: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b.
It is used by peripherals to reference a domain controller, in this
case a firewall feature domain. The bus uses the ID referenced by
the feature-domains property to know where to look in the firewall
to get the security configuration for the peripheral. This allows
a device tree description rather than a hardcoded peripheral table
in the bus driver.

The STM32 ETZPC device is responsible for filtering accesses based on
security level, or co-processor isolation for any resource connected
to it.

The RIFSC is responsible for filtering accesses based on Compartment
ID / security level / privilege level for any resource connected to
it.

STM32MP13/15/25 SoC device tree files are updated in this series to
implement this mecanism.

Changes in V2:

	generic:
		- Add fw_devlink dependency for "feature-domains"
		  property.

	bindings:
		- Corrected YAMLS errors highlighted by Rob's robot
		- Firewall controllers YAMLs no longer define the
		  maxItems for the "feature-domains" property
		- Renamed st,stm32-rifsc.yaml to
		  st,stm32mp25-rifsc.yaml
		- Fix examples in YAML files
		- Change feature-domains maxItems to 2 in firewall
		  consumer files as there should not be more than
		  2 entries for now
		- Declare "feature-domain-names" as an optional
		  property for firewall controllers child nodes.
		- Add missing "feature-domains" property declaration
		  in bosch,m_can.yaml and st,stm32-cryp.yaml files

	firewall framework:
		- Support multiple entries for "feature-domains"
		  property
		- Better handle the device-tree parsing using
		  phandle+args APIs
		- Remove "resource firewall" type
		- Add a field for the name of the firewall entry
		- Fix licenses
	
	RIFSC:
		- Add controller name
		- Driver is now a module_platform_driver
		- Fix license

	ETZPC:
		- Add controller name
		- Driver is now a module_platform_driver
		- Fix license

	Device trees:
		- Fix rifsc node name
		- Move the "ranges" property under the
		  "feature-domains" one
		

Oleksii Moisieiev (1):
  dt-bindings: Document common device controller bindings

Gatien Chevallier (10):
  dt-bindings: bus: document RIFSC
  dt-bindings: bus: document ETZPC
  dt-bindings: treewide: add feature-domains description
  firewall: introduce stm32_firewall framework
  of: property: fw_devlink: Add support for "feature-domains"
  bus: rifsc: introduce RIFSC firewall controller driver
  arm64: dts: st: add RIFSC as a domain controller for STM32MP25x boards
  bus: etzpc: introduce ETZPC firewall controller driver
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards

 .../bindings/bus/st,stm32-etzpc.yaml          |   96 +
 .../bindings/bus/st,stm32mp25-rifsc.yaml      |  105 +
 .../bindings/crypto/st,stm32-cryp.yaml        |    4 +
 .../bindings/crypto/st,stm32-hash.yaml        |    4 +
 .../devicetree/bindings/dma/st,stm32-dma.yaml |    4 +
 .../bindings/dma/st,stm32-dmamux.yaml         |    4 +
 .../feature-domain-controller.yaml            |   84 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |    4 +
 .../bindings/iio/adc/st,stm32-adc.yaml        |    4 +
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |    4 +
 .../bindings/iio/dac/st,stm32-dac.yaml        |    4 +
 .../bindings/media/cec/st,stm32-cec.yaml      |    4 +
 .../bindings/media/st,stm32-dcmi.yaml         |    4 +
 .../memory-controllers/st,stm32-fmc2-ebi.yaml |    4 +
 .../bindings/mfd/st,stm32-lptimer.yaml        |    4 +
 .../bindings/mfd/st,stm32-timers.yaml         |    5 +
 .../devicetree/bindings/mmc/arm,pl18x.yaml    |    4 +
 .../bindings/net/can/bosch,m_can.yaml         |    4 +
 .../devicetree/bindings/net/stm32-dwmac.yaml  |    4 +
 .../bindings/phy/phy-stm32-usbphyc.yaml       |    4 +
 .../bindings/regulator/st,stm32-vrefbuf.yaml  |    4 +
 .../devicetree/bindings/rng/st,stm32-rng.yaml |    4 +
 .../bindings/serial/st,stm32-uart.yaml        |    4 +
 .../bindings/sound/st,stm32-i2s.yaml          |    4 +
 .../bindings/sound/st,stm32-sai.yaml          |    4 +
 .../bindings/sound/st,stm32-spdifrx.yaml      |    4 +
 .../bindings/spi/st,stm32-qspi.yaml           |    4 +
 .../devicetree/bindings/spi/st,stm32-spi.yaml |    4 +
 .../devicetree/bindings/usb/dwc2.yaml         |    4 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/st/stm32mp131.dtsi          | 1027 +++---
 arch/arm/boot/dts/st/stm32mp133.dtsi          |   51 +-
 arch/arm/boot/dts/st/stm32mp13xc.dtsi         |   19 +-
 arch/arm/boot/dts/st/stm32mp13xf.dtsi         |   19 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 2757 +++++++++--------
 arch/arm/boot/dts/st/stm32mp153.dtsi          |   52 +-
 arch/arm/boot/dts/st/stm32mp15xc.dtsi         |   19 +-
 arch/arm64/Kconfig.platforms                  |    1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |    7 +-
 drivers/bus/Kconfig                           |    9 +
 drivers/bus/Makefile                          |    1 +
 drivers/bus/stm32_etzpc.c                     |  141 +
 drivers/bus/stm32_firewall.c                  |  288 ++
 drivers/bus/stm32_firewall.h                  |   83 +
 drivers/bus/stm32_rifsc.c                     |  252 ++
 drivers/of/property.c                         |    2 +
 include/linux/bus/stm32_firewall_device.h     |  140 +
 47 files changed, 3346 insertions(+), 1919 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
 create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
 create mode 100644 drivers/bus/stm32_etzpc.c
 create mode 100644 drivers/bus/stm32_firewall.c
 create mode 100644 drivers/bus/stm32_firewall.h
 create mode 100644 drivers/bus/stm32_rifsc.c
 create mode 100644 include/linux/bus/stm32_firewall_device.h

-- 
2.35.3

