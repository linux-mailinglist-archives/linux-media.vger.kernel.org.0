Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6422B09F5
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 17:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgKLQ2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 11:28:06 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:38277 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgKLQ2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 11:28:05 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A1E17100014;
        Thu, 12 Nov 2020 16:28:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 8/8] [DNI] arm64: dts: renesas: eagle: Specify channel amplitude
Date:   Thu, 12 Nov 2020 17:27:29 +0100
Message-Id: <20201112162729.101384-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
References: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced 'maxim,maxim,initial-reverse-channel-mV'
property to specify the initial reverse channel amplitude when the
remote serializers are not pre-programmed with noise immunity threshold
enabled.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 45b947d44cee..75296865104c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -308,6 +308,7 @@ gmsl: gmsl-deserializer@48 {
 
 		/* eagle-pca9654-max9286-pwdn */
 		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
+		maxim,initial-reverse-channel-mV = <100>;
 
 		/*
 		 * Workaround: Hog the CAMVDD line high as we can't establish a
-- 
2.29.1

