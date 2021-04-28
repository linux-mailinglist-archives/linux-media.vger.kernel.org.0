Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B7F36D83C
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239805AbhD1N0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:26:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36133 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239634AbhD1N0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:26:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bkCIlVh38k1MGbkCLlOQ1x; Wed, 28 Apr 2021 15:25:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619616349; bh=UthuXpu8NhLcMlzJKzArkxx5H5x53BP0fzOHl8ytWwA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=awMipbD+9Iz/++v9cna/2Zw5HM5w5mUW084MrZjIlBpdgT0/SsaZQJnxu1HT54exg
         GqNaktbPPTZDjV2wfsz8Oq1Qx/Lo9J9Yn+rZnq6qXU1nqpP72VbqZhZAByQhL67nQR
         nmrfLuqlrLBlQ5vEbsyBJYpMPU/dQklmp+K0pOsXShjoFB/v5E3O+VPz8UIelZakht
         5mwB9S2gTIm/rZAqBA0Eu1cK5YP8pGtAmywqTwKZBUk6aKp5IdRTXq1MGCp4KKYMbi
         pi7YopC2dvlsrBX6dTnmo/LLqWUSUzBvav1f/1zSi9l8LXslOFw46gOxVMVXsIyRyF
         JMt7EDS08jYFw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCHv3 0/6] drm/omap: hdmi: improve hdmi4 CEC, add CEC for hdmi5
Date:   Wed, 28 Apr 2021 15:25:39 +0200
Message-Id: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNcxjyqcG4pJNs1Tk8nDvJ3/ZamesNQP5Hi8QpIBONjn0playxL7JoP3ip4juMQSEgVMXQQB+V255EzLLy4U6GjT5JMAxOqJ8HqEaqTWCHnf58gC5NgC
 GBTAcJGrdQ3qCz0p14/dlAedeK+FTFrEVTgEYGWsVRM9MB5AVrnrEakLXdLSOpXAYUYXRyY0KIWFfgikgi9DPJJvw9lsiPKaLsW8N9KrLwrLOPyFRCc/jt6g
 bKLAiBXI2CyXjNUX32Tc8kvzPSftCjfbHYgqg7wes/Fo5aQEYr5E2GFZHLLRHiUr4aiwX0lHjwFyoqaY1XParIFF19Z3rjkBifN95XbkTcB133MKU+u6yiT6
 r5JY+4pqZmB7USCPxD5UvicFP1Ggng==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series improves the drm_bridge support for CEC by introducing two
new bridge ops in the first patch, and using those in the second patch.

This makes it possible to call cec_s_conn_info() and set
CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
the CEC adapter with the corresponding DRM connector.

The third patch simplifies CEC physical address handling by using the
cec_s_phys_addr_from_edid helper function that didn't exist when this
code was originally written.

The fourth patch adds the cec clock to ti,omap5-dss.txt.

The fifth patch the missing cec clock to the dra7 and omap5 device tree,
and the last patch adds CEC support to the OMAP5 driver.

Tested with a Pandaboard and a Beagle X15 board.

Regards,

	Hans

Changes since v2:

- connector_attach can now return an error. If an error is
  returned then connector_detach is called in reverse order
  to clean up any previous connector_attach calls.

- connector_attach in hdmi4 and hdmi5 now return 0.

Changes since v1:

- as per suggestion from Laurent, changed cec_init/exit to
  connector_attach/_detach which are just called for all
  bridges. The DRM_BRIDGE_OP_CEC was dropped.

- added patch to add the cec clock to ti,omap5-dss.txt

- swapped the order of the last two patches

- incorporated Tomi's suggestions for the hdmi5 CEC support.

Hans Verkuil (6):
  drm: drm_bridge: add connector_attach/detach bridge ops
  drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
  drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
  dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
  dra7.dtsi/omap5.dtsi: add cec clock
  drm/omapdrm/dss/hdmi5: add CEC support

 .../bindings/display/ti/ti,omap5-dss.txt      |   4 +-
 arch/arm/boot/dts/dra7.dtsi                   |   5 +-
 arch/arm/boot/dts/omap5.dtsi                  |   5 +-
 drivers/gpu/drm/drm_bridge_connector.c        |  25 ++-
 drivers/gpu/drm/omapdrm/Kconfig               |   8 +
 drivers/gpu/drm/omapdrm/Makefile              |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi.h            |   1 +
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  41 ++--
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  13 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  12 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           |  64 +++++-
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c       | 209 ++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h       |  42 ++++
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  35 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |  33 ++-
 include/drm/drm_bridge.h                      |  27 +++
 16 files changed, 470 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
 create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h

-- 
2.30.2

