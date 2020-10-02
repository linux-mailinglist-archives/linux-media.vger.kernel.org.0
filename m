Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FFE281866
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 18:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBQ5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 12:57:02 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:10136 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725991AbgJBQ5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 12:57:02 -0400
X-IronPort-AV: E=Sophos;i="5.77,328,1596466800"; 
   d="scan'208";a="58562610"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Oct 2020 01:57:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E7BDA4007F4C;
        Sat,  3 Oct 2020 01:56:58 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/3] media: i2c: ov772x: Enable BT.656 mode and test pattern support
Date:   Fri,  2 Oct 2020 17:56:53 +0100
Message-Id: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for BT.656 mode in the ov772x sensor
and also enables color bar test pattern control.

Cheers,
Prabhakar

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

 drivers/media/i2c/ov772x.c | 69 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

-- 
2.17.1

