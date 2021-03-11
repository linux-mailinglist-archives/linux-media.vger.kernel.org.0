Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B2F336F51
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 10:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhCKJx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 04:53:27 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:1821 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231826AbhCKJxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 04:53:08 -0500
X-IronPort-AV: E=Sophos;i="5.81,240,1610377200"; 
   d="scan'208";a="74827406"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Mar 2021 18:53:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 87D1D401350F;
        Thu, 11 Mar 2021 18:53:02 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pavel Machek <pavel@denx.de>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 0/2] media: i2c: imx219: Trivial Fixes
Date:   Thu, 11 Mar 2021 09:52:03 +0000
Message-Id: <20210311095205.8095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series fixes trivial issues found in imx219 driver.

Cheers,
Prabhakar

Changes for v2:
* Dropped serialization patch
* Moved locking/unlocking of controls to imx219_start/imx219_stop as
  suggested by Laurent.
* Moved incrementing/decrementing to imx219_start/imx219_stop as
  suggested by Laurent.

Lad Prabhakar (2):
  media: i2c: imx219: Move out locking/unlocking of vflip and hflip
    controls from imx219_set_stream
  media: i2c: imx219: Balance runtime PM use-count

 drivers/media/i2c/imx219.c | 49 ++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 20 deletions(-)

-- 
2.17.1

