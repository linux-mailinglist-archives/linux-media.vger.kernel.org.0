Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAD64876E2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 12:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238138AbiAGLyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 06:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237810AbiAGLyP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 06:54:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B179C061245
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 03:54:15 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 614BC8AE;
        Fri,  7 Jan 2022 12:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641556453;
        bh=xnLN7BWWZcaDxAd57rKuzsYk5KQhNLlxw9IGXWer3jQ=;
        h=From:To:Cc:Subject:Date:From;
        b=uUYaIYCVWJxVVhhSBK2+xiT2x/o5c6+keVX/ABp/hu+iJJlbVhcUBZWpmkjNou1Qp
         5C92IjQ0hBgPp9e6hI+Xi84BdS+Z38sz3XKBRDzAmYC1or/Rpje1wJH+clia1eIwNZ
         kXe+uAWZQuP2qvaatf1jqpB+BT8ONBOdX2QuPuYM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Subject: [PATCH v2 0/3] staging: media: imx7-mipi-csis: Small improvements
Date:   Fri,  7 Jan 2022 13:53:58 +0200
Message-Id: <20220107115401.31698-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series contains small debugging improvements for the
imx7-mipi-csis driver, as well as a fix to make entity names unique for
platforms that have multiple CSI receiver instances (namely the
i.MX8MP).

There's not much more to tell here, please see individual patches for
details.

Laurent Pinchart (3):
  staging: media: imx: imx7-mipi-csis: Dump MIPI_CSIS_FRAME_COUNTER_CH0
    register
  staging: media: imx: imx7_mipi_csis: Add timings override through
    debugfs
  staging: media: imx: imx7-mipi-csis: Make subdev name unique

 drivers/staging/media/imx/imx7-mipi-csis.c | 44 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
Regards,

Laurent Pinchart

