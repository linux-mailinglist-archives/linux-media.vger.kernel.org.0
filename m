Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E419AE09
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733139AbfHWLYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:24:33 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59553 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732503AbfHWLYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:24:33 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 17gBikVExThuu17gEiolpz; Fri, 23 Aug 2019 13:24:31 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 0/3] drm: cec: call cec_s_conn_info()
Date:   Fri, 23 Aug 2019 13:24:24 +0200
Message-Id: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFpP5ahn1mixZEgS2DpGEwnLDr611pFCD0NV1aR4xDYjIfGWFW+alp1i6B90RB0a37/Eyyj7pCnCYYUaCLZWGPDbccEpv6R6CEdgP2ingXp4qaLpUgdk
 2QEv8r4eNX2KTzASPzqxoRsHnNXPUyAYnyPIH8ULL7c2JNpYgE3P2/Xs7jn5L8blqnrhGPRdVPeq4B62Jfpq1ACe6RF9cb8go6Q8hlopjpeyCdyeA6sxLCCH
 LkPEAkG6jR46B4qw36CbMkUxJqvjdcyZ/PWijBDQ03sUly2G6N82ASKLF2gbslwNJ6sRVE3NROdI2SFsHex9qxrVm4aOuzw3Iy4Htz/nL9CV0K+9PVFL8Ngi
 BFec1pniNSXqP9vMgpoBicSPRSSF624K8kMJMZ2J9O1qS5c0snOZ8ZDE4BuAxq00XyvpTAY/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Three drivers were not updated in Dariusz' series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=573

This series adds connector info support for those three.

Note that the sun4i patch has this patch as a prerequisite:

https://patchwork.linuxtv.org/project/linux-media/list/?series=573

This will be merged for v5.3, so this should be in before the
sun4i patch is merged.

Regards,

	Hans

Dariusz Marcinkiewicz (1):
  drm/vc4/vc4_hdmi: fill in connector info

Hans Verkuil (2):
  drm/sun4i/sun4i_hdmi_enc: call cec_s_conn_info()
  drm/bridge/adv7511: enable CEC connector info

 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c |  7 ++++++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++----------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  6 ++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c               | 13 ++++++++----
 4 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.20.1

