Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5735423A874
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 16:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgHCOcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 10:32:05 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:4092 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgHCOcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 10:32:05 -0400
X-IronPort-AV: E=Sophos;i="5.75,430,1589209200"; 
   d="scan'208";a="53750340"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2020 23:32:03 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D29D242ACBDC;
        Mon,  3 Aug 2020 23:32:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] media: i2c: ov5640 feature enhancement and fixes
Date:   Mon,  3 Aug 2020 15:31:43 +0100
Message-Id: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series fixes DVP support and enables BT656 mode in
the driver.

@Jacopo Mondi - patch 1/4 will collide with your patch series [1],
feel free to merge it as part of your v2.

[1] https://www.spinics.net/lists/linux-renesas-soc/msg51236.html

Cheers,
Prabhakar

Changes for v2:
* Added support to fallback in parallel mode
* Documented bus-type property
* Added descriptive commit message for patch 2/4 as pointed
  by Sakari
* Fixed review comments pointed by Laurent to have separate functions
  for mipi and dvp setup
* Made sure the sensor is in power down mode during startup too for
  DVP mode

Lad Prabhakar (4):
  dt-bindings: media: i2c: ov5640: Document bus-type property
  media: i2c: ov5640: Enable data pins on poweron for DVP mode
  media: i2c: ov5640: Add support for BT656 mode
  media: i2c: ov5640: Fallback to parallel mode

 .../devicetree/bindings/media/i2c/ov5640.txt  |   9 +-
 drivers/media/i2c/ov5640.c                    | 333 ++++++++++--------
 2 files changed, 198 insertions(+), 144 deletions(-)

-- 
2.17.1

