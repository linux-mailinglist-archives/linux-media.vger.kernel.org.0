Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D72F243E18
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 19:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgHMRNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 13:13:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19125 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726248AbgHMRNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 13:13:48 -0400
X-IronPort-AV: E=Sophos;i="5.76,309,1592838000"; 
   d="scan'208";a="54526434"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Aug 2020 02:13:46 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1907D4005E0F;
        Fri, 14 Aug 2020 02:13:43 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3 0/3] media: i2c: ov5640 feature enhancement and fixes
Date:   Thu, 13 Aug 2020 18:13:34 +0100
Message-Id: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Changes for v3:
* Dropped DT binding patch
* Fail probe if unsupported bus_type is passed
* Fixed review comments pointed by Jacopo

Changes for v2:
* Added support to fallback in parallel mode
* Documented bus-type property
* Added descriptive commit message for patch 2/4 as pointed
  by Sakari
* Fixed review comments pointed by Laurent to have separate functions
  for mipi and dvp setup
* Made sure the sensor is in power down mode during startup too for
  DVP mode

Lad Prabhakar (3):
  media: i2c: ov5640: Enable data pins on poweron for DVP mode
  media: i2c: ov5640: Add support for BT656 mode
  media: i2c: ov5640: Fail probe on unsupported bus_type

 drivers/media/i2c/ov5640.c | 340 +++++++++++++++++++++----------------
 1 file changed, 196 insertions(+), 144 deletions(-)

-- 
2.17.1

