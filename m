Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9B954E6A7
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378015AbiFPQFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 12:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238923AbiFPQFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 12:05:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF1547561
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 09:05:14 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E0BC415;
        Thu, 16 Jun 2022 18:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655395511;
        bh=sfgjD71mMMO2VKPZ8D/w2A2VjIx3RyrU4ZsbPNtOwls=;
        h=From:To:Cc:Subject:Date:From;
        b=V2X45dtxil8hUJgHpw+70aFLvpL+o9hq6riHi0+anGtNIkaEIjsYkPljW5ILRCl+3
         g7NGbhMhYlBlxvEdcty7f5/ScKKPAtrYrcoBCIYOFLPbUSYXkh4Ws7cWwW+5VzHb7/
         LlvK+jrJKKrp+ipmPkGavL3Las4+TOm0/Ib2u3xQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: [PATCH 0/3] media: rkisp1: Improve DPCC configuration
Date:   Thu, 16 Jun 2022 19:04:53 +0300
Message-Id: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series improves the configuration of the Defective
Pixel Cluster Correction (DPCC) configuration. Please see individual
patches for details.

The series is based on top of "[PATCH v4 00/21] media: rkisp1: Misc bug
fixes and cleanups" ([1]).

[1] https://lore.kernel.org/linux-media/20220421234240.1694-1-laurent.pinchart@ideasonboard.com/

Laurent Pinchart (3):
  media: rockchip: rkisp1: Set DPCC methods enable bits inside loop
  media: rockchip: rkisp1: Mask invalid bits in DPCC parameters
  media: rockchip: rkisp1: Define macros for DPCC configurations in UAPI

 .../platform/rockchip/rkisp1/rkisp1-params.c  | 52 ++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 25 +++---
 include/uapi/linux/rkisp1-config.h            | 77 +++++++++++++++----
 3 files changed, 104 insertions(+), 50 deletions(-)


base-commit: 4d846800b527933a46ffd5ff48b87f5a03ca087a
-- 
Regards,

Laurent Pinchart

