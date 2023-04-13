Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7996E0591
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 05:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjDMDz6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 12 Apr 2023 23:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjDMDzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 23:55:50 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606A16199;
        Wed, 12 Apr 2023 20:55:49 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 1AF8B24E284;
        Thu, 13 Apr 2023 11:55:42 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 11:55:42 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 11:55:42 +0800
From:   Jack Zhu <jack.zhu@starfivetech.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        "Todor Tomov" <todor.too@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jack.zhu@starfivetech.com>,
        <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 0/8] Add StarFive Camera Subsystem driver
Date:   Thu, 13 Apr 2023 11:55:33 +0800
Message-ID: <20230413035541.62129-1-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patch series adds support for the StarFive Camera Subsystem
found on StarFive JH7110 SoC.

The driver implements V4L2, Media controller and V4L2 subdev interfaces.
Camera sensor using V4L2 subdev interface in the kernel is supported.

The driver is tested on VisionFive V2 board with IMX219 camera sensor.
GStreamer 1.18.5 with v4l2src plugin is supported.

Changes since v3:
Patch 1:
- Modified port@0 and port@1 properties.
- Extended the port@0 example with appropriate properties.
- Added 'port@0' for 'required'
Patch 2:
- Modified spelling errors.
Patch 3:
- Merged patch 5 into the patch with an explanation for compatible in
  commit msg.
Patch 6:
- Asserted pixel_rst[i] reset in the loop after the err_disable_pixclk
  label.
- Modified Code Style for getting sys_rst and p_rst.
- Renamed clk_name to name and modified the relevant code.
Patch 9:
- Added static for stfcamss_get_mem_res function.
- Added static for isp_close function.
- Fixed implicit conversion warning for stf_vin_map_isp_pad function.
- Dropped unused variables.

  v3: https://lore.kernel.org/all/20230331121826.96973-1-jack.zhu@starfivetech.com/

Changes since v2:
- Rebased on v6.3-rc1.
Patch 1:
- Modified spelling errors.
- Added port@0.
- Modified '$ref' of port.
- Added 'ports' to 'required'.
- Dropped 'stfcamss' label in example.
- Added port@0 in example.
- Added MAINTAINERS file.
Patch 2:
- Split this patch into three new patches.
- Modified compatible property.
- Replaced clock names with the existing names.
- Modified 'bus-type' and 'clock-lanes'
- Added port@2 - port@4
- Dropped 'csi2rx' label in example.
Patch 3:
- Updated rst and dot file as three pipelines were deleted.
Patch 4:
- Split this patch into three new patches.
- Dropped .s_power() and .get_fmt().
- Dropped CSI-2 DT support.
- Dropped v4l2_device_register_subdev_nodes().
- Used assigned-clock-rates in DT to set clk value.
- Modified 'compatible' field.
Patch 5:
- Deleted three pipelines. 
- Modified 'stfcamss_clocks'/'stfcamss_resets' struct.
- Dropped stfcamss_find_sensor() function.
- Removed redundant code from stfcamss_of_parse_endpoint_node().
- Modified spelling errors.
- Rewrote stfcamss_reg_media_subdev_node() function.
- Modified stfcamss_subdev_notifier_bound().
- Modified stfcamss_probe() function.
- Dropped stfcamss_suspend() and stfcamss_resume().
- Dropped dev_info() in stfcamss_remove() function.
- Added 'stf_' prefix for enum subdev_type.
- Moved all includes to the top in stf_camss.h file.
- Dropped unused fields in stfcamss struct.
- Replaced Custom logging macros with regular macros.
- Rewrote register read and write functions.
- Used lowercase for all hex constants.
- Used macro to name registers.
- Dropped unused ioctl and stf_isp_ioctl.h file.

  v2: https://lore.kernel.org/all/20230310120553.60586-1-jack.zhu@starfivetech.com/

Changes since v1:
- Deleted starfive,jh7110-mipi-csi2.yaml.
- Converted cdns,csi2rx.txt to cdns,csi2rx.yaml and added ‘resets’
  properties.
- Added ‘cdns,csi2rx.yaml’ in ‘CADENCE MIPI-CSI2 BRIDGES’ entry.
- The following contents were modified in starfive,jh7110-camss.yaml:
  dropped quotes from ’id’ and ‘schema’; dropped ‘|’ for ‘description’;
  corrected the wrong or redundant words: ‘a ISP’, ‘PD ISP’;
  dropped ‘minItems’ for ‘reg’, ‘clocks’, ‘resets’ and ‘interrupts’;
  dropped the '_clk' and 'rst_' prefix about the 'clock-names' and
  'reset-names';
  changed ‘endpoint@1’ to ‘endpoint’; updated examples;
- Updated Subject for some patches.
- Merged patch 6, 7, 8, 9, 10, 11 into one patch.

Jack Zhu (8):
  media: dt-bindings: cadence-csi2rx: Convert to DT schema
  media: dt-bindings: cadence-csi2rx: Add resets property
  media: cadence: Add operation on reset
  media: cadence: Add support for external dphy
  media: cadence: Add support for JH7110 SoC
  media: dt-bindings: Add bindings for JH7110 Camera Subsystem
  media: admin-guide: Add starfive_camss.rst for Starfive Camera
    Subsystem
  media: starfive: Add Starfive Camera Subsystem driver

 .../admin-guide/media/starfive_camss.rst      |   57 +
 .../media/starfive_camss_graph.dot            |   16 +
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../devicetree/bindings/media/cdns,csi2rx.txt |  100 --
 .../bindings/media/cdns,csi2rx.yaml           |  201 +++
 .../bindings/media/starfive,jh7110-camss.yaml |  164 +++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  107 +-
 drivers/media/platform/starfive/Kconfig       |   18 +
 drivers/media/platform/starfive/Makefile      |   14 +
 drivers/media/platform/starfive/stf_camss.c   |  477 +++++++
 drivers/media/platform/starfive/stf_camss.h   |  150 +++
 drivers/media/platform/starfive/stf_common.h  |   18 +
 drivers/media/platform/starfive/stf_isp.c     |  737 +++++++++++
 drivers/media/platform/starfive/stf_isp.h     |  999 +++++++++++++++
 .../media/platform/starfive/stf_isp_hw_ops.c  |  715 +++++++++++
 drivers/media/platform/starfive/stf_video.c   |  989 ++++++++++++++
 drivers/media/platform/starfive/stf_video.h   |   89 ++
 drivers/media/platform/starfive/stf_vin.c     | 1138 +++++++++++++++++
 drivers/media/platform/starfive/stf_vin.h     |  174 +++
 .../media/platform/starfive/stf_vin_hw_ops.c  |  211 +++
 23 files changed, 6272 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/admin-guide/media/starfive_camss.rst
 create mode 100644 Documentation/admin-guide/media/starfive_camss_graph.dot
 delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
 create mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 create mode 100644 drivers/media/platform/starfive/Kconfig
 create mode 100644 drivers/media/platform/starfive/Makefile
 create mode 100644 drivers/media/platform/starfive/stf_camss.c
 create mode 100644 drivers/media/platform/starfive/stf_camss.h
 create mode 100644 drivers/media/platform/starfive/stf_common.h
 create mode 100644 drivers/media/platform/starfive/stf_isp.c
 create mode 100644 drivers/media/platform/starfive/stf_isp.h
 create mode 100644 drivers/media/platform/starfive/stf_isp_hw_ops.c
 create mode 100644 drivers/media/platform/starfive/stf_video.c
 create mode 100644 drivers/media/platform/starfive/stf_video.h
 create mode 100644 drivers/media/platform/starfive/stf_vin.c
 create mode 100644 drivers/media/platform/starfive/stf_vin.h
 create mode 100644 drivers/media/platform/starfive/stf_vin_hw_ops.c

-- 
2.34.1

