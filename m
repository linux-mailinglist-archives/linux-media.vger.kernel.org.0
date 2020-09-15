Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1041C26AAF1
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 19:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgIORnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 13:43:43 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:47340 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727975AbgIORnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:43:25 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57128161"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Sep 2020 02:42:56 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 44BCC4004BC0;
        Wed, 16 Sep 2020 02:42:54 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v5 0/3] media: i2c: ov772x: Enable BT.656 mode and test pattern support
Date:   Tue, 15 Sep 2020 18:42:32 +0100
Message-Id: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for BT.656 mode in the ov772x sensor
and also enables color bar test pattern control.

Cheers,
Prabhakar

Changes for v5:
* Put the ep instance back using fwnode_handle_put()
* Renamed BT656 to BT.656
* Correctly handled backward compatibility case falling
  back to parallel mode.

Changes for v4:
* New patch 1/3 to fallback in parallel mode.
* Switched to v4l2_fwnode_endpoint_alloc_parse() for parsing the ep.
* Dropped support for pdat for test pattern control.
* DT documentation patches [1].

Changes for v3:
* Dropped DT binding documentation patch as this is handled by Jacopo.
* Fixed review comments pointed by Jacopo.

[1] https://patchwork.kernel.org/project/
    linux-renesas-soc/list/?series=346809

Lad Prabhakar (3):
  media: i2c: ov772x: Parse endpoint properties
  media: i2c: ov772x: Add support for BT.656 mode
  media: i2c: ov772x: Add test pattern control

 drivers/media/i2c/ov772x.c | 57 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

-- 
2.17.1

