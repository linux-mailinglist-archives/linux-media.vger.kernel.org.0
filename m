Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A75486868
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 18:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241776AbiAFRZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 12:25:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241786AbiAFRZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 12:25:03 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E83D11FE;
        Thu,  6 Jan 2022 18:25:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641489900;
        bh=xnLN7BWWZcaDxAd57rKuzsYk5KQhNLlxw9IGXWer3jQ=;
        h=From:To:Cc:Subject:Date:From;
        b=SO0g1nBc5vkulpPUkVdrMHTP3Dw2jAqiCoxcbINqWDeqePkEKAmznbdc6gRHGUPrt
         IxjeDDw4mORPb0kcrUPO8DCL/WyDGYEFa6iX8bqAVDPvxPHB5fsR6rVOAPPDKFC4Ls
         /W5Lk+u/U49ItXpLKalp4wuiRUISl4NmqXlMt+RY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Subject: [PATCH v1 0/3] staging: media: imx7-mipi-csis: Small improvements
Date:   Thu,  6 Jan 2022 19:24:38 +0200
Message-Id: <20220106172441.7399-1-laurent.pinchart@ideasonboard.com>
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

