Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F9B4D5FD7
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 11:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241652AbiCKKjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 05:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236627AbiCKKjN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 05:39:13 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8CDFBC116B;
        Fri, 11 Mar 2022 02:38:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,173,1643641200"; 
   d="scan'208";a="114094148"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Mar 2022 19:38:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.53])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 970AC40062CC;
        Fri, 11 Mar 2022 19:38:06 +0900 (JST)
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
Subject: [PATCH v3 0/3] Add support for RZ/G2L VSPD
Date:   Fri, 11 Mar 2022 10:38:00 +0000
Message-Id: <20220311103803.25239-1-biju.das.jz@bp.renesas.com>
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
new compatible string "renesas,rzg2l-vsp2" with a data pointer containing
the info structure. Also the reset line is shared with the DU module.

v2->v3:
 * Added Rb tags from Krzysztof and Philipp
 * If reset_control_deassert() failed, return ret directly.
 * Fixed version comparison in vsp1_lookup()
v1->v2:
 * Used reference counted reset handle to perform deassert/assert
 * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
 * Added standalone device info for rzg2l-vsp2.
 * Added vsp1_lookup helper function.
 * Updated comments for LIF0 buffer attribute register
 * Used last ID for rzg2l-vsp2.
RFC->v1:
 * Added reset support as separate patch
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

 .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++-----
 drivers/media/platform/vsp1/vsp1.h            |  1 +
 drivers/media/platform/vsp1/vsp1_drv.c        | 56 +++++++++++++++----
 drivers/media/platform/vsp1/vsp1_lif.c        | 15 +++--
 drivers/media/platform/vsp1/vsp1_regs.h       |  2 +
 5 files changed, 97 insertions(+), 29 deletions(-)

-- 
2.17.1

