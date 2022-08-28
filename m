Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1835F5A3EC1
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 19:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiH1RMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 13:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiH1RMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 13:12:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C9A33413
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 10:12:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A69FFE5;
        Sun, 28 Aug 2022 19:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661706726;
        bh=Wudkdcv0KFzXxEGEaHbIBAk97g9AmTJ59W8Onb4PgPw=;
        h=Date:From:To:Cc:Subject:From;
        b=Cshl3HX2dwupqYX2ifJmFkFZC3gjc3KY7IxQ4YD61yZVoVbk/g7IHHHxQBuTWEfr0
         9Q3C7rhP1M1D0oVNhJPV0Bt+y0BI30oX/KzCJGLvsxhNYTKcSwXeJofpmesnHrS5P8
         vaM1k8Hu5oNYiQkQub3cefM7McGlNodMnLy7nc9w=
Date:   Sun, 28 Aug 2022 20:11:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>
Subject: [GIT PULL FOR v6.1] Renesas VSP1 changes
Message-ID: <Ywuh3m7l2bpJbspq@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/vsp1-next-20220828

for you to fetch changes up to 37cb1e6fc612fd397ddc1e41859bd16733246277:

  media: renesas: vsp1: Add support for RZ/G2L VSPD (2022-08-28 20:01:17 +0300)

----------------------------------------------------------------
- RZ/G2L support in the Renesas VSP1 driver

----------------------------------------------------------------
Biju Das (5):
      media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
      media: renesas: vsp1: Add support to deassert/assert reset line
      media: renesas: vsp1: Add support for VSP software version
      media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
      media: renesas: vsp1: Add support for RZ/G2L VSPD

 .../devicetree/bindings/media/renesas,vsp1.yaml    |  53 ++++++++---
 drivers/media/platform/renesas/vsp1/vsp1.h         |   4 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     | 101 ++++++++++++++++++---
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |  12 +--
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |   6 ++
 5 files changed, 142 insertions(+), 34 deletions(-)

-- 
Regards,

Laurent Pinchart
