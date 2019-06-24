Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBFA517E4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbfFXQDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:38 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47239 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728416AbfFXQDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:38 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRNhZaZJ; Mon, 24 Jun 2019 18:03:36 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Subject: [PATCHv8 00/13] cec: improve notifier support, add connector info
Date:   Mon, 24 Jun 2019 18:03:17 +0200
Message-Id: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM5cfxY3qb1mJIOEfAgwxyzmneGu3DOIaGPtL1rXLfi9ZKPJS+IAvic+bCsU2HYwU9mQ1Jj1vHvFgU1ggcDsS/Y2kgf9iITUsRBXY3PD2phToQDCc7VC
 D9qy5VUksdVPfEmAoqdig/CkbbI/xZ2j0MrcjwW8YQziT3PqWeenUt1+RFIh0+Eh+xH7KibSdTcIg0ccNYqm8bhQAjQ8RRo4sTtbJnTn5yrH1qf0+Guwsnoz
 8nTXUd04SWZfm+tRBY7dnPH8nG1tXOv4p3fhvKkKcadpR0mwrXrn5i76bhiBsKsu
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a rework of Dariusz' v7 series:

https://www.spinics.net/lists/linux-media/msg151117.html

Rather than changing the existing CEC kAPI to allocate and
register CEC adapters I left it as-is. Instead new notifiers
functions are added to (un)register HDMI connector and CEC adapter
notifiers. These replace the current cec_notifier_get_conn and _put
functions.

For drivers that don't use notifiers the cec_s_conn_info function
was created so the connector info can be set directly as well.

This split in separate connector and CEC adapter functions is needed
since the notifier information is different between the two and this
makes it future proof since we will need to eventually support more
than one CEC adapter per HDMI connector.

By carefully designing these functions it is possible to convert
drivers to these new functions one-by-one, rather than as a painful
big-bang patch.

The plan is to merge the first three patches for kernel 5.3: these
patches provide the infrastructure needed by drm and cec drivers
to do the conversion during the 5.4 cycle, without requiring
patches that touch on multiple subsystems.

Once the conversion is done the new connector API can be exposed.
A patch documenting the new API is included as well, but it is
old and needs updating (the new CEC_CAP_CONNECTOR_INFO capability
isn't documented, and neither is the new 'have_connector_info'
field of the state changed event).

Various drivers have been converted as well as an example. These
are based on Dariusz' original series, but using the new notifier
functions.

Regards,

	Hans

Dariusz Marcinkiewicz (9):
  cec: add struct cec_connector_info support
  cec: expose the new connector info API
  drm_dp_cec: add connector info support.
  drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
  dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
  dw-hdmi: use cec_notifier_conn_(un)register
  tda9950: use cec_notifier_cec_adap_(un)register
  tda998x: use cec_notifier_conn_(un)register
  drm/vc4/vc4_hdmi: fill in connector info

Hans Verkuil (4):
  cec-notifier: rename variable, check kstrdup
  cec: add new notifier functions
  cec: document CEC_ADAP_G_CONNECTOR_INFO
  meson/ao-cec: use cec_notifier_cec_adap_(un)register

 Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
 .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 109 +++++++++++++++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |   9 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 104 +++++++++-------
 drivers/gpu/drm/drm_dp_cec.c                  |  25 ++--
 drivers/gpu/drm/i2c/tda9950.c                 |  11 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             |  56 ++++-----
 drivers/gpu/drm/i915/intel_dp.c               |   4 +-
 drivers/gpu/drm/i915/intel_hdmi.c             |  13 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   3 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  13 +-
 drivers/media/cec/cec-adap.c                  |  31 +++++
 drivers/media/cec/cec-api.c                   |  16 +++
 drivers/media/cec/cec-notifier.c              | 115 ++++++++++++++++--
 drivers/media/platform/meson/ao-cec.c         |  37 +++---
 include/drm/drm_dp_helper.h                   |  14 +--
 include/media/cec-notifier.h                  |  78 ++++++++++++
 include/media/cec.h                           |  19 +++
 include/uapi/linux/cec.h                      |  33 +++++
 20 files changed, 550 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst

-- 
2.20.1

