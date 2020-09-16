Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFEE26C671
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 19:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgIPRuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 13:50:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:44627 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727450AbgIPRtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:49:08 -0400
X-IronPort-AV: E=Sophos;i="5.76,432,1592838000"; 
   d="scan'208";a="57427885"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Sep 2020 19:59:58 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6E7F74277746;
        Wed, 16 Sep 2020 19:59:55 +0900 (JST)
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
Subject: [PATCH v2 1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
Date:   Wed, 16 Sep 2020 11:59:47 +0100
Message-Id: <20200916105949.24858-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Renesas are expanding their DRIF support and offering,
I'll be the internal maintainer for DRIF.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v1->v2:
* No change

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2575f449139a..d9ebaf0c179b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10909,6 +10909,7 @@ F:	include/media/drv-intf/renesas-ceu.h
 
 MEDIA DRIVERS FOR RENESAS - DRIF
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-- 
2.25.1

