Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB4B6E3F0E
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 07:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjDQFjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 01:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDQFjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 01:39:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF57D9F
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 22:39:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B6B675B;
        Mon, 17 Apr 2023 07:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681709972;
        bh=SW9J8ZFoTJDAI0rZgn8TkAWuEuUEnxQTVpt0XDauiJU=;
        h=From:To:Cc:Subject:Date:From;
        b=THTbT1Q3VkA61RMdUXKQGQHNqmssi4qfzC+WUruMiEKYQpUO7LHeZOz2yw+/hesq3
         wBmXoXYZrUMDrV6qpxDteH/itc1mCUf2LJEeRxILU8d3QCc9L67IaOzc7WPa2QMdG0
         t62Dduz8ei/30q1nJ942AceVSljkj/U9QwZ1GdZ0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v1 0/2] media: nxp: imx8-isi: Compilation fixes
Date:   Mon, 17 Apr 2023 08:39:47 +0300
Message-Id: <20230417053949.7395-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
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

The recently merged imx8-isi driver fails to compile when
CONFIG_PM_SLEEP is disabled, or when test-compiled on 32-bit platforms.
This patch series fixes it.

Laurent Pinchart (2):
  media: nxp: imx8-isi: Mark PM functions as __maybe_unused
  media: nxp: imx8-isi: Use #ifdef to test CONFIG_ARCH_DMA_ADDR_T_64BIT

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++----
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)


base-commit: 20af6be6bee4c3af80aac9b44b3d32d89824dde7
-- 
Regards,

Laurent Pinchart

