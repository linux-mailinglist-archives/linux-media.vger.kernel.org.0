Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668EF28E3AF
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 17:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbgJNP5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 11:57:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1802 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727161AbgJNP5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 11:57:25 -0400
X-IronPort-AV: E=Sophos;i="5.77,375,1596466800"; 
   d="scan'208";a="59783589"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2020 00:57:23 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 47170400C4EA;
        Thu, 15 Oct 2020 00:57:21 +0900 (JST)
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
Subject: [PATCH v4 0/5] Add r8a77965 DRIF support
Date:   Wed, 14 Oct 2020 16:57:14 +0100
Message-Id: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear All,

this series is to add DRIF support for the r8a77965
(a.k.a. R-Car M3-N). Version 4 improves the DT schema
for DRIF, as suggested by Geert.

Thanks,
Fab

Fabrizio Castro (5):
  MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
  media: dt-bindings: media: renesas,drif: Convert to json-schema
  media: dt-bindings: media: renesas,drif: Add r8a77990 support
  media: dt-bindings: media: renesas,drif: Add r8a77965 support
  arm64: dts: r8a77965: Add DRIF support

 .../bindings/media/renesas,drif.txt           | 177 -----------
 .../bindings/media/renesas,drif.yaml          | 279 ++++++++++++++++++
 MAINTAINERS                                   |   4 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 120 ++++++++
 4 files changed, 401 insertions(+), 179 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml

-- 
2.25.1

