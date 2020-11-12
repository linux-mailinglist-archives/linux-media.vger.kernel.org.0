Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D552B0988
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 17:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgKLQI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 11:08:57 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48973 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbgKLQI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 11:08:57 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EED4EE001F;
        Thu, 12 Nov 2020 16:08:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] media: rcar-vin: Mask access to VNCSI_IFMD register
Date:   Thu, 12 Nov 2020 17:08:49 +0100
Message-Id: <20201112160851.99750-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
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

Thanks
   j

Jacopo Mondi (2):
  media: rcar-vin: Remove unused macro
  media: rcar-vin: Mask VNCSI_IFMD register

 drivers/media/platform/rcar-vin/rcar-core.c | 5 +++++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 8 +++-----
 drivers/media/platform/rcar-vin/rcar-vin.h  | 6 ++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

--
2.29.1

