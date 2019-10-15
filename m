Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B71A1D740E
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 12:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731622AbfJOK6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 06:58:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11529 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbfJOK6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 06:58:49 -0400
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; 
   d="scan'208";a="29145013"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2019 19:58:47 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9E6EE4006DFD;
        Tue, 15 Oct 2019 19:58:44 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/4] media: dt-bindings: rcar-csi2: Add R8A774B1 support
Date:   Tue, 15 Oct 2019 11:57:56 +0100
Message-Id: <1571137078-28922-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
References: <1571137078-28922-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the compatible string for RZ/G2N (R8A774B1) to the list of supported
SoCs.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,csi2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
index 3314092..2da6f60 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.txt
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.txt
@@ -9,6 +9,7 @@ Mandatory properties
 --------------------
  - compatible: Must be one or more of the following
    - "renesas,r8a774a1-csi2" for the R8A774A1 device.
+   - "renesas,r8a774b1-csi2" for the R8A774B1 device.
    - "renesas,r8a774c0-csi2" for the R8A774C0 device.
    - "renesas,r8a7795-csi2" for the R8A7795 device.
    - "renesas,r8a7796-csi2" for the R8A7796 device.
-- 
2.7.4

