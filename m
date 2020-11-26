Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900D82C4FB1
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 08:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730581AbgKZHsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 02:48:13 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57853 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730206AbgKZHsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 02:48:13 -0500
X-Originating-IP: 80.104.176.17
Received: from uno.homenet.telecomitalia.it (host-80-104-176-17.retail.telecomitalia.it [80.104.176.17])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E22C61C000C;
        Thu, 26 Nov 2020 07:48:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD register
Date:   Thu, 26 Nov 2020 08:47:55 +0100
Message-Id: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported in patch 2/2 commit message the the VNCSI_IFMD register
has the following limitations according to chip manual revision 2.20

- V3M, V3H and E3 do not support the DES1 field has they do not feature
a CSI20 receiver.
- D3 only supports parallel input, and the whole register shall always
be written as 0.

This patch upports the BSP change commit f54697394457
("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
Koji Matsuoka

Tested on r-car E3 Ebisu.

v2 -> v3:
- Remove a few comments and add Niklas' tag to [2/2]

v1 -> v2:
- Inspect the channel routing table to deduce the availability of DES1/DES0
  bits as suggested by Niklas.

Jacopo Mondi (2):
  media: rcar-vin: Remove unused macro
  media: rcar-vin: Mask VNCSI_IFMD register

 drivers/media/platform/rcar-vin/rcar-dma.c | 26 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

--
2.29.1

