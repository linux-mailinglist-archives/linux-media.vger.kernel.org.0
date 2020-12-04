Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0497D2CEB2E
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 10:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbgLDJkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 04:40:45 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8649 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgLDJko (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 04:40:44 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnSMx3j5Lz15XWR;
        Fri,  4 Dec 2020 17:39:25 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 17:39:43 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Stafford Horne <shorne@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 0/5] fix dt_binding_check warnings
Date:   Fri, 4 Dec 2020 17:38:08 +0800
Message-ID: <20201204093813.1275-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches is based on the latest linux-next code.

When I do dt_binding_check for any YAML file, below wanrings is always reported:

/root/linux-next/Documentation/devicetree/bindings/serial/litex,liteuart.yaml: 'additionalProperties' is a required property
/root/linux-next/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml: 'additionalProperties' is a required property
/root/linux-next/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml: 'additionalProperties' is a required property
/root/linux-next/Documentation/devicetree/bindings/media/coda.yaml: 'additionalProperties' is a required property
/root/linux-next/Documentation/devicetree/bindings/media/coda.yaml: ignoring, error in schema:
warning: no schema found in file: ./Documentation/devicetree/bindings/media/coda.yaml
/root/linux-next/Documentation/devicetree/bindings/serial/litex,liteuart.yaml: ignoring, error in schema:
warning: no schema found in file: ./Documentation/devicetree/bindings/serial/litex,liteuart.yaml
/root/linux-next/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml: ignoring, error in schema:
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
/root/linux-next/Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml: ignoring, error in schema:
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml
/root/linux-next/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /root/linux-next/Documentation/devicetree/bindings/leds/leds-pwm.yaml

I have done the dtbs_check for all 5 yaml files on both arm32 and arm64.


Zhen Lei (5):
  media: dt-bindings: add the required property 'additionalProperties'
  dt-bindings: serial: add the required property 'additionalProperties'
  dt-bindings: soc: add the required property 'additionalProperties'
  dt-bindings: devapc: add the required property 'additionalProperties'
  dt-bindings: mfd: correct the node name of the panel led

 Documentation/devicetree/bindings/media/coda.yaml                   | 6 ++++++
 Documentation/devicetree/bindings/mfd/iqs62x.yaml                   | 2 +-
 Documentation/devicetree/bindings/serial/litex,liteuart.yaml        | 2 ++
 .../devicetree/bindings/soc/litex/litex,soc-controller.yaml         | 2 ++
 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml          | 2 ++
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
1.8.3


