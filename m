Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384C12B4528
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbgKPNxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:53:42 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44589 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbgKPNxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:53:42 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D33714000B;
        Mon, 16 Nov 2020 13:53:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: [PATCH v5 7/8] [DNI] arm64: dts: renesas: salvator-x-max9286: Specify channel amplitude
Date:   Mon, 16 Nov 2020 14:53:04 +0100
Message-Id: <20201116135305.81319-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced 'maxim,initial-reverse-channel-mV'
property to specify the initial reverse channel amplitude when
the remote serializers are pre-programmed with noise immunity threshold
enabled.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
index 6f4798859542..f14a133b7302 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
@@ -128,6 +128,7 @@ gmsl-deserializer@4c {
 		compatible = "maxim,max9286";
 		reg = <0x4c>;
 		poc-supply = <&poc_12v>;
+		maxim,initial-reverse-channel-mV = <170>;
 
 		ports {
 			#address-cells = <1>;
@@ -263,6 +264,7 @@ gmsl-deserializer@6c {
 		compatible = "maxim,max9286";
 		reg = <0x6c>;
 		poc-supply = <&poc_12v>;
+		maxim,initial-reverse-channel-mV = <170>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.29.1

