Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC57493967
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 12:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354103AbiASLTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 06:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354098AbiASLTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 06:19:31 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4235C061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 03:19:30 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9FFF2100004;
        Wed, 19 Jan 2022 11:19:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] staging: media: imx7-mipi-csis: Two small fixes
Date:   Wed, 19 Jan 2022 12:20:22 +0100
Message-Id: <20220119112024.11339-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two small fixes for the imx7-mipi-csis driver.

The second patch is required to correctly capture in packed YUV422 formats

Thanks
   j

Jacopo Mondi (2):
  staging: media: imx: imx7-mipi-csic: Resume on debug
  staging: media: imx: imx7-mipi-csic: Set PIXEL_MODE for YUV422

 drivers/staging/media/imx/imx7-mipi-csis.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--
2.34.1

