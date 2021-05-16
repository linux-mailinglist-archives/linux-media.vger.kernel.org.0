Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F45381C09
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhEPCQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbhEPCNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:13:05 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7118229BD;
        Sun, 16 May 2021 03:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129522;
        bh=8p58NNFDJFv051VBNYUdzLRPuG2+Q2dBtF0Kf4seSpk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hql9UoR8lc/sjD7lvqvgpw0ftpBiwFYWCI/mt2d3DIQ9dyBxn9+W5uIp8ePe76Rfy
         9N6/BFaShUbac6FdCLKwnky/5K/1arqjrfpBs95c3Sw/DHsUq7qrN28CVa9MgJSfgv
         EhdLxlSMV/Go/0mPB3dRl3LG+fXfm+CQjV/KYZJY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 25/25] media: imx: imx7_mipi_csis: Update MAINTAINERS
Date:   Sun, 16 May 2021 04:44:41 +0300
Message-Id: <20210516014441.5508-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Given my recent contributions to the imx7-mipi-csis driver, I can as
well be listed as a maintainer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..2d06dc43fe70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11283,6 +11283,7 @@ F:	include/media/imx.h
 
 MEDIA DRIVERS FOR FREESCALE IMX7
 M:	Rui Miguel Silva <rmfrfs@gmail.com>
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
Regards,

Laurent Pinchart

