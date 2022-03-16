Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C554DAF40
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355498AbiCPL5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348872AbiCPL5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:57:11 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72539369F2;
        Wed, 16 Mar 2022 04:55:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,186,1643641200"; 
   d="scan'208";a="113695414"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 20:55:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2812E40078CD;
        Wed, 16 Mar 2022 20:55:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/3] Add support for RZ/G2L VSPD
Date:   Wed, 16 Mar 2022 11:55:48 +0000
Message-Id: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
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

v5->v6:
 * Rebased to media_staging and updated commit header
 * Removed LCDC reference clock description from bindings
 * Changed the clock name from du.0->aclk from bindings
 * Added Rb tag from Laurent for reset patch
 * Added forward declaration for struct reset_control
 * Updated vsp1_device_get() with changes suggested by Laurent
 * Updated error message for reset_control_get form ctrl->control.
 * Removed the extra tab from rzg2l_vsp2_device_info
 * Changed the function vsp1_lookup->vsp1_lookup_info and
   all info match related code moved here.
 * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
   distinguish HW & SW IP_VSP_Version.
 * Used 0x80 for RZG2L VSPD model and SoC identification
 * Updated Switch() for LIF0 buffer attribute handling.
v4->v5:
 * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
 * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
   for SoC identification for RZ/G2L SoC's.
v3->v4:
 * Restored error check for pm_runtime_resume_and_get and calls
   assert() in case of failure.
 * Added Rb tag from Geert
 * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M SoC's
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
  media: renesas: vsp1: Add support to deassert/assert reset line
  media: renesas: vsp1: Add support for RZ/G2L VSPD

 .../bindings/media/renesas,vsp1.yaml          | 52 +++++++++----
 drivers/media/platform/renesas/vsp1/vsp1.h    |  2 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 75 +++++++++++++++----
 .../media/platform/renesas/vsp1/vsp1_lif.c    | 18 +++--
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  8 ++
 5 files changed, 121 insertions(+), 34 deletions(-)

-- 
2.17.1

