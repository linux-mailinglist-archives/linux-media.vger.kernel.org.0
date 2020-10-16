Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6BD290286
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406619AbgJPKHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:07:21 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:39871 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406585AbgJPKHM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:07:12 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7FC12E0018;
        Fri, 16 Oct 2020 10:07:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 7/7] [DNI] arm64: dts: renesas: salvator-x-max9286: Use high-threshold
Date:   Fri, 16 Oct 2020 14:06:25 +0200
Message-Id: <20201016120625.64337-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced 'maxim,high-threshold' property to maintain
compatibility with RDACM20 camera module.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
index 6f4798859542..e207436f8690 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
@@ -128,6 +128,7 @@ gmsl-deserializer@4c {
 		compatible = "maxim,max9286";
 		reg = <0x4c>;
 		poc-supply = <&poc_12v>;
+		maxim,high-threshold;
 
 		ports {
 			#address-cells = <1>;
@@ -263,6 +264,7 @@ gmsl-deserializer@6c {
 		compatible = "maxim,max9286";
 		reg = <0x6c>;
 		poc-supply = <&poc_12v>;
+		maxim,high-threshold;
 
 		ports {
 			#address-cells = <1>;
-- 
2.28.0

