Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FB62F6EFB
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 00:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730913AbhANXew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 18:34:52 -0500
Received: from gloria.sntech.de ([185.11.138.130]:53520 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730776AbhANXew (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 18:34:52 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.sntech)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l0C82-0001lf-Ae; Fri, 15 Jan 2021 00:34:10 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com, heiko@sntech.de,
        tfiga@chromium.org
Subject: [PATCH 0/2] Fix the rkisp1 userspace API for later IP versions
Date:   Fri, 15 Jan 2021 00:33:43 +0100
Message-Id: <20210114233345.160223-4-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114233345.160223-1-heiko@sntech.de>
References: <20210114233345.160223-1-heiko@sntech.de>
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


[0] http://lore.kernel.org/r/3342088.iIbC2pHGDl@diego
[1] https://lore.kernel.org/r/20210108193311.3423236-2-heiko@sntech.de

Heiko Stuebner (2):
  media: rockchip: rkisp1: carry ip version information
  media: rockchip: rkisp1: extend uapi array sizes

 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++-------
 include/uapi/linux/rkisp1-config.h            | 25 ++++++++++++++++---
 3 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.29.2

