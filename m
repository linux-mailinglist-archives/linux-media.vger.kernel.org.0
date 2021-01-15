Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9032F7794
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 12:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbhAOLYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 06:24:36 -0500
Received: from gloria.sntech.de ([185.11.138.130]:56410 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727496AbhAOLYg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 06:24:36 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.sntech)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l0NCr-0004rD-P4; Fri, 15 Jan 2021 12:23:53 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, heiko@sntech.de,
        tfiga@chromium.org
Subject: [PATCH v3 0/2] Fix the rkisp1 userspace API for later IP versions
Date:   Fri, 15 Jan 2021 12:23:49 +0100
Message-Id: <20210115112351.208011-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This NEEDs to go into 5.11 while we can still adapt the uapi
during its RC-cycle.


When looking into supporting the rkisp1 of the px30 I noticed that
some fields got bigger in the uapi, caused by bigger number of samples
for example for histograms or gamma values.

The rkisp1 was destaged with 5.11-rc1 so we have still time during
the 5.11 cycle to fix that without big hassles.

This was discussed previously in a mail [0] and a rfc series [1]
and this two-part series now splits out the important parts that
really should become part of a 5.11-rc and thus the final 5.11.

changes since v2:
- actually zero the correct sizes for u16 values (hist-bins)
  (kernel-test-robot)

changes since v1:
- drop duplicate isp_ver storage, hw_revision is enough (Dafna)
- document multiple maximum sizes in uapi (Hans)
- document usage of hw_revision field (Hans)
- zero fields transmitted to userspace before adding data (Hans)
- use _V10 field sizes when filling fields, as there is only v10 for now

changes since rfc:
- move rkisp1_version enum into uapo
- show version in media-api hw_revision
- introduce constants for versions and make max use the biggest

Heiko Stuebner (2):
  media: rockchip: rkisp1: carry ip version information
  media: rockchip: rkisp1: extend uapi array sizes

 Documentation/admin-guide/media/rkisp1.rst    | 15 +++++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 21 +++++----
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-stats.c   | 12 +++++-
 include/uapi/linux/rkisp1-config.h            | 43 ++++++++++++++++---
 5 files changed, 76 insertions(+), 17 deletions(-)

-- 
2.29.2

