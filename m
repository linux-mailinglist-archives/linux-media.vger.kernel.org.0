Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA8C281E34
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 00:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgJBWXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 18:23:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:56531 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725283AbgJBWXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 18:23:34 -0400
X-IronPort-AV: E=Sophos;i="5.77,329,1596466800"; 
   d="scan'208";a="58790184"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2020 07:23:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1161940062C6;
        Sat,  3 Oct 2020 07:23:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 0/3] media: i2c: ov772x: Enable BT.656 mode and test pattern support
Date:   Fri,  2 Oct 2020 23:23:20 +0100
Message-Id: <20201002222323.21736-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for BT.656 mode in the ov772x sensor
and also enables color bar test pattern control.

Cheers,
Prabhakar

V7->v8
* Fixed review comments pointed by Sakari

v6->v7
* Fixed review comments pointed by Sakari
* Included Ack from Jacopo

v5->v6
* Introduced new function ov772x_parse_dt()
* Moved the backward compatibility comment from 1/3 to 2/3

v4->v5:
* Put the ep instance back using fwnode_handle_put()
* Renamed BT656 to BT.656
* Correctly handled backward compatibility case falling
  back to parallel mode.

v3->v4:
* New patch 1/3 to fallback in parallel mode.
* Switched to v4l2_fwnode_endpoint_alloc_parse() for parsing the ep.
* Dropped support for pdat for test pattern control.
* DT documentation patches [1].

v2->v3:
* Dropped DT binding documentation patch as this is handled by Jacopo.
* Fixed review comments pointed by Jacopo.

v2:
 https://patchwork.kernel.org/project/linux-renesas-soc/
 list/?series=328133

 v1:
https://patchwork.kernel.org/project/linux-renesas-soc/
list/?series=323807

[1] https://patchwork.kernel.org/project/
    linux-renesas-soc/list/?series=346809

Lad Prabhakar (3):
  media: i2c: ov772x: Parse endpoint properties
  media: i2c: ov772x: Add support for BT.656 mode
  media: i2c: ov772x: Add test pattern control

 drivers/media/i2c/ov772x.c | 71 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

-- 
2.17.1

