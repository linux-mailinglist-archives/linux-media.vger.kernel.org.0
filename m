Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44D92508BA
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 21:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgHXTES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 15:04:18 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:42218 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725963AbgHXTEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 15:04:16 -0400
X-IronPort-AV: E=Sophos;i="5.76,349,1592838000"; 
   d="scan'208";a="55396221"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2020 04:04:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 20C9640CD7A3;
        Tue, 25 Aug 2020 04:04:12 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3 0/2] media: i2c: ov772x: Enable BT656 mode and test pattern support
Date:   Mon, 24 Aug 2020 20:04:04 +0100
Message-Id: <20200824190406.27478-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for BT656 mode in the ov772x sensor
and also enables color bar test pattern control.

Cheers,
Prabhakar

Changes for v3:
* Dropped DT binding documentation patch as this is handled by Jacopo.
* Fixed review comments pointed by Jacopo.

[1] https://www.spinics.net/lists/linux-media/msg175098.html

Changes for v2:
* Updated DT bindings
* Driver defaults to parallel mode
* Fixed return type when endpoint parsing fails

Lad Prabhakar (2):
  media: i2c: ov772x: Add support for BT656 mode
  media: i2c: ov772x: Add test pattern control

 drivers/media/i2c/ov772x.c | 57 +++++++++++++++++++++++++++++++++++++-
 include/media/i2c/ov772x.h |  1 +
 2 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.17.1

