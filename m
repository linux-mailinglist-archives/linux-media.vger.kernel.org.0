Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C4026A63D
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 15:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgIONWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 09:22:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17833 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726446AbgIONNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:13:11 -0400
X-IronPort-AV: E=Sophos;i="5.76,429,1592838000"; 
   d="scan'208";a="57333413"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Sep 2020 22:12:38 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B25842BA8C2;
        Tue, 15 Sep 2020 22:12:35 +0900 (JST)
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
Subject: [PATCH 0/3] Document r8a77990 DRIF support
Date:   Tue, 15 Sep 2020 14:12:13 +0100
Message-Id: <20200915131216.21137-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear All,

this series documents DRIF support for the r8a77990
(a.k.a. R-Car E3).

Thanks,
Fab

Fabrizio Castro (3):
  MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
  media: dt-bindings: media: renesas,drif: Convert to json-schema
  media: dt-bindings: media: renesas,drif: Add r8a77990 support

 .../bindings/media/renesas,drif.txt           | 177 ------------
 .../bindings/media/renesas,drif.yaml          | 271 ++++++++++++++++++
 MAINTAINERS                                   |   3 +-
 3 files changed, 273 insertions(+), 178 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml

-- 
2.25.1

