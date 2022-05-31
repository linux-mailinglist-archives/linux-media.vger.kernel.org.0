Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643E2539306
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 16:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbiEaOUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 10:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345209AbiEaOUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 10:20:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 585AF70364;
        Tue, 31 May 2022 07:20:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,265,1647270000"; 
   d="scan'208";a="121464425"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2022 23:20:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0E4354004BBF;
        Tue, 31 May 2022 23:20:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 0/5] Add support for RZ/G2L VSPD
Date:   Tue, 31 May 2022 15:19:53 +0100
Message-Id: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
new compatible string "renesas,r9a07g044-vsp2" with a data pointer containing
the info structure. Also the reset line is shared with the DU module.

This patch series is tested on RZ/G1N, RZ/G2M and RZ/G2L boards.

v10->v11:
 * Added poll for reset status in order to avoid lock-up on R-Car Gen2
 * with vsp register access after deassert.

v9->v10
 * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}

V8->v9
 * Added Rb tag from Geert for patch#3
 * Replaced break with return info in case a Model match is found and
   removed additional check for non-match case.
 * Used generic check for matching SoCs with LBA feature.
 * Replaced the code comments RZ/G2L {SoC's,SoC} with RZ/G2L SoCs.
v7->v8:
 * Split the patch for adding s/w version, feature bit and RZ/G2L support
 * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
 * Added .soc for RZ/G2L
 * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-vsp2"
 * Updated Clock-names to false for non RZ/G2L SoC's on binding doc
 * Added Rb tag from Laurent for bindings
v6->v7:
 * Added Rb tag from Kieran for patch#3
 * Added a quirk to handle LIF0 buffer attribute related
   changes for V3M and G2L.
 * Removed the macro for VSP HW version
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

Biju Das (5):
  media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
  media: renesas: vsp1: Add support to deassert/assert reset line
  media: renesas: vsp1: Add support for VSP software version
  media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
  media: renesas: vsp1: Add support for RZ/G2L VSPD

 .../bindings/media/renesas,vsp1.yaml          |  53 ++++++---
 drivers/media/platform/renesas/vsp1/vsp1.h    |   4 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 104 +++++++++++++++---
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  12 +-
 .../media/platform/renesas/vsp1/vsp1_regs.h   |   6 +
 5 files changed, 145 insertions(+), 34 deletions(-)

-- 
2.25.1

