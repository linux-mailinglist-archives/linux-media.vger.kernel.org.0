Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803744D3A8D
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 20:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238002AbiCITq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 14:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238001AbiCITq2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 14:46:28 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 291188E;
        Wed,  9 Mar 2022 11:45:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,168,1643641200"; 
   d="scan'208";a="113867404"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2022 04:45:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.47])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 207BF40DD852;
        Thu, 10 Mar 2022 04:45:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add support for RZ/G2L VSPD
Date:   Wed,  9 Mar 2022 19:45:18 +0000
Message-Id: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RZ/G2L VSPD provides a single VSPD instance. It has the following
sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.

The VSPD block on RZ/G2L does not have a version register, so added a
new compatible string "renesas,vsp2-rzg2l" with a data pointer containing
the info structure. Also the reset line is shared with the DU module
so devm_reset_control_get_shared() call is used in case of RZ/G2L.

RFC->v1:
 * Added reset support as seperate patch
 * Moved rstc just after the bus_master field in struct vsp1_device
 * Used data pointer containing info structure to retrieve version information
 * Updated commit description
 * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
 * Defined the clocks
 * Clock max Items is based on SoC Compatible string

RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-20-biju.das.jz@bp.renesas.com/

Biju Das (3):
  media: dt-bindings: media: renesas,vsp1: Document RZ/{G2L,V2L} VSPD
    bindings
  media: vsp1: Add support to deassert/assert reset line
  media: vsp1: Add support for RZ/G2L VSPD

 .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
 drivers/media/platform/vsp1/vsp1.h            |  1 +
 drivers/media/platform/vsp1/vsp1_drv.c        | 51 +++++++++++++++---
 drivers/media/platform/vsp1/vsp1_lif.c        |  7 ++-
 drivers/media/platform/vsp1/vsp1_regs.h       |  1 +
 5 files changed, 90 insertions(+), 22 deletions(-)

-- 
2.17.1

