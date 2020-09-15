Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D5226ABE5
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 20:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgIOS33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 14:29:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:47012 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727993AbgIOSUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 14:20:34 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57347037"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Sep 2020 03:20:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E6E624006DF6;
        Wed, 16 Sep 2020 03:20:31 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2 1/2] media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_CSI2 config
Date:   Tue, 15 Sep 2020 19:20:26 +0100
Message-Id: <20200915182027.2787-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915182027.2787-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200915182027.2787-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rcar-csi2 driver also supports RZ/G2 SoC's, update the description
to reflect this.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/Kconfig b/drivers/media/platform/rcar-vin/Kconfig
index ca0d906dce2f..2669c13a0423 100644
--- a/drivers/media/platform/rcar-vin/Kconfig
+++ b/drivers/media/platform/rcar-vin/Kconfig
@@ -9,7 +9,7 @@ config VIDEO_RCAR_CSI2
 	select V4L2_FWNODE
 	help
 	  Support for Renesas R-Car MIPI CSI-2 receiver.
-	  Supports R-Car Gen3 SoCs.
+	  Supports R-Car Gen3 and RZ/G2 SoCs.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called rcar-csi2.
-- 
2.17.1

