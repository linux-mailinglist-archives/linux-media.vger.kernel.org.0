Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EC325E295
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgIDUSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:46 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6054 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726441AbgIDUSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:46 -0400
X-IronPort-AV: E=Sophos;i="5.76,391,1592838000"; 
   d="scan'208";a="56410434"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2020 05:18:44 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3CBBC4007F51;
        Sat,  5 Sep 2020 05:18:42 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 0/6] media: i2c: ov5640 feature enhancement and fixes
Date:   Fri,  4 Sep 2020 21:18:29 +0100
Message-Id: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series fixes DVP support and enables BT656 mode in
the driver.

Cheers,
Prabhakar

Changes for v4:
* Split patch 1/3 from v3 patch series [1] more granular as
  requested by Sakari
* Included [Tested/Reviewed]-by tag from Jacopo

[1] https://patchwork.kernel.org/cover/11712735/

Changes for v3 (https://patchwork.kernel.org/cover/11712735/):
* Dropped DT binding patch
* Fail probe if unsupported bus_type is passed
* Fixed review comments pointed by Jacopo

Changes for v2 (https://lkml.org/lkml/2020/8/3/830):
* Added support to fallback in parallel mode
* Documented bus-type property
* Added descriptive commit message for patch 2/4 as pointed
  by Sakari
* Fixed review comments pointed by Laurent to have separate functions
  for mipi and dvp setup
* Made sure the sensor is in power down mode during startup too for
  DVP mode

Lad Prabhakar (6):
  media: i2c: ov5640: Remain in power down for DVP mode unless streaming
  media: i2c: ov5640: Separate out mipi configuration from s_power
  media: i2c: ov5640: Enable data pins on poweron for DVP mode
  media: i2c: ov5640: Configure HVP lines in s_power callback
  media: i2c: ov5640: Add support for BT656 mode
  media: i2c: ov5640: Fail probe on unsupported bus_type

 drivers/media/i2c/ov5640.c | 336 +++++++++++++++++++++----------------
 1 file changed, 191 insertions(+), 145 deletions(-)

-- 
2.17.1

