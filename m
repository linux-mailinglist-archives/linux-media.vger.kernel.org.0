Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC37596759
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 04:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbiHQCTL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 22:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbiHQCTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 22:19:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F142F80366
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 19:19:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BBEECC;
        Wed, 17 Aug 2022 04:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660702744;
        bh=p6YhSLc/MbFiHL92Bsw4xKgsyTThualgTp23OJPrJI4=;
        h=From:To:Cc:Subject:Date:From;
        b=o1g27KOt7z77qjV4n4wgveO8LUo9tP3lA6kiigrIifa/7v2pBcq7DV4w0lZPvChMT
         +I2llpS6if7Hv0n2Q7hPgOjdwvHxeNcvhp4D4VhuvUuAiTSysokUwHgG7XaWbE+2k4
         Ae6JZ1kf9EnfpMiRQrmZhPUETgE1qxxXQSygSudY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 0/5] media: rkisp1: Fix LSC initial configuration on i.MX8MP
Date:   Wed, 17 Aug 2022 05:18:45 +0300
Message-Id: <20220817021850.20460-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series fixes the Lens Shading Correction initial
configuration on the i.MX8MP.

The i.MX8MP integrates an ISP8000Nano v18.02, which unlike other
versions currently supported by the driver, gates access to the LSC RAM
with the ISP_CTRL.ISP_ENABLE bit. The initial LSC configuration being
performed before the ISP gets enabled, the writes to the RAM are
ignored, leading to incorrect results.

The series starts with four small drive-by cleanups of the LSC code, and
patch 5/5 then fixes the issue. I'm not totally thrilled by the code
architecture, but I'm not sure why, and I have a feeling doing better
would require a large refactoring of the ISP parameters handling. If
anyone sees an option for a better implementation, please say so.

The series is based on top of "[PATCH 0/7] media: rkisp1: Fix and
improve color space support" ([1]). Reviews for that base series would
thus be appreciated too.

[1] https://lore.kernel.org/linux-media/20220815065235.23797-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (5):
  media: rkisp1: Clean up LSC configuration code
  media: rkisp1: Store LSC register values in u32 variables
  media: rkisp1: Simplify LSC x/y size and grad register macros
  media: rkisp1: Use RKISP1_CIF_ISP_LSC_GRAD_SIZE() for gradient
    registers
  media: rkisp1: Configure LSC after enabling the ISP

 .../platform/rockchip/rkisp1/rkisp1-common.h  |  29 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |   9 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 378 ++++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  20 +-
 4 files changed, 239 insertions(+), 197 deletions(-)

-- 
Regards,

Laurent Pinchart

