Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3712555250
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbfFYOpQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:45:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52241 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730905AbfFYOpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:45:16 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmh4hQwJSSfvXfmh8hHoyd; Tue, 25 Jun 2019 16:45:14 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Subject: [PATCHv9 00/13] cec: improve notifier support, add connector info
Date:   Tue, 25 Jun 2019 16:44:57 +0200
Message-Id: <20190625144510.122214-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGotbewLqH47JURfpvjZTkncnARHewLy1oqUHYbwzqPtDPvONf3dtrG/IOF9QxJbcyVMhjJt0KGFoWLRBz8EwpyYk6Keyz/Fctqw4aQqOJHQ/TYw8FAZ
 q/JNFcyfuc4wW5+tsoG3t6uUODtH0DZ2Xi/TiHi1fivntsucHa1iEnys/uQpPQ/stBXYqgiICCeRH97g+cTXQn7vCCn2JDdbJ3nXbOMZvpWN5T2/XsiMlWb9
 KR4nWAKZjBEGF94GoAAEE/rFIvQh7+E1L2z8ATrbHm7xjvYRqTQMA0tmIxc0ACe7u3B7bdw8BBsOpDCRiy1XJnFIA2cM48MhKqEzBPvIFeyDnQaSxQrosMb2
 9VSdic4ykUFzjXfNHWTcYFeaBx2r6w==
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

Various drivers have been converted as well as an example. These
are based on Dariusz' original series, but using the new notifier
functions.

Regards,

	Hans

Changes since v8:

- Complete the documentation patch (now documents the new capability
  and the new field in the state changed event)
- Take a lock in cec_adap_g_connector_info
- cec-notifier: dropped 'called_cec_notifier_register', use 'callback'
  instead.
- cec_notifier_cec_adap_unregister: don't memset adap->conn_info, it's
  not necessary.
- seco-cec: include cec-notifier instead of relying on cec.h to include
  it, since that's no longer the case.
- Move cec_notifier_register, cec_notifier_unregister and
  cec_register_cec_notifier to cec.h. This avoids sparse/smatch warnings.
- Improve cec_(drm_)connector_info docbook comments.
- CEC_CAP_CONNECTOR_INFO is now defined as (1 << 8) instead of 0, but is
  removed from the cap set in cec_adapter_allocate while this API remains
  internal.

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
  cec-notifier: rename variables, check kstrdup and n->conn_name
  cec-notifier: add new notifier functions
  cec: document CEC_ADAP_G_CONNECTOR_INFO and capability
  meson/ao-cec: use cec_notifier_cec_adap_(un)register

 Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
 .../media/uapi/cec/cec-ioc-adap-g-caps.rst    |   6 +-
 .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 102 ++++++++++++++++
 .../media/uapi/cec/cec-ioc-dqevent.rst        |   8 ++
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
 drivers/media/cec/cec-api.c                   |  20 ++++
 drivers/media/cec/cec-notifier.c              | 112 ++++++++++++++++--
 drivers/media/platform/meson/ao-cec.c         |  37 +++---
 drivers/media/platform/seco-cec/seco-cec.c    |   2 +-
 include/drm/drm_dp_helper.h                   |  14 +--
 include/media/cec-notifier.h                  | 105 ++++++++++------
 include/media/cec.h                           |  67 ++++++++++-
 include/uapi/linux/cec.h                      |  40 +++++++
 23 files changed, 606 insertions(+), 179 deletions(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst

-- 
2.20.1

