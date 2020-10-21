Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B311C294DFF
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 15:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442084AbgJUNxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 09:53:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29050 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2442065AbgJUNxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 09:53:42 -0400
X-IronPort-AV: E=Sophos;i="5.77,401,1596466800"; 
   d="scan'208";a="60410342"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Oct 2020 22:53:40 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5170542980AB;
        Wed, 21 Oct 2020 22:53:38 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 1/5] MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
Date:   Wed, 21 Oct 2020 14:53:28 +0100
Message-Id: <20201021135332.4928-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Fabrizio castro and remove Ramesh Shanmugasundaram.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ramesh Shanmugasundaram <rashanmu@gmail.com>
---
v4->v5:
* No change
v3->v4:
* No change
v2->v3:
* Removed Ramesh Shanmugasundaram as maintainer, as suggested
  by Ramesh
* Reworked commit title and changelog
v1->v2:
* No change

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 743b4e2135da..07dce09e08dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10925,7 +10925,7 @@ F:	drivers/media/platform/renesas-ceu.c
 F:	include/media/drv-intf/renesas-ceu.h
 
 MEDIA DRIVERS FOR RENESAS - DRIF
-M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-- 
2.25.1

