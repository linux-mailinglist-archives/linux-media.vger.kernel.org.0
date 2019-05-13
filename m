Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2525E1BBC7
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 19:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731502AbfEMRVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 13:21:39 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46339 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731532AbfEMRVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 13:21:37 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hQEdq-0008VS-Vk; Mon, 13 May 2019 19:21:34 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hQEdp-0003vj-Av; Mon, 13 May 2019 19:21:33 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 3/5] media: dt-bindings: media: Add vendor prefix for allegro
Date:   Mon, 13 May 2019 19:21:29 +0200
Message-Id: <20190513172131.15048-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513172131.15048-1-m.tretter@pengutronix.de>
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
VP9 encoder, codec and decoder hardware (RTL) IPs.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v5 -> v6:
none

v5:
- new patch
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8162b0eb4b50..78a849b25f64 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -16,6 +16,7 @@ adi	Analog Devices, Inc.
 advantech	Advantech Corporation
 aeroflexgaisler	Aeroflex Gaisler AB
 al	Annapurna Labs
+allegro	Allegro DVT
 allo	Allo.com
 allwinner	Allwinner Technology Co., Ltd.
 alphascale	AlphaScale Integrated Circuits Systems, Inc.
-- 
2.20.1

