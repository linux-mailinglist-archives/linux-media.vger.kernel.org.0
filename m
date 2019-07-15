Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B73368710
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfGOKa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:30:57 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56561 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729674AbfGOKa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:57 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyFzhRPK9; Mon, 15 Jul 2019 12:30:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Subject: [PATCH 0/6] media: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:48 +0200
Message-Id: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfN9O7HsLv/gL8kDGuQCpjCtraycPGcFXz3R/TSiIH10v1UGBUgVtG5eXFlYnya4RJIpATPmjzSCrC797esNYjrvj/FwirWP9cx69YoBEqird4vox9Cjo
 xqv6weq8f6zl4Vo6QG84YMKqww0MGQ1f8YxcAFXcHgvOD5sqPyTDf+Exqb58sLzx7mMfMtrfCHoAuhoXGn+YI/2fUfm4vir5jzYrk26VRYCu9o2lemPtSwfB
 V/zjUUUqa1Q81zPBbdeN3ZjmikbyoPdqI2dTvIe6hwc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series converts all media cec adapter drivers to use
cec_notifier_cec_adap_(un)register instead of cec_notifier_get(_conn),
cec_notifier_put and cec_register_cec_notifier.

Also enable the CEC_CAP_CONNECTOR_INFO capability.

The CEC_CAP_CONNECTOR_INFO capability is not yet exposed, that
will be done later in a separate patch series that also implements
the new CEC_ADAP_G_CONNECTOR_INFO ioctl.

Once all the drm and media cec drivers stop using cec_notifier_get(_conn),
cec_notifier_put and cec_register_cec_notifier those functions can be
deleted from the CEC core.

These functions are blocking the development of more advanced CEC
features such as multiple CEC adapters per HDMI connector (one for
use when in standby, one for use when powered up).

Regards,

	Hans

Hans Verkuil (6):
  meson/ao-cec: use cec_notifier_cec_adap_(un)register
  cros-ec-cec: use cec_notifier_cec_adap_(un)register
  seco-cec: use cec_notifier_cec_adap_(un)register
  s5p-cec: use cec_notifier_cec_adap_(un)register
  stih-cec: use cec_notifier_cec_adap_(un)register
  tegra-cec: use cec_notifier_cec_adap_(un)register

 .../media/platform/cros-ec-cec/cros-ec-cec.c  | 68 +++++++++++--------
 drivers/media/platform/meson/ao-cec-g12a.c    | 48 +++++++------
 drivers/media/platform/meson/ao-cec.c         | 44 ++++++------
 drivers/media/platform/s5p-cec/s5p_cec.c      | 23 ++++---
 drivers/media/platform/seco-cec/seco-cec.c    | 55 ++++++++-------
 drivers/media/platform/sti/cec/stih-cec.c     | 32 +++++----
 drivers/media/platform/tegra-cec/tegra_cec.c  | 35 +++++-----
 7 files changed, 162 insertions(+), 143 deletions(-)

-- 
2.20.1

