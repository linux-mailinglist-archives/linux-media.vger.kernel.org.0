Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF54122C89D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 16:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgGXO7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 10:59:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18194 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726366AbgGXO7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 10:59:19 -0400
X-IronPort-AV: E=Sophos;i="5.75,391,1589209200"; 
   d="scan'208";a="52751506"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jul 2020 23:59:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E0DD3425F874;
        Fri, 24 Jul 2020 23:59:14 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] media: rcar-vin: Add support to select data pins
Date:   Fri, 24 Jul 2020 15:58:50 +0100
Message-Id: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support to enable selecting data
lines via DT.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: media: renesas,vin: Document renesas-vin-ycbcr-8b-g
    property
  media: rcar-vin: Add support to read renesas-vin-ycbcr-8b-g property

 Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 +++++++++++++
 drivers/media/platform/rcar-vin/rcar-core.c              |  4 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c               |  7 +++++++
 drivers/media/platform/rcar-vin/rcar-vin.h               |  2 ++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.7.4

